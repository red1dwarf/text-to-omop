-- -------------------------------------------------------------------
-- @2020, Odysseus Data Services, Inc. All rights reserved
-- MIMIC IV CDM Conversion
-- -------------------------------------------------------------------
-- -------------------------------------------------------------------
-- Populate lookup tables for cdm_measurement table
-- Rule 2
-- Labs from chartevents
-- 
-- Dependencies: run after 
--      st_core.sql,
--      st_hosp.sql,
--      st_icu.sql,
--      lk_meas_units
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Known issues / Open points:
--
-- to add more measurements from chartevents (see table d_items and analysis for custom mapping)
-- 
-- custom mapping:
--      brand new vocabulary -> mimiciv_meas_chartevents_value -- mapped partially
--          src_chartevents.value = measurement.value_source_value -> value_as_concept_id
-- 
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Rule 2
-- chartevents
-- chartevents keeps all possible records about events during an ICU stay
-- it repeats labs, but in case of discrepancies labs is the final truth
-- both HR and RR obviously do not repeat labs
-- Saturation probably repeats labs. Compare to Lab with source_value = "Oxygen Saturation | 50817"
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.lk_chartevents_clean AS
-- SELECT
--     src.subject_id                  AS subject_id,
--     src.hadm_id                     AS hadm_id,
--     src.stay_id                     AS stay_id,
--     src.itemid                      AS itemid,
--     CAST(src.itemid AS STRING)      AS source_code,
--     di.label                        AS source_label,
--     src.charttime                   AS start_datetime,
--     TRIM(src.value)                 AS value,
--     IF(
--         REGEXP_EXTRACT(TRIM(src.value), r'^[-]?[\d]+[.]?[\d]*[ ]*[a-z]+$') IS NOT NULL, -- 7.5 mm etc
--         CAST(REGEXP_EXTRACT(src.value, r'[-]?[\d]+[.]?[\d]*') AS FLOAT64),
--         src.valuenum
--     )                               AS valuenum,
--     IF(
--         REGEXP_EXTRACT(TRIM(src.value), r'^[-]?[\d]+[.]?[\d]*[ ]*[a-z]+$') IS NOT NULL, -- 7.5 mm etc
--         REGEXP_EXTRACT(src.value, r'[a-z]+'),
--         src.valueuom
--     )                               AS valueuom, -- unit of measurement
--     --
--     'chartevents'           AS unit_id,
--     src.load_table_id       AS load_table_id,
--     src.load_row_id         AS load_row_id,
--     src.trace_id            AS trace_id
-- FROM
--     @etl_project.@etl_dataset.src_chartevents src -- ce
-- INNER JOIN
--     @etl_project.@etl_dataset.src_d_items di
--         ON  src.itemid = di.itemid
-- WHERE
--     di.label NOT LIKE '%Temperature'
--     OR di.label LIKE '%Temperature' 
--         AND IF(valueuom LIKE '%F%', (valuenum - 32) * 5 / 9, valuenum) BETWEEN 25 and 44
    
-- ;

-- -------------------------------------------------------------------
-- tmp_chartevents_code_dist
-- it is a temporary table to collect distinct codes to be mapped
-- we are going to store source_code, source_label, and row_count in the concept lookup table,
-- to provide enough information for a mapping team for possible future mapping
--
-- brand new custom vocabulary -> mimiciv_meas_chart
-- brand new custom vocabulary -> mimiciv_meas_chartevents_value
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.tmp_chartevents_code_dist AS
-- -- source codes to be mapped
-- SELECT
--     itemid                      AS itemid,
--     source_code                 AS source_code,
--     source_label                AS source_label,
--     'mimiciv_meas_chart'        AS source_vocabulary_id,
--     COUNT(*)                    AS row_count
-- FROM
--     @etl_project.@etl_dataset.lk_chartevents_clean
-- GROUP BY
--     itemid,
--     source_code,
--     source_label
-- UNION ALL
-- -- values to be mapped
-- SELECT
--     CAST(NULL AS INT64)                 AS itemid,
--     value                               AS source_code,
--     value                               AS source_label,
--     'mimiciv_meas_chartevents_value'    AS source_vocabulary_id, -- both obs values and conditions
--     COUNT(*)                            AS row_count
-- FROM
--     @etl_project.@etl_dataset.lk_chartevents_clean
-- GROUP BY
--     source_code,
--     source_label
-- ;

