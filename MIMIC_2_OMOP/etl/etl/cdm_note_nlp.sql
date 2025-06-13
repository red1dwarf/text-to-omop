DROP TABLE IF EXISTS omop.cdm_note_nlp;
CREATE TABLE omop.cdm_note_nlp(
    note_nlp_id bigint,
    note_id text,
    section_concept_id integer,
    snippet varchar(250),
    "offset" varchar(50),
    lexical_variant varchar(250),
    note_nlp_concept_id bigint,
    note_nlp_source_concept_id bigint,
    nlp_system varchar(250),
    nlp_date date,
    nlp_datetime timestamp,
    term_exists varchar(1),
    term_temporal varchar(50),
    term_modifiers varchar(2000)
)
;

INSERT INTO omop.cdm_note_nlp
SELECT
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS note_nlp_id,
    src.note_id AS note_id,
    0 AS section_concept_id,
    SUBSTRING(n.note_text FROM 
        GREATEST(1, src.nlp_start - 20) 
        FOR 
        GREATEST(0, LEAST(src.nlp_end + 20, LENGTH(n.note_text)) - GREATEST(1, src.nlp_start - 20))
    ) AS snippet,
    CONCAT(src.nlp_start, ':', src.nlp_end) AS "offset",
    src.detected_name AS lexical_variant,
    src.cui::bigint AS note_nlp_concept_id,
    src.cui::bigint AS note_nlp_source_concept_id,
    CONCAT(src.service_model, src.service_version) AS nlp_system,
    src.timestamp::date AS nlp_date,
    src.timestamp AS nlp_datetime,
    CASE 
    WHEN src.presence_value = 'True' THEN 'T'
    WHEN src.presence_value = 'False' THEN 'F'
    ELSE 'H'
	END AS term_exists,
    src.time_value AS term_temporal,
    'Negation=' || 
    CASE WHEN src.presence_value = 'False' THEN 'true' ELSE 'false' END ||
    ';Subject=' || src.subject_value AS term_modifiers
FROM
    mimiciv_subset.discharge_annotations src
LEFT JOIN 
    omop.cdm_note n
        ON src.note_id = n.note_id
;

INSERT INTO omop.cdm_note_nlp
SELECT
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS note_nlp_id,
    src.note_id AS note_id,
    0 AS section_concept_id,
    SUBSTRING(n.note_text FROM 
        GREATEST(1, src.nlp_start - 20) 
        FOR 
        GREATEST(0, LEAST(src.nlp_end + 20, LENGTH(n.note_text)) - GREATEST(1, src.nlp_start - 20))
    ) AS snippet,
    CONCAT(src.nlp_start, ':', src.nlp_end) AS "offset",
    src.detected_name AS lexical_variant,
    src.cui::bigint AS note_nlp_concept_id,
    src.cui::bigint AS note_nlp_source_concept_id,
    CONCAT(src.service_model, src.service_version) AS nlp_system,
    src.timestamp::date AS nlp_date,
    src.timestamp AS nlp_datetime,
    CASE 
    WHEN src.presence_value = 'True' THEN 'T'
    WHEN src.presence_value = 'False' THEN 'F'
    ELSE 'H'
	END AS term_exists,
    src.time_value AS term_temporal,
    'Negation=' || 
    CASE WHEN src.presence_value = 'False' THEN 'true' ELSE 'false' END ||
    ';Subject=' || src.subject_value AS term_modifiers
FROM
    mimiciv_subset.radiology_annotations src
LEFT JOIN 
    omop.cdm_note n
        ON src.note_id = n.note_id
;