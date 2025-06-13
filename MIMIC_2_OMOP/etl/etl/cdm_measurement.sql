-- -------------------------------------------------------------------
-- @2020, Odysseus Data Services, Inc. All rights reserved
-- MIMIC IV CDM Conversion
-- -------------------------------------------------------------------
-- -------------------------------------------------------------------
-- Populate cdm_measurement table
-- 
-- Dependencies: run after 
--      cdm_person.sql,
--      cdm_visit_occurrence,
--      cdm_visit_detail,
--          lk_meas_labevents.sql,
--          lk_meas_chartevents,
--          lk_meas_specimen,
--          lk_meas_waveform.sql
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Known issues / Open points:
--
-- TRUNCATE TABLE is not supported, organize create or replace
--
-- src_labevents: look closer to fields priority and specimen_id
-- src_labevents.value: 
--      investigate if there are formatted values with thousand separators,
--      and if we need to use more complicated parsing.
-- -------------------------------------------------------------------



--HINT DISTRIBUTE_ON_KEY(person_id)
-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.cdm_measurement
-- (
--     measurement_id                INT64     not null ,
--     person_id                     INT64     not null ,
--     measurement_concept_id        INT64     not null ,
--     measurement_date              DATE      not null ,
--     measurement_datetime          DATETIME           ,
--     measurement_time              STRING             ,
--     measurement_type_concept_id   INT64     not null ,
--     operator_concept_id           INT64              ,
--     value_as_number               FLOAT64            ,
--     value_as_concept_id           INT64              ,
--     unit_concept_id               INT64              ,
--     range_low                     FLOAT64            ,
--     range_high                    FLOAT64            ,
--     provider_id                   INT64              ,
--     visit_occurrence_id           INT64              ,
--     visit_detail_id               INT64              ,
--     measurement_source_value      STRING             ,
--     measurement_source_concept_id INT64              ,
--     unit_source_value             STRING             ,
--     value_source_value            STRING             ,
--     -- 
--     unit_id                       STRING,
--     load_table_id                 STRING,
--     load_row_id                   INT64,
--     trace_id                      STRING  
-- )
-- ;

-- -------------------------------------------------------------------
-- Rule 1
-- LABS from labevents
-- demo:  115,272 rows from mapped 107,209 rows. Remove duplicates
-- -------------------------------------------------------------------

-- INSERT INTO @etl_project.@etl_dataset.cdm_measurement
-- SELECT
--     src.measurement_id                      AS measurement_id,
--     per.person_id                           AS person_id,
--     COALESCE(src.target_concept_id, 0)      AS measurement_concept_id,
--     CAST(src.start_datetime AS DATE)        AS measurement_date,
--     src.start_datetime                      AS measurement_datetime,
--     CAST(NULL AS STRING)                    AS measurement_time,
--     32856                                   AS measurement_type_concept_id, -- OMOP4976929 Lab
--     src.operator_concept_id                 AS operator_concept_id,
--     CAST(src.value_as_number AS FLOAT64)    AS value_as_number,  -- to move CAST to mapped/clean
--     CAST(NULL AS INT64)                     AS value_as_concept_id,
--     src.unit_concept_id                     AS unit_concept_id,
--     src.range_low                           AS range_low,
--     src.range_high                          AS range_high,
--     CAST(NULL AS INT64)                     AS provider_id,
--     vis.visit_occurrence_id                 AS visit_occurrence_id,
--     CAST(NULL AS INT64)                     AS visit_detail_id,
--     src.source_code                         AS measurement_source_value,
--     src.source_concept_id                   AS measurement_source_concept_id,
--     src.unit_source_value                   AS unit_source_value,
--     src.value_source_value                  AS value_source_value,
--     --
--     CONCAT('measurement.', src.unit_id)     AS unit_id,
--     src.load_table_id               AS load_table_id,
--     src.load_row_id                 AS load_row_id,
--     src.trace_id                    AS trace_id
-- FROM  
--     @etl_project.@etl_dataset.lk_meas_labevents_mapped src -- 107,209 
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_person per -- 110,849
--         ON CAST(src.subject_id AS STRING) = per.person_source_value
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_visit_occurrence vis -- 116,559
--         ON  vis.visit_source_value = 
--             CONCAT(CAST(src.subject_id AS STRING), '|', 
--                 COALESCE(CAST(src.hadm_id AS STRING), CAST(src.date_id AS STRING)))
-- WHERE
--     src.target_domain_id = 'Measurement' -- 115,272
-- ;

