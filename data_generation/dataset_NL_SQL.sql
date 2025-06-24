[
  {
    "question_name": "What are the top 4 frequent prescribed drugs for patients who were also prescribed <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> at the same time on the last hospital visit?",
    "question_concept": "What are the top 4 frequent prescribed drugs for patients who were also prescribed <DRUG>19041823</DRUG> at the same time on the last hospital visit?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  -- {
  --   "question_name": "What are the top 3 frequent prescribed drugs for patients who were also prescribed <DRUG>levetiracetam 500 MG Oral Tablet [Keppra]</DRUG> within the same hospital visit on the first hospital visit?",
  --   "question_concept": "What are the top 3 frequent prescribed drugs for patients who were also prescribed <DRUG>711586</DRUG> within the same hospital visit on the first hospital visit?",
  --   "sql": "WITH first_visits AS ( SELECT person_id, MIN(visit_occurrence_id) AS first_visit_id FROM drug_exposure GROUP BY person_id ), patients_with_711586 AS ( SELECT DISTINCT person_id, visit_occurrence_id FROM drug_exposure WHERE drug_concept_id = 711586 ), target_visits AS ( SELECT fv.person_id, fv.first_visit_id AS visit_occurrence_id FROM first_visits fv WHERE EXISTS ( SELECT 1 FROM patients_with_711586 pw WHERE pw.person_id = fv.person_id AND pw.visit_occurrence_id = fv.first_visit_id ) ), drugs_in_target_visits AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id) IN ( SELECT person_id, visit_occurrence_id FROM target_visits ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_in_target_visits WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 3;",
  --   "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  -- },
  -- {
  --   "question_name": "What are the top 3 frequent prescribed drugs for patients who were also prescribed <DRUG>100 ML propofol 10 MG/ML Injection [Diprivan]</DRUG> within the same month since July/2167?",
  --   "question_concept": "What are the top 3 frequent prescribed drugs for patients who were also prescribed <DRUG>40220388</DRUG> within the same month since July/2167?",
  --   "sql": "WITH target_patients_months AS ( SELECT DISTINCT person_id, EXTRACT(YEAR FROM drug_exposure_start_date) AS yr, EXTRACT(MONTH FROM drug_exposure_start_date) AS mo FROM drug_exposure WHERE drug_concept_id = 40220388 AND drug_exposure_start_date >= '2167-07-01' ), drugs_in_same_month AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, EXTRACT(YEAR FROM drug_exposure_start_date), EXTRACT(MONTH FROM drug_exposure_start_date)) IN ( SELECT person_id, yr, mo FROM target_patients_months ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_in_same_month WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 3;",
  --   "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  -- },
  -- {
  --   "question_name": "What are the top 5 frequent prescribed drugs for patients who were also prescribed <DRUG>10 ML sodium chloride 9 MG/ML Prefilled Syringe</DRUG> within the same day last year?",
  --   "question_concept": "What are the top 5 frequent prescribed drugs for patients who were also prescribed <DRUG>19127213</DRUG> within the same day last year?",
  --   "sql": "WITH target_patients_days AS ( SELECT DISTINCT person_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19127213 AND EXTRACT(YEAR FROM drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 ), drugs_in_same_day AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, drug_exposure_start_date) IN ( SELECT person_id, drug_exposure_start_date FROM target_patients_days ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_in_same_day WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 5;",
  --   "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  -- },
  -- {
  --   "question_name": "What are the top 3 frequent prescribed drugs for patients who were also prescribed <DRUG>calcium chloride 0.2 MG/ML / potassium chloride 0.3 MG/ML / sodium chloride 6 MG/ML / sodium lactate 3.1 MG/ML Injectable Solution</DRUG> within 2 year until January/last year?",
  --   "question_concept": "What are the top 3 frequent prescribed drugs for patients who were also prescribed <DRUG>19135374</DRUG> within 2 year until January/last year?",
  --   "sql": "WITH params AS ( SELECT make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 1, 1) AS window_end, make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 1, 1) - interval '2 years' AS window_start ), target_patients AS ( SELECT DISTINCT person_id FROM drug_exposure, params WHERE drug_concept_id = 19135374 AND drug_exposure_start_date >= params.window_start AND drug_exposure_start_date < params.window_end ), drugs_in_window AS ( SELECT drug_concept_id FROM drug_exposure WHERE person_id IN (SELECT person_id FROM target_patients) AND drug_exposure_start_date >= (SELECT window_start FROM params) AND drug_exposure_start_date < (SELECT window_end FROM params) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_in_window WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 3;",
  --   "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  -- },
  {
    "question_name": "what are the top 3 frequent diagnoses of patients aged 60's or above last month?",
    "question_concept": "what are the top 3 frequent diagnoses of patients aged 60's or above last month?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  -- {
  --   "question_name": "what were the top 3 frequent diagnoses of patients aged 40's until 2189?",
  --   "question_concept": "what were the top 3 frequent diagnoses of patients aged 40's until 2189?",
  --   "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date < '2190-01-01' AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE('2189-12-31', make_date(year_of_birth, 1, 1))) BETWEEN 40 AND 49) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
  --   "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  -- },
  -- {
  --   "question_name": "what were the top 5 frequent diagnoses of patients aged 50's on the current ICU visit?",
  --   "question_concept": "what were the top 5 frequent diagnoses of patients aged 50's on the current ICU visit?",
  --   "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE visit_concept_id IN (9203, 32037, 44818517)) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) BETWEEN 50 AND 59) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 5;",
  --   "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  -- },
  -- {
  --   "question_name": "what were the top 3 frequent diagnoses of patients aged 20's on March/12/2201?",
  --   "question_concept": "what were the top 3 frequent diagnoses of patients aged 20's on March/12/2201?",
  --   "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date = '2201-03-12' AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE('2201-03-12', make_date(year_of_birth, 1, 1))) BETWEEN 20 AND 29) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
  --   "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  -- },
  -- {
  --   "question_name": "what are the top 4 frequent diagnoses of patients aged 60's or above until 4 month ago?",
  --   "question_concept": "what are the top 4 frequent diagnoses of patients aged 60's or above until 4 month ago?",
  --   "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date < date_trunc('month', CURRENT_DATE) - INTERVAL '4 months' AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 4;",
  --   "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  -- },
  -- Need to add tags for value and patient_id ?
  -- Need to add in the "question_name" ?
  {
    "question_name": "What percentile is the value of 1.3 in a <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> lab test among patients of the same age as patient 4924550704026979905 in March/last year?",
    "question_concept": "What percentile is the value of 1.3 in a <MEASUREMENT>3022217</MEASUREMENT> lab test among patients of the same age as patient 4924550704026979905 in March/last year?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "What percentile is the value of 98.5 in a <MEASUREMENT>Body temperature</MEASUREMENT> lab test among patients of the same age as patient 3165460829936440061 since last year?",
  --   "question_concept": "What percentile is the value of 98.5 in a <MEASUREMENT>3020891</MEASUREMENT> lab test among patients of the same age as patient 3165460829936440061 since last year?",
  --   "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 3165460829936440061), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3020891 AND measurement_date >= (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 98.5 LIMIT 1;",
  --   "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  -- },
  -- {
  --   "question_name": "What percentile is the value of 59.0 in a <MEASUREMENT>Heart rate</MEASUREMENT> lab test among patients of the same age as patient 987285437032398862 on the last hospital visit?",
  --   "question_concept": "What percentile is the value of 59.0 in a <MEASUREMENT>3027018</MEASUREMENT> lab test among patients of the same age as patient 987285437032398862 on the last hospital visit?",
  --   "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 987285437032398862), last_visit_id AS (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 987285437032398862 ORDER BY visit_start_date DESC LIMIT 1), patients_same_birth_year AS (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)), last_visits_same_birth_year AS (SELECT person_id, visit_occurrence_id FROM visit_occurrence WHERE visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_occurrence v2 WHERE v2.person_id = visit_occurrence.person_id ORDER BY v2.visit_start_date DESC LIMIT 1) AND person_id IN (SELECT person_id FROM patients_same_birth_year)), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3027018 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM last_visits_same_birth_year) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 59.0 LIMIT 1;",
  --   "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  -- },
  -- {
  --   "question_name": "What percentile is the value of 14.8 in a <MEASUREMENT>Erythrocyte distribution width [Ratio] by Automated count</MEASUREMENT> lab test among patients of the same age as patient 3158857548412946003 since last month?",
  --   "question_concept": "What percentile is the value of 14.8 in a <MEASUREMENT>3019897</MEASUREMENT> lab test among patients of the same age as patient 3158857548412946003 since last month?",
  --   "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 3158857548412946003), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3019897 AND measurement_date >= (DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 month') AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 14.8 LIMIT 1;",
  --   "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  -- },
  -- {
  --   "question_name": "What percentile is the value of 4.0 in a <MEASUREMENT>Physical mobility Braden scale</MEASUREMENT> lab test among patients of the same age as patient 8623393892246627034 until yesterday?",
  --   "question_concept": "What percentile is the value of 4.0 in a <MEASUREMENT>3035206</MEASUREMENT> lab test among patients of the same age as patient 8623393892246627034 until yesterday?",
  --   "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 8623393892246627034), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3035206 AND measurement_date < CURRENT_DATE AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 4.0 LIMIT 1;",
  --   "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  -- },
  {
    "question_name": "What was the name of the drug that patient 449512254961891092 was at 2145-09-19 20:00:00 prescribed via route <ROUTE>Subcutaneous</ROUTE> yesterday?",
    "question_concept": "What was the name of the drug that patient 449512254961891092 was at 2145-09-19 20:00:00 prescribed via route <ROUTE>4142048</ROUTE> yesterday?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 AND exposure_start_date < CURRENT_DATE AND drug_concept_id IS NOT NULL LIMIT 1) LIMIT 1;" 
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  -- {
  --   "question_name": "What was the name of the drug that patient 3201959312032121892 was last prescribed via route <ROUTE>Respiratory tract</ROUTE> since yesterday?",
  --   "question_concept": "What was the name of the drug that patient 3201959312032121892 was last prescribed via route <ROUTE>40486069</ROUTE> since yesterday?",
  --   "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 3201959312032121892 AND route_concept_id = 40486069 AND exposure_start_date >= CURRENT_DATE - INTERVAL '1 day' AND drug_concept_id IS NOT NULL ORDER BY exposure_start_datetime DESC LIMIT 1) AS last_prescription) LIMIT 1;",
  --   "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  -- },
  -- {
  --   "question_name": "What was the name of the drug that patient 4199078057453045236 was second to last prescribed via route <ROUTE>Nasal</ROUTE> until last month?",
  --   "question_concept": "What was the name of the drug that patient 4199078057453045236 was second to last prescribed via route <ROUTE>4262914</ROUTE> until last month?",
  --   "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 4199078057453045236 AND route_concept_id = 4262914 AND exposure_start_date < DATE_TRUNC('month', CURRENT_DATE) AND drug_concept_id IS NOT NULL ORDER BY exposure_start_datetime DESC OFFSET 1 LIMIT 1) AS second_last) LIMIT 1;",
  --   "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  -- },
  -- {
  --   "question_name": "What was the name of the drug that patient 6425552959618862336 was first prescribed via route <ROUTE>Ocular</ROUTE> this month?",
  --   "question_concept": "What was the name of the drug that patient 6425552959618862336 was first prescribed via route <ROUTE>40549429</ROUTE> this month?",
  --   "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 6425552959618862336 AND route_concept_id = 40549429 AND exposure_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND drug_concept_id IS NOT NULL ORDER BY exposure_start_datetime ASC LIMIT 1) AS first_prescription) LIMIT 1;",
  --   "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  -- },
  -- {
  --   "question_name": "What was the name of the drug that patient 6623547836435530117 was at 2127-01-19 13:00:00 prescribed via route <ROUTE>Intravenous</ROUTE> on the current hospital visit?",
  --   "question_concept": "What was the name of the drug that patient 6623547836435530117 was at 2127-01-19 13:00:00 prescribed via route <ROUTE>4171047</ROUTE> on the current hospital visit?",
  --   "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 6623547836435530117 AND exposure_start_datetime = TIMESTAMP '2127-01-19 13:00:00' AND route_concept_id = 4171047 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6623547836435530117 AND visit_start_date <= DATE '2127-01-19' AND visit_end_date >= DATE '2127-01-19' ORDER BY visit_start_date DESC LIMIT 1) AND drug_concept_id IS NOT NULL LIMIT 1) LIMIT 1;",
  --   "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  -- },
  {
    "question_name": "What was the name of the specimen that patient 6819106907993465128 was first tested on the first hospital visit?",
	  "question_concept": "What was the name of the specimen that patient 6819106907993465128 was first tested on the first hospital visit?",
	  "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  -- {  
  --   "question_name": "What was the name of the specimen that patient 4795391738335884256 was first tested on February/13/this year?",
	--   "question_concept": "What was the name of the specimen that patient 4795391738335884256 was first tested on February/13/this year?",
	--   "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 4795391738335884256 AND specimen_date = DATE_TRUNC('year', CURRENT_DATE) + INTERVAL '1 month' * 1 + INTERVAL '12 days' AND specimen_concept_id IS NOT NULL ORDER BY specimen_datetime ASC NULLS LAST, specimen_date ASC LIMIT 1) AS first_specimen) LIMIT 1;",
  --   "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  -- },
  -- {  
  --   "question_name": "What was the name of the specimen that patient 5968818447823462715 was second tested until last month?",
	--   "question_concept": "What was the name of the specimen that patient 5968818447823462715 was second tested until last month?",
	--   "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 5968818447823462715 AND specimen_date < DATE_TRUNC('month', CURRENT_DATE) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date ASC, specimen_datetime ASC NULLS LAST OFFSET 1 LIMIT 1) AS second_specimen) LIMIT 1;",
  --   "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  -- },
  -- {  
  --   "question_name": "What was the name of the specimen that patient 4766486693575350599 was first tested today?",
	--   "question_concept": "What was the name of the specimen that patient 4766486693575350599 was first tested today?",
	--   "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 4766486693575350599 AND specimen_date = CURRENT_DATE AND specimen_concept_id IS NOT NULL ORDER BY specimen_datetime ASC NULLS LAST, specimen_date ASC LIMIT 1) AS first_specimen) LIMIT 1;",
  --   "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  -- },
  -- {  
  --   "question_name": "What was the name of the specimen that patient 6592787936548515380 was second to last tested last year?",
	--   "question_concept": "What was the name of the specimen that patient 6592787936548515380 was second to last tested last year?",
	--   "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6592787936548515380 AND specimen_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND specimen_date < DATE_TRUNC('year', CURRENT_DATE) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date DESC, specimen_datetime DESC NULLS LAST OFFSET 1 LIMIT 1) AS second_to_last_specimen) LIMIT 1;",
  --   "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  -- },
  {  
    "question_name": "What are the top 5 frequent diagnoses on August/23/2123?",
	  "question_concept": "What are the top 5 frequent diagnoses on August/23/2123?",
	  "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  -- {  
  --   "question_name": "What are the top 3 frequent diagnoses last year?",
	--   "question_concept": "What are the top 3 frequent diagnoses last year?",
	--   "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND condition_start_date < DATE_TRUNC('year', CURRENT_DATE) AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 3) AS top_diagnoses) LIMIT 3;",
  --   "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  -- },
  -- {  
  --   "question_name": "What are the top 5 frequent diagnoses on the first hospital visit?",
	--   "question_concept": "What are the top 5 frequent diagnoses on the first hospital visit?",
	--   "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = condition_occurrence.person_id ORDER BY visit_start_date ASC LIMIT 1) AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses_first_visit) LIMIT 5;",
  --   "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  -- },
  -- {  
  --   "question_name": "What are the top 4 frequent diagnoses since last month?",
	--   "question_concept": "What are the top 4 frequent diagnoses since last month?",
	--   "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date >= (DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 month') AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 4) AS top_diagnoses_last_month) LIMIT 4;",
  --   "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  -- },
  -- {  
  --   "question_name": "What are the top 4 frequent diagnoses in 2178?",
	--   "question_concept": "What are the top 4 frequent diagnoses in 2178?",
	--   "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date >= DATE '2178-01-01' AND condition_start_date < DATE '2179-01-01' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 4) AS top_diagnoses_2178) LIMIT 4;",
  --   "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  -- },
  {  
    "question_name": "What was the second measured weight of patient 1922226694437355804 on July/16/last year?",
	  "question_concept": "What was the second measured weight of patient 1922226694437355804 on July/16/last year?",
	  "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?" 
  },
  -- {  
  --   "question_name": "What was the first measured weight of patient 5137371837600014318 since yesterday?",
	--   "question_concept": "What was the first measured weight of patient 5137371837600014318 since yesterday?",
	--   "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 5137371837600014318 AND measurement_concept_id = 3025315 AND measurement_date >= CURRENT_DATE - INTERVAL '1 day' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC LIMIT 1) AS first_weight LIMIT 1;",
  --   "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  -- },
  -- {  
  --   "question_name": "What was the second to last measured weight of patient 377874305776176554 on the first hospital visit?",
	--   "question_concept": "What was the second to last measured weight of patient 377874305776176554 on the first hospital visit?",
	--   "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 377874305776176554 AND measurement_concept_id = 3025315 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 377874305776176554 ORDER BY visit_start_date ASC LIMIT 1) AND value_as_number IS NOT NULL ORDER BY measurement_datetime DESC NULLS LAST, measurement_id DESC OFFSET 1 LIMIT 1) AS second_to_last_weight LIMIT 1;",
  --   "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  -- },
  -- {  
  --   "question_name": "What was the last measured weight of patient 4140836990585633885 since last year?",
	--   "question_concept": "What was the last measured weight of patient 4140836990585633885 since last year?",
	--   "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 4140836990585633885 AND measurement_concept_id = 3025315 AND measurement_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND value_as_number IS NOT NULL ORDER BY measurement_datetime DESC NULLS LAST, measurement_id DESC LIMIT 1) AS last_weight LIMIT 1;",
  --   "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  -- },
  -- {  
  --   "question_name": "What was the last measured weight of patient 6760981801117359828 until last month?",
	--   "question_concept": "What was the last measured weight of patient 6760981801117359828 until last month?",
	--   "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 6760981801117359828 AND measurement_concept_id = 3025315 AND measurement_date < DATE_TRUNC('month', CURRENT_DATE) AND value_as_number IS NOT NULL ORDER BY measurement_datetime DESC NULLS LAST, measurement_id DESC LIMIT 1) AS last_weight LIMIT 1;",
  --   "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  -- },
  {  
    "question_name": "Count the number of patients who were dead after having been diagnosed with <CONDITION>Opioid dependence</CONDITION> within the same day since 7 month ago.",
	  "question_concept": "Count the number of patients who were dead after having been diagnosed with <CONDITION>438120</CONDITION> within the same day since 7 month ago.",
	  "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  -- {  
  --   "question_name": "Count the number of patients who were dead after having been diagnosed with <CONDITION>Pancytopenia</CONDITION> within the same hospital visit until 2198.",
	--   "question_concept": "Count the number of patients who were dead after having been diagnosed with <CONDITION>432881</CONDITION> within the same hospital visit until 2198.",
	--   "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 432881 AND c.condition_start_date < DATE '2199-01-01' AND c.visit_occurrence_id IS NOT NULL AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date BETWEEN (SELECT v.visit_start_date FROM visit_occurrence v WHERE v.visit_occurrence_id = c.visit_occurrence_id LIMIT 1) AND (SELECT v.visit_end_date FROM visit_occurrence v WHERE v.visit_occurrence_id = c.visit_occurrence_id LIMIT 1))) AS patients_dead_same_visit;",
  --   "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  -- },
  -- {  
  --   "question_name": "Count the number of patients who were dead after having been diagnosed with <CONDITION>Alzheimer's disease</CONDITION> within the same ICU visit yesterday.",
	--   "question_concept": "Count the number of patients who were dead after having been diagnosed with <CONDITION>378419</CONDITION> within the same ICU visit yesterday.",
	--   "sql": "SELECT COUNT(DISTINCT person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 378419 AND c.visit_detail_id IN (SELECT v.visit_detail_id FROM visit_detail v WHERE v.person_id = c.person_id AND v.visit_detail_concept_id = 32037 AND v.visit_detail_start_date = CURRENT_DATE - INTERVAL '1 day') AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date BETWEEN (SELECT v.visit_detail_start_date FROM visit_detail v WHERE v.visit_detail_id = c.visit_detail_id LIMIT 1) AND (SELECT v.visit_detail_end_date FROM visit_detail v WHERE v.visit_detail_id = c.visit_detail_id LIMIT 1))) AS patients_dead_same_icu_visit;",
  --   "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  -- },
  -- {  
  --   "question_name": "Count the number of patients who were dead after having been diagnosed with <CONDITION>Pleural effusion</CONDITION> at the same time on the last hospital visit.",
	--   "question_concept": "Count the number of patients who were dead after having been diagnosed with <CONDITION>254061</CONDITION> at the same time on the last hospital visit.",
	--   "sql": "SELECT COUNT(DISTINCT person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 254061 AND c.visit_occurrence_id = (SELECT v.visit_occurrence_id FROM visit_occurrence v WHERE v.person_id = c.person_id ORDER BY v.visit_start_date DESC LIMIT 1) AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date > c.condition_start_date AND d.death_date BETWEEN (SELECT v.visit_start_date FROM visit_occurrence v WHERE v.visit_occurrence_id = c.visit_occurrence_id LIMIT 1) AND (SELECT v.visit_end_date FROM visit_occurrence v WHERE v.visit_occurrence_id = c.visit_occurrence_id LIMIT 1))) AS patients_dead_after_diag_same_visit;",
  --   "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  -- },
  -- {  
  --   "question_name": "Count the number of patients who were dead after having been diagnosed with <CONDITION>Vitamin B deficiency</CONDITION> within 10 year until last year.",
	--   "question_concept": "Count the number of patients who were dead after having been diagnosed with <CONDITION>437246</CONDITION> within 10 year until last year.",
	--   "sql": "SELECT COUNT(DISTINCT person_id) AS num_dead_patients FROM death WHERE person_id IN (SELECT person_id FROM condition_occurrence WHERE condition_concept_id = 437246 AND condition_start_date <= (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 day')) AND death_date <= (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 day') AND death_date >= (SELECT MIN(condition_start_date) FROM condition_occurrence co WHERE co.person_id = death.person_id AND co.condition_concept_id = 437246) AND death_date <= (SELECT MIN(condition_start_date) FROM condition_occurrence co WHERE co.person_id = death.person_id AND co.condition_concept_id = 437246) + INTERVAL '10 year';",
  --   "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  -- },
  {
    "question_name": "When was the second hospital discharge time of patient 2219414084045702174 in May/last year?",
    "question_concept": "When was the second hospital discharge time of patient 2219414084045702174 in May/last year?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  -- {
  --   "question_concept": "When was the last hospital discharge time of patient 3939649646360315115 on December/12/2200?",
  -- },
  -- {
  --   "question_concept": "When was the second to last hospital discharge time of patient 8982740782454497941 on the last ICU visit?",
  -- },
  -- {
  --   "question_concept": "When was the first hospital discharge time of patient 8201699254434800333 until last month?",
  -- },
  -- {
  --   "question_concept": "When was the second to last hospital discharge time of patient 2791853658149350871 since 7 month ago?",
  -- },
  {
    "question_name": "What are the top four frequently prescribed drugs that female patients aged 20's were prescribed within 2 day after having been diagnosed with <CONDITION>Gastroesophageal reflux disease</CONDITION> on this month/2?",
    "question_concept": "What are the top four frequently prescribed drugs that female patients aged 20's were prescribed within 2 day after having been diagnosed with <CONDITION>318800</CONDITION> on this month/2?",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  -- {
  --   "question_concept": "What are the top three frequently prescribed drugs that female patients aged 60 or above were prescribed within 2164 year after having been diagnosed with <CONDITION>372892</CONDITION> on the first ICU visit?",
  -- },
  -- {
  --   "question_concept": "What are the top five frequently prescribed drugs that female patients aged 20's were prescribed within the same year after having been diagnosed with <CONDITION>374888</CONDITION> until last month?",
  -- },
  -- {
  --   "question_concept": "What are the top three frequently prescribed drugs that male patients aged 40's were prescribed within 9 month after having been diagnosed with <CONDITION>4168694</CONDITION> on 9/20/this year?",
  -- },
  -- {
  --   "question_concept": "What are the top four frequently prescribed drugs that female patients aged 50's were prescribed at the same time after having been diagnosed with <CONDITION>4286201</CONDITION> until last year?",
  -- },
  {
    "question_name": "When was the second to last time that patient 6657709864320620215 was prescribed <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> within the same day on the first ICU visit?",
    "question_concept": "When was the second to last time that patient 6657709864320620215 was prescribed <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> within the same day on the first ICU visit?",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the first time that patient 7685403288203028352 was prescribed <DRUG>40220967</DRUG> and <DRUG>968274</DRUG> within the same icu visit on 08/15/2118?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the last time that patient 7671434461288969720 was prescribed <DRUG>1346990</DRUG> and <DRUG>1742258</DRUG> within the same year since 2178?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the last time that patient 4974108451470572214 was prescribed 968274 and 1346990 within 3 days on the current hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the second time that patient 7685403288203028352 was prescribed <DRUG>968274</DRUG> and <DRUG>1742258</DRUG> at the same time until yesterday?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Count the number of patients who received a <PROCEDURE>2786472</PROCEDURE> procedure on the current hospital visit.",
    "question_concept": "Count the number of patients who received a <PROCEDURE>2786472</PROCEDURE> procedure on the current hospital visit.",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who received a <PROCEDURE>4231419</PROCEDURE> procedure on February/29/2210.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who received a <PROCEDURE>2514402</PROCEDURE> procedure since 2176.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who received a <PROCEDURE>42689574</PROCEDURE> procedure today.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who received a <PROCEDURE>4231419</PROCEDURE> procedure on the first ICU visit.",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Count the number of patients who were diagnosed with <CONDITION>Nicotine dependence</CONDITION> within 3 months after having been diagnosed with <CONDITION>Postoperative infection</CONDITION> since last year.",
    "question_concept": "Count the number of patients who were diagnosed with <CONDITION>4209423</CONDITION> within 3 months after having been diagnosed with <CONDITION>437474</CONDITION> since last year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who were diagnosed with <CONDITION>42873170</CONDITION> within the same hospital visit after having been diagnosed with <CONDITION>80180</CONDITION> on the last hospital visit.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who were diagnosed with <CONDITION>4064614</CONDITION> within 3 days after having been diagnosed with <CONDITION>4174262</CONDITION> since last year.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who were diagnosed with <CONDITION>432867</CONDITION> within 6 months after having been diagnosed with <CONDITION>4064452</CONDITION> until last month.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who were diagnosed with <CONDITION>435875</CONDITION> within the same month after having been diagnosed with <CONDITION>435783</CONDITION> on the current ICU visit.",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "When was the second time that patient 6082951626122164742 was diagnosed with <CONDITION>40481043</CONDITION> until last year?",
    "question_concept": "When was the second time that patient 6082951626122164742 was diagnosed with <CONDITION>40481043</CONDITION> until last year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the second to last time that patient 7470331823726232200 was diagnosed with <CONDITION>199074</CONDITION> on June/01/2117?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the second time that patient 6895872824278848802 was diagnosed with <CONDITION>4112839</CONDITION> since September/2196?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the second time that patient 432743781607034732 was diagnosed with <CONDITION>434004</CONDITION> in January/this year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the second to last time that patient 2124354350562797103 was diagnosed with <CONDITION>44782690</CONDITION> until October/23/2166?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What is the age of patient 7333484583531995140 until last month?",
    "question_concept": "What is the age of patient 7333484583531995140 until last month?",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the age of patient 1649230229917884655 until March/31/2153?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "what is the age of patient 3819405761458244774 since 2172?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "what is the age of patient 5166080555831731151 until 9 month ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "what is the age of patient 7115133231088297164 last month?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "How many days have passed since the second time patient 4500356454715756250 stayed in careunit <CAREUNIT>Psychiatry department</CAREUNIT> on the current hospital visit?",
    "question_concept": "How many days have passed since the second time patient 4500356454715756250 stayed in careunit <CAREUNIT>4150077</CAREUNIT> on the current hospital visit?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "How many days have passed since the first time patient 8453402496910086041 stayed in careunit <CAREUNIT>262</CAREUNIT> on the current hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "How many hours have passed since the second to last time patient 6568316665764866128 stayed in careunit <CAREUNIT>4148511</CAREUNIT> on the current hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "How many hours have passed since the last time patient 1317572821476220685 stayed in careunit <CAREUNIT>4150070</CAREUNIT> on the current hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "How many days have passed since the last time patient 8942734957916414083 stayed in careunit <CAREUNIT>8870</CAREUNIT> on the current hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What are the top three frequent procedures of patients aged 50's on the first hospital visit?",
    "question_concept": "What are the top three frequent procedures of patients aged 50's on the first hospital visit?",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top five frequent procedures of patients aged 20's last year",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top four frequent procedures of patients aged 60 or above in July/2175?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top five frequent procedures of patients aged 30's since last month?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top three frequent procedures of patients aged 40's on 8/4/2122?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What was the name of the measurement that patient 2185246955166355889 at 2186-3-19 7:12:33 had on the first hospital visit?",
    "question_concept": "What was the name of the measurement that patient 2185246955166355889 at 2186-3-19 7:12:33 had on the first hospital visit?",
    "sql": "SELECT c.concept_name FROM measurement m, concept c WHERE m.person_id = 2185246955166355889 AND m.measurement_datetime = TIMESTAMP '2186-03-19 07:12:33' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 2185246955166355889 ORDER BY vo.visit_start_datetime LIMIT 1) AND m.measurement_concept_id = c.concept_id;",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the name of the measurement that patient 17207036863060518 second had today?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the name of the measurement that patient 4340269910439957692 second had on this month/02?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the name of the measurement that patient 4100280192930391855 second to last had yesterday?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the name of the measurement that patient 1082045772778115627 first had in 2211?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Count the number of current patients.",
    "question_concept": "Count the number of current patients.",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "Has there been any organism found in the first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> microbiology test of patient 7776408132511994203 this month?",
    "question_concept": "Has there been any organism found in the first <MEASUREMENT>3007813</MEASUREMENT> microbiology test of patient 7776408132511994203 this month?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement me WHERE me.measurement_id = (SELECT measurement_id FROM (SELECT m.measurement_id, m.measurement_date FROM measurement m WHERE m.person_id = 7776408132511994203 AND m.measurement_concept_id = 3007813 AND date_trunc('month', m.measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY m.measurement_date ASC LIMIT 1) AS first_micro) AND me.value_as_concept_id IS NOT NULL) AS organism_found;",
    "template": "has_verb there been any organism found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has there been any organism found in the second <MEASUREMENT>4035113</MEASUREMENT> microbiology test of patient 8481276938488039928 in October/this year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has there been any organism found in the first <MEASUREMENT>4189544</MEASUREMENT> microbiology test of patient 7527036573013626918 on the last hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has there been any organism found in the first <MEASUREMENT>4036044</MEASUREMENT> microbiology test of patient 7070557456910390941 since 1/15/2199?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has there been any organism found in the last <MEASUREMENT>4045656</MEASUREMENT> microbiology test of patient 9061113530049984955 on last month/04?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Is the <MEASUREMENT>Body temperature</MEASUREMENT> of patient 6333223435366125024 at 2126-10-14 07:03:17 measured on the first ICU visit > than the first value measured this year?",
    "question_concept": "Is the <MEASUREMENT>3020891</MEASUREMENT> of patient 6333223435366125024 at 2126-10-14 07:03:17 measured on the first ICU visit > than the first value measured this year?",
    "sql": "SELECT val_icu > val_year AS is_icu_value_greater, val_icu AS icu_value, val_year AS first_value_this_year FROM (SELECT (SELECT m1.value_as_number FROM measurement m1 WHERE m1.person_id = 6333223435366125024 AND m1.measurement_concept_id = 3020891 AND m1.measurement_datetime = TIMESTAMP '2126-10-14 07:03:17' AND m1.visit_occurrence_id = (SELECT vo1.visit_occurrence_id FROM visit_occurrence vo1 WHERE vo1.person_id = 6333223435366125024 AND vo1.visit_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%') ORDER BY vo1.visit_start_datetime LIMIT 1)) AS val_icu, (SELECT m2.value_as_number FROM measurement m2 WHERE m2.person_id = 6333223435366125024 AND m2.measurement_concept_id = 3020891 AND DATE_PART('year', m2.measurement_datetime) = DATE_PART('year', CURRENT_DATE) ORDER BY m2.measurement_datetime LIMIT 1) AS val_year) AS comparison;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Is the <MEASUREMENT>3024171</MEASUREMENT> of patient 1462077129225667345 second to last measured on the current ICU visit < than the second value measured on the first ICU visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Is the <MEASUREMENT>3036277</MEASUREMENT> of patient 6009130791199453547 last measured on the current ICU visit < than the at 2138-01-24 10:33:25 value measured this year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Is the <MEASUREMENT>3025315</MEASUREMENT> of patient 4378476518267020730 second measured since 03/01/2199) > than the second to last value measured this month?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Is the <MEASUREMENT>3027018</MEASUREMENT> of patient 1503762333444408214 at 2139-02-22 11:40:54 measured on the current ICU visit > than the second to last value measured since 06/24/2138)?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Has patient 1027943263163534509 received a <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test since last year?",
    "question_concept": "Has patient 1027943263163534509 received a <MEASUREMENT>3000620</MEASUREMENT> lab test since last year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has patient 3603983996026431134 received a <MEASUREMENT>3034860</MEASUREMENT> lab test since 4 years ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has patient 3532507109348233796 received a <MEASUREMENT>3005897</MEASUREMENT> lab test last year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has patient 4915479270576793750 received a <MEASUREMENT>3009306</MEASUREMENT> lab test in February/this year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has patient 2471461864771998229 received a <MEASUREMENT>3025411</MEASUREMENT> lab test on the last hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What was the name of the lab test that patient 1359228978448708169 at 2141-03-05 18:48:41 received on the current hospital visit?",
    "question_concept": "What was the name of the lab test that patient 1359228978448708169 at 2141-03-05 18:48:41 received on the current hospital visit?",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the name of the lab test that patient 4800606615012289716 second to last received on the current hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the name of the lab test that patient 4111616372059744804 2202-08-16 14:03:24 received until 2 years ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the name of the lab test that patient 8167221240375731990 2134-04-03 23:52:43 received today?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the name of the lab test that patient 4509290774399130632 2184-04-14 02:15:16 received since 1 year ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "When was the last time that patient 4398308024184711278 was prescribed a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route last year?",
    "question_concept": "When was the last time that patient 4398308024184711278 was prescribed a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route last year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the second to last time that patient 1033627856578910520 was prescribed a medication via <DRUG_ROUTE>40549429</DRUG_ROUTE> route until 2 months ago)?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the first time that patient 4825776363303599702 was prescribed a medication via <DRUG_ROUTE>4171047</DRUG_ROUTE> route on the first hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the first time that patient 4373551354604950327 was prescribed a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route since 10/2121?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the second time that patient 3960361806701170320 was prescribed a medication via <DRUG_ROUTE>40549429</DRUG_ROUTE> route since last year?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What are the top three frequent intake events since 3 months ago?",
    "question_concept": "What are the top three frequent intake events since 3 months ago?",
    "sql": "SELECT de.drug_concept_id, (SELECT concept_name FROM concept c WHERE c.concept_id = de.drug_concept_id) AS drug_name, COUNT(*) AS intake_count FROM drug_exposure de WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' AND de.drug_concept_id != 0 GROUP BY de.drug_concept_id ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top two frequent intake events in 2200?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top two frequent intake events on the current ICU visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top four frequent intake events in December/last year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top two frequent intake events on last month/14?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Has the <MEASUREMENT>Body weight</MEASUREMENT> of patient 2277671307213519503 been ever less than 154 since 5 day ago?",
    "question_concept": "Has the <MEASUREMENT>3025315</MEASUREMENT> of patient 2277671307213519503 been ever less than 154 since 5 day ago?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 2277671307213519503 AND m.measurement_concept_id = 3025315 AND m.value_as_number < 154 AND m.measurement_datetime >= CURRENT_DATE - INTERVAL '5 days');",
    "template": "has_verb the {vital_name} of patient {patient_id} been ever [comparison] than {vital_value} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has the <MEASUREMENT>3020891</MEASUREMENT> of patient 5689611512019210058 been ever greater than 99 since 1 year ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has the <MEASUREMENT>3024171</MEASUREMENT> of patient 828378916427067384 been ever less than 30 today?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has the <MEASUREMENT>3036277</MEASUREMENT> of patient 4117630355923185298 been ever less than 66 in 2134?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has the <MEASUREMENT>3027018</MEASUREMENT> of patient 7530936356340184350 been ever greater than 150 since yesterday?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What are the top five frequent specimens that patients were tested within the same month after having received a <PROCEDURE>Computed tomography</PROCEDURE> procedure on the current hospital visit?",
    "question_concept": "What are the top five frequent specimens that patients were tested within the same month after having received a <PROCEDURE>4300757</PROCEDURE> procedure on the current hospital visit?",
    "sql": "SELECT specimen_name, COUNT(*) AS frequency FROM (SELECT (SELECT concept_name FROM concept c WHERE c.concept_id = s.specimen_concept_id) AS specimen_name FROM specimen s WHERE s.person_id IN (SELECT vo.person_id FROM visit_occurrence vo WHERE vo.visit_end_date IS NULL AND vo.discharged_to_concept_id IS NULL AND vo.visit_start_date = (SELECT MAX(visit_start_date) FROM visit_occurrence vo_inner WHERE vo_inner.person_id = vo.person_id AND vo_inner.visit_end_date IS NULL AND vo_inner.discharged_to_concept_id IS NULL) AND EXISTS (SELECT 1 FROM procedure_occurrence po WHERE po.visit_occurrence_id = vo.visit_occurrence_id AND po.procedure_concept_id = 4300757 AND s.specimen_date BETWEEN po.procedure_date AND (po.procedure_date + INTERVAL '1 month')))) AS specimen_names GROUP BY specimen_name ORDER BY frequency DESC LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent specimens that patients were tested [time_filter_within] after having received a {procedure_name} procedure [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What were the top four frequent specimens that patients were tested within the same icu visit after having received a <PROCEDURE>2789606</PROCEDURE> procedure until 4 months ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What have been the top five frequent specimens that patients were tested within the same day after having received a <PROCEDURE>4231419</PROCEDURE> procedure on the last ICU visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What were the top five frequent specimens that patients were tested within the same hospital visit after having received a <PROCEDURE>4052413</PROCEDURE> procedure in August/2187?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What have been the top four frequent specimens that patients were tested within the same year after having received a <PROCEDURE>4021323</PROCEDURE> procedure last month?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Has patient 6264555136921102118 been prescribed <DRUG>hydromorphone hydrochloride 2 MG Oral Tablet</DRUG> on the first ICU visit?",
    "question_concept": "Has patient 6264555136921102118 been prescribed <DRUG>40173098</DRUG> on the first ICU visit?",
    "sql": "SELECT EXISTS (SELECT 1 FROM drug_exposure de WHERE de.person_id = 6264555136921102118 AND de.drug_concept_id = 40173098 AND de.visit_occurrence_id = (SELECT vd.visit_occurrence_id FROM visit_detail vd WHERE vd.person_id = 6264555136921102118 AND vd.visit_detail_concept_id IN (SELECT c.concept_id FROM concept c WHERE c.concept_name ILIKE '%intensive care%') ORDER BY vd.visit_detail_start_date LIMIT 1));",
    "template": "has_verb patient {patient_id} been prescribed {drug_name} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has patient 6638713370964516319 been prescribed <DRUG>46275622</DRUG> until yesterday?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has patient 4141432525566108616 been prescribed <DRUG>40227019</DRUG> on 07/09/this year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has patient 4457778540176700757 been prescribed <DRUG>798875</DRUG> since last year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has patient 6524248001810550734 been prescribed <DRUG>36249322</DRUG> on the current hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "How many hours have passed since patient 1832753164987106308 was admitted to the icu currently?",
    "question_concept": "How many hours have passed since patient 1832753164987106308 was admitted to the icu currently?",
    "sql": "SELECT EXTRACT(EPOCH FROM (CURRENT_TIMESTAMP - vd.visit_detail_start_datetime)) / 3600 AS hours_since_icu_admission FROM visit_detail vd WHERE vd.person_id = 1832753164987106308 AND vd.visit_detail_concept_id IN (SELECT c.concept_id FROM concept c WHERE c.concept_name ILIKE '%intensive care%') ORDER BY vd.visit_detail_start_datetime DESC LIMIT 1;",
    "template": "how many [unit_count] have passed since patient {patient_id} was admitted to the icu currently?"
  },
  -- {
  --   "question_name": "How many days have passed since patient 1012575855340890594 was admitted to the icu currently?",
  --   "question_concept": "How many days have passed since patient 1012575855340890594 was admitted to the icu currently?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "How many days have passed since patient 3493108529686372660 was admitted to the hospital currently?",
    "question_concept": "How many days have passed since patient 3493108529686372660 was admitted to the hospital currently?",
    "sql": "SELECT CURRENT_DATE - (SELECT v.visit_start_date FROM visit_occurrence v WHERE v.person_id = 3493108529686372660 ORDER BY v.visit_start_date DESC LIMIT 1) AS days_since_admission;",
    "template": "how many [unit_count] have passed since patient {patient_id} was admitted to the hospital currently?"
  },
  -- {
  --   "question_name": "How many hours have passed since patient 1164906972697935785 was admitted to the hospital currently?",
  --   "question_concept": "How many hours have passed since patient 1164906972697935785 was admitted to the hospital currently?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "What were the top three frequent lab tests that patients had within the same icu visit after having been diagnosed with <CONDITION>Chronic congestive heart failure</CONDITION> until 2203?",
  --   "question_concept": "What were the top three frequent lab tests that patients had within the same icu visit after having been diagnosed with <CONDITION>4229440</CONDITION> until 2203?",
  --   "sql": "",
  --   "template": "what are_verb the top [n_rank] frequent lab tests that patients had [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What were the top three frequent lab tests that patients had within 3 years after having been diagnosed with <CONDITION>44782429</CONDITION> on the last hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "what were the top four frequent lab tests that patients had within the same hospital visit after having been diagnosed with <CONDITION>75909</CONDITION> yesterday?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What were the top two frequent lab tests that patients had within the same year after having been diagnosed with <CONDITION>201826</CONDITION> until yesterday?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "what were the top three frequent lab tests that patients had within 2 years after having been diagnosed with <CONDITION>4206148</CONDITION> last month?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What is the maximum monthly number of patient records diagnosed with <CONDITION>316135</CONDITION> on the first ICU visit?",
    "question_concept": "What is the maximum monthly number of patient records diagnosed with <CONDITION>316135</CONDITION> on the first ICU visit?",
    "sql": "WITH intensive_care_concepts AS (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%'), intensive_care_visits AS (SELECT vd.person_id, vd.visit_detail_id, vd.visit_detail_start_datetime, vd.visit_detail_end_datetime, DATE_TRUNC('month', vd.visit_detail_start_datetime) AS visit_month, ROW_NUMBER() OVER (PARTITION BY vd.person_id ORDER BY vd.visit_detail_start_datetime) AS rn FROM visit_detail vd WHERE vd.visit_detail_concept_id IN (SELECT concept_id FROM intensive_care_concepts)), first_icu_visits_with_condition AS (SELECT icv.person_id, icv.visit_month FROM intensive_care_visits icv JOIN condition_occurrence co ON co.person_id = icv.person_id AND co.condition_concept_id = 316135 AND co.condition_start_datetime BETWEEN icv.visit_detail_start_datetime AND icv.visit_detail_end_datetime WHERE icv.rn = 1) SELECT MAX(monthly_count) AS max_monthly_patients FROM (SELECT visit_month, COUNT(DISTINCT person_id) AS monthly_count FROM first_icu_visits_with_condition GROUP BY visit_month) AS monthly_counts;",
    "template": "what is the [agg_function] [unit_average] number of patient records diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the average monthly number of patient records diagnosed with <CONDITION>432863</CONDITION> today?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the maximum daily number of patient records diagnosed with <CONDITION>22340</CONDITION> until 2 months ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the minimum daily number of patient records diagnosed with <CONDITION>132797</CONDITION> yesterday?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the minimum yearly number of patient records diagnosed with <CONDITION>319835</CONDITION> on 12/01/last year?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What was the name of the drug that patient 4252323938379886649 was prescribed within 3 months after having received a <PROCEDURE>Implantation of heart assist system</PROCEDURE> procedure since September/2210?",
    "question_concept": "What was the name of the drug that patient 4252323938379886649 was prescribed within 3 months after having received a <PROCEDURE>4275142</PROCEDURE> procedure since September/2210?",
    "sql": "SELECT c.concept_name FROM concept c WHERE c.concept_id IN (SELECT de.drug_concept_id FROM drug_exposure de WHERE de.person_id = 4252323938379886649 AND EXISTS (SELECT 1 FROM procedure_occurrence po WHERE po.person_id = 4252323938379886649 AND po.procedure_concept_id = 4275142 AND po.procedure_date >= DATE '2210-09-01' AND de.drug_exposure_start_date BETWEEN po.procedure_date AND po.procedure_date + INTERVAL '3 months'));",
    "template": "what was the name of the drug that patient {patient_id} was prescribed [time_filter_within] after having received a {procedure_name} procedure [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the name of the drug that patient 1114544004311247931 was prescribed within 10 years after having received a <PROCEDURE>43018323</PROCEDURE> procedure on the first ICU visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "what was the name of the drug that patient 1875807658311834419 was prescribed within the same month after having received a <PROCEDURE>2779574</PROCEDURE> procedure in 09/2118?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the name of the drug that patient 5319234761860809575 was prescribed within 5 days after having received a <PROCEDURE>2779573</PROCEDURE> procedure this month?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "what was the name of the drug that patient 5489036706175460226 was prescribed within the same year after having received a <PROCEDURE>2726186</PROCEDURE> procedure today?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "How many hours have passed since the second to last time patient 1233743921983070633 had a <DRUG>piperacillin 4000 MG / tazobactam 500 MG Injection [Zosyn]</DRUG> intake on the current icu visit?",
    "question_concept": "How many hours have passed since the second to last time patient 1233743921983070633 had a <DRUG>46275446</DRUG> intake on the current icu visit?",
    "sql": "SELECT EXTRACT(EPOCH FROM (CURRENT_TIMESTAMP - (SELECT drug_exposure_start_datetime FROM (SELECT de.drug_exposure_start_datetime FROM drug_exposure de WHERE de.person_id = 1233743921983070633 AND de.drug_concept_id = 46275446 AND de.visit_detail_id = (SELECT vd.visit_detail_id FROM visit_detail vd WHERE vd.person_id = 1233743921983070633 AND vd.visit_detail_concept_id IN (SELECT c.concept_id FROM concept c WHERE c.concept_name ILIKE '%intensive care%' AND c.domain_id = 'Visit') ORDER BY vd.visit_detail_start_datetime DESC LIMIT 1) ORDER BY de.drug_exposure_start_datetime DESC OFFSET 1 LIMIT 1) AS second_last_intake))) / 3600 AS hours_since_second_last_intake;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} had a {intake_name} intake on the current icu visit?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "How many hours have passed since the last time patient 2710186043174014737 had a <DRUG>1332419</DRUG> intake on the current icu visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "How many hours have passed since the first time patient 8623830817101437884 had a <DRUG>46287338</DRUG> intake on the current icu visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "How many hours have passed since the second time patient 4733547322242029613 had a <DRUG>35605728</DRUG> intake on the current icu visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "How many days have passed since the second to last time patient 7134830336970561513 had a <DRUG>19011816</DRUG> intake on the current icu visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Has patient 873643486446280759 been prescribed any medication on the first hospital visit?",
    "question_concept": "Has patient 873643486446280759 been prescribed any medication on the first hospital visit?",
    "sql": "SELECT EXISTS (SELECT 1 FROM drug_exposure de WHERE de.person_id = 873643486446280759 AND de.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 873643486446280759 ORDER BY vo.visit_start_date ASC LIMIT 1)) AS prescribed_on_first_visit;",
    "template": "has_verb patient {patient_id} been prescribed any medication [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has patient 9201084095159041569 been prescribed any medication in April/this year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has patient 6810694722280007909 been prescribed any medication yesterday?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has patient 4271368401648689040 been prescribed any medication since last year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Has patient 2818957381148024412 been prescribed any medication until 20 days ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Count the number of icu visits of patient 6114769255486634735 this year.",
    "question_concept": "Count the number of icu visits of patient 6114769255486634735 this year.",
    "sql": "SELECT COUNT(*) AS icu_visit_count FROM visit_detail vd WHERE vd.person_id = 6114769255486634735 AND EXTRACT(YEAR FROM vd.visit_detail_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) AND vd.visit_detail_concept_id IN (SELECT c.concept_id FROM concept c WHERE c.concept_name ILIKE '%intensive care%');",
    "template": "count the number of icu visits of patient {patient_id} [time_filter_global1]."
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of icu visits of patient 6443943319218691655 last month.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of icu visits of patient 3416111702466501224 since 07/13/2111.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of icu visits of patient 7388825402506549238 until last year.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of icu visits of patient 1004333499598895022 on the last hospital visit.",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What was the total amount of dose of <DRUG>torsemide 20 MG Oral Tablet</DRUG> that patient 3552656871579492299 were prescribed since yesterday?",
    "question_concept": "What was the total amount of dose of <DRUG>942384</DRUG> that patient 3552656871579492299 were prescribed since yesterday?",
    "sql": "SELECT SUM(de.quantity) AS total_quantity, de.dose_unit_source_value FROM drug_exposure de WHERE de.person_id = 3552656871579492299 AND de.drug_concept_id = 942384 AND de.drug_exposure_start_date >= current_date - INTERVAL '1 day' GROUP BY de.dose_unit_source_value;",
    "template": "what was the total amount of dose of {drug_name} that patient {patient_id} were prescribed [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the total amount of dose of <DRUG>19011816</DRUG> that patient 4254058576999180840 were prescribed in 2203?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the total amount of dose of <DRUG>43011884</DRUG> that patient 9117287109489681631 were prescribed on the current hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the total amount of dose of <DRUG>19019003</DRUG> that patient 6995909694201839715 were prescribed until last month?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the total amount of dose of <DRUG>1594705</DRUG> that patient 6936241177682414875 were prescribed on May/13/2201?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What was the organism name found in the second to last <MEASUREMENT>Anaerobic microbial culture</MEASUREMENT> microbiology test of patient <PERSON_ID>517101686241972750</PERSON_iD> this month?",
    "question_concept": "What was the organism name found in the second to last <MEASUREMENT>4036044</MEASUREMENT> microbiology test of patient <PERSON_ID>517101686241972750</PERSON_iD> this month?",
    "sql": "SELECT me.value_as_concept_id, (SELECT c.concept_name FROM concept c WHERE c.concept_id = me.value_as_concept_id) AS organism_name FROM measurement me WHERE me.person_id = 517101686241972750 AND me.measurement_concept_id = 4036044 AND date_trunc('month', me.measurement_date) = date_trunc('month', CURRENT_DATE) AND me.measurement_datetime = (SELECT measurement_datetime FROM (SELECT measurement_datetime FROM measurement WHERE person_id = 517101686241972750 AND measurement_concept_id = 4036044 AND date_trunc('month', measurement_date) = date_trunc('month', CURRENT_DATE) ORDER BY measurement_datetime DESC OFFSET 1 LIMIT 1) sub);",
    "template": "what was the organism name found in the [time_filter_exact1] {culture_name} microbiology test of patient {patient_id} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the organism name found in the second <MEASUREMENT>3007813</MEASUREMENT> microbiology test of patient 458996160754225463 in July/this year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the organism name found in the second <MEASUREMENT>4304958</MEASUREMENT> microbiology test of patient 5193955207120423251 until 2190?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the organism name found in the first <MEASUREMENT>4045656</MEASUREMENT> microbiology test of patient 93027068294800434 since 20 years ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the organism name found in the last <MEASUREMENT>4036044</MEASUREMENT> microbiology test of patient 6527518496303479157 until yesterday?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Count the number of current patients aged 20's",
    "question_concept": "Count the number of current patients aged 20's",
    "sql": "SELECT COUNT(*) AS num_current_patients_in_20s FROM person p WHERE DATE_PART('year', AGE(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29 AND EXISTS (SELECT 1 FROM visit_occurrence v WHERE v.person_id = p.person_id AND v.visit_end_date IS NULL);",
    "template": "count the number of current patients aged [age_group]."
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of current patients aged 30's",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of current patients aged 40's",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of current patients aged 50's",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of current patients aged 60's",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Count the number of hospital visits of patient 3024811265145791153 last year.",
    "question_concept": "Count the number of hospital visits of patient 3024811265145791153 last year.",
    "sql": "SELECT COUNT(*) AS visit_count_last_year FROM visit_occurrence vo WHERE vo.person_id = 3024811265145791153 AND DATE_PART('year', vo.visit_start_date) = DATE_PART('year', CURRENT_DATE) - 1;",
    "template": "count the number of hospital visits of patient {patient_id} [time_filter_global1]."
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of hospital visits of patient 5927534998888820766 since {month}/{year}.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of hospital visits of patient 4774127770131558868 on last 9/17.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of hospital visits of patient 8474829643781229 in 2137.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of hospital visits of patient -7017334450021652155 on the current hospital visit.",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What is the intake method of <DRUG>levetiracetam 250 MG Oral Tablet</DRUG>?",
    "question_concept": "What is the intake method of <DRUG>711588</DRUG>?",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = d.route_concept_id) AS intake_method FROM drug_exposure d WHERE d.drug_concept_id = 711588 AND d.route_concept_id IS NOT NULL LIMIT 1;",
    "template": "what is the intake method of {drug_name}?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the intake method of <DRUG>40175009</DRUG>?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the intake method of <DRUG>19082350</DRUG>?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the intake method of <DRUG>35605859</DRUG>?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the intake method of <DRUG>43613338</DRUG>?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Count the number of patients who received a <PROCEDURE>Plain X-ray</PROCEDURE> procedure two_times today.",
    "question_concept": "Count the number of patients who received a <PROCEDURE>4056681</PROCEDURE> procedure two_times today.",
    "sql": "SELECT COUNT(*) AS patient_count FROM (SELECT person_id FROM (SELECT person_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE procedure_concept_id = 4056681 AND procedure_date = CURRENT_DATE GROUP BY person_id) AS proc_counts WHERE procedure_count = 2) AS patients_with_two_procedures;",
    "template": "count the number of patients who received a {procedure_name} procedure [n_times] [time_filter_global1]."
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who received a <PROCEDURE>4275142</PROCEDURE> procedure two_times since March/2201.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who received a <PROCEDURE>2779574</PROCEDURE> procedure two_times last month.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who received a <PROCEDURE>2722443</PROCEDURE> procedure two_times on the last ICU visit.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who received a <PROCEDURE>2510860</PROCEDURE> procedure two or more times on the current hospital visit.",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What is the change in the <MEASUREMENT>3027018</MEASUREMENT> of patient 5753387128065316976 from the first value measured on the first hospital visit compared to the second value measured on the last ICU visit?",
    "question_concept": "What is the change in the <MEASUREMENT>3027018</MEASUREMENT> of patient 5753387128065316976 from the first value measured on the first hospital visit compared to the second value measured on the last ICU visit?",
    "sql": "SELECT ((SELECT m2.value_as_number FROM measurement m2 WHERE m2.person_id = 5753387128065316976 AND m2.measurement_concept_id = 3027018 AND m2.visit_detail_id = (SELECT vd2.visit_detail_id FROM visit_detail vd2 WHERE vd2.person_id = 5753387128065316976 AND vd2.visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%') ORDER BY vd2.visit_detail_start_datetime DESC LIMIT 1) ORDER BY m2.measurement_datetime ASC OFFSET 1 LIMIT 1) - (SELECT m1.value_as_number FROM measurement m1 WHERE m1.person_id = 5753387128065316976 AND m1.measurement_concept_id = 3027018 AND m1.visit_occurrence_id = (SELECT vo1.visit_occurrence_id FROM visit_occurrence vo1 WHERE vo1.person_id = 5753387128065316976 ORDER BY vo1.visit_start_datetime ASC LIMIT 1) ORDER BY m1.measurement_datetime ASC LIMIT 1)) AS value_difference;",
    "template": "what is the change in the {vital_name} of patient {patient_id} from the [time_filter_exact2] value measured [time_filter_global2] compared to the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the change in the <MEASUREMENT>3024171</MEASUREMENT> of patient 6205666018465042649 from the second to last value measured today compared to the second value measured in 2125?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the change in the <MEASUREMENT>3025315</MEASUREMENT> of patient 166050355808105179 from the second value measured until June/2205 compared to the second to last value measured last year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the change in the <MEASUREMENT>3025315</MEASUREMENT> of patient 7727094553716106665 from the first value measured this year compared to the second value measured today?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the change in the <MEASUREMENT>3027018</MEASUREMENT> of patient 4775377389251482015 from the last value measured this month compared to the first value measured on 10/24/2210?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "",
    "question_concept": "Count the number of <> procedure cases until 2022.",
    "sql": "",
    "template": "count the number of {procedure_name} procedure cases [time_filter_global1]."
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "",
    "question_concept": "",
    "sql": "",
    "template": "what are_verb the top [n_rank] frequent specimens that patients were tested [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "",
    "question_concept": "",
    "sql": "",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} was prescribed {drug_name} on the current hospital visit?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "",
    "question_concept": "",
    "sql": "",
    "template": "what was the [time_filter_exact1] hospital admission type of patient {patient_id} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "",
    "question_concept": "",
    "sql": "",
    "template": "when was the [time_filter_exact1] hospital admission time of patient {patient_id} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "",
    "question_concept": "",
    "sql": "",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} had a {output_name} output [time_filter_global1]?
"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "",
    "question_concept": "",
    "sql": "",
    "template": ""
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "",
    "question_concept": "",
    "sql": "",
    "template": ""
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "",
    "question_concept": "",
    "sql": "",
    "template": ""
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "",
  --   "sql": "",
  --   "template": ""
  -- },
]

