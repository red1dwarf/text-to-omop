-- -------------------------------------------------------------------
-- @2019, Odysseus Data Services, Inc. All rights reserved
-- Stanford Epic EHR CDM Conversion
-- last updated February 05, 2019
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Load custom mappings from tmp table to concept and concept_relationship.
--
-- Tables affected:
--     concept
--     concept_relationship
--     vocabulary
--
-- Source table:
-- tmp_custom_mapping
-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Data flow:
-- tmp_custom_mapping - tmp_custom_concept - tmp_voc_concept - concept
-- tmp_custom_mapping - tmp_custom_concept_relationship - tmp_voc_concept_relationship - concept_relationship
-- tmp_custom_mapping - tmp_custom_vocabulary - tmp_voc_vocabulary - vocabulary
-- -------------------------------------------------------------------

-- go

-- -- temp create backup
-- CREATE TABLE omop.concept_bak AS
-- SELECT * FROM omop.concept
-- ;
-- CREATE TABLE omop.concept_relationship_bak AS
-- SELECT * FROM omop.concept_relationship
-- ;
-- CREATE TABLE omop.vocabulary_bak AS
-- SELECT * FROM omop.vocabulary
-- ;



-- -------------------------------------------------------------------
-- Convert stcm-formatted table to tmp_custom_concept + concept_rel + vocabulary
-- -------------------------------------------------------------------

-- tmp_custom_concept

DROP TABLE IF EXISTS omop.tmp_custom_concept;

CREATE TABLE omop.tmp_custom_concept AS
SELECT
    voc.source_concept_id           AS concept_id,
    voc.concept_name                AS concept_name,
    voc.source_domain_id            AS domain_id,
    voc.source_vocabulary_id        AS vocabulary_id,
    voc.source_concept_class_id     AS concept_class_id,
    CASE
        WHEN voc.target_concept_id = 0 THEN 'S'
        ELSE voc.standard_concept 
    END                             AS standard_concept,
    voc.concept_code                AS concept_code,
    TO_DATE(voc.valid_start_date, 'YYYY-MM-DD')    AS valid_start_date,
    TO_DATE(voc.valid_end_date, 'YYYY-MM-DD')      AS valid_end_date,
    voc.invalid_reason              AS invalid_reason,

    'tmp_custom_mapping'            AS load_table_id,
    CAST(NULL AS BIGINT)             AS load_row_id
    -- voc.load_table_id               AS load_table_id,
    -- MIN(voc.load_row_id)            AS load_row_id
FROM
    omop.tmp_custom_mapping voc
GROUP BY
    voc.source_concept_id,
    voc.concept_name,
    voc.source_domain_id,
    voc.source_vocabulary_id,
    voc.source_concept_class_id,
    CASE
        WHEN voc.target_concept_id = 0 THEN 'S'
        ELSE voc.standard_concept 
    END,
    voc.concept_code,
    voc.valid_start_date,
    voc.valid_end_date,
    voc.invalid_reason
    -- voc.load_table_id
;

-- tmp_custom_concept_relationship

DROP TABLE IF EXISTS omop.tmp_custom_concept_relationship;

CREATE TABLE omop.tmp_custom_concept_relationship AS
SELECT
    tcr.source_concept_id               AS concept_id_1,
    CASE
        WHEN tcr.target_concept_id = 0 THEN tcr.source_concept_id
        ELSE tcr.target_concept_id
    END                                 AS concept_id_2,
    tcr.relationship_id                 AS relationship_id,
    TO_DATE(tcr.relationship_valid_start_date, 'YYYY-MM-DD')   AS valid_start_date,
    TO_DATE(tcr.relationship_end_date, 'YYYY-MM-DD')           AS valid_end_date,
    tcr.invalid_reason_cr               AS invalid_reason,

    'tmp_custom_mapping'            AS load_table_id,
    CAST(NULL AS BIGINT)             AS load_row_id
    -- tcr.load_table_id                   AS load_table_id,
    -- tcr.load_row_id                     AS load_row_id
FROM
    omop.tmp_custom_mapping tcr
WHERE
    tcr.target_concept_id IS NOT NULL

UNION ALL

