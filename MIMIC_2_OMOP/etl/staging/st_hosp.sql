-- -------------------------------------------------------------------
-- @2020, Odysseus Data Services, Inc. All rights reserved
-- MIMIC IV CDM Conversion
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Populate staging tables for cdm dimension tables
-- 
-- Dependencies: run first after DDL
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Known issues / Open points:
--
-- -------------------------------------------------------------------


-- -------------------------------------------------------------------
-- for Condition_occurrence
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- src_diagnoses_icd
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.src_diagnoses_icd AS
-- SELECT
--     subject_id      AS subject_id,
--     hadm_id         AS hadm_id,
--     seq_num         AS seq_num,
--     icd_code        AS icd_code,
--     icd_version     AS icd_version,
--     --
--     'diagnoses_icd'                     AS load_table_id,
--     FARM_FINGERPRINT(GENERATE_UUID())   AS load_row_id,
--     TO_JSON_STRING(STRUCT(
--         hadm_id AS hadm_id,
--         seq_num AS seq_num
--     ))                                  AS trace_id
-- FROM
--     @source_project.@hosp_dataset.diagnoses_icd
-- ;

-- -------------------------------------------------------------------
-- for Measurement
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- src_services
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.src_services AS
-- SELECT
--     subject_id                          AS subject_id,
--     hadm_id                             AS hadm_id,
--     transfertime                        AS transfertime,
--     prev_service                        AS prev_service,
--     curr_service                        AS curr_service,
--     --
--     'services'                          AS load_table_id,
--     FARM_FINGERPRINT(GENERATE_UUID())   AS load_row_id,
--     TO_JSON_STRING(STRUCT(
--         subject_id AS subject_id,
--         hadm_id AS hadm_id,
--         transfertime AS transfertime
--     ))                                  AS trace_id
-- FROM
--     @source_project.@hosp_dataset.services
-- ;

-- -------------------------------------------------------------------
-- src_labevents
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.src_labevents AS
-- SELECT
--     labevent_id                         AS labevent_id,
--     subject_id                          AS subject_id,
--     charttime                           AS charttime,
--     hadm_id                             AS hadm_id,
--     itemid                              AS itemid,
--     valueuom                            AS valueuom,
--     value                               AS value,
--     flag                                AS flag,
--     ref_range_lower                     AS ref_range_lower,
--     ref_range_upper                     AS ref_range_upper,
--     --
--     'labevents'                         AS load_table_id,
--     FARM_FINGERPRINT(GENERATE_UUID())   AS load_row_id,
--     TO_JSON_STRING(STRUCT(
--         labevent_id AS labevent_id
--     ))                                  AS trace_id
-- FROM
--     @source_project.@hosp_dataset.labevents
-- ;

-- -------------------------------------------------------------------
-- src_d_labitems
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.src_d_labitems AS
-- SELECT
--     itemid                              AS itemid,
--     label                               AS label,
--     fluid                               AS fluid,
--     category                            AS category,
--     CAST(NULL AS STRING)                AS loinc_code, -- MIMIC IV 2.0 change, the field is removed
--     --
--     'd_labitems'                        AS load_table_id,
--     FARM_FINGERPRINT(GENERATE_UUID())   AS load_row_id,
--     TO_JSON_STRING(STRUCT(
--         itemid AS itemid
--     ))                                  AS trace_id
-- FROM
--     @source_project.@hosp_dataset.d_labitems
-- ;


-- -------------------------------------------------------------------
-- for Procedure
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- src_procedures_icd
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.src_procedures_icd AS
-- SELECT
--     subject_id                          AS subject_id,
--     hadm_id                             AS hadm_id,
--     icd_code        AS icd_code,
--     icd_version     AS icd_version,
--     --
--     'procedures_icd'                    AS load_table_id,
--     FARM_FINGERPRINT(GENERATE_UUID())   AS load_row_id,
--     TO_JSON_STRING(STRUCT(
--         subject_id AS subject_id,
--         hadm_id AS hadm_id,
--         icd_code AS icd_code,
--         icd_version AS icd_version
--     ))                                  AS trace_id -- this set of fields is not unique. To set quantity?
-- FROM
--     @source_project.@hosp_dataset.procedures_icd
-- ;

