-- 1 - Create tables using OMOPCDM_postgresql_5.4_ddl.sql
DROP TABLE IF EXISTS omop.concept;
CREATE TABLE omop.concept (
    concept_id integer NOT NULL,
    concept_name varchar(255) NOT NULL,
    domain_id varchar(20) NOT NULL,
    vocabulary_id varchar(30) NOT NULL,
    concept_class_id varchar(20) NOT NULL,
    standard_concept varchar(1) NULL,
    concept_code varchar(255) NOT NULL,
    valid_start_date date NOT NULL,
    valid_end_date date NOT NULL,
    invalid_reason varchar(1) NULL );

DROP TABLE IF EXISTS omop.concept_ancestor;
CREATE TABLE omop.concept_ancestor (
    ancestor_concept_id integer NOT NULL,
    descendant_concept_id integer NOT NULL,
    min_levels_of_separation integer NOT NULL,
    max_levels_of_separation integer NOT NULL );

DROP TABLE IF EXISTS omop.concept_class;
CREATE TABLE omop.concept_class (
    concept_class_id varchar(20) NOT NULL,
    concept_class_name varchar(255) NOT NULL,
    concept_class_concept_id integer NOT NULL );

DROP TABLE IF EXISTS omop.concept_relationship;
CREATE TABLE omop.concept_relationship (
    concept_id_1 integer NOT NULL,
    concept_id_2 integer NOT NULL,
    relationship_id varchar(20) NOT NULL,
    valid_start_date date NOT NULL,
    valid_end_date date NOT NULL,
    invalid_reason varchar(1) NULL );

DROP TABLE IF EXISTS omop.concept_synonym;
CREATE TABLE omop.concept_synonym (
    concept_id integer NOT NULL,
    concept_synonym_name varchar(1000) NOT NULL,
    language_concept_id integer NOT NULL );

DROP TABLE IF EXISTS omop.domain;
CREATE TABLE omop.domain (
    domain_id varchar(20) NOT NULL,
    domain_name varchar(255) NOT NULL,
    domain_concept_id integer NOT NULL );

DROP TABLE IF EXISTS omop.drug_strength;
CREATE TABLE omop.drug_strength (
    drug_concept_id integer NOT NULL,
    ingredient_concept_id integer NOT NULL,
    amount_value NUMERIC NULL,
    amount_unit_concept_id integer NULL,
    numerator_value NUMERIC NULL,
    numerator_unit_concept_id integer NULL,
    denominator_value NUMERIC NULL,
    denominator_unit_concept_id integer NULL,
    box_size integer NULL,
    valid_start_date date NOT NULL,
    valid_end_date date NOT NULL,
    invalid_reason varchar(1) NULL );

DROP TABLE IF EXISTS omop.relationship;
CREATE TABLE omop.relationship (
    relationship_id varchar(20) NOT NULL,
    relationship_name varchar(255) NOT NULL,
    is_hierarchical varchar(1) NOT NULL,
    defines_ancestry varchar(1) NOT NULL,
    reverse_relationship_id varchar(20) NOT NULL,
    relationship_concept_id integer NOT NULL );

DROP TABLE IF EXISTS omop.vocabulary;
CREATE TABLE omop.vocabulary (
    vocabulary_id varchar(30) NOT NULL,
    vocabulary_name varchar(255) NOT NULL,
    vocabulary_reference varchar(255) NULL,
    vocabulary_version varchar(255) NULL,
    vocabulary_concept_id integer NOT NULL );

-- 2 - Upload Athena vocabularies using vocab_loading.sql
-- 3 - Add 2 columns "load_table_id" and "load_row_id" from create_voc_from_tmp.sql
ALTER TABLE ...
    ADD COLUMN load_table_id TEXT NOT NULL
        DEFAULT '...',
    ADD COLUMN load_row_id BIGINT NOT NULL
        DEFAULT ...,


-- 4 - Create table "tmp_custom_mapping" from custom_mapping.json
DROP TABLE IF EXISTS omop.tmp_custom_mapping;
CREATE TABLE omop.tmp_custom_mapping
(
concept_name TEXT,
source_concept_id INTEGER,
source_vocabulary_id TEXT,
source_domain_id TEXT,
source_concept_class_id TEXT,
standard_concept TEXT,
concept_code TEXT,
valid_start_date TEXT,
valid_end_date TEXT,
invalid_reason TEXT,
target_concept_id INTEGER,
relationship_id TEXT,
reverese_relationship_id TEXT,
relationship_valid_start_date TEXT,
relationship_end_date TEXT,
invalid_reason_cr TEXT
);


-- 5 - Upload custom_mapping_csv files in tmp_custom_mapping using load_custom_mapping_csv.py
-- 6 - Check using check_custom_loaded.sql
-- 7 - Add custom concepts to vocabulary tables from the intermediate table using custom_vocabularies.sql
-- 8 - Check using vocabulary_check_bq.sql
-- 10 - 
