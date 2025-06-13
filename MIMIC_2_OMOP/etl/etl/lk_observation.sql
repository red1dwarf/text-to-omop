-- -------------------------------------------------------------------
-- @2020, Odysseus Data Services, Inc. All rights reserved
-- MIMIC IV CDM Conversion
-- -------------------------------------------------------------------
-- -------------------------------------------------------------------
-- Populate lookups for cdm_observation table
-- 
-- Dependencies: run after 
--      st_core.sql,
--      st_hosp.sql
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Known issues / Open points:
--
-- TRUNCATE TABLE is not supported, organize create or replace
--
-- loaded custom mapping:
--      gcpt_insurance_to_concept -> mimiciv_obs_insurance
--      gcpt_marital_status_to_concept -> mimiciv_obs_marital
--      gcpt_drgcode_to_concept -> mimiciv_obs_drgcodes
--          source_code = gcpt.description
-- Cost containment drgcode should be in cost table apparently.... 
--      http://forums.ohdsi.org/t/most-appropriate-omop-table-to-house-drg-information/1591/9,
-- observation.proc.* (Achilless Heel report)
--      value_as_string IS NULL AND value_as_number IS NULL AND COALESCE(value_as_concept_id, 0) = 0
--      review custom mapping. if ok, use value_as_concept_id = 4188539 'Yes'?
-- -------------------------------------------------------------------

-- on demo: 1585 rows
-- -------------------------------------------------------------------
-- lk_observation_clean from admissions
-- rules 1-3
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.lk_observation_clean AS
-- -- rule 1, insurance
-- SELECT
--     src.subject_id                  AS subject_id,
--     src.hadm_id                     AS hadm_id,
--     'Insurance'                     AS source_code,
--     46235654                        AS target_concept_id, -- Primary insurance,
--     src.admittime                   AS start_datetime,
--     src.insurance                   AS value_as_string,
--     'mimiciv_obs_insurance'         AS source_vocabulary_id,
--     --
--     'admissions.insurance'          AS unit_id,
--     src.load_table_id               AS load_table_id,
--     src.load_row_id                 AS load_row_id,
--     src.trace_id                    AS trace_id
-- FROM
--     @etl_project.@etl_dataset.src_admissions src -- adm
-- WHERE
--     src.insurance IS NOT NULL

-- UNION ALL
-- -- rule 2, marital_status
-- SELECT
--     src.subject_id                  AS subject_id,
--     src.hadm_id                     AS hadm_id,
--     'Marital status'                AS source_code,
--     40766231                        AS target_concept_id, -- Marital status,
--     src.admittime                   AS start_datetime,
--     src.marital_status              AS value_as_string,
--     'mimiciv_obs_marital'           AS source_vocabulary_id,
--     --
--     'admissions.marital_status'     AS unit_id,
--     src.load_table_id               AS load_table_id,
--     src.load_row_id                 AS load_row_id,
--     src.trace_id                    AS trace_id
-- FROM
--     @etl_project.@etl_dataset.src_admissions src -- adm
-- WHERE
--     src.marital_status IS NOT NULL

-- UNION ALL
-- -- rule 3, language
-- SELECT
--     src.subject_id                  AS subject_id,
--     src.hadm_id                     AS hadm_id,
--     'Language'                      AS source_code,
--     40758030                        AS target_concept_id, -- Preferred language
--     src.admittime                   AS start_datetime,
--     src.language                    AS value_as_string,
--     'mimiciv_obs_language'          AS source_vocabulary_id,
--     --
--     'admissions.language'           AS unit_id,
--     src.load_table_id               AS load_table_id,
--     src.load_row_id                 AS load_row_id,
--     src.trace_id                    AS trace_id
-- FROM
--     @etl_project.@etl_dataset.src_admissions src -- adm
-- WHERE
--     src.language IS NOT NULL
-- ;

-- -------------------------------------------------------------------
-- lk_observation_clean
-- Rule 4, drgcodes
-- -------------------------------------------------------------------