-- -------------------------------------------------------------------
-- src_hcpcsevents
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.src_hcpcsevents AS
-- SELECT
--     hadm_id                             AS hadm_id,
--     subject_id                          AS subject_id,
--     hcpcs_cd                            AS hcpcs_cd,
--     seq_num                             AS seq_num,
--     short_description                   AS short_description,
--     --
--     'hcpcsevents'                       AS load_table_id,
--     FARM_FINGERPRINT(GENERATE_UUID())   AS load_row_id,
--     TO_JSON_STRING(STRUCT(
--         subject_id AS subject_id,
--         hadm_id AS hadm_id,
--         hcpcs_cd AS hcpcs_cd,
--         seq_num AS seq_num
--     ))                                  AS trace_id -- this set of fields is not unique. To set quantity?
-- FROM
--     @source_project.@hosp_dataset.hcpcsevents
-- ;


-- -------------------------------------------------------------------
-- src_drgcodes
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.src_drgcodes AS
-- SELECT
--     hadm_id                             AS hadm_id,
--     subject_id                          AS subject_id,
--     drg_code                            AS drg_code,
--     description                         AS description,
--     --
--     'drgcodes'                       AS load_table_id,
--     FARM_FINGERPRINT(GENERATE_UUID())   AS load_row_id,
--     TO_JSON_STRING(STRUCT(
--         subject_id AS subject_id,
--         hadm_id AS hadm_id,
--         COALESCE(drg_code, '') AS drg_code
--     ))                                  AS trace_id -- this set of fields is not unique.
-- FROM
--     @source_project.@hosp_dataset.drgcodes
-- ;

-- -------------------------------------------------------------------
-- src_prescriptions
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.src_prescriptions AS
-- SELECT
--     hadm_id                             AS hadm_id,
--     subject_id                          AS subject_id,
--     pharmacy_id                         AS pharmacy_id,
--     starttime                           AS starttime,
--     stoptime                            AS stoptime,
--     drug_type                           AS drug_type,
--     drug                                AS drug,
--     gsn                                 AS gsn,
--     ndc                                 AS ndc,
--     prod_strength                       AS prod_strength,
--     form_rx                             AS form_rx,
--     dose_val_rx                         AS dose_val_rx,
--     dose_unit_rx                        AS dose_unit_rx,
--     form_val_disp                       AS form_val_disp,
--     form_unit_disp                      AS form_unit_disp,
--     doses_per_24_hrs                    AS doses_per_24_hrs,
--     route                               AS route,
--     --
--     'prescriptions'                     AS load_table_id,
--     FARM_FINGERPRINT(GENERATE_UUID())   AS load_row_id,
--     TO_JSON_STRING(STRUCT(
--         subject_id AS subject_id,
--         hadm_id AS hadm_id,
--         pharmacy_id AS pharmacy_id,
--         starttime AS starttime
--     ))                                  AS trace_id
-- FROM
--     @source_project.@hosp_dataset.prescriptions
-- ;


-- -------------------------------------------------------------------
-- src_microbiologyevents
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.src_microbiologyevents AS
-- SELECT
--     microevent_id               AS microevent_id,
--     subject_id                  AS subject_id,
--     hadm_id                     AS hadm_id,
--     chartdate                   AS chartdate,
--     charttime                   AS charttime, -- usage: COALESCE(charttime, chartdate)
--     spec_itemid                 AS spec_itemid, -- d_micro, type of specimen taken. If no grouth, then all other fields is null
--     spec_type_desc              AS spec_type_desc, -- for reference
--     test_itemid                 AS test_itemid, -- d_micro, what test is taken, goes to measurement
--     test_name                   AS test_name, -- for reference
--     org_itemid                  AS org_itemid, -- d_micro, what bacteria have grown
--     org_name                    AS org_name, -- for reference
--     ab_itemid                   AS ab_itemid, -- d_micro, antibiotic tested on the bacteria
--     ab_name                     AS ab_name, -- for reference
--     dilution_comparison         AS dilution_comparison, -- operator sign
--     dilution_value              AS dilution_value, -- numeric value
--     interpretation              AS interpretation, -- bacteria's degree of resistance to the antibiotic
--     --
--     'microbiologyevents'                AS load_table_id,
--     FARM_FINGERPRINT(GENERATE_UUID())   AS load_row_id,
--     TO_JSON_STRING(STRUCT(
--         subject_id AS subject_id,
--         hadm_id AS hadm_id,
--         microevent_id AS microevent_id
--     ))                                  AS trace_id
-- FROM
--     @source_project.@hosp_dataset.microbiologyevents
-- ;