SELECT
    CASE
        WHEN tcr.target_concept_id = 0 THEN tcr.source_concept_id
        ELSE tcr.target_concept_id
    END                                 AS concept_id_1,
    tcr.source_concept_id               AS concept_id_2,
    tcr.reverese_relationship_id        AS relationship_id,
    TO_DATE(tcr.relationship_valid_start_date, 'YYYY-MM-DD')   AS valid_start_date,
    TO_DATE(tcr.relationship_end_date, 'YYYY-MM-DD')           AS valid_end_date,
    tcr.invalid_reason_cr               AS invalid_reason,

    'tmp_custom_mapping'            AS load_table_id,
    CAST(NULL AS BIGINT)             AS load_row_id
    -- tcr.load_table_id                   AS load_table_id,
    -- tcr.load_row_id                     AS load_row_id
FROM
    omop.tmp_custom_mapping tcr
WHERE
    tcr.target_concept_id IS NOT NULL
;

-- tmp_custom_vocabulary

DROP TABLE IF EXISTS omop.tmp_custom_vocabulary_dist;

CREATE TABLE omop.tmp_custom_vocabulary_dist AS
SELECT
    voc.source_vocabulary_id        AS source_vocabulary_id,

    'tmp_custom_mapping'            AS load_table_id,
    CAST(NULL AS BIGINT)             AS load_row_id
    -- voc.load_table_id               AS load_table_id,
    -- MIN(voc.load_row_id)            AS load_row_id
FROM
    omop.tmp_custom_mapping voc
GROUP BY
    voc.source_vocabulary_id
    -- voc.load_table_id
;

DROP TABLE IF EXISTS omop.tmp_custom_vocabulary;

CREATE TABLE omop.tmp_custom_vocabulary AS
SELECT
    voc.source_vocabulary_id        AS vocabulary_id,
    voc.source_vocabulary_id        AS vocabulary_name,
    'Odysseus generated'            AS vocabulary_reference,
    CAST(NULL AS TEXT)            AS vocabulary_version,
    2110000001 + 
        ROW_NUMBER() OVER (
            ORDER BY voc.source_vocabulary_id
        )                           AS vocabulary_concept_id,

    voc.load_table_id               AS load_table_id,
    voc.load_row_id                 AS load_row_id
FROM
    omop.tmp_custom_vocabulary_dist voc
;

DROP TABLE IF EXISTS omop.tmp_custom_vocabulary_dist;

-- -------------------------------------------------------------------
-- Re-write voc_concept to remove previous version of custom concept
-- Keep PEDSnet originated custom concepts
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS omop.tmp_voc_concept;

CREATE TABLE omop.tmp_voc_concept AS
SELECT *
FROM
    omop.concept
WHERE
    concept_id < 2000000000
;

-- ----------------------------------------------------------------------
-- Re-write Custom Relationships table to remove rows related to custom concepts
-- Keep links to PEDSnet originated custom concepts
-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS omop.tmp_voc_concept_relationship;

CREATE TABLE omop.tmp_voc_concept_relationship AS
SELECT vr.*
FROM
    omop.concept_relationship vr
INNER JOIN
    omop.tmp_voc_concept vc1
        ON  vc1.concept_id = vr.concept_id_1
INNER JOIN
    omop.tmp_voc_concept vc2
        ON  vc2.concept_id = vr.concept_id_2
;

-- -------------------------------------------------------------------
-- Add new custom concepts to the re-written
-- -------------------------------------------------------------------

INSERT INTO omop.tmp_voc_concept
SELECT
    voc.concept_id              AS concept_id,
    voc.concept_name            AS concept_name,
    voc.domain_id               AS domain_id,
    voc.vocabulary_id           AS vocabulary_id,
    voc.concept_class_id        AS concept_class_id,
    voc.standard_concept        AS standard_concept,
    voc.concept_code            AS concept_code,
    voc.valid_start_date        AS valid_start_date,
    voc.valid_end_date          AS valid_end_date,
    voc.invalid_reason          AS invalid_reason --,

    -- voc.load_table_id           AS load_table_id,
    -- voc.load_row_id              AS load_row_id
    -- when loaded not by vocabulary_refresh, raw concept tables have no load_row_id, so comment it temporarily
FROM 
    omop.tmp_custom_concept voc
-- LEFT JOIN
--     omop.concept vc
--         ON  vc.concept_id = voc.concept_id
-- WHERE
--     vc.concept_id IS NULL
;

