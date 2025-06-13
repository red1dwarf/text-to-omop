DROP TABLE IF EXISTS omop.cdm_note;
CREATE TABLE omop.cdm_note(
    note_id bigint,
    person_id bigint,
    note_date date,
    note_datetime timestamp,
    note_type_concept_id integer,
    note_class_concept_id integer,
    note_title varchar(250),
    note_text varchar,
    encoding_concept_id integer,
    language_concept_id integer,
    provider_id integer,
    visit_occurrence_id bigint,
    visit_detail_id bigint,
    note_source_value varchar(50),
    note_event_id integer,
    note_event_field_concept_id integer
)
;

INSERT INTO omop.cdm_note
SELECT
    src.note_id AS note_id,
    per.person_id AS person_id,
    src.charttime::date AS note_date,
    src.charttime AS note_datetime,
    32817 AS note_type_concept_id,
    706531 AS note_class_concept_id,
    'DISCHARGE SUMMARY' AS note_title,
    src.text AS note_text,
    32766 AS encoding_concept_id,
    4180186 AS language_concept_id,
    NULL AS provider_id,
    vo.visit_occurrence_id AS visit_occurrence_id,
    vd.visit_detail_id AS visit_detail_id,
    'Discharge summary' AS note_source_value,
    NULL AS note_event_id,
    NULL AS note_event_field_concept_id
FROM 
    omop.src_discharge src
LEFT JOIN
    omop.cdm_person per
        ON src.subject_id::text = per.person_source_value
LEFT JOIN
    omop.cdm_visit_occurrence vo
        ON src.hamd_id::text = split_part(vo.visit_source_value, '|', 2)
LEFT JOIN
    omop.cdm_visit_detail vd
        ON vo.visit_occurrence_id = vd.visit_occurrence_id
;

INSERT INTO omop.cdm_note
SELECT
    src.note_id AS note_id,
    per.person_id AS person_id,
    src.charttime::date AS note_date,
    src.charttime AS note_datetime,
    32817 AS note_type_concept_id,
    706371 AS note_class_concept_id,
    'RADIOLOGY REPORT' AS note_title,
    src.text AS note_text,
    32766 AS encoding_concept_id,
    4180186 AS language_concept_id,
    NULL AS provider_id,
    vo.visit_occurrence_id AS visit_occurrence_id,
    vd.visit_detail_id AS visit_detail_id,
    'Report' AS note_source_value,
    NULL AS note_event_id,
    NULL AS note_event_field_concept_id
FROM
    omop.src_radiology src
LEFT JOIN
    omop.cdm_person per
        ON src.subject_id::text = per.person_source_value
LEFT JOIN
    omop.cdm_visit_occurrence vo
        ON src.hamd_id::text = split_part(vo.visit_source_value, '|', 2)
LEFT JOIN
    omop.cdm_visit_detail vd
        ON vo.visit_occurrence_id = vd.visit_occurrence_id
;