-- -------------------------------------------------------------------
-- src_d_micro
-- raw d_micro is no longer available both in mimic_hosp and mimiciv_hosp
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.src_d_micro AS
-- SELECT
--     itemid                      AS itemid, -- numeric ID
--     label                       AS label, -- source_code for custom mapping
--     category                    AS category, 
--     --
--     'd_micro'                   AS load_table_id,
--     FARM_FINGERPRINT(GENERATE_UUID())   AS load_row_id,
--     TO_JSON_STRING(STRUCT(
--         itemid AS itemid
--     ))                                  AS trace_id
-- FROM
--     @source_project.@hosp_dataset.d_micro
-- ;

-- -------------------------------------------------------------------
-- src_d_micro
-- MIMIC IV 2.0: generate src_d_micro from microbiologyevents
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.src_d_micro AS
-- WITH d_micro AS (

--     SELECT DISTINCT
--         ab_itemid                   AS itemid, -- numeric ID
--         ab_name                     AS label, -- source_code for custom mapping
--         'ANTIBIOTIC'                AS category, 
--         --
--         TO_JSON_STRING(STRUCT(
--             'ab_itemid' AS field_name,
--             ab_itemid AS itemid
--         ))                                  AS trace_id
--     FROM
--         @source_project.@hosp_dataset.microbiologyevents
--     WHERE
--         ab_itemid IS NOT NULL
--     UNION ALL
--     SELECT DISTINCT
--         test_itemid                 AS itemid, -- numeric ID
--         test_name                   AS label, -- source_code for custom mapping
--         'MICROTEST'                 AS category, 
--         --
--         TO_JSON_STRING(STRUCT(
--             'test_itemid' AS field_name,
--             test_itemid AS itemid
--         ))                                  AS trace_id
--     FROM
--         @source_project.@hosp_dataset.microbiologyevents
--     WHERE
--         test_itemid IS NOT NULL
--     UNION ALL
--     SELECT DISTINCT
--         org_itemid                  AS itemid, -- numeric ID
--         org_name                    AS label, -- source_code for custom mapping
--         'ORGANISM'                  AS category, 
--         --
--         TO_JSON_STRING(STRUCT(
--             'org_itemid' AS field_name,
--             org_itemid AS itemid
--         ))                                  AS trace_id
--     FROM
--         @source_project.@hosp_dataset.microbiologyevents
--     WHERE
--         org_itemid IS NOT NULL
--     UNION ALL
--     SELECT DISTINCT
--         spec_itemid                 AS itemid, -- numeric ID
--         spec_type_desc              AS label, -- source_code for custom mapping
--         'SPECIMEN'                  AS category, 
--         --
--         TO_JSON_STRING(STRUCT(
--             'spec_itemid' AS field_name,
--             spec_itemid AS itemid
--         ))                                  AS trace_id
--     FROM
--         @source_project.@hosp_dataset.microbiologyevents
--     WHERE
--         spec_itemid IS NOT NULL
-- )
-- SELECT
--     itemid                      AS itemid, -- numeric ID
--     label                       AS label, -- source_code for custom mapping
--     category                    AS category, 
--     --
--     'microbiologyevents'                AS load_table_id,
--     FARM_FINGERPRINT(GENERATE_UUID())   AS load_row_id,
--     trace_id                            AS trace_id
-- FROM
--     d_micro
-- ;

-- -------------------------------------------------------------------
-- src_pharmacy
-- -------------------------------------------------------------------

-- CREATE OR REPLACE TABLE @etl_project.@etl_dataset.src_pharmacy AS
-- SELECT
--     pharmacy_id                         AS pharmacy_id,
--     medication                          AS medication,
--     -- hadm_id                             AS hadm_id,
--     -- subject_id                          AS subject_id,
--     -- starttime                           AS starttime,
--     -- stoptime                            AS stoptime,
--     -- route                               AS route,
--     --
--     'pharmacy'                          AS load_table_id,
--     FARM_FINGERPRINT(GENERATE_UUID())   AS load_row_id,
--     TO_JSON_STRING(STRUCT(
--         pharmacy_id AS pharmacy_id
--     ))                                  AS trace_id
-- FROM
--     @source_project.@hosp_dataset.pharmacy
-- ;





-- ---------------------------------
-- POSTGRESQL
-- ---------------------------------