-- -------------------------------------------------------------------
-- lk_chartevents_concept
-- collect the mapping and keep source_code, source_label, and row_count
-- for possible future mapping
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.lk_chartevents_concept AS
-- SELECT
--     src.itemid                  AS itemid,
--     src.source_code             AS source_code,
--     src.source_label            AS source_label,
--     src.source_vocabulary_id    AS source_vocabulary_id,
--     -- source concept
--     vc.domain_id                AS source_domain_id,
--     vc.concept_id               AS source_concept_id,
--     -- target concept
--     vc2.domain_id               AS target_domain_id,
--     vc2.concept_id              AS target_concept_id,
--     src.row_count               AS row_count
-- FROM
--     @etl_project.@etl_dataset.tmp_chartevents_code_dist src
-- LEFT JOIN
--     @etl_project.@etl_dataset.voc_concept vc
--         ON  vc.concept_code = src.source_code
--         AND vc.vocabulary_id = src.source_vocabulary_id
-- LEFT JOIN
--     @etl_project.@etl_dataset.voc_concept_relationship vcr
--         ON  vc.concept_id = vcr.concept_id_1
--         AND vcr.relationship_id = 'Maps to'
-- LEFT JOIN
--     @etl_project.@etl_dataset.voc_concept vc2
--         ON vc2.concept_id = vcr.concept_id_2
--         AND vc2.standard_concept = 'S'
--         AND vc2.invalid_reason IS NULL
-- ;

-- DROP TABLE IF EXISTS @etl_project.@etl_dataset.tmp_chartevents_code_dist;

-- -------------------------------------------------------------------
-- lk_chartevents_mapped
-- src_chartevents to measurement and measurement value
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.lk_chartevents_mapped AS
-- SELECT
--     FARM_FINGERPRINT(GENERATE_UUID())           AS measurement_id,
--     src.subject_id                              AS subject_id,
--     src.hadm_id                                 AS hadm_id,
--     src.stay_id                                 AS stay_id,
--     src.start_datetime                          AS start_datetime,
--     32817                                       AS type_concept_id,  -- OMOP4976890 EHR
--     src.itemid                                  AS itemid,
--     src.source_code                             AS source_code,
--     src.source_label                            AS source_label,
--     c_main.source_vocabulary_id                 AS source_vocabulary_id,
--     c_main.source_domain_id                     AS source_domain_id,
--     c_main.source_concept_id                    AS source_concept_id,
--     c_main.target_domain_id                     AS target_domain_id,
--     c_main.target_concept_id                    AS target_concept_id,
--     src.value                                   AS value_source_value,
--     IF(
--         IF(src.valuenum IS NULL, src.value, NULL) IS NOT NULL,
--         COALESCE(c_value.target_concept_id, 0), 
--         NULL
--     )                                           AS value_as_concept_id,
--     src.valuenum                                AS value_as_number,
--     src.valueuom                                AS unit_source_value, -- unit of measurement
--     IF(src.valueuom IS NOT NULL, 
--         COALESCE(uc.target_concept_id, 0), NULL)    AS unit_concept_id,
--     --
--     CONCAT('meas.', src.unit_id)                AS unit_id,
--     src.load_table_id       AS load_table_id,
--     src.load_row_id         AS load_row_id,
--     src.trace_id            AS trace_id
-- FROM
--     @etl_project.@etl_dataset.lk_chartevents_clean src -- ce
-- LEFT JOIN
--     @etl_project.@etl_dataset.lk_chartevents_concept c_main -- main
--         ON c_main.source_code = src.source_code 
--         AND c_main.source_vocabulary_id = 'mimiciv_meas_chart'
-- LEFT JOIN
--     @etl_project.@etl_dataset.lk_chartevents_concept c_value -- values for main
--         ON c_value.source_code = src.value
--         AND c_value.source_vocabulary_id = 'mimiciv_meas_chartevents_value'
--         AND c_value.target_domain_id = 'Meas Value'
-- LEFT JOIN 
--     @etl_project.@etl_dataset.lk_meas_unit_concept uc
--         ON uc.source_code = src.valueuom
-- ;


