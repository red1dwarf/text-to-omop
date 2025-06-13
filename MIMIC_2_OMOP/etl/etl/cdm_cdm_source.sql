-- -------------------------------------------------------------------
-- @2020, Odysseus Data Services, Inc. All rights reserved
-- MIMIC IV CDM Conversion
-- -------------------------------------------------------------------
-- -------------------------------------------------------------------
-- Populate cdm_cdm_source table
-- 
-- Dependencies: no 
--      run in the end of the ETL workflow
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Known issues / Open points:
--
-- TRUNCATE TABLE is not supported, organize create or replace
-- 
-- To define source release date as (?)
--      SELECT MAX(creation_time)
--      FROM (loop through source datasets).INFORMATION_omop.TABLES
-- Add second row for Waveform POC?
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.cdm_cdm_source
-- (
--     cdm_source_name                 STRING        not null ,
--     cdm_source_abbreviation         STRING             ,
--     cdm_holder                      STRING             ,
--     source_description              STRING             ,
--     source_documentation_reference  STRING             ,
--     cdm_etl_reference               STRING             ,
--     source_release_date             DATE               ,
--     cdm_release_date                DATE               ,
--     cdm_version                     STRING             ,
--     vocabulary_version              STRING             ,
--     -- 
--     unit_id                       STRING,
--     load_table_id                 STRING,
--     load_row_id                   INT64,
--     trace_id                      STRING
-- )
-- ;

-- INSERT INTO @etl_project.@etl_dataset.cdm_cdm_source
-- SELECT
--     'MIMIC IV'                              AS cdm_source_name,
--     'mimiciv'                               AS cdm_source_abbreviation,
--     'PhysioNet'                             AS cdm_holder,          
--     CONCAT('MIMIC-IV is a publicly available database of patients ',
--         'admitted to the Beth Israel Deaconess Medical Center in Boston, MA, USA.') AS source_description,
--     'https://mimic-iv.mit.edu/docs/'        AS source_documentation_reference,
--     'https://github.com/OHDSI/MIMIC/'       AS cdm_etl_reference,
--     PARSE_DATE('%Y-%m-%d', '2020-09-01')    AS source_release_date, -- to look up
--     CURRENT_DATE()                          AS cdm_release_date,
--     '5.3.1'                                 AS cdm_version,
--     v.vocabulary_version                    AS vocabulary_version,
--     -- 
--     'cdm.source'            AS unit_id,
--     'none'                  AS load_table_id,
--     1                       AS load_row_id,
--     TO_JSON_STRING(STRUCT(
--         'mimiciv' AS trace_id
--     ))                                  AS trace_id

-- FROM 
--     @etl_project.@etl_dataset.voc_vocabulary v
-- WHERE
--     v.vocabulary_id = 'None'
-- ;





-- -----------------------------------------------------------------
-- POSTGRESQL
-- -----------------------------------------------------------------

DROP TABLE IF EXISTS omop.cdm_cdm_source;
CREATE TABLE omop.cdm_cdm_source
(
    cdm_source_name VARCHAR(255) NOT NULL,
    cdm_source_abbreviation VARCHAR(25) NOT NULL,
    cdm_holder VARCHAR(255) NOT NULL,
    source_description TEXT NULL,
    source_documentation_reference VARCHAR(255) NULL,
    cdm_etl_reference VARCHAR(255) NULL,
    source_release_date DATE NOT NULL,
    cdm_release_date DATE NOT NULL,
    cdm_version VARCHAR(10) NULL,
    cdm_version_concept_id INTEGER NOT NULL,
    vocabulary_version VARCHAR(20) NOT NULL,
    -- 
    unit_id TEXT,
    load_table_id TEXT,
    load_row_id BIGINT,
    trace_id TEXT
)
;

INSERT INTO omop.cdm_cdm_source
SELECT
    'MIMIC IV' AS cdm_source_name,
    'mimiciv' AS cdm_source_abbreviation,
    'PhysioNet' AS cdm_holder,          
    CONCAT('MIMIC-IV is a publicly available database of patients ',
        'admitted to the Beth Israel Deaconess Medical Center in Boston, MA, USA.') AS source_description,
    'https://mimic-iv.mit.edu/docs/' AS source_documentation_reference,
    'https://github.com/OHDSI/MIMIC/' AS cdm_etl_reference,
    '2025-03-19'::DATE AS source_release_date, -- to look up
    CURRENT_DATE AS cdm_release_date,
    '5.3.1' AS cdm_version,
    705800 AS cdm_version_concept_id,
    v.vocabulary_version AS vocabulary_version,
    -- 
    'cdm.source' AS unit_id,
    'none' AS load_table_id,
    1 AS load_row_id,
    json_build_object('trace_id', 'mimiciv')::TEXT AS trace_id

FROM 
    omop.voc_vocabulary v
WHERE
    v.vocabulary_id = 'None'
;