-- INSERT INTO @etl_project.@etl_dataset.lk_observation_clean
-- SELECT
--     src.subject_id                  AS subject_id,
--     src.hadm_id                     AS hadm_id,
--     -- 'DRG code' AS source_code,
--     src.drg_code                    AS source_code,
--     4296248                         AS target_concept_id, -- Cost containment
--     COALESCE(adm.edregtime, adm.admittime)  AS start_datetime,
--     src.description                 AS value_as_string,
--     'mimiciv_obs_drgcodes'          AS source_vocabulary_id,
--     --
--     'drgcodes.description'          AS unit_id,
--     src.load_table_id               AS load_table_id,
--     src.load_row_id                 AS load_row_id,
--     src.trace_id                    AS trace_id
-- FROM
--     @etl_project.@etl_dataset.src_drgcodes src -- drg
-- INNER JOIN
--     @etl_project.@etl_dataset.src_admissions adm
--         ON src.hadm_id = adm.hadm_id
-- WHERE
--     src.description IS NOT NULL
-- ;


-- -- on demo: 270 rows
-- -- -------------------------------------------------------------------
-- -- lk_obs_admissions_concept
-- -- Rules 1-4
-- -- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.lk_obs_admissions_concept AS
-- SELECT DISTINCT
--     src.value_as_string         AS source_code,
--     src.source_vocabulary_id    AS source_vocabulary_id,
--     vc.domain_id                AS source_domain_id,
--     vc.concept_id               AS source_concept_id,
--     vc2.domain_id               AS target_domain_id,
--     vc2.concept_id              AS target_concept_id
-- FROM
--     @etl_project.@etl_dataset.lk_observation_clean src
-- LEFT JOIN
--     @etl_project.@etl_dataset.voc_concept vc
--         ON src.value_as_string = vc.concept_code
--         AND src.source_vocabulary_id = vc.vocabulary_id
--         -- valid period should be used to map drg_code, but due to the date shift it is not applicable
--         -- AND src.start_datetime BETWEEN vc.valid_start_date AND vc.valid_end_date
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

-- -- -------------------------------------------------------------------
-- -- lk_observation_mapped
-- -- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.lk_observation_mapped AS
-- SELECT
--     src.hadm_id                             AS hadm_id, -- to visit
--     src.subject_id                          AS subject_id, -- to person
--     COALESCE(src.target_concept_id, 0)      AS target_concept_id,
--     src.start_datetime                      AS start_datetime,
--     32817                                   AS type_concept_id, -- OMOP4976890 EHR, -- Rules 1-4
--     src.source_code                         AS source_code,
--     0                                       AS source_concept_id,
--     src.value_as_string                     AS value_as_string,
--     lc.target_concept_id                    AS value_as_concept_id,
--     'Observation'                           AS target_domain_id, -- to join on src.target_concept_id?
--     --
--     src.unit_id                     AS unit_id,
--     src.load_table_id               AS load_table_id,
--     src.load_row_id                 AS load_row_id,
--     src.trace_id                    AS trace_id
-- FROM
--     @etl_project.@etl_dataset.lk_observation_clean src
-- LEFT JOIN
--     @etl_project.@etl_dataset.lk_obs_admissions_concept lc
--         ON src.value_as_string = lc.source_code
--         AND src.source_vocabulary_id = lc.source_vocabulary_id
-- ;




-- ------------------------------------------------------------------------
-- POSTGRESQL
-- ------------------------------------------------------------------------


DROP TABLE IF EXISTS omop.lk_observation_clean;
CREATE TABLE omop.lk_observation_clean AS
SELECT
    src.subject_id AS subject_id,
    src.hadm_id AS hadm_id,
    'Insurance' AS source_code,
    46235654 AS target_concept_id, -- Primary insurance
    src.admittime AS start_datetime,
    src.dischtime AS end_datetime,
    src.insurance AS value_as_string,
    'mimiciv_obs_insurance' AS source_vocabulary_id,
    src.admit_provider_id AS provider_id,
    --
    'admissions.insurance' AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.src_admissions src -- adm
WHERE
    src.insurance IS NOT NULL

UNION ALL
-- rule 2, marital_status
SELECT
    src.subject_id AS subject_id,
    src.hadm_id AS hadm_id,
    'Marital status' AS source_code,
    40766231 AS target_concept_id, -- Marital status
    src.admittime AS start_datetime,
    src.dischtime AS end_datetime,
    src.marital_status AS value_as_string,
    'mimiciv_obs_marital' AS source_vocabulary_id,
    src.admit_provider_id AS provider_id,
    --
    'admissions.marital_status' AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.src_admissions src -- adm
WHERE
    src.marital_status IS NOT NULL