-- -------------------------------------------------------------------
-- lk_chartevents_condition_mapped
-- src_chartevents to condition
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.lk_chartevents_condition_mapped AS
-- SELECT
--     src.subject_id                              AS subject_id,
--     src.hadm_id                                 AS hadm_id,
--     src.stay_id                                 AS stay_id,
--     src.start_datetime                          AS start_datetime,
--     src.value                                   AS source_code,
--     c_main.source_vocabulary_id                 AS source_vocabulary_id,
--     c_main.source_concept_id                    AS source_concept_id,
--     c_main.target_domain_id                     AS target_domain_id,
--     c_main.target_concept_id                    AS target_concept_id,
--     --
--     CONCAT('cond.', src.unit_id)                AS unit_id,
--     src.load_table_id       AS load_table_id,
--     src.load_row_id         AS load_row_id,
--     src.trace_id            AS trace_id
-- FROM
--     @etl_project.@etl_dataset.lk_chartevents_clean src -- ce
-- INNER JOIN
--     @etl_project.@etl_dataset.lk_chartevents_concept c_main -- condition domain from values, mapped
--         ON c_main.source_code = src.value
--         AND c_main.source_vocabulary_id = 'mimiciv_meas_chartevents_value'
--         AND c_main.target_domain_id = 'Condition'
-- ;




-- ------------------------------------------------------------
-- POSTGRESQL
-- ------------------------------------------------------------

DROP TABLE IF EXISTS omop.lk_chartevents_clean;
CREATE TABLE omop.lk_chartevents_clean AS
SELECT
    src.subject_id AS subject_id,
    src.hadm_id AS hadm_id,
    src.stay_id AS stay_id,
    src.caregiver_id AS provider_id,
    src.itemid AS itemid,
    CAST(src.itemid AS TEXT) AS source_code,
    di.label AS source_label,
    src.charttime AS start_datetime,
    TRIM(src.value) AS value,
    CASE
        WHEN
            TRIM(src.value) ~ '^[-]?\d+(\.\d+)?\s*[a-z]+$' -- 7.5 mm etc
        THEN
            CAST(SUBSTRING(TRIM(src.value) FROM '[-]?\d+(\.\d+)?') AS NUMERIC)
        ELSE
            src.valuenum
    END AS valuenum,
    CASE
        WHEN
            TRIM(src.value) ~ '^[-]?\d+(\.\d+)?\s*[a-z]+$' -- 7.5 mm etc
        THEN
            SUBSTRING(src.value FROM '[a-z]+')
        ELSE
            src.valueuom
    END AS valueuom, -- unit of measurement
    --
    'chartevents' AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.src_chartevents src -- ce
INNER JOIN
    omop.src_d_items di
        ON src.itemid = di.itemid
WHERE
    di.label NOT LIKE '%Temperature'
    OR (
        di.label LIKE '%Temperature'
        AND CASE
                WHEN src.valueuom ILIKE '%F%' THEN (src.valuenum - 32) * 5 / 9
                ELSE src.valuenum
            END BETWEEN 25 AND 44
    )
;



DROP TABLE IF EXISTS omop.tmp_chartevents_code_dist;
CREATE TABLE omop.tmp_chartevents_code_dist AS
-- source codes to be mapped
SELECT
    itemid AS itemid,
    source_code AS source_code,
    source_label AS source_label,
    'mimiciv_meas_chart' AS source_vocabulary_id,
    COUNT(*) AS row_count
FROM
    omop.lk_chartevents_clean
GROUP BY
    itemid,
    source_code,
    source_label
UNION ALL
-- values to be mapped
SELECT
    CAST(NULL AS INTEGER) AS itemid,
    value AS source_code,
    value AS source_label,
    'mimiciv_meas_chartevents_value' AS source_vocabulary_id, -- both obs values and conditions
    COUNT(*) AS row_count
FROM
    omop.lk_chartevents_clean
GROUP BY
    value
;



DROP TABLE IF EXISTS omop.lk_chartevents_concept;
CREATE TABLE omop.lk_chartevents_concept AS
SELECT
    src.itemid AS itemid,
    src.source_code AS source_code,
    src.source_label AS source_label,
    src.source_vocabulary_id AS source_vocabulary_id,
    -- source concept
    vc.domain_id AS source_domain_id,
    vc.concept_id AS source_concept_id,
    -- target concept
    vc2.domain_id AS target_domain_id,
    vc2.concept_id AS target_concept_id,
    src.row_count AS row_count