CREATE TABLE omop.src_diagnoses_icd AS
SELECT
    subject_id      AS subject_id,
    hadm_id         AS hadm_id,
    seq_num         AS seq_num,
    icd_code        AS icd_code,
    icd_version     AS icd_version,
    'diagnoses_icd'                     AS load_table_id,
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS load_row_id,
    json_build_object('hadm_id', hadm_id, 'seq_num', seq_num)::text AS trace_id
FROM
    mimiciv_subset.diagnoses_icd
;


CREATE TABLE omop.src_services AS
SELECT
    subject_id                          AS subject_id,
    hadm_id                             AS hadm_id,
    transfertime                        AS transfertime,
    prev_service                        AS prev_service,
    curr_service                        AS curr_service,
    'services'                          AS load_table_id,
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS load_row_id,
    json_build_object('subject_id', subject_id, 'hadm_id', hadm_id, 'transfertime', transfertime)::text AS trace_id
FROM
    mimiciv_subset.services
;


CREATE TABLE omop.src_labevents AS
SELECT
    labevent_id                         AS labevent_id,
    subject_id                          AS subject_id,
    charttime                           AS charttime,
	storetime                           AS storetime,
    hadm_id                             AS hadm_id,
	specimen_id                         AS specimen_id,
    itemid                              AS itemid,
	order_provider_id                   AS order_provider_id,
	valuenum                            AS valuenum,
    valueuom                            AS valueuom,
    value                               AS value,
    flag                                AS flag,
	priority                            AS priority,
	comments                            AS comments,
    ref_range_lower                     AS ref_range_lower,
    ref_range_upper                     AS ref_range_upper,
    'labevents'                         AS load_table_id,
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS load_row_id,
    json_build_object('labevent_id', labevent_id)::text AS trace_id
FROM
    mimiciv_subset.labevents
;


CREATE TABLE omop.src_d_labitems AS
SELECT
    itemid                              AS itemid,
    label                               AS label,
    fluid                               AS fluid,
    category                            AS category,
    CAST(NULL AS TEXT)                  AS loinc_code,
    'd_labitems'                        AS load_table_id,
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS load_row_id,
    json_build_object('itemid', itemid)::text AS trace_id
FROM
    mimiciv_subset.d_labitems
;


CREATE TABLE omop.src_procedures_icd AS
SELECT
    subject_id                          AS subject_id,
    hadm_id                             AS hadm_id,
	seq_num                             AS seq_num,
	chartdate                           AS chartdate,
    icd_code        AS icd_code,
    icd_version     AS icd_version,
    'procedures_icd'                    AS load_table_id,
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS load_row_id,
    json_build_object('subject_id', subject_id, 'hadm_id', hadm_id, 'icd_code', icd_code, 'icd_version', icd_version)::text AS trace_id
FROM
    mimiciv_subset.procedures_icd
;


CREATE TABLE omop.src_hcpcsevents AS
SELECT
    hadm_id                             AS hadm_id,
    subject_id                          AS subject_id,
	chartdate                           AS chartdate,
    hcpcs_cd                            AS hcpcs_cd,
    seq_num                             AS seq_num,
    short_description                   AS short_description,
    'hcpcsevents'                       AS load_table_id,
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS load_row_id,
    json_build_object('subject_id', subject_id, 'hadm_id', hadm_id, 'hcpcs_cd', hcpcs_cd, 'seq_num', seq_num)::text AS trace_id
FROM
    mimiciv_subset.hcpcsevents
;


CREATE TABLE omop.src_drgcodes AS
SELECT
    hadm_id                             AS hadm_id,
    subject_id                          AS subject_id,
	drg_type                            AS drg_type,
    drg_code                            AS drg_code,
    description                         AS description,
	drg_severity                        AS drg_severity,
	drg_mortality                       AS drg_mortality,
    'drgcodes'                          AS load_table_id,
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS load_row_id,
    json_build_object('subject_id', subject_id, 'hadm_id', hadm_id, 'drg_code', COALESCE(drg_code, ''))::text AS trace_id
FROM
    mimiciv_subset.drgcodes
;


