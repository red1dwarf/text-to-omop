-- -------------------------------------------------------------------
-- @2020, Odysseus Data Services, Inc. All rights reserved
-- MIMIC IV CDM Conversion
-- -------------------------------------------------------------------
-- -------------------------------------------------------------------
-- Populate cdm_procedure_occurrence table
-- 
-- Dependencies: run after 
--      cdm_person.sql,
--      cdm_visit_occurrence,
--      lk_procedure_occurrence
--      lk_meas_specimen
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Known issues / Open points:
--
-- TRUNCATE TABLE is not supported, organize create or replace
--
-- -------------------------------------------------------------------


-- -------------------------------------------------------------------
-- cdm_procedure_occurrence
-- -------------------------------------------------------------------

--HINT DISTRIBUTE_ON_KEY(person_id)
-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.cdm_procedure_occurrence
-- (
--     procedure_occurrence_id     INT64     not null ,
--     person_id                   INT64     not null ,
--     procedure_concept_id        INT64     not null ,
--     procedure_date              DATE      not null ,
--     procedure_datetime          DATETIME           ,
--     procedure_type_concept_id   INT64     not null ,
--     modifier_concept_id         INT64              ,
--     quantity                    INT64              ,
--     provider_id                 INT64              ,
--     visit_occurrence_id         INT64              ,
--     visit_detail_id             INT64              ,
--     procedure_source_value      STRING             ,
--     procedure_source_concept_id INT64              ,
--     modifier_source_value      STRING              ,
--     -- 
--     unit_id                       STRING,
--     load_table_id                 STRING,
--     load_row_id                   INT64,
--     trace_id                      STRING
-- )
-- ;

-- -- -------------------------------------------------------------------
-- -- Rules 1-4
-- -- lk_procedure_mapped
-- -- -------------------------------------------------------------------

-- INSERT INTO @etl_project.@etl_dataset.cdm_procedure_occurrence
-- SELECT
--     FARM_FINGERPRINT(GENERATE_UUID())           AS procedure_occurrence_id,
--     per.person_id                               AS person_id,
--     src.target_concept_id                       AS procedure_concept_id,
--     CAST(src.start_datetime AS DATE)            AS procedure_date,
--     src.start_datetime                          AS procedure_datetime,
--     src.type_concept_id                         AS procedure_type_concept_id,
--     0                                           AS modifier_concept_id,
--     CAST(src.quantity AS INT64)                 AS quantity,
--     CAST(NULL AS INT64)                         AS provider_id,
--     vis.visit_occurrence_id                     AS visit_occurrence_id,
--     CAST(NULL AS INT64)                         AS visit_detail_id,
--     src.source_code                             AS procedure_source_value,
--     src.source_concept_id                       AS procedure_source_concept_id,
--     CAST(NULL AS STRING)                        AS modifier_source_value,
--     -- 
--     CONCAT('procedure.', src.unit_id)           AS unit_id,
--     src.load_table_id               AS load_table_id,
--     src.load_row_id                 AS load_row_id,
--     src.trace_id                    AS trace_id
-- FROM
--     @etl_project.@etl_dataset.lk_procedure_mapped src
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_person per
--         ON CAST(src.subject_id AS STRING) = per.person_source_value
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_visit_occurrence vis
--         ON  vis.visit_source_value = 
--             CONCAT(CAST(src.subject_id AS STRING), '|', CAST(src.hadm_id AS STRING))
-- WHERE
--     src.target_domain_id = 'Procedure'
-- ;

-- -------------------------------------------------------------------
-- Rule 5
-- lk_observation_mapped, possible DRG codes
-- -------------------------------------------------------------------

