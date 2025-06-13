-- CREATE OR REPLACE TABLE `@etl_project`.@etl_dataset.lk_outputevents AS
-- SELECT
--     src.subject_id                  AS subject_id,
--     src.hadm_id                     AS hadm_id,
--     src.stay_id                     AS stay_id,
--     src.itemid                      AS itemid,
--     CAST(src.itemid AS STRING)      AS source_code,
--     di.label                        AS source_label,
--     src.charttime                   AS start_datetime,
--     src.value                       AS valuenum,
--     src.valueuom                    AS valueuom,
--     'outputevents'           AS unit_id,
--     src.load_table_id       AS load_table_id,
--     src.load_row_id         AS load_row_id,
--     src.trace_id            AS trace_id
-- FROM
--     `@etl_project`.@etl_dataset.src_outputevents src
-- INNER JOIN
--     `@etl_project`.@etl_dataset.src_d_items di
--         ON  src.itemid = di.itemid
-- ;


-- CREATE OR REPLACE TABLE `@etl_project`.@etl_dataset.lk_outputevents_mapped AS
-- SELECT
--     FARM_FINGERPRINT(GENERATE_UUID())               AS measurement_id,
--     src.subject_id                                  AS subject_id,
--     src.hadm_id                                     AS hadm_id,
--     src.stay_id                                     AS stay_id,
--     src.start_datetime                              AS start_datetime,
--     32817                                           AS type_concept_id,  -- OMOP4976890 EHR
--     src.itemid                                      AS itemid,
--     src.source_code                                 AS source_code,
--     src.source_label                                AS source_label,
--     c.vocabulary_id                                 AS vocabulary_id,
--     c.domain_id                                     AS source_domain_id,
--     c.concept_id                                    AS source_concept_id,
--     c2.domain_id                                    AS target_domain_id,
--     c2.concept_id                                   AS target_concept_id,
--     CAST(src.valuenum AS STRING)                    AS value_source_value,
--     0                                               AS value_as_concept_id,
--     CASE
--         WHEN src.itemid = 227488 THEN -src.valuenum
--         ELSE src.valuenum
--     END                                             AS value_as_number,
--     src.valueuom                                    AS unit_source_value,
--     IF(src.valueuom IS NOT NULL,
--         COALESCE(uc.target_concept_id, 0), NULL)    AS unit_concept_id,
--     --
--     CONCAT('meas.', src.unit_id)                    AS unit_id,
--     src.load_table_id                               AS load_table_id,
--     src.load_row_id                                 AS load_row_id,
--     src.trace_id                                    AS trace_id
-- FROM
--     `@etl_project`.@etl_dataset.lk_outputevents src
-- LEFT JOIN `@etl_project`.@etl_dataset.concept c
--     ON src.source_code = c.concept_code AND c.vocabulary_id = 'mimiciv_outputevents'
-- LEFT JOIN `@etl_project`.@etl_dataset.concept_relationship cr
--     ON  c.concept_id = cr.concept_id_1
-- LEFT JOIN `@etl_project`.@etl_dataset.concept c2
--     ON cr.concept_id_2 = c2.concept_id
--     AND c2.standard_concept = 'S'
--     AND c2.invalid_reason IS NULL
-- LEFT JOIN `@etl_project`.@etl_dataset.lk_meas_unit_concept uc
--     ON  src.valueuom = uc.source_code
-- ;




-- ----------------------------------------------------------
-- POSTGRESQL
-- ----------------------------------------------------------

DROP TABLE IF EXISTS omop.lk_outputevents;
CREATE TABLE omop.lk_outputevents AS
SELECT
    src.subject_id AS subject_id,
    src.hadm_id AS hadm_id,
    src.stay_id AS stay_id,
    src.caregiver_id AS provider_id,
    src.itemid AS itemid,
    CAST(src.itemid AS TEXT) AS source_code,
    di.label AS source_label,
    src.charttime AS start_datetime,
    src.value AS valuenum,
    src.valueuom AS valueuom,
    --
    'outputevents' AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.src_outputevents src
INNER JOIN
    omop.src_d_items di
        ON src.itemid = di.itemid
;



DROP TABLE IF EXISTS omop.lk_outputevents_mapped;
CREATE TABLE omop.lk_outputevents_mapped AS
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
    c.vocabulary_id AS vocabulary_id,
    c.domain_id AS source_domain_id,
    c.concept_id AS source_concept_id,
    c2.domain_id AS target_domain_id,
    c2.concept_id AS target_concept_id,
    CAST(src.valuenum AS TEXT) AS value_source_value,
    0 AS value_as_concept_id,
    CASE
        WHEN src.itemid = 227488 THEN -src.valuenum
        ELSE src.valuenum
    END AS value_as_number,
    src.valueuom AS unit_source_value,
    CASE
        WHEN src.valueuom IS NOT NULL THEN COALESCE(uc.target_concept_id, 0)
        ELSE NULL
    END AS unit_concept_id,
    CASE
        WHEN src.valueuom IS NOT NULL THEN COALESCE(uc.source_concept_id, 0)
        ELSE 0
    END AS unit_source_concept_id,
    --
    CONCAT('meas.', src.unit_id) AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.lk_outputevents src
LEFT JOIN omop.concept c
    ON src.source_code = c.concept_code AND c.vocabulary_id = 'mimiciv_outputevents'
LEFT JOIN omop.concept_relationship cr
    ON c.concept_id = cr.concept_id_1
LEFT JOIN omop.concept c2
    ON cr.concept_id_2 = c2.concept_id
    AND c2.standard_concept = 'S'
    AND c2.invalid_reason IS NULL
LEFT JOIN omop.lk_meas_unit_concept uc
    ON src.valueuom = uc.source_code
;