-- -------------------------------------------------------------------
-- Rule 2
-- chartevents
-- -------------------------------------------------------------------

-- INSERT INTO @etl_project.@etl_dataset.cdm_measurement
-- SELECT
--     src.measurement_id                      AS measurement_id,
--     per.person_id                           AS person_id,
--     COALESCE(src.target_concept_id, 0)      AS measurement_concept_id,
--     CAST(src.start_datetime AS DATE)        AS measurement_date,
--     src.start_datetime                      AS measurement_datetime,
--     CAST(NULL AS STRING)                    AS measurement_time,
--     src.type_concept_id                     AS measurement_type_concept_id,
--     CAST(NULL AS INT64)                     AS operator_concept_id,
--     src.value_as_number                     AS value_as_number,
--     src.value_as_concept_id                 AS value_as_concept_id,
--     src.unit_concept_id                     AS unit_concept_id,
--     CAST(NULL AS INT64)                     AS range_low,
--     CAST(NULL AS INT64)                     AS range_high,
--     CAST(NULL AS INT64)                     AS provider_id,
--     vis.visit_occurrence_id                 AS visit_occurrence_id,
--     CAST(NULL AS INT64)                     AS visit_detail_id,
--     src.source_code                         AS measurement_source_value,
--     src.source_concept_id                   AS measurement_source_concept_id,
--     src.unit_source_value                   AS unit_source_value,
--     src.value_source_value                  AS value_source_value,
--     --
--     CONCAT('measurement.', src.unit_id)     AS unit_id,
--     src.load_table_id               AS load_table_id,
--     src.load_row_id                 AS load_row_id,
--     src.trace_id                    AS trace_id
-- FROM  
--     @etl_project.@etl_dataset.lk_chartevents_mapped src
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_person per
--         ON CAST(src.subject_id AS STRING) = per.person_source_value
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_visit_occurrence vis
--         ON  vis.visit_source_value = 
--             CONCAT(CAST(src.subject_id AS STRING), '|', CAST(src.hadm_id AS STRING))
-- WHERE
--     src.target_domain_id = 'Measurement'
-- ;

-- -------------------------------------------------------------------
-- Rule 3.1
-- Microbiology - organism
-- -------------------------------------------------------------------

-- INSERT INTO @etl_project.@etl_dataset.cdm_measurement
-- SELECT
--     src.measurement_id                      AS measurement_id,
--     per.person_id                           AS person_id,
--     COALESCE(src.target_concept_id, 0)      AS measurement_concept_id,
--     CAST(src.start_datetime AS DATE)        AS measurement_date,
--     src.start_datetime                      AS measurement_datetime,
--     CAST(NULL AS STRING)                    AS measurement_time,
--     src.type_concept_id                     AS measurement_type_concept_id,
--     CAST(NULL AS INT64)                     AS operator_concept_id,
--     CAST(NULL AS FLOAT64)                   AS value_as_number,
--     COALESCE(src.value_as_concept_id, 0)    AS value_as_concept_id,
--     CAST(NULL AS INT64)                     AS unit_concept_id,
--     CAST(NULL AS INT64)                     AS range_low,
--     CAST(NULL AS INT64)                     AS range_high,
--     CAST(NULL AS INT64)                     AS provider_id,
--     vis.visit_occurrence_id                 AS visit_occurrence_id,
--     CAST(NULL AS INT64)                     AS visit_detail_id,
--     src.source_code                         AS measurement_source_value,
--     src.source_concept_id                   AS measurement_source_concept_id,
--     CAST(NULL AS STRING)                    AS unit_source_value,
--     src.value_source_value                  AS value_source_value,
--     --
--     CONCAT('measurement.', src.unit_id)     AS unit_id,
--     src.load_table_id               AS load_table_id,
--     src.load_row_id                 AS load_row_id,
--     src.trace_id                    AS trace_id
-- FROM  
--     @etl_project.@etl_dataset.lk_meas_organism_mapped src
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_person per
--         ON CAST(src.subject_id AS STRING) = per.person_source_value
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_visit_occurrence vis -- 116,559
--         ON  vis.visit_source_value = 
--             CONCAT(CAST(src.subject_id AS STRING), '|', 
--                 COALESCE(CAST(src.hadm_id AS STRING), CAST(src.date_id AS STRING)))
-- WHERE
--     src.target_domain_id = 'Measurement'
-- ;

