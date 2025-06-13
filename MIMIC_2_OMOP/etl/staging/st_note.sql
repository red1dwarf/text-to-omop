DROP SCHEMA IF EXISTS mimiciv_note CASCADE;
CREATE SCHEMA mimiciv_note;


DROP TABLE IF EXISTS mimiciv_note.discharge;
CREATE TABLE mimiciv_note.discharge(
    note_id VARCHAR(25) NOT NULL,
    subject_id INTEGER NOT NULL,
    hadm_id INTEGER NOT NULL,
    note_type CHAR(2) NOT NULL,
    note_seq INTEGER NOT NULL,
    charttime TIMESTAMP NOT NULL,
    storetime TIMESTAMP,
    text TEXT NOT NULL
);

DROP TABLE IF EXISTS mimiciv_note.radiology;
CREATE TABLE mimiciv_note.radiology(
    note_id VARCHAR(25) NOT NULL,
    subject_id INTEGER NOT NULL,
    hadm_id	INTEGER,
    note_type CHAR(2) NOT NULL,
    note_seq INTEGER NOT NULL,
    charttime TIMESTAMP NOT NULL,
    storetime TIMESTAMP,
    text TEXT NOT NULL
);


DROP TABLE IF EXISTS omop.src_discharge;
CREATE TABLE omop.src_discharge AS
SELECT
    note_id AS note_id,
    subject_id AS subject_id,
    hadm_id AS hamd_id,
    note_type AS note_type,
    note_seq AS note_seq,
    charttime AS charttime,
    storetime AS storetime,
    text AS text,
    'discharge' AS load_table_id,
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS load_row_id,
    json_build_object('subject_id', subject_id, 'hadm_id', hadm_id)::text AS trace_id
FROM
    mimiciv_subset.discharge
;

DROP TABLE IF EXISTS omop.src_radiology;
CREATE TABLE omop.src_radiology AS
SELECT
    note_id AS note_id,
    subject_id AS subject_id,
    hadm_id AS hamd_id,
    note_type AS note_type,
    note_seq AS note_seq,
    charttime AS charttime,
    storetime AS storetime,
    text AS text,
    'radiology' AS load_table_id,
    ('x' || substr(md5(gen_random_uuid()::text), 1, 16))::bit(64)::bigint AS load_row_id,
    json_build_object('subject_id', subject_id, 'hadm_id', hadm_id, 'note_type', note_type, 'note_seq', note_seq)::text AS trace_id
FROM
    mimiciv_subset.radiology
;