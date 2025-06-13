-- -------------------------------------------------------------------
-- @2020, Odysseus Data Services, Inc. All rights reserved
-- MIMIC IV CDM Conversion
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Populate cdm_provider table
-- 
-- Dependencies: run after st_core.sql
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Known issues / Open points:
--
-- MIMIC IV does not contain table "caregivers" which was used in MIMIC III OMOP
-- Find replacement or leave cdm_provider empty
-- -------------------------------------------------------------------

-- MIMIC III code for reference:

-- WITH caregivers AS 
-- (
--  SELECT 
--      mimic_id as provider_id, 
--      label as provider_source_value, 
--      description as specialty_source_value 
--  FROM caregivers
-- )
-- INSERT INTO :OMOP_SCHEMA.PROVIDER
-- (
--   provider_id
--  , provider_source_value
--  , specialty_source_value
-- )
-- SELECT caregivers.provider_id, caregivers.provider_source_value, caregivers.specialty_source_value
-- FROM caregivers;


DROP TABLE IF EXISTS schema.cdm_provider;
CREATE TABLE schema.cdm_provider 
(
    provider_id BIGINT NOT NULL,
    provider_name VARCHAR(255) NULL,
    npi VARCHAR(20) NULL,
    dea VARCHAR(20) NULL,
    specialty_concept_id INTEGER NULL,
    care_site_id INTEGER NULL,
    year_of_birth INTEGER NULL,
    gender_concept_id INTEGER NULL,
    provider_source_value VARCHAR(50) NULL,
    specialty_source_value VARCHAR(50) NULL,
    specialty_source_concept_id INTEGER NULL,
    gender_source_value VARCHAR(50) NULL,
    gender_source_concept_id INTEGER NULL 
)
;

INSERT INTO schema.cdm_provider
SELECT
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS provider_id,
    NULL AS provider_name,
    NULL AS npi,
    NULL AS dea,
    NULL AS specialty_concept_id,
    NULL AS care_site_id,
    NULL AS year_of_birth,
    NULL AS gender_concept_id,
    src.provider_id AS provider_source_value,
    NULL AS specialty_source_value,
    NULL AS specialty_source_concept_id,
    NULL AS gender_source_value,
    NULL AS gender_source_concept_id
FROM
    schema.src_provider src
;

INSERT INTO schema.cdm_provider
SELECT
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS provider_id,
    NULL AS provider_name,
    NULL AS npi,
    NULL AS dea,
    NULL AS specialty_concept_id,
    NULL AS care_site_id,
    NULL AS year_of_birth,
    NULL AS gender_concept_id,
    CAST(src.caregiver_id AS VARCHAR(50)) AS provider_source_value,
    NULL AS specialty_source_value,
    NULL AS specialty_source_concept_id,
    NULL AS gender_source_value,
    NULL AS gender_source_concept_id
FROM
    schema.src_caregiver src
;