-- INSERT INTO @etl_project.@etl_dataset.cdm_procedure_occurrence
-- SELECT
--     FARM_FINGERPRINT(GENERATE_UUID())           AS procedure_occurrence_id,
--     per.person_id                               AS person_id,
--     src.target_concept_id                       AS procedure_concept_id,
--     CAST(src.start_datetime AS DATE)            AS procedure_date,
--     src.start_datetime                          AS procedure_datetime,
--     src.type_concept_id                         AS procedure_type_concept_id,
--     0                                           AS modifier_concept_id,
--     CAST(NULL AS INT64)                         AS quantity,
--     CAST(NULL AS INT64)                         AS provider_id,
--     vis.visit_occurrence_id                     AS visit_occurrence_id,
--     CAST(NULL AS INT64)                         AS visit_detail_id,
--     src.source_code                             AS procedure_source_value,
--     src.source_concept_id                       AS procedure_source_concept_id,
--     CAST(NULL AS STRING)                        AS modifier_source_value,
--     -- 
--     CONCAT('procedure.', src.unit_id)           AS unit_id,
--     src.load_table_id               AS load_table_id,
--     src.load_row_id                 AS load_row_id,
--     src.trace_id                    AS trace_id
-- FROM
--     @etl_project.@etl_dataset.lk_observation_mapped src
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_person per
--         ON CAST(src.subject_id AS STRING) = per.person_source_value
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_visit_occurrence vis
--         ON  vis.visit_source_value = 
--             CONCAT(CAST(src.subject_id AS STRING), '|', CAST(src.hadm_id AS STRING))
-- WHERE
--     src.target_domain_id = 'Procedure'
-- ;

-- -------------------------------------------------------------------
-- Rule 6
-- lk_specimen_mapped, small part of specimen is mapped to Procedure
-- -------------------------------------------------------------------

-- INSERT INTO @etl_project.@etl_dataset.cdm_procedure_occurrence
-- SELECT
--     FARM_FINGERPRINT(GENERATE_UUID())           AS procedure_occurrence_id,
--     per.person_id                               AS person_id,
--     src.target_concept_id                       AS procedure_concept_id,
--     CAST(src.start_datetime AS DATE)            AS procedure_date,
--     src.start_datetime                          AS procedure_datetime,
--     src.type_concept_id                         AS procedure_type_concept_id,
--     0                                           AS modifier_concept_id,
--     CAST(NULL AS INT64)                         AS quantity,
--     CAST(NULL AS INT64)                         AS provider_id,
--     vis.visit_occurrence_id                     AS visit_occurrence_id,
--     CAST(NULL AS INT64)                         AS visit_detail_id,
--     src.source_code                             AS procedure_source_value,
--     src.source_concept_id                       AS procedure_source_concept_id,
--     CAST(NULL AS STRING)                        AS modifier_source_value,
--     -- 
--     CONCAT('procedure.', src.unit_id)           AS unit_id,
--     src.load_table_id               AS load_table_id,
--     src.load_row_id                 AS load_row_id,
--     src.trace_id                    AS trace_id
-- FROM
--     @etl_project.@etl_dataset.lk_specimen_mapped src
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_person per
--         ON CAST(src.subject_id AS STRING) = per.person_source_value
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_visit_occurrence vis
--         ON  vis.visit_source_value = 
--             CONCAT(CAST(src.subject_id AS STRING), '|', 
--                 COALESCE(CAST(src.hadm_id AS STRING), CAST(src.date_id AS STRING)))
-- WHERE
--     src.target_domain_id = 'Procedure'
-- ;


-- -- -------------------------------------------------------------------
-- -- Rule 7
-- -- lk_chartevents_mapped, a part of chartevents table is mapped to Procedure
-- -- -------------------------------------------------------------------