UNION ALL
-- rule 3, language
SELECT
    src.subject_id AS subject_id,
    src.hadm_id AS hadm_id,
    'Language' AS source_code,
    40758030 AS target_concept_id, -- Preferred language
    src.admittime AS start_datetime,
    src.dischtime AS end_datetime,
    src.language AS value_as_string,
    'mimiciv_obs_language' AS source_vocabulary_id,
    src.admit_provider_id AS provider_id,
    --
    'admissions.language' AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.src_admissions src -- adm
WHERE
    src.language IS NOT NULL
;



INSERT INTO omop.lk_observation_clean
SELECT
    src.subject_id AS subject_id,
    src.hadm_id AS hadm_id,
    -- 'DRG code' AS source_code,
    src.drg_code AS source_code,
    4296248 AS target_concept_id, -- Cost containment
    COALESCE(adm.edregtime, adm.admittime) AS start_datetime,
    adm.dischtime AS end_datetime,
    src.description AS value_as_string,
    'mimiciv_obs_drgcodes' AS source_vocabulary_id,
    adm.admit_provider_id AS provider_id,
    --
    'drgcodes.description' AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.src_drgcodes src -- drg
INNER JOIN
    omop.src_admissions adm
        ON src.hadm_id = adm.hadm_id
WHERE
    src.description IS NOT NULL
;



DROP TABLE IF EXISTS omop.lk_obs_admissions_concept;
CREATE TABLE omop.lk_obs_admissions_concept AS
SELECT DISTINCT
    src.value_as_string AS source_code,
    src.source_vocabulary_id AS source_vocabulary_id,
    vc.domain_id AS source_domain_id,
    vc.concept_id AS source_concept_id,
    vc2.domain_id AS target_domain_id,
    vc2.concept_id AS target_concept_id
FROM
    omop.lk_observation_clean src
LEFT JOIN
    omop.voc_concept vc
        ON src.value_as_string = vc.concept_code
        AND src.source_vocabulary_id = vc.vocabulary_id
        -- valid period should be used to map drg_code, but due to the date shift it is not applicable
        -- AND src.start_datetime BETWEEN vc.valid_start_date AND vc.valid_end_date
LEFT JOIN
    omop.voc_concept_relationship vcr
        ON vc.concept_id = vcr.concept_id_1
        AND vcr.relationship_id = 'Maps to'
LEFT JOIN
    omop.voc_concept vc2
        ON vc2.concept_id = vcr.concept_id_2
        AND vc2.standard_concept = 'S'
        AND vc2.invalid_reason IS NULL
;


DROP TABLE IF EXISTS omop.lk_obs_admissions_concept2;
CREATE TABLE omop.lk_obs_admissions_concept2 AS
SELECT
	ac.source_code AS source_code,
    ac.source_vocabulary_id AS source_vocabulary_id,
    c.domain_id AS source_domain_id,
    c.concept_id AS source_concept_id,
    c2.domain_id AS target_domain_id,
    c2.concept_id AS target_concept_id
FROM omop.lk_obs_admissions_concept ac
INNER JOIN omop.voc_concept c
	ON UPPER(c.concept_name) = UPPER(ac.source_code)
	AND c.domain_id = 'Observation'
INNER JOIN omop.voc_concept_relationship cr
	ON c.concept_id = cr.concept_id_1
	AND cr.relationship_id = 'Maps to'
INNER JOIN omop.voc_concept c2
	ON c2.concept_id = cr.concept_id_2
	AND c2.standard_concept = 'S'
    AND c2.invalid_reason IS NULL
WHERE ac.target_concept_id IS NULL
AND c.vocabulary_id != 'UK Biobank'
AND c.vocabulary_id != 'SNOMED'
ORDER BY ac.source_code,
 CASE
	WHEN c.vocabulary_id ILIKE '%mimic%' THEN 1
	WHEN c.vocabulary_id = 'DRG' THEN 2
	ELSE 3
 END;


DELETE FROM omop.lk_obs_admissions_concept2
WHERE source_concept_id = 38001548;


UPDATE omop.lk_obs_admissions_concept ac
SET target_concept_id = ac2.target_concept_id
-- source_domain_id = ac2.source_domain_id
-- source_concept_id = ac2.source_concept_id
-- target_domain_id = ac2.target_domain_id
FROM omop.lk_obs_admissions_concept2 ac2
WHERE ac.source_code = ac2.source_code
  AND ac.target_concept_id IS NULL;


