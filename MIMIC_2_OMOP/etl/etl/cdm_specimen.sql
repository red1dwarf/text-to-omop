-- -------------------------------------------------------------------
-- @2020, Odysseus Data Services, Inc. All rights reserved
-- MIMIC IV CDM Conversion
-- -------------------------------------------------------------------
-- -------------------------------------------------------------------
-- Populate cdm_specimen table
-- 
-- Dependencies: run after 
--      cdm_person.sql,
--      lk_meas_specimen.sql
--      
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Known issues / Open points:
--
-- TRUNCATE TABLE is not supported, organize create or replace
--
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Rule 1 specimen from microbiology
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- cdm_specimen
-- -------------------------------------------------------------------

--HINT DISTRIBUTE_ON_KEY(person_id)
-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.cdm_specimen
-- (
--     specimen_id                 INT64     not null ,
--     person_id                   INT64     not null ,
--     specimen_concept_id         INT64     not null ,
--     specimen_type_concept_id    INT64     not null ,
--     specimen_date               DATE      not null ,
--     specimen_datetime           DATETIME           ,
--     quantity                    FLOAT64            ,
--     unit_concept_id             INT64              ,
--     anatomic_site_concept_id    INT64              ,
--     disease_status_concept_id   INT64              ,
--     specimen_source_id          STRING             ,
--     specimen_source_value       STRING             ,
--     unit_source_value           STRING             ,
--     anatomic_site_source_value  STRING             ,
--     disease_status_source_value STRING             ,
--     -- 
--     unit_id                       STRING,
--     load_table_id                 STRING,
--     load_row_id                   INT64,
--     trace_id                      STRING
-- )
-- ;


-- INSERT INTO @etl_project.@etl_dataset.cdm_specimen
-- SELECT
--     src.specimen_id                             AS specimen_id,
--     per.person_id                               AS person_id,
--     COALESCE(src.target_concept_id, 0)          AS specimen_concept_id,
--     32856                                       AS specimen_type_concept_id, -- OMOP4976929 Lab
--     CAST(src.start_datetime AS DATE)            AS specimen_date,
--     src.start_datetime                          AS specimen_datetime,
--     CAST(NULL AS FLOAT64)                       AS quantity,
--     CAST(NULL AS INT64)                         AS unit_concept_id,
--     0                                           AS anatomic_site_concept_id,
--     0                                           AS disease_status_concept_id,
--     src.trace_id                                AS specimen_source_id,
--     src.source_code                             AS specimen_source_value,
--     CAST(NULL AS STRING)                        AS unit_source_value,
--     CAST(NULL AS STRING)                        AS anatomic_site_source_value,
--     CAST(NULL AS STRING)                        AS disease_status_source_value,
--     -- 
--     CONCAT('specimen.', src.unit_id)    AS unit_id,
--     src.load_table_id               AS load_table_id,
--     src.load_row_id                 AS load_row_id,
--     src.trace_id                    AS trace_id
-- FROM
--     @etl_project.@etl_dataset.lk_specimen_mapped src
-- INNER JOIN
--     @etl_project.@etl_dataset.cdm_person per
--         ON CAST(src.subject_id AS STRING) = per.person_source_value
-- WHERE
--     src.target_domain_id = 'Specimen'
-- ;






-- -------------------------------------------------------------------
-- POSTGRESQL
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS omop.cdm_specimen;
CREATE TABLE omop.cdm_specimen 
(
    specimen_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL,
    specimen_concept_id INTEGER NOT NULL,
    specimen_type_concept_id INTEGER NOT NULL,
    specimen_date DATE NOT NULL,
    specimen_datetime TIMESTAMP NULL,
    quantity NUMERIC NULL,
    unit_concept_id INTEGER NULL,
    anatomic_site_concept_id INTEGER NULL,
    disease_status_concept_id INTEGER NULL,
    specimen_source_id VARCHAR(50) NULL,
    specimen_source_value VARCHAR(50) NULL,
    unit_source_value VARCHAR(50) NULL,
    anatomic_site_source_value VARCHAR(50) NULL,
    disease_status_source_value VARCHAR(50) NULL,
    --
    unit_id TEXT,
    load_table_id TEXT,
    load_row_id BIGINT,
    trace_id TEXT
)
;

INSERT INTO omop.cdm_specimen
SELECT
    src.specimen_id AS specimen_id,
    per.person_id AS person_id,
    COALESCE(src.target_concept_id, 0) AS specimen_concept_id,
    32856 AS specimen_type_concept_id, -- OMOP4976929 Lab
    CAST(src.start_datetime AS DATE) AS specimen_date,
    src.start_datetime AS specimen_datetime,
    NULL AS quantity,
    NULL AS unit_concept_id,
    0 AS anatomic_site_concept_id,
    0 AS disease_status_concept_id,
    src.trace_id AS specimen_source_id,
    src.source_code AS specimen_source_value,
    NULL AS unit_source_value,
    NULL AS anatomic_site_source_value,
    NULL AS disease_status_source_value,
    --
    CONCAT('specimen.', src.unit_id) AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.lk_specimen_mapped src
INNER JOIN
    omop.cdm_person per
        ON CAST(src.subject_id AS TEXT) = per.person_source_value
WHERE
    src.target_domain_id = 'Specimen'
;