-- -------------------------------------------------------------------
-- Rule 3.2
-- Microbiology - antibiotics
-- -------------------------------------------------------------------

-- INSERT INTO @etl_project.@etl_dataset.cdm_measurement
-- SELECT
--     src.measurement_id                      AS measurement_id,
--     per.person_id                           AS person_id,
--     COALESCE(src.target_concept_id, 0)      AS measurement_concept_id,
--     CAST(src.start_datetime AS DATE)        AS measurement_date,
--     src.start_datetime                      AS measurement_datetime,
--     CAST(NULL AS STRING)                    AS measurement_time,
--     src.type_concept_id                     AS measurement_type_concept_id,
--     src.operator_concept_id                 AS operator_concept_id, -- dilution comparison
--     src.value_as_number                     AS value_as_number, -- dilution value
--     COALESCE(src.value_as_concept_id, 0)    AS value_as_concept_id, -- resistance (interpretation)
--     CAST(NULL AS INT64)                     AS unit_concept_id,
--     CAST(NULL AS INT64)                     AS range_low,
--     CAST(NULL AS INT64)                     AS range_high,
--     CAST(NULL AS INT64)                     AS provider_id,
--     vis.visit_occurrence_id                 AS visit_occurrence_id,
--     CAST(NULL AS INT64)                     AS visit_detail_id,
--     src.source_code                         AS measurement_source_value, -- antibiotic name
--     src.source_concept_id                   AS measurement_source_concept_id,
--     CAST(NULL AS STRING)                    AS unit_source_value,
--     src.value_source_value                  AS value_source_value, -- resistance source value
--     --
--     CONCAT('measurement.', src.unit_id)     AS unit_id,
--     src.load_table_id               AS load_table_id,
--     src.load_row_id                 AS load_row_id,
--     src.trace_id                    AS trace_id
-- FROM  
--     @etl_project.@etl_dataset.lk_meas_ab_mapped src
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_person per
--         ON CAST(src.subject_id AS STRING) = per.person_source_value
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_visit_occurrence vis -- 116,559
--         ON  vis.visit_source_value = 
--             CONCAT(CAST(src.subject_id AS STRING), '|', 
--                 COALESCE(CAST(src.hadm_id AS STRING), CAST(src.date_id AS STRING)))
-- WHERE
--     src.target_domain_id = 'Measurement'
-- ;

-- -------------------------------------------------------------------
-- cdm_measurement
-- Rule 10 (waveform)
-- wf demo poc: 1,500 rows from 1,500 rows in mapped
-- -------------------------------------------------------------------

-- INSERT INTO @etl_project.@etl_dataset.cdm_measurement
-- SELECT
--     FARM_FINGERPRINT(GENERATE_UUID())       AS measurement_id,
--     per.person_id                           AS person_id,
--     COALESCE(src.target_concept_id, 0)      AS measurement_concept_id,
--     CAST(src.start_datetime AS DATE)        AS measurement_date,
--     src.start_datetime                      AS measurement_datetime,
--     CAST(NULL AS STRING)                    AS measurement_time, -- deprecated, to be removed in later versions
--     32817                                   AS measurement_type_concept_id, -- OMOP4976890 EHR
--     CAST(NULL AS INT64)                     AS operator_concept_id,
--     src.value_as_number                     AS value_as_number,
--     CAST(NULL AS INT64)                     AS value_as_concept_id, -- to add values
--     src.unit_concept_id                     AS unit_concept_id,
--     CAST(NULL AS FLOAT64)                   AS range_low,
--     CAST(NULL AS FLOAT64)                   AS range_high,
--     CAST(NULL AS INT64)                     AS provider_id,
--     vd.visit_occurrence_id                  AS visit_occurrence_id,
--     vd.visit_detail_id                      AS visit_detail_id,
--     CONCAT(src.source_code)                 AS measurement_source_value,  -- source value is changed
--     src.source_concept_id                           AS measurement_source_concept_id,
--     src.unit_source_value                   AS unit_source_value,
--     CAST(src.value_as_number AS STRING)     AS value_source_value, -- ?
--     -- 
--     CONCAT('measurement.', src.unit_id)     AS unit_id,
--     src.load_table_id                       AS load_table_id,
--     src.load_row_id                         AS load_row_id,
--     src.trace_id                            AS trace_id
-- FROM
--     @etl_project.@etl_dataset.lk_meas_waveform_mapped src
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_person per 
--         ON CAST(src.subject_id AS STRING) = per.person_source_value
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_visit_detail vd 
--         ON src.reference_id = vd.visit_detail_source_value
-- WHERE
--     src.target_domain_id = 'Measurement'
-- ;