FROM
    omop.tmp_chartevents_code_dist src
LEFT JOIN
    omop.voc_concept vc
        ON  vc.concept_code = src.source_code
        AND vc.vocabulary_id = src.source_vocabulary_id
LEFT JOIN
    omop.voc_concept_relationship vcr
        ON  vc.concept_id = vcr.concept_id_1
        AND vcr.relationship_id = 'Maps to'
LEFT JOIN
    omop.voc_concept vc2
        ON  vc2.concept_id = vcr.concept_id_2
        AND vc2.standard_concept = 'S'
        AND vc2.invalid_reason IS NULL
;

DROP TABLE IF EXISTS omop.tmp_chartevents_code_dist;



DROP TABLE IF EXISTS omop.lk_chartevents_mapped;
CREATE TABLE omop.lk_chartevents_mapped AS
SELECT
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS measurement_id,
    src.subject_id AS subject_id,
    src.hadm_id AS hadm_id,
    src.stay_id AS stay_id,
    src.provider_id AS provider_id,
    src.start_datetime AS start_datetime,
    32817 AS type_concept_id,  -- OMOP4976890 EHR
    src.itemid AS itemid,
    src.source_code AS source_code,
    src.source_label AS source_label,
    c_main.source_vocabulary_id AS source_vocabulary_id,
    c_main.source_domain_id AS source_domain_id,
    c_main.source_concept_id AS source_concept_id,
    c_main.target_domain_id AS target_domain_id,
    c_main.target_concept_id AS target_concept_id,
    src.value AS value_source_value,
    CASE
        WHEN src.valuenum IS NULL AND src.value IS NOT NULL 
        THEN COALESCE(c_value.target_concept_id, 0)
        ELSE NULL
    END AS value_as_concept_id,
    src.valuenum AS value_as_number,
    src.valueuom AS unit_source_value, -- unit of measurement
    CASE
        WHEN src.valueuom IS NOT NULL
        THEN COALESCE(uc.target_concept_id, 0)
        ELSE NULL
    END AS unit_concept_id,
    CASE
        WHEN src.valueuom IS NOT NULL
        THEN COALESCE(uc.source_concept_id, 0)
        ELSE NULL
    END AS unit_source_concept_id,
    --
    CONCAT('meas.', src.unit_id) AS unit_id,
    src.load_table_id,
    src.load_row_id,
    src.trace_id
FROM
    omop.lk_chartevents_clean src -- ce
LEFT JOIN
    omop.lk_chartevents_concept c_main -- main
        ON c_main.source_code = src.source_code
        AND c_main.source_vocabulary_id = 'mimiciv_meas_chart'
LEFT JOIN
    omop.lk_chartevents_concept c_value -- values for main
        ON c_value.source_code = src.value
        AND c_value.source_vocabulary_id = 'mimiciv_meas_chartevents_value'
        AND c_value.target_domain_id = 'Meas Value'
LEFT JOIN
    omop.lk_meas_unit_concept uc
        ON uc.source_code = src.valueuom
;



DROP TABLE IF EXISTS omop.lk_chartevents_condition_mapped;
CREATE TABLE omop.lk_chartevents_condition_mapped AS
SELECT
    src.subject_id AS subject_id,
    src.hadm_id AS hadm_id,
    src.stay_id AS stay_id,
    src.provider_id AS provider_id,
    src.start_datetime AS start_datetime,
    src.value AS source_code,
    c_main.source_vocabulary_id AS source_vocabulary_id,
    c_main.source_concept_id AS source_concept_id,
    c_main.target_domain_id AS target_domain_id,
    c_main.target_concept_id AS target_concept_id,
    --
    CONCAT('cond.', src.unit_id) AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.lk_chartevents_clean src -- ce
INNER JOIN
    omop.lk_chartevents_concept c_main -- condition domain from values, mapped
        ON c_main.source_code = src.value
        AND c_main.source_vocabulary_id = 'mimiciv_meas_chartevents_value'
        AND c_main.target_domain_id = 'Condition'
;