-- INSERT INTO @etl_project.@etl_dataset.cdm_procedure_occurrence
-- SELECT
--     FARM_FINGERPRINT(GENERATE_UUID())           AS procedure_occurrence_id,
--     per.person_id                               AS person_id,
--     src.target_concept_id                       AS procedure_concept_id,
--     CAST(src.start_datetime AS DATE)            AS procedure_date,
--     src.start_datetime                          AS procedure_datetime,
--     src.type_concept_id                         AS procedure_type_concept_id,
--     0                                           AS modifier_concept_id,
--     CAST(NULL AS INT64)                         AS quantity,
--     CAST(NULL AS INT64)                         AS provider_id,
--     vis.visit_occurrence_id                     AS visit_occurrence_id,
--     CAST(NULL AS INT64)                         AS visit_detail_id,
--     src.source_code                             AS procedure_source_value,
--     src.source_concept_id                       AS procedure_source_concept_id,
--     CAST(NULL AS STRING)                        AS modifier_source_value,
--     -- 
--     CONCAT('procedure.', src.unit_id)           AS unit_id,
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
--     src.target_domain_id = 'Procedure'
-- ;






-- ------------------------------------------------------------
-- POSTGRESQL
-- ------------------------------------------------------------

DROP TABLE IF EXISTS omop.cdm_procedure_occurrence;
CREATE TABLE omop.cdm_procedure_occurrence 
(
    procedure_occurrence_id BIGINT NOT NULL,
    person_id BIGINT NOT NULL,
    procedure_concept_id INTEGER NOT NULL,
    procedure_date date NOT NULL,
    procedure_datetime TIMESTAMP NULL,
    procedure_end_date DATE NULL,
    procedure_end_datetime TIMESTAMP NULL,
    procedure_type_concept_id INTEGER NOT NULL,
    modifier_concept_id INTEGER NULL,
    quantity INTEGER NULL,
    provider_id BIGINT NULL,
    visit_occurrence_id BIGINT NULL,
    visit_detail_id BIGINT NULL,
    procedure_source_value VARCHAR(50) NULL,
    procedure_source_concept_id INTEGER NULL,
    modifier_source_value VARCHAR(50) NULL
    --
    unit_id TEXT,
    load_table_id TEXT,
    load_row_id BIGINT,
    trace_id TEXT
)
;


INSERT INTO omop.cdm_procedure_occurrence
SELECT
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS procedure_occurrence_id,
    per.person_id AS person_id,
    src.target_concept_id AS procedure_concept_id,
    CAST(src.start_datetime AS DATE) AS procedure_date,
    src.start_datetime AS procedure_datetime,
    CAST(src.end_datetime AS DATE) AS procedure_end_date,
    src.end_datetime AS procedure_end_datetime,
    src.type_concept_id AS procedure_type_concept_id,
    0 AS modifier_concept_id,
    CAST(src.quantity AS INTEGER) AS quantity,
    prov.provider_id AS provider_id,
    vis.visit_occurrence_id AS visit_occurrence_id,
    NULL AS visit_detail_id,
    src.source_code AS procedure_source_value,
    src.source_concept_id AS procedure_source_concept_id,
    NULL AS modifier_source_value,
    --
    CONCAT('procedure.', src.unit_id) AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.lk_procedure_mapped src
INNER JOIN
    omop.cdm_person per
        ON CAST(src.subject_id AS TEXT) = per.person_source_value
INNER JOIN
    omop.cdm_visit_occurrence vis
        ON  vis.visit_source_value =
            CONCAT(CAST(src.subject_id AS TEXT), '|', CAST(src.hadm_id AS TEXT))
LEFT  JOIN 
    omop.cdm_provider prov
        ON prov.provider_source_value = CAST(src.provider_id AS TEXT)
WHERE
    src.target_domain_id = 'Procedure'
;


