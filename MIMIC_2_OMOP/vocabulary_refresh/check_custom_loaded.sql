-- -------------------------------------------------------------------
-- @2019, Odysseus Data Services, Inc. All rights reserved
-- Stanford Epic EHR CDM Conversion
-- last updated February 05, 2019
-- -------------------------------------------------------------------

/*
    Check loaded tmp_custom_mapping
*/

DROP TABLE IF EXISTS omop.z_check_tmp_custom_mapping;
CREATE TABLE omop.z_check_tmp_custom_mapping
(
    field_name TEXT,
    cnt_empty INTEGER
);

INSERT INTO omop.z_check_tmp_custom_mapping
SELECT 'concept_name' AS field_name, COUNT(*) as cnt_empty 
FROM omop.tmp_custom_mapping
WHERE concept_name IS NULL;
 
INSERT INTO omop.z_check_tmp_custom_mapping
SELECT 'source_concept_id' AS field_name, COUNT(*) as cnt_empty 
FROM omop.tmp_custom_mapping
WHERE source_concept_id IS NULL;
 
INSERT INTO omop.z_check_tmp_custom_mapping
SELECT 'source_vocabulary_id' AS field_name, COUNT(*) as cnt_empty 
FROM omop.tmp_custom_mapping
WHERE source_vocabulary_id IS NULL;
 
INSERT INTO omop.z_check_tmp_custom_mapping
SELECT 'source_domain_id' AS field_name, COUNT(*) as cnt_empty 
FROM omop.tmp_custom_mapping
WHERE source_domain_id IS NULL;
 
INSERT INTO omop.z_check_tmp_custom_mapping
SELECT 'source_concept_class_id' AS field_name, COUNT(*) as cnt_empty 
FROM omop.tmp_custom_mapping
WHERE source_concept_class_id IS NULL;
 
INSERT INTO omop.z_check_tmp_custom_mapping
SELECT 'concept_code' AS field_name, COUNT(*) as cnt_empty 
FROM omop.tmp_custom_mapping
WHERE concept_code IS NULL;
 
INSERT INTO omop.z_check_tmp_custom_mapping
SELECT 'valid_start_date' AS field_name, COUNT(*) as cnt_empty 
FROM omop.tmp_custom_mapping
WHERE valid_start_date IS NULL;
 
INSERT INTO omop.z_check_tmp_custom_mapping
SELECT 'valid_end_date' AS field_name, COUNT(*) as cnt_empty 
FROM omop.tmp_custom_mapping
WHERE valid_end_date IS NULL;
 
INSERT INTO omop.z_check_tmp_custom_mapping
SELECT 'target_concept_id' AS field_name, COUNT(*) as cnt_empty 
FROM omop.tmp_custom_mapping
WHERE target_concept_id IS NULL;
 
INSERT INTO omop.z_check_tmp_custom_mapping
SELECT 'relationship_id' AS field_name, COUNT(*) as cnt_empty 
FROM omop.tmp_custom_mapping
WHERE relationship_id IS NULL;
 
INSERT INTO omop.z_check_tmp_custom_mapping
SELECT 'reverese_relationship_id' AS field_name, COUNT(*) as cnt_empty 
FROM omop.tmp_custom_mapping
WHERE reverese_relationship_id IS NULL;
 
INSERT INTO omop.z_check_tmp_custom_mapping
SELECT 'relationship_valid_start_date' AS field_name, COUNT(*) as cnt_empty 
FROM omop.tmp_custom_mapping
WHERE relationship_valid_start_date IS NULL;
 
INSERT INTO omop.z_check_tmp_custom_mapping
SELECT 'relationship_end_date' AS field_name, COUNT(*) as cnt_empty 
FROM omop.tmp_custom_mapping
WHERE relationship_end_date IS NULL;

INSERT INTO omop.z_check_tmp_custom_mapping
SELECT 'duplicate_source_concept_id' AS field_name, COUNT(*) as cnt_empty 
FROM (
    SELECT source_concept_id
    FROM omop.tmp_custom_mapping
    GROUP BY source_concept_id
    HAVING COUNT(*) > 1
) t;

SELECT
    field_name, cnt_empty
FROM omop.z_check_tmp_custom_mapping
ORDER BY field_name
;