CREATE TABLE omop.src_prescriptions AS
SELECT
    hadm_id                             AS hadm_id,
    subject_id                          AS subject_id,
    pharmacy_id                         AS pharmacy_id,
	order_provider_id                   AS order_provider_id,
    starttime                           AS starttime,
    stoptime                            AS stoptime,
    drug_type                           AS drug_type,
    drug                                AS drug,
    gsn                                 AS gsn,
    ndc                                 AS ndc,
    prod_strength                       AS prod_strength,
    form_rx                             AS form_rx,
    dose_val_rx                         AS dose_val_rx,
    dose_unit_rx                        AS dose_unit_rx,
    form_val_disp                       AS form_val_disp,
    form_unit_disp                      AS form_unit_disp,
    doses_per_24_hrs                    AS doses_per_24_hrs,
    route                               AS route,
    'prescriptions'                     AS load_table_id,
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS load_row_id,
    json_build_object('subject_id', subject_id, 'hadm_id', hadm_id, 'pharmacy_id', pharmacy_id, 'starttime', starttime)::text AS trace_id
FROM
    mimiciv_subset.prescriptions
;


CREATE TABLE omop.src_microbiologyevents AS
SELECT
    microevent_id               AS microevent_id,
    subject_id                  AS subject_id,
    hadm_id                     AS hadm_id,
	micro_specimen_id           AS micro_specimen_id,
	order_provider_id           AS order_provider_id,
    chartdate                   AS chartdate,
    charttime                   AS charttime,
    spec_itemid                 AS spec_itemid,
    spec_type_desc              AS spec_type_desc,
	storedate                   AS storedate,
	storetime                   AS storetime,
    test_itemid                 AS test_itemid,
    test_name                   AS test_name,
    org_itemid                  AS org_itemid,
    org_name                    AS org_name,
    ab_itemid                   AS ab_itemid,
    ab_name                     AS ab_name,
    dilution_comparison         AS dilution_comparison,
    dilution_value              AS dilution_value,
    interpretation              AS interpretation,
    'microbiologyevents'        AS load_table_id,
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS load_row_id,
    json_build_object('subject_id', subject_id, 'hadm_id', hadm_id, 'microevent_id', microevent_id)::text AS trace_id
FROM
    mimiciv_subset.microbiologyevents
;


CREATE TABLE omop.src_d_micro AS
WITH d_micro AS (
    SELECT DISTINCT
        ab_itemid                   AS itemid,
        ab_name                     AS label,
        'ANTIBIOTIC'                AS category,
        json_build_object('field_name', 'ab_itemid', 'itemid', ab_itemid)::text AS trace_id
    FROM
        mimiciv_subset.microbiologyevents
    WHERE
        ab_itemid IS NOT NULL
    UNION ALL
    SELECT DISTINCT
        test_itemid                 AS itemid,
        test_name                   AS label,
        'MICROTEST'                 AS category,
        json_build_object('field_name', 'test_itemid', 'itemid', test_itemid)::text AS trace_id
    FROM
        mimiciv_subset.microbiologyevents
    WHERE
        test_itemid IS NOT NULL
    UNION ALL
    SELECT DISTINCT
        org_itemid                  AS itemid,
        org_name                    AS label,
        'ORGANISM'                  AS category,
        json_build_object('field_name', 'org_itemid', 'itemid', org_itemid)::text AS trace_id
    FROM
        mimiciv_subset.microbiologyevents
    WHERE
        org_itemid IS NOT NULL
    UNION ALL
    SELECT DISTINCT
        spec_itemid                 AS itemid,
        spec_type_desc              AS label,
        'SPECIMEN'                  AS category,
        json_build_object('field_name', 'spec_itemid', 'itemid', spec_itemid)::text AS trace_id
    FROM
        mimiciv_subset.microbiologyevents
    WHERE
        spec_itemid IS NOT NULL
)
SELECT
    itemid                      AS itemid,
    label                       AS label,
    category                    AS category,
    'microbiologyevents'        AS load_table_id,
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS load_row_id,
    trace_id                    AS trace_id
FROM
    d_micro
;


CREATE TABLE omop.src_pharmacy AS
SELECT
    pharmacy_id                         AS pharmacy_id,
    medication                          AS medication,
    'pharmacy'                          AS load_table_id,
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS load_row_id,
    json_build_object('pharmacy_id', pharmacy_id)::text AS trace_id
FROM
    mimiciv_subset.pharmacy
;


CREATE TABLE omop.src_provider AS
SELECT
	provider_id AS provider_id,
	'provider' AS load_table_id,
	('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS load_row_id,
	json_build_object(
        'provider_id', provider_id
    )::text                             AS trace_id
FROM
	mimiciv_subset.provider
;