DROP TABLE IF EXISTS omop.concept;

CREATE TABLE omop.concept AS
SELECT *
FROM omop.tmp_voc_concept;

-- ----------------------------------------------------------------------
-- Add relationships to the added custom concepts
-- ----------------------------------------------------------------------

INSERT INTO omop.tmp_voc_concept_relationship
SELECT
    tcr.concept_id_1             AS concept_id_1,
    tcr.concept_id_2             AS concept_id_2,
    tcr.relationship_id          AS relationship_id,
    tcr.valid_start_date         AS valid_start_date,
    tcr.valid_end_date           AS valid_end_date,
    tcr.invalid_reason           AS invalid_reason --,

    -- tcr.load_table_id            AS load_table_id,
    -- tcr.load_row_id              AS load_row_id
FROM 
    omop.tmp_custom_concept_relationship tcr
-- LEFT JOIN 
--     omop.concept_relationship vcr
--         ON  tcr.concept_id_1 = vcr.concept_id_1
--         AND tcr.concept_id_2 = vcr.concept_id_2
-- WHERE
--     vcr.concept_id_1 IS NULL
;

DROP TABLE IF EXISTS omop.concept_relationship;

CREATE TABLE omop.concept_relationship AS
SELECT *
FROM omop.tmp_voc_concept_relationship;

-- ----------------------------------------------------------------------
-- Re-write vocabularies to remove previous version of custom vocabularies
-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS omop.tmp_voc_vocabulary;

CREATE TABLE omop.tmp_voc_vocabulary AS
SELECT *
FROM
    omop.vocabulary
WHERE
    vocabulary_concept_id < 2000000000
;

-- ----------------------------------------------------------------------
-- Add custom vocabularies to Vocabulary and Concept table
-- ----------------------------------------------------------------------

INSERT INTO omop.tmp_voc_vocabulary
SELECT
    voc.vocabulary_id         AS vocabulary_id,
    voc.vocabulary_name       AS vocabulary_name,
    voc.vocabulary_reference  AS vocabulary_reference,
    voc.vocabulary_version    AS vocabulary_version,
    voc.vocabulary_concept_id AS vocabulary_concept_id --,

    -- voc.load_table_id           AS load_table_id,
    -- voc.load_row_id             AS load_row_id
FROM 
    omop.tmp_custom_vocabulary voc
;

DROP TABLE IF EXISTS omop.vocabulary;

CREATE TABLE omop.vocabulary AS
SELECT *
FROM omop.tmp_voc_vocabulary;

INSERT INTO omop.concept
SELECT
    vcv.vocabulary_concept_id   AS concept_id,
    vcv.vocabulary_name         AS concept_name,
    'Metadata'                  AS domain_id,
    'Vocabulary'                AS vocabulary_id,
    'Vocabulary'                AS concept_class_id,
    'S'                         AS standard_concept,
    vcv.vocabulary_reference    AS concept_code,
    CAST('1970-01-01' AS DATE)  AS valid_start_date,
    CAST('2099-12-31' AS DATE)  AS valid_end_date,
    NULL                        AS invalid_reason --,

    -- NULL                        AS load_table_id,
    -- NULL                        AS load_row_id
FROM 
    omop.tmp_custom_vocabulary vcv 
;


-- -------------------------------------------------------------------
-- save source rows with conflicting concept_id, if any is left,
-- into table
-- tmp_custom_concept_skipped
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS omop.tmp_custom_concept_skipped;

CREATE TABLE omop.tmp_custom_concept_skipped AS
SELECT
    tcc.*
FROM
    omop.tmp_custom_concept tcc
INNER JOIN
    omop.concept vc
        ON  tcc.concept_id = vc.concept_id
        AND tcc.concept_name <> vc.concept_name
;

-- -------------------------------------------------------------------
-- clean up
-- -------------------------------------------------------------------

DROP TABLE IF EXISTS omop.tmp_custom_concept;
DROP TABLE IF EXISTS omop.tmp_custom_concept_relationship;
DROP TABLE IF EXISTS omop.tmp_custom_vocabulary;
DROP TABLE IF EXISTS omop.tmp_voc_concept;
DROP TABLE IF EXISTS omop.tmp_voc_concept_relationship;
DROP TABLE IF EXISTS omop.tmp_voc_vocabulary;