-- -------------------------------------------------------------------
-- Rule 4
-- Outputevents
-- -------------------------------------------------------------------

-- INSERT INTO `@etl_project`.@etl_dataset.cdm_measurement
-- SELECT
--     src.measurement_id                      AS measurement_id,
--     per.person_id                           AS person_id,
--     COALESCE(src.target_concept_id, 0)      AS measurement_concept_id,
--     CAST(src.start_datetime AS DATE)        AS measurement_date,
--     src.start_datetime                      AS measurement_datetime,
--     CAST(NULL AS STRING)                    AS measurement_time,
--     src.type_concept_id                     AS measurement_type_concept_id,
--     CAST(NULL AS INT64)                     AS operator_concept_id,
--     src.value_as_number                     AS value_as_number,
--     COALESCE(src.value_as_concept_id, 0)    AS value_as_concept_id,
--     CAST(NULL AS INT64)                     AS unit_concept_id,
--     CAST(NULL AS INT64)                     AS range_low,
--     CAST(NULL AS INT64)                     AS range_high,
--     CAST(NULL AS INT64)                     AS provider_id,
--     vis.visit_occurrence_id                 AS visit_occurrence_id,
--     CAST(NULL AS INT64)                     AS visit_detail_id,
--     src.source_code                         AS measurement_source_value,
--     src.source_concept_id                   AS measurement_source_concept_id,
--     src.unit_source_value                   AS unit_source_value,
--     src.value_source_value                  AS value_source_value,
--     --
--     CONCAT('measurement.', src.unit_id)     AS unit_id,
--     src.load_table_id               AS load_table_id,
--     src.load_row_id                 AS load_row_id,
--     src.trace_id                    AS trace_id
-- FROM
--     `@etl_project`.@etl_dataset.lk_outputevents_mapped src
-- INNER JOIN
--     `@etl_project`.@etl_dataset.cdm_person per
--         ON CAST(src.subject_id AS STRING) = per.person_source_value
-- INNER JOIN
--     `@etl_project`.@etl_dataset.cdm_visit_occurrence vis
--         ON  vis.visit_source_value =
--             CONCAT(CAST(src.subject_id AS STRING), '|', CAST(src.hadm_id AS STRING))
-- ;





-- ----------------------------------------------------------------------
-- POSTGRESQL
-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS omop.cdm_measurement;
CREATE TABLE omop.cdm_measurement 
(
    measurement_id BIGINT NOT NULL,
    person_id BIGINT NOT NULL,
    measurement_concept_id INTEGER NOT NULL,
    measurement_date DATE NOT NULL,
    measurement_datetime TIMESTAMP NULL,
    measurement_time VARCHAR(10) NULL,
    measurement_type_concept_id INTEGER NOT NULL,
    operator_concept_id INTEGER NULL,
    value_as_number NUMERIC NULL,
    value_as_concept_id INTEGER NULL,
    unit_concept_id INTEGER NULL,
    range_low NUMERIC NULL,
    range_high NUMERIC NULL,
    provider_id BIGINT NULL,
    visit_occurrence_id BIGINT NULL,
    visit_detail_id BIGINT NULL,
    measurement_source_value VARCHAR(50) NULL,
    measurement_source_concept_id INTEGER NULL,
    unit_source_value VARCHAR(50) NULL,
    unit_source_concept_id INTEGER NULL,
    value_source_value VARCHAR(50) NULL,
    measurement_event_id INTEGER NULL,
    meas_event_field_concept_id INTEGER NULL,
    --
    unit_id TEXT,
    load_table_id TEXT,
    load_row_id BIGINT,
    trace_id TEXT
)
;