DROP TABLE IF EXISTS omop.lk_obs_admissions_concept2;


DROP TABLE IF EXISTS omop.lk_obs_admissions_concept3;
CREATE TABLE omop.lk_obs_admissions_concept3 AS
SELECT l.normalized_code
FROM (
  SELECT *,
         REPLACE(REPLACE(REPLACE(UPPER(source_code), 'WITHOUT', 'W/O'), 'WITH', 'W'), 'AND', '&') AS normalized_code
  FROM omop.lk_obs_admissions_concept WHERE target_concept_id IS NULL
) l;


DROP TABLE IF EXISTS omop.lk_obs_admissions_concept3;
CREATE TABLE omop.lk_obs_admissions_concept3 AS
SELECT l.source_code, l.normalized_code, l.source_vocabulary_id
FROM (
  SELECT *,
         REPLACE(REPLACE(REPLACE(UPPER(source_code), 'WITHOUT', 'W/O'), 'WITH', 'W'), 'AND', '&') AS normalized_code
  FROM omop.lk_obs_admissions_concept WHERE target_concept_id IS NULL
) l;


CREATE TABLE omop.lk_obs_admissions_concept4 AS
SELECT
	ac.source_code AS source_code,
    ac.source_vocabulary_id AS source_vocabulary_id,
    c.domain_id AS source_domain_id,
    c.concept_id AS source_concept_id,
    c2.domain_id AS target_domain_id,
    c2.concept_id AS target_concept_id
FROM omop.lk_obs_admissions_concept3 ac
INNER JOIN omop.voc_concept c
ON ac.normalized_code = c.concept_name
INNER JOIN omop.voc_concept_relationship cr
ON cr.concept_id_1 = c.concept_id
AND cr.relationship_id = 'Maps to'
INNER JOIN omop.voc_concept c2
ON c2.concept_id = cr.concept_id_2
AND c2.standard_concept = 'S'
AND c2.invalid_reason IS NULL
WHERE c.domain_id = 'Observation'
AND UPPER(ac.source_code) != ac.normalized_code
AND c.concept_id != 43125851
ORDER BY normalized_code;


UPDATE omop.lk_obs_admissions_concept ac
SET target_concept_id = ac4.target_concept_id
FROM omop.lk_obs_admissions_concept4 ac4
-- source_domain_id = ac4.source_domain_id
-- source_concept_id = ac4.source_concept_id
-- target_domain_id = ac4.target_domain_id
WHERE ac.source_code = ac4.source_code
AND ac.target_concept_id IS NULL;


DROP TABLE IF EXISTS omop.lk_obs_admissions_concept3
DROP TABLE IF EXISTS omop.lk_obs_admissions_concept4


DROP TABLE IF EXISTS omop.lk_obs_admissions_concept5;
CREATE TABLE omop.lk_obs_admissions_concept5 AS
SELECT
	ac.source_code AS source_code,
    ac.source_vocabulary_id AS source_vocabulary_id,
    c.domain_id AS source_domain_id,
    c.concept_id AS source_concept_id,
    c2.domain_id AS target_domain_id,
    c2.concept_id AS target_concept_id
FROM omop.lk_obs_admissions_concept ac
INNER JOIN omop.voc_concept c
ON c.concept_name = CONCAT(ac.source_code, ' language')
INNER JOIN omop.voc_concept_relationship cr
	ON c.concept_id = cr.concept_id_1
	AND cr.relationship_id = 'Maps to'
INNER JOIN omop.voc_concept c2
	ON c2.concept_id = cr.concept_id_2
	AND c2.standard_concept = 'S'
    AND c2.invalid_reason IS NULL
WHERE ac.source_vocabulary_id = 'mimiciv_obs_language'
AND c.domain_id = 'Language'
ORDER BY c.concept_name;


DELETE FROM omop.lk_obs_admissions_concept5
WHERE source_concept_id = 40300863;
DELETE FROM omop.lk_obs_admissions_concept5
WHERE source_concept_id = 40331510;


UPDATE omop.lk_obs_admissions_concept ac
SET source_domain_id = ac5.source_domain_id
-- source_concept_id = ac5.source_concept_id
-- target_domain_id = ac5.target_domain_id
-- target_concept_id = ac5.target_concept_id
FROM omop.lk_obs_admissions_concept5 ac5
WHERE ac.source_code = ac5.source_code;


