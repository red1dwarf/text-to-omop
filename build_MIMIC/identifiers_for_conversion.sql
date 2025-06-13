-- ------------------------------------------------------------------------
-- Add identifiers to know in OMOP tables where data come from in MIMIC-IV
-- ------------------------------------------------------------------------


-- ------
-- HOSP
-- ------

-- patients

ALTER TABLE mimiciv_hosp.patients
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_hosp.patients
SET
    load_table_id = 'patients',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'subject_id', subject_id
    )::text
;


-- admissions

ALTER TABLE mimiciv_hosp.admissions
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_hosp.admissions
SET
    load_table_id = 'admissions',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'subject_id', subject_id,
        'hadm_id', hadm_id
    )::text
;


-- transfers

ALTER TABLE mimiciv_hosp.transfers
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_hosp.transfers
SET
    load_table_id = 'transfers',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'subject_id', subject_id,
        'hadm_id', hadm_id,
        'transfer_id', transfer_id
    )::text
;


-- diagnoses_icd

ALTER TABLE mimiciv_hosp.diagnoses_icd
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_hosp.diagnoses_icd
SET
    load_table_id = 'diagnoses_icd',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'hadm_id', hadm_id,
        'seq_num', seq_num
    )::text
;


-- services

ALTER TABLE mimiciv_hosp.services
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_hosp.services
SET
    load_table_id = 'services',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'subject_id', subject_id,
        'hadm_id', hadm_id,
        'transfertime', transfertime
    )::text
;


-- labevents

ALTER TABLE mimiciv_hosp.labevents
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_hosp.services
SET
    load_table_id = 'labevents',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'labevent_id', labevent_id,
    )::text
;


-- d_labitems

ALTER TABLE mimiciv_hosp.d_labitems
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_hosp.d_labitems
SET
    load_table_id = 'd_labitems',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'itemid', itemid,
    )::text
;


-- procedures_icd

ALTER TABLE mimiciv_hosp.procedures_icd
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_hosp.procedures_icd
SET
    load_table_id = 'procedures_icd',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'subject_id', subject_id,
        'hadm_id', hadm_id,
        'icd_code', icd_code,
        'icd_version', icd_version
    )::text
;


-- hcpcsevents

ALTER TABLE mimiciv_hosp.hcpcsevents
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_hosp.hcpcsevents
SET
    load_table_id = 'hcpcsevents',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'subject_id', subject_id,
        'hadm_id', hadm_id,
        'hcpcs_cd', hcpcs_cd,
        'seq_num', seq_num
    )::text
;


-- drgcodes

ALTER TABLE mimiciv_hosp.drgcodes
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_hosp.drgcodes
SET
    load_table_id = 'drgcodes',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'subject_id', subject_id,
        'hadm_id', hadm_id,
        'drg_code', COALESCE(drg_code, '')
    )::text
;


-- prescriptions

ALTER TABLE mimiciv_hosp.prescriptions
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_hosp.prescriptions
SET
    load_table_id = 'prescriptions',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'subject_id', subject_id,
        'hadm_id', hadm_id,
        'pharmacy_id', pharmacy_id,
        'starttime', starttime
    )::text
;


-- microbiologyevents

ALTER TABLE mimiciv_hosp.microbiologyevents
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_hosp.microbiologyevents
SET
    load_table_id = 'microbiologyevents',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'subject_id', subject_id,
        'hadm_id', hadm_id,
        'microevent_id', microevent_id
    )::text
;


-- d_micro

DROP TABLE IF EXISTS mimiciv_hosp.d_micro;
CREATE TABLE mimiciv_hosp.d_micro AS
WITH d_micro AS (

    SELECT DISTINCT
        ab_itemid AS itemid, -- numeric ID
        ab_name AS label,  -- source_code for custom mapping
        'ANTIBIOTIC' AS category, 
        --
        json_build_object(
            'field_name', 'ab_itemid',
            'itemid', ab_itemid
        )::text AS trace_id
    FROM
        mimiciv_hosp.microbiologyevents
    WHERE
        ab_itemid IS NOT NULL

    UNION ALL

    SELECT DISTINCT
        test_itemid AS itemid, -- numeric ID
        test_name AS label,  -- source_code for custom mapping
        'MICROTEST' AS category, 
        --
        json_build_object(
            'field_name', 'test_itemid',
            'itemid', test_itemid
        )::text AS trace_id
    FROM
        mimiciv_hosp.microbiologyevents
    WHERE
        test_itemid IS NOT NULL

    UNION ALL

    SELECT DISTINCT
        org_itemid AS itemid, -- numeric ID
        org_name AS label,  -- source_code for custom mapping
        'ORGANISM' AS category, 
        --
        json_build_object(
            'field_name', 'org_itemid',
            'itemid', org_itemid
        )::text AS trace_id
    FROM
        mimiciv_hosp.microbiologyevents
    WHERE
        org_itemid IS NOT NULL

    UNION ALL

    SELECT DISTINCT
        spec_itemid AS itemid, -- numeric ID
        spec_type_desc AS label,  -- source_code for custom mapping
        'SPECIMEN' AS category, 
        --
        json_build_object(
            'field_name', 'spec_itemid',
            'itemid', spec_itemid
        )::text AS trace_id
    FROM
        mimiciv_hosp.microbiologyevents
    WHERE
        spec_itemid IS NOT NULL
)

SELECT
    itemid AS itemid,         -- numeric ID
    label AS label,          -- source_code for custom mapping
    category AS category,      
    -- 
    'microbiologyevents' AS load_table_id,
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS load_row_id,
    trace_id AS trace_id
FROM
    d_micro
;


-- pharmacy

ALTER TABLE mimiciv_hosp.pharmacy
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_hosp.pharmacy
SET
    load_table_id = 'pharmacy',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'pharmacy_id', pharmacy_id
    )::text
;



-- ------
-- ICU
-- ------


-- procedureevents

ALTER TABLE mimiciv_icu.procedureevents
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_icu.procedureevents
SET
    load_table_id = 'procedureevents',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'subject_id', subject_id,
        'hadm_id', hadm_id,
        'starttime', starttime
    )::text
;


-- d_items

ALTER TABLE mimiciv_icu.d_items
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_icu.d_items
SET
    load_table_id = 'd_items',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'itemid', itemid,
        'linksto', linksto,
    )::text
;


-- datetimesevents

ALTER TABLE mimiciv_icu.datetimeevents
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_icu.datetimeevents
SET
    load_table_id = 'datetimeevents',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'subject_id', subject_id,
        'hadm_id', hadm_id,
        'stay_id', stay_id,
        'charttime', charttime
    )::text
;


-- chartevents

ALTER TABLE mimiciv_icu.chartevents
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_icu.chartevents
SET
    load_table_id = 'chartevents',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'subject_id', subject_id,
        'hadm_id', hadm_id,
        'stay_id', stay_id,
        'charttime', charttime
    )::text
;


-- outputevents

ALTER TABLE mimiciv_icu.outputevents
ADD COLUMN load_table_id TEXT,
ADD COLUMN load_row_id BIGINT,
ADD COLUMN trace_id TEXT;

UPDATE mimiciv_icu.outputevents
SET
    load_table_id = 'outputevents',
    load_row_id = ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint,
    trace_id = json_build_object(
        'subject_id', subject_id,
        'hadm_id', hadm_id,
        'stay_id', stay_id,
        'charttime', charttime
    )::text
;