-- INSERT INTO omop.cdm_procedure_occurrence
-- SELECT
--     ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS procedure_occurrence_id,
--     per.person_id AS person_id,
--     src.target_concept_id AS procedure_concept_id,
--     CAST(src.start_datetime AS DATE) AS procedure_date,
--     src.start_datetime AS procedure_datetime,
--     CAST(src.end_datetime AS DATE) AS procedure_end_date,
--     src.end_datetime AS procedure_end_datetime,
--     src.type_concept_id AS procedure_type_concept_id,
--     0 AS modifier_concept_id,
--     NULL AS quantity,
--     prov.provider_id AS provider_id,
--     vis.visit_occurrence_id AS visit_occurrence_id,
--     NULL AS visit_detail_id,
--     src.source_code AS procedure_source_value,
--     src.source_concept_id AS procedure_source_concept_id,
--     NULL AS modifier_source_value,
--     --
--     CONCAT('procedure.', src.unit_id) AS unit_id,
--     src.load_table_id AS load_table_id,
--     src.load_row_id AS load_row_id,
--     src.trace_id AS trace_id
-- FROM
--     omop.lk_observation_mapped src
-- INNER JOIN
--     omop.cdm_person per
--         ON CAST(src.subject_id AS TEXT) = per.person_source_value
-- INNER JOIN
--     omop.cdm_visit_occurrence vis
--         ON vis.visit_source_value =
--             CONCAT(CAST(src.subject_id AS TEXT), '|', CAST(src.hadm_id AS TEXT))
-- LEFT  JOIN 
--     omop.cdm_provider prov
--         ON prov.provider_source_value = CAST(src.provider_id AS TEXT)
-- WHERE
--     src.target_domain_id = 'Procedure'
-- ;


INSERT INTO omop.cdm_procedure_occurrence
SELECT
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS procedure_occurrence_id,
    per.person_id AS person_id,
    src.target_concept_id AS procedure_concept_id,
    CAST(src.start_datetime AS DATE) AS procedure_date,
    src.start_datetime AS procedure_datetime,
    CAST(src.end_datetime AS DATE) AS procedure_end_date,
    src.end_datetime AS procedure_end_datetime,
    src.type_concept_id AS procedure_type_concept_id,
    0 AS modifier_concept_id,
    NULL AS quantity,
    prov.provider_id AS provider_id,
    vis.visit_occurrence_id AS visit_occurrence_id,
    NULL AS visit_detail_id,
    src.source_code AS procedure_source_value,
    src.source_concept_id AS procedure_source_concept_id,
    NULL AS modifier_source_value,
    --
    CONCAT('procedure.', src.unit_id) AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.lk_specimen_mapped src
INNER JOIN
    omop.cdm_person per
        ON CAST(src.subject_id AS TEXT) = per.person_source_value
INNER JOIN
    omop.cdm_visit_occurrence vis
        ON vis.visit_source_value =
            CONCAT(CAST(src.subject_id AS TEXT), '|',
                COALESCE(CAST(src.hadm_id AS TEXT), CAST(src.date_id AS TEXT)))
LEFT  JOIN 
    omop.cdm_provider prov
        ON prov.provider_source_value = CAST(src.provider_id AS TEXT)
WHERE
    src.target_domain_id = 'Procedure'
;


INSERT INTO omop.cdm_procedure_occurrence
SELECT
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS procedure_occurrence_id,
    per.person_id AS person_id,
    src.target_concept_id AS procedure_concept_id,
    CAST(src.start_datetime AS DATE) AS procedure_date,
    src.start_datetime AS procedure_datetime,
    CAST(src.start_datetime AS DATE) AS procedure_end_date,
    src.start_datetime AS procedure_end_datetime,
    src.type_concept_id AS procedure_type_concept_id,
    0 AS modifier_concept_id,
    NULL AS quantity,
    prov.provider_id AS provider_id,
    vis.visit_occurrence_id AS visit_occurrence_id,
    NULL AS visit_detail_id,
    src.source_code AS procedure_source_value,
    src.source_concept_id AS procedure_source_concept_id,
    NULL AS modifier_source_value,
    --
    CONCAT('procedure.', src.unit_id) AS unit_id,
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
LEFT  JOIN 
    omop.cdm_provider prov
        ON prov.provider_source_value = CAST(src.provider_id AS TEXT)
WHERE
    src.target_domain_id = 'Procedure'
;
