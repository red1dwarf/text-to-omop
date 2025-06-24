import json

table_names = [
    "person",
    "drug_exposure",
    "condition_occurrence",
    "visit_occurrence",
    "observation",
    "measurement",
    "procedure_occurrence",
    "concept",
    "concept_ancestor"
]

column_descriptions = [
    "person.person_id: Unique identifier for each patient",
    "person.year_of_birth: Year of birth of the person",
    "person.gender_concept_id: Gender as concept ID",
    "person.race_concept_id: Race as concept ID",

    "drug_exposure.drug_exposure_id: Unique ID for the drug exposure record",
    "drug_exposure.person_id: Foreign key to person table",
    "drug_exposure.drug_concept_id: Concept ID of the prescribed drug",
    "drug_exposure.drug_exposure_start_date: Start date of drug exposure",

    "condition_occurrence.condition_occurrence_id: Unique ID for condition record",
    "condition_occurrence.person_id: Foreign key to person table",
    "condition_occurrence.condition_concept_id: Concept ID for condition",
    "condition_occurrence.condition_start_date: Date of condition onset",

    "visit_occurrence.visit_occurrence_id: Unique ID for visit record",
    "visit_occurrence.person_id: Foreign key to person table",
    "visit_occurrence.visit_concept_id: Concept ID for type of visit (e.g., outpatient, inpatient)",
    "visit_occurrence.visit_start_date: Date when the visit started",

    "observation.observation_id: Unique ID for observation",
    "observation.person_id: Foreign key to person table",
    "observation.observation_concept_id: Concept ID for observation",
    "observation.observation_date: Date when observation was made",

    "measurement.measurement_id: Unique ID for measurement record",
    "measurement.person_id: Foreign key to person table",
    "measurement.measurement_concept_id: Concept ID for the measurement (e.g., blood pressure)",
    "measurement.measurement_date: Date of the measurement",

    "procedure_occurrence.procedure_occurrence_id: Unique ID for procedure",
    "procedure_occurrence.person_id: Foreign key to person table",
    "procedure_occurrence.procedure_concept_id: Concept ID for performed procedure",
    "procedure_occurrence.procedure_date: Date of the procedure",

    "concept.concept_id: Unique concept identifier across vocabularies",
    "concept.concept_name: Human-readable name of the concept",
    "concept.domain_id: Domain classification (e.g., Condition, Drug, Measurement)",
    "concept.vocabulary_id: Vocabulary source (e.g., SNOMED, RxNorm)",

    "concept_ancestor.ancestor_concept_id: Higher-level (parent) concept",
    "concept_ancestor.descendant_concept_id: Lower-level (child) concept"
]

schema_context = "\n".join(column_descriptions)

input_path = 'data_generation/dataset_NL_SQL.sql'
output_path = 'model-fine-tuning/formatted_data_with_schema.jsonl'

with open(input_path, 'r', encoding='utf-8') as f:
    data = json.load(f)

with open(output_path, 'w', encoding='utf-8') as outfile:
    for record in data:
        prompt_input = f"Question: {record['question']}\n\nSchema:\n{schema_context}\n\nSQL:"
        transformed = {
            "input": prompt_input,
            "output": record["sql"]
        }
        outfile.write(json.dumps(transformed, ensure_ascii=False) + '\n')