INSERT INTO omop.cdm_measurement
SELECT
    src.measurement_id AS measurement_id,
    per.person_id AS person_id,
    COALESCE(src.target_concept_id, 0) AS measurement_concept_id,
    CAST(src.start_datetime AS DATE) AS measurement_date,
    src.start_datetime AS measurement_datetime,
    NULL AS measurement_time,
    32856 AS measurement_type_concept_id, -- OMOP4976929 Lab
    src.operator_concept_id AS operator_concept_id,
    CAST(src.value_as_number AS NUMERIC) AS value_as_number,  -- to move CAST to mapped/clean
    NULL AS value_as_concept_id,
    src.unit_concept_id AS unit_concept_id,
    src.range_low AS range_low,
    src.range_high AS range_high,
    prov.provider_id AS provider_id,
    vis.visit_occurrence_id AS visit_occurrence_id,
    NULL AS visit_detail_id,
    src.source_code AS measurement_source_value,
    src.source_concept_id AS measurement_source_concept_id,
    src.unit_source_value AS unit_source_value,
    src.unit_source_concept_id AS unit_source_concept_id,
    src.value_source_value AS value_source_value,
    NULL AS measurement_event_id,
    NULL AS meas_event_field_concept_id,
    --
    CONCAT('measurement.', src.unit_id) AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.lk_meas_labevents_mapped src -- 107,209
INNER JOIN
    omop.cdm_person per -- 110,849
        ON CAST(src.subject_id AS TEXT) = per.person_source_value
INNER JOIN
    omop.cdm_visit_occurrence vis -- 116,559
        ON vis.visit_source_value =
            CONCAT(CAST(src.subject_id AS TEXT), '|',
                COALESCE(CAST(src.hadm_id AS TEXT), CAST(src.date_id AS TEXT)))
LEFT JOIN
    omop.cdm_provider prov
        ON prov.provider_source_value = CAST(src.provider_id AS TEXT)
WHERE
    src.target_domain_id = 'Measurement' -- 115,272
;


INSERT INTO omop.cdm_measurement
SELECT
    src.measurement_id AS measurement_id,
    per.person_id AS person_id,
    COALESCE(src.target_concept_id, 0) AS measurement_concept_id,
    CAST(src.start_datetime AS DATE) AS measurement_date,
    src.start_datetime AS measurement_datetime,
    NULL AS measurement_time,
    src.type_concept_id AS measurement_type_concept_id,
    NULL AS operator_concept_id,
    src.value_as_number AS value_as_number,
    src.value_as_concept_id AS value_as_concept_id,
    src.unit_concept_id AS unit_concept_id,
    NULL AS range_low,
    NULL AS range_high,
    prov.provider_id AS provider_id,
    vis.visit_occurrence_id AS visit_occurrence_id,
    NULL AS visit_detail_id,
    src.source_code AS measurement_source_value,
    src.source_concept_id AS measurement_source_concept_id,
    src.unit_source_value AS unit_source_value,
    src.unit_source_concept_id AS unit_source_concept_id,
    src.value_source_value AS value_source_value,
    NULL AS measurement_event_id,
    NULL AS meas_event_field_concept_id,
    --
    CONCAT('measurement.', src.unit_id) AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.lk_chartevents_mapped src
INNER JOIN
    omop.cdm_person per
        ON CAST(src.subject_id AS TEXT) = per.person_source_value
INNER JOIN
    omop.cdm_visit_occurrence vis
        ON vis.visit_source_value =
            CONCAT(CAST(src.subject_id AS TEXT), '|', CAST(src.hadm_id AS TEXT))
LEFT JOIN
    omop.cdm_provider prov
        ON prov.provider_source_value = CAST(src.provider_id AS TEXT)
WHERE
    src.target_domain_id = 'Measurement'
;


INSERT INTO omop.cdm_measurement
SELECT
    src.measurement_id AS measurement_id,
    per.person_id AS person_id,
    COALESCE(src.target_concept_id, 0) AS measurement_concept_id,
    CAST(src.start_datetime AS DATE) AS measurement_date,
    src.start_datetime AS measurement_datetime,
    NULL AS measurement_time,
    src.type_concept_id AS measurement_type_concept_id,
    NULL AS operator_concept_id,
    NULL AS value_as_number,
    COALESCE(src.value_as_concept_id, 0) AS value_as_concept_id,
    NULL AS unit_concept_id,
    NULL AS range_low,
    NULL AS range_high,
    prov.provider_id AS provider_id,
    vis.visit_occurrence_id AS visit_occurrence_id,
    NULL AS visit_detail_id,
    src.source_code AS measurement_source_value,
    src.source_concept_id AS measurement_source_concept_id,
    NULL AS unit_source_value,
    NULL AS unit_source_concept_id,
    src.value_source_value AS value_source_value,
    NULL AS measurement_event_id,
    NULL AS meas_event_field_concept_id,
    --
    CONCAT('measurement.', src.unit_id) AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.lk_meas_organism_mapped src