SET search_path TO omop;

WITH ranked AS (
    SELECT
        s.source_code,
        c.concept_id,
        c.concept_name,
        similarity(upper(s.source_code), upper(c.concept_name)) AS sim,
        ROW_NUMBER() OVER (PARTITION BY s.source_code
                           ORDER BY similarity(upper(s.source_code), upper(c.concept_name)) DESC) AS rn
    FROM omop.lk_obs_admissions_concept_cust AS s
    JOIN omop.voc_concept AS c
	  ON c.domain_id = 'Observation'
     AND c.concept_name !~* '\mage\M'
     AND upper(c.concept_name) % upper(s.source_code)	
)
SELECT
    source_code,
    concept_id,
    concept_name,
    sim AS similarity_score
FROM ranked
WHERE rn = 1
AND sim >= 0.5
ORDER BY similarity_score DESC;


DROP TABLE IF EXISTS omop.concept_name_similarity;
CREATE TABLE omop.concept_name_similarity(
source_code TEXT,
concept_id INTEGER,
concept_name TEXT,
similarity_score REAL);


DELETE FROM omop.concept_name_similarity
WHERE concept_id::text ILIKE '20000%'
  AND similarity_score < 0.5714286
  AND source_code NOT IN (
    'GASTROINTESTINAL HEMORRHAGE WITH MCC',
    'ESOPHAGITIS, GASTROENTERITIS AND MISCELLANEOUS DIGESTIVE DISORDERS WITHO',
	'ESOPHAGITIS, GASTROENTERITIS AND MISCELLANEOUS DIGESTIVE DISORDERS WITH'
  );

DELETE FROM omop.concept_name_similarity
WHERE source_code = 'BACK & NECK PROC EXC SPINAL FUSION W CC';
DELETE FROM omop.concept_name_similarity
WHERE source_code = 'UTERINE AND ADNEXA PROCEDURES FOR NON-MALIGNANCY WITHOUT CC/MCC';
DELETE FROM omop.concept_name_similarity
WHERE source_code = 'BREAST PROCEDURES EXCEPT MASTECTOMY';
DELETE FROM omop.concept_name_similarity
WHERE source_code = 'OTHER DIGESTIVE SYSTEM AND ABDOMINAL PROCEDURES';
DELETE FROM omop.concept_name_similarity
WHERE source_code = 'MAJOR RESPIRATORY AND CHEST PROCEDURES';
DELETE FROM omop.concept_name_similarity
WHERE source_code = 'MAJOR CRANIAL OR FACIAL BONE PROCEDURES';
DELETE FROM omop.concept_name_similarity
WHERE source_code = 'DEGENERATIVE NERVOUS SYSTEM DISORDERS EXCEPT MULTIPLE SCLEROSIS';
DELETE FROM omop.concept_name_similarity
WHERE source_code = 'URINARY STONES W/O MCC';
UPDATE omop.concept_name_similarity
SET concept_id = 2000020759
WHERE concept_id = 2000020760;
UPDATE omop.concept_name_similarity
SET concept_id = 2000020778
WHERE source_code = 'SEPTICEMIA OR SEVERE SEPSIS W/O MV >96 HOURS W/O MCC';
UPDATE omop.concept_name_similarity
SET concept_id = 2000020760
WHERE source_code = 'RESPIRATORY SYSTEM DIAGNOSIS W VENTILATOR SUPPORT >96 HOURS';
UPDATE omop.concept_name_similarity
SET concept_id = 2000020184
WHERE source_code = 'COMBINED ANTERIOR AND POSTERIOR SPINAL FUSION WITHOUT CC/MCC';
UPDATE omop.concept_name_similarity
SET concept_id = 2000020203
WHERE source_code = 'CORONARY BYPASS WITH CARDIAC CATHETERIZATION WITHOUT MCC';
UPDATE omop.concept_name_similarity
SET concept_id = 2000020210
WHERE source_code = 'CORONARY BYPASS WITHOUT CARDIAC CATHETERIZATION WITHOUT MCC';
UPDATE omop.concept_name_similarity
SET concept_id = 2000020114
WHERE source_code = 'CARDIAC DEFIB IMPLANT WITH CARDIAC CATH WITHOUT AMI, HF OR SHOCK WITHOUT';
UPDATE omop.concept_name_similarity
SET concept_id = 2000020480
WHERE source_code = 'MAJOR LARGE BOWEL PROCEDURES';
UPDATE omop.concept_name_similarity
SET concept_id = 2000020203
WHERE source_code = 'CORONARY BYPASS WITH CARDIAC CATHETERIZATION OR OPEN ABLATION WITHOUT MC';
UPDATE omop.concept_name_similarity
SET concept_id = 2000020684
WHERE source_code = 'PERC CVASC PROC WITHOUT CORONARY ARTERY STENT WITHOUT MCC';
UPDATE omop.concept_name_similarity
SET concept_id = 2000020879
WHERE source_code = 'TRAUMATIC STUPOR AND COMA >1 HOUR WITHOUT CC/MCC';
UPDATE omop.concept_name_similarity
SET concept_id = 2000020504
WHERE source_code = 'MISCELLANEOUS DISORDERS OF NUTRITION, MET, FLUIDS AND ELECTROLYTES WITHO';
UPDATE omop.concept_name_similarity
SET concept_id = 2000020444
WHERE source_code = 'OTHER MAJOR CARDIOVASCULAR PROCEDURES WITH CC';
UPDATE omop.concept_name_similarity
SET concept_id = 2000020173
WHERE source_code = 'CIRCULATORY DISORDERS EXCEPT AMI, WITH CARDIAC CATHETERIZATION WITHOUT M';
UPDATE omop.concept_name_similarity
SET concept_id = 2000020318
WHERE source_code = 'GASTROINTESTINAL HEMORRHAGE WITH MCC';
UPDATE omop.concept_name_similarity
SET concept_id = 2000020288
WHERE source_code = 'ESOPHAGITIS, GASTROENTERITIS AND MISCELLANEOUS DIGESTIVE DISORDERS WITHO';


