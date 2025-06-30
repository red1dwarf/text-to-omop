import json

# Données d'entrée : liste de dictionnaires (extrait partagé)
data = [
  {
    "question_name": "Has there been any organism found in the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> microbiology test of patient <PERSON_ID>7776408132511994203</PERSON_ID> this month?",
    "question_concept": "Has there been any organism found in the first <MEASUREMENT>3007813</MEASUREMENT> microbiology test of patient <PERSON_ID>7776408132511994203</PERSON_ID> this month?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Was any organism detected in the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> microbiology test for patient <PERSON_ID>7776408132511994203</PERSON_ID> this month?",
    "question_concept": "Was any organism detected in the first <MEASUREMENT>3007813</MEASUREMENT> microbiology test for patient <PERSON_ID>7776408132511994203</PERSON_ID> this month?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Did the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> microbiology result of patient <PERSON_ID>7776408132511994203</PERSON_ID> this month show any organism?",
    "question_concept": "Did the first <MEASUREMENT>3007813</MEASUREMENT> microbiology result of patient <PERSON_ID>7776408132511994203</PERSON_ID> this month show any organism?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Have any organisms been found in patient <PERSON_ID>7776408132511994203</PERSON_ID>'s first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> test this month?",
    "question_concept": "Have any organisms been found in patient <PERSON_ID>7776408132511994203</PERSON_ID>'s first <MEASUREMENT>3007813</MEASUREMENT> test this month?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "In the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> microbiology test for patient <PERSON_ID>7776408132511994203</PERSON_ID> this month, was an organism identified?",
    "question_concept": "In the first <MEASUREMENT>3007813</MEASUREMENT> microbiology test for patient <PERSON_ID>7776408132511994203</PERSON_ID> this month, was an organism identified?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Has patient <PERSON_ID>7776408132511994203</PERSON_ID> shown any organism in the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> test this month?",
    "question_concept": "Has patient <PERSON_ID>7776408132511994203</PERSON_ID> shown any organism in the first <MEASUREMENT>3007813</MEASUREMENT> test this month?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Did the initial <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> test this month for patient <PERSON_ID>7776408132511994203</PERSON_ID> detect any organisms?",
    "question_concept": "Did the initial <MEASUREMENT>3007813</MEASUREMENT> test this month for patient <PERSON_ID>7776408132511994203</PERSON_ID> detect any organisms?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Any sign of an organism in the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> microbiology test for patient <PERSON_ID>7776408132511994203</PERSON_ID> this month?",
    "question_concept": "Any sign of an organism in the first <MEASUREMENT>3007813</MEASUREMENT> microbiology test for patient <PERSON_ID>7776408132511994203</PERSON_ID> this month?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Were organisms present in patient <PERSON_ID>7776408132511994203</PERSON_ID>'s first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> microbiology result this month?",
    "question_concept": "Were organisms present in patient <PERSON_ID>7776408132511994203</PERSON_ID>'s first <MEASUREMENT>3007813</MEASUREMENT> microbiology result this month?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Has there been detection of any organism in the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> test this month for patient <PERSON_ID>7776408132511994203</PERSON_ID>?",
    "question_concept": "Has there been detection of any organism in the first <MEASUREMENT>3007813</MEASUREMENT> test this month for patient <PERSON_ID>7776408132511994203</PERSON_ID>?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Did the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> microbiology analysis of patient <PERSON_ID>7776408132511994203</PERSON_ID> this month find any organisms?",
    "question_concept": "Did the first <MEASUREMENT>3007813</MEASUREMENT> microbiology analysis of patient <PERSON_ID>7776408132511994203</PERSON_ID> this month find any organisms?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Was the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> test of patient <PERSON_ID>7776408132511994203</PERSON_ID> this month positive for organisms?",
    "question_concept": "Was the first <MEASUREMENT>3007813</MEASUREMENT> test of patient <PERSON_ID>7776408132511994203</PERSON_ID> this month positive for organisms?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Did patient <PERSON_ID>7776408132511994203</PERSON_ID>'s first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> microbiology test this month find any organisms?",
    "question_concept": "Did patient <PERSON_ID>7776408132511994203</PERSON_ID>'s first <MEASUREMENT>3007813</MEASUREMENT> microbiology test this month find any organisms?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Has the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> test this month revealed any organisms for patient <PERSON_ID>7776408132511994203</PERSON_ID>?",
    "question_concept": "Has the first <MEASUREMENT>3007813</MEASUREMENT> test this month revealed any organisms for patient <PERSON_ID>7776408132511994203</PERSON_ID>?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "In this month's first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> test for patient <PERSON_ID>7776408132511994203</PERSON_ID>, has any organism been found?",
    "question_concept": "In this month's first <MEASUREMENT>3007813</MEASUREMENT> test for patient <PERSON_ID>7776408132511994203</PERSON_ID>, has any organism been found?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Has an organism been detected this month in the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> microbiology test of patient <PERSON_ID>7776408132511994203</PERSON_ID>?",
    "question_concept": "Has an organism been detected this month in the first <MEASUREMENT>3007813</MEASUREMENT> microbiology test of patient <PERSON_ID>7776408132511994203</PERSON_ID>?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Was any microorganism identified in the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> microbiology test for patient <PERSON_ID>7776408132511994203</PERSON_ID> this month?",
    "question_concept": "Was any microorganism identified in the first <MEASUREMENT>3007813</MEASUREMENT> microbiology test for patient <PERSON_ID>7776408132511994203</PERSON_ID> this month?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Is there any organism found in the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> test this month for patient <PERSON_ID>7776408132511994203</PERSON_ID>?",
    "question_concept": "Is there any organism found in the first <MEASUREMENT>3007813</MEASUREMENT> test this month for patient <PERSON_ID>7776408132511994203</PERSON_ID>?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Has any organism shown up in the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> test for patient <PERSON_ID>7776408132511994203</PERSON_ID> this month?",
    "question_concept": "Has any organism shown up in the first <MEASUREMENT>3007813</MEASUREMENT> test for patient <PERSON_ID>7776408132511994203</PERSON_ID> this month?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Has the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> microbiology sample from patient <PERSON_ID>7776408132511994203</PERSON_ID> this month indicated an organism?",
    "question_concept": "Has the first <MEASUREMENT>3007813</MEASUREMENT> microbiology sample from patient <PERSON_ID>7776408132511994203</PERSON_ID> this month indicated an organism?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Was any organism found in patient <PERSON_ID>7776408132511994203</PERSON_ID>'s first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> microbiology this month?",
    "question_concept": "Was any organism found in patient <PERSON_ID>7776408132511994203</PERSON_ID>'s first <MEASUREMENT>3007813</MEASUREMENT> microbiology this month?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  }
]

# Nouveau SQL à insérer
new_sql = "SELECT m.value_as_concept_id FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND DATE_TRUNC('month', m.measurement_date) = DATE_TRUNC('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1;"

# Remplacement du champ "sql"
for entry in data:
    entry["sql"] = new_sql

# Affichage (ou sauvegarde) du résultat
print(json.dumps(data, indent=2))