INNER JOIN
    omop.cdm_person per
        ON CAST(src.subject_id AS TEXT) = per.person_source_value
INNER JOIN
    omop.cdm_visit_occurrence vis
        ON vis.visit_source_value =
            CONCAT(CAST(src.subject_id AS TEXT), '|',
                COALESCE(CAST(src.hadm_id AS TEXT), CAST(src.date_id AS TEXT)))
LEFT JOIN
    omop.cdm_provider prov
        ON prov.provider_source_value = CAST(src.provider_id AS TEXT)
WHERE
    src.target_domain_id = 'Measurement'
;


INSERT INTO omop.cdm_measurement
SELECT
    src.measurement_id AS measurement_id,
    per.person_id AS person_id,
    COALESCE(src.target_concept_id, 0) AS measurement_concept_id,
    CAST(src.start_datetime AS DATE) AS measurement_date,
    src.start_datetime AS measurement_datetime,
    NULL AS measurement_time,
    src.type_concept_id AS measurement_type_concept_id,
    src.operator_concept_id AS operator_concept_id, -- dilution comparison
    src.value_as_number AS value_as_number, -- dilution value
    COALESCE(src.value_as_concept_id, 0) AS value_as_concept_id, -- resistance (interpretation)
    NULL AS unit_concept_id,
    NULL AS range_low,
    NULL AS range_high,
    prov.provider_id AS provider_id,
    vis.visit_occurrence_id AS visit_occurrence_id,
    NULL AS visit_detail_id,
    src.source_code AS measurement_source_value, -- antibiotic name
    src.source_concept_id AS measurement_source_concept_id,
    NULL AS unit_source_value,
    NULL AS unit_source_concept_id,
    src.value_source_value AS value_source_value, -- resistance source value
    NULL AS measurement_event_id,
    NULL AS meas_event_field_concept_id,
    --
    CONCAT('measurement.', src.unit_id) AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.lk_meas_ab_mapped src
INNER JOIN
    omop.cdm_person per
        ON CAST(src.subject_id AS TEXT) = per.person_source_value
INNER JOIN
    omop.cdm_visit_occurrence vis
        ON vis.visit_source_value =
            CONCAT(CAST(src.subject_id AS TEXT), '|',
                COALESCE(CAST(src.hadm_id AS TEXT), CAST(src.date_id AS TEXT)))
LEFT JOIN
    omop.cdm_provider prov
        ON prov.provider_source_value = CAST(src.provider_id AS TEXT)
WHERE
    src.target_domain_id = 'Measurement'
;


INSERT INTO omop.cdm_measurement
SELECT
    src.measurement_id AS measurement_id,
    per.person_id AS person_id,
    COALESCE(src.target_concept_id, 0) AS measurement_concept_id,
    CAST(src.start_datetime AS DATE) AS measurement_date,
    src.start_datetime AS measurement_datetime,
    NULL AS measurement_time,
    src.type_concept_id AS measurement_type_concept_id,
    NULL AS operator_concept_id,
    src.value_as_number AS value_as_number,
    COALESCE(src.value_as_concept_id, 0) AS value_as_concept_id,
    src.unit_concept_id AS unit_concept_id,
    NULL AS range_low,
    NULL AS range_high,
    prov.provider_id AS provider_id,
    vis.visit_occurrence_id AS visit_occurrence_id,
    NULL AS visit_detail_id,
    src.source_code AS measurement_source_value,
    src.source_concept_id AS measurement_source_concept_id,
    src.unit_source_value AS unit_source_value,
    src.unit_source_concept_id AS unit_source_concept_id,
    src.value_source_value AS value_source_value,
    NULL AS measurement_event_id,
    NULL AS meas_event_field_concept_id,
    --
    CONCAT('measurement.', src.unit_id) AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.lk_outputevents_mapped src
INNER JOIN
    omop.cdm_person per
        ON CAST(src.subject_id AS TEXT) = per.person_source_value
INNER JOIN
    omop.cdm_visit_occurrence vis
        ON vis.visit_source_value =
            CONCAT(CAST(src.subject_id AS TEXT), '|', CAST(src.hadm_id AS TEXT))
LEFT JOIN
    omop.cdm_provider prov
        ON prov.provider_source_value = CAST(src.provider_id AS TEXT)
;