CREATE TABLE omop.data1(
    source_code TEXT,
    concept_name TEXT
);

INSERT INTO omop.data1
SELECT
source_code AS source_code
FROM omop.lk_obs_admissions_concept
WHERE source_concept_id IS NULL
AND source_code ILIKE '%cc%'
AND source_code != 'RENAL DIALYSIS ACCESS DEVICE PROCEDURES AND VESSEL REPAIR'
AND source_code != 'NONSPECIFIC CVA AND PRECEREBRAL OCCLUSION WITHOUT INFARCTION'
AND source_code != 'CVA AND PRECEREBRAL OCCLUSION WITH INFARCTION';


UPDATE omop.data1
SET source_concept_id = tmp.source_concept_id,
    target_concept_id = tmp.target_concept_id
FROM omop.tmp_custom_mapping tmp
WHERE data1.concept_name = tmp.concept_name;


UPDATE omop.lk_obs_admissions_concept l
SET source_concept_id = d.source_concept_id,
    target_concept_id = d.target_concept_id
FROM omop.data1 d
WHERE l.source_code = d.source_code;


DROP TABLE IF EXISTS omop.data1;


CREATE TABLE omop.data2(
    source_code TEXT,
    concept_name TEXT
);


DROP TABLE IF EXISTS omop.lk_observation_mapped;
CREATE TABLE omop.lk_observation_mapped AS
SELECT
    src.hadm_id AS hadm_id, -- to visit
    src.subject_id AS subject_id, -- to person
    COALESCE(src.target_concept_id, 0) AS target_concept_id,
    src.start_datetime AS start_datetime,
    src.end_datetime,
    32817 AS type_concept_id, -- OMOP4976890 EHR, -- Rules 1-4
    src.source_code AS source_code,
    0 AS source_concept_id,
    src.value_as_string AS value_as_string,
    lc.target_concept_id AS value_as_concept_id,
    'Observation' AS target_domain_id, -- to join on src.target_concept_id?
    src.provider_id AS provider_id,
    --
    src.unit_id AS unit_id,
    src.load_table_id AS load_table_id,
    src.load_row_id AS load_row_id,
    src.trace_id AS trace_id
FROM
    omop.lk_observation_clean src
LEFT JOIN
    omop.lk_obs_admissions_concept lc
        ON src.value_as_string = lc.source_code
        AND src.source_vocabulary_id = lc.source_vocabulary_id
;