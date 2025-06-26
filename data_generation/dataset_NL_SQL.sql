[
  {
    "question_name": "What are the top 4 frequent prescribed drugs for patients who were also prescribed <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> at the same time on the last hospital visit?",
    "question_concept": "What are the top 4 frequent prescribed drugs for patients who were also prescribed <DRUG>19041823</DRUG> at the same time on the last hospital visit?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Which 4 drugs are most frequently co-prescribed with <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> during the last hospital visit?",
    "question_concept": "Which 4 drugs are most frequently co-prescribed with <DRUG>19041823</DRUG> during the last hospital visit?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "What are the top 4 medications commonly given alongside <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> in the most recent hospital stay?",
    "question_concept": "What are the top 4 medications commonly given alongside <DRUG>19041823</DRUG> in the most recent hospital stay?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "During the latest hospital visit, what 4 drugs were most often prescribed together with <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG>?",
    "question_concept": "During the latest hospital visit, what 4 drugs were most often prescribed together with <DRUG>19041823</DRUG>?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "List the 4 most frequent drugs co-administered with <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> in the patient's last hospital admission.",
    "question_concept": "List the 4 most frequent drugs co-administered with <DRUG>19041823</DRUG> in the patient's last hospital admission.",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "What are the four most commonly prescribed medications at the same time as <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> during a patient's last visit?",
    "question_concept": "What are the four most commonly prescribed medications at the same time as <DRUG>19041823</DRUG> during a patient's last visit?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Find the top 4 drugs prescribed with <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> during the most recent hospital encounter.",
    "question_concept": "Find the top 4 drugs prescribed with <DRUG>19041823</DRUG> during the most recent hospital encounter.",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Which four medications are most often prescribed together with <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> in the last hospital visit?",
    "question_concept": "Which four medications are most often prescribed together with <DRUG>19041823</DRUG> in the last hospital visit?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Identify the top 4 co-prescribed drugs with <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> in a patient's final hospital visit.",
    "question_concept": "Identify the top 4 co-prescribed drugs with <DRUG>19041823</DRUG> in a patient's final hospital visit.",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "What are the 4 drugs most frequently prescribed at the same time as <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> in their last admission?",
    "question_concept": "What are the 4 drugs most frequently prescribed at the same time as <DRUG>19041823</DRUG> in their last admission?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Which drugs were most often given alongside <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> during the patient's last hospital visit?",
    "question_concept": "Which drugs were most often given alongside <DRUG>19041823</DRUG> during the patient's last hospital visit?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Name the 4 most common medications prescribed concurrently with <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> during the last hospital visit.",
    "question_concept": "Name the 4 most common medications prescribed concurrently with <DRUG>19041823</DRUG> during the last hospital visit.",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "What four other drugs are most frequently prescribed when <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> is prescribed in the last hospital visit?",
    "question_concept": "What four other drugs are most frequently prescribed when <DRUG>19041823</DRUG> is prescribed in the last hospital visit?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "In the most recent hospital visit, which drugs were most commonly prescribed with <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG>?",
    "question_concept": "In the most recent hospital visit, which drugs were most commonly prescribed with <DRUG>19041823</DRUG>?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Which are the top 4 drugs used alongside <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> in patients' latest hospitalizations?",
    "question_concept": "Which are the top 4 drugs used alongside <DRUG>19041823</DRUG> in patients' latest hospitalizations?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "What four medications are typically co-prescribed with <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> at the time of the last hospital admission?",
    "question_concept": "What four medications are typically co-prescribed with <DRUG>19041823</DRUG> at the time of the last hospital admission?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Top 4 drugs prescribed concurrently with <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> during the latest hospital stay?",
    "question_concept": "Top 4 drugs prescribed concurrently with <DRUG>19041823</DRUG> during the latest hospital stay?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Which medications were prescribed most often with <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> during patients’ most recent visits?",
    "question_concept": "Which medications were prescribed most often with <DRUG>19041823</DRUG> during patients’ most recent visits?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "What are the four most frequently co-prescribed drugs during the last hospital admission involving <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG>?",
    "question_concept": "What are the four most frequently co-prescribed drugs during the last hospital admission involving <DRUG>19041823</DRUG>?",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Identify four drugs that are commonly administered with <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG> in the most recent hospital stay.",
    "question_concept": "Identify four drugs that are commonly administered with <DRUG>19041823</DRUG> in the most recent hospital stay.",
    "sql": "WITH last_visits AS ( SELECT person_id, MAX(visit_occurrence_id) AS last_visit_id FROM drug_exposure GROUP BY person_id ), target_patients_dates AS ( SELECT DISTINCT person_id, visit_occurrence_id, drug_exposure_start_date FROM drug_exposure WHERE drug_concept_id = 19041823 AND (person_id, visit_occurrence_id) IN ( SELECT person_id, last_visit_id FROM last_visits ) ), drugs_same_time AS ( SELECT drug_concept_id FROM drug_exposure WHERE (person_id, visit_occurrence_id, drug_exposure_start_date) IN ( SELECT person_id, visit_occurrence_id, drug_exposure_start_date FROM target_patients_dates ) ) SELECT drug_concept_id, COUNT(*) AS freq FROM drugs_same_time WHERE drug_concept_id != 0 GROUP BY drug_concept_id ORDER BY freq DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequent prescribed drugs for patients who were also prescribed {drug_name} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "During their last hospital visit, what are the top four drugs patients received alongside <DRUG>bisacodyl 10 MG Rectal Suppository [Bisac-Evac]</DRUG>?",
    "question_concept": "During their last hospital visit, what are the top four drugs patients received alongside <DRUG>19041823</DRUG>?",
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
  {
    "question_name": "Which diagnoses were most common among patients aged 60 and older last month?",
    "question_concept": "Which diagnoses were most common among patients aged 60 and older last month?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What were the top 3 diagnoses for patients over 60 during the previous month?",
    "question_concept": "What were the top 3 diagnoses for patients over 60 during the previous month?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Can you list the three most frequent diagnoses in patients aged 60+ last month?",
    "question_concept": "Can you list the three most frequent diagnoses in patients aged 60+ last month?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What are the leading diagnoses from last month in patients aged 60 or more?",
    "question_concept": "What are the leading diagnoses from last month in patients aged 60 or more?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What were the most reported conditions among people aged 60 and above last month?",
    "question_concept": "What were the most reported conditions among people aged 60 and above last month?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Which three diagnoses occurred most frequently in seniors (60+) last month?",
    "question_concept": "Which three diagnoses occurred most frequently in seniors (60+) last month?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Top 3 diagnoses among patients aged 60 or above in the last month?",
    "question_concept": "Top 3 diagnoses among patients aged 60 or above in the last month?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Identify the top three conditions affecting patients 60 and older last month.",
    "question_concept": "Identify the top three conditions affecting patients 60 and older last month.",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What are the three most common diagnoses for elderly patients last month?",
    "question_concept": "What are the three most common diagnoses for elderly patients last month?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Which diagnoses were recorded most often last month for those 60 years and up?",
    "question_concept": "Which diagnoses were recorded most often last month for those 60 years and up?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Name the top 3 frequent diagnoses among people aged 60+ during the last month.",
    "question_concept": "Name the top 3 frequent diagnoses among people aged 60+ during the last month.",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What conditions were diagnosed most in patients aged 60+ in the previous month?",
    "question_concept": "What conditions were diagnosed most in patients aged 60+ in the previous month?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What are the highest occurring diagnoses last month for seniors aged 60 and over?",
    "question_concept": "What are the highest occurring diagnoses last month for seniors aged 60 and over?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Which diagnoses topped the list for patients aged 60 or older last month?",
    "question_concept": "Which diagnoses topped the list for patients aged 60 or older last month?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Which three diagnoses were most frequent in the elderly (60+) population last month?",
    "question_concept": "Which three diagnoses were most frequent in the elderly (60+) population last month?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Last month, what were the top three diagnoses for patients aged 60 and up?",
    "question_concept": "Last month, what were the top three diagnoses for patients aged 60 and up?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Give the top 3 most common conditions for patients 60+ from last month.",
    "question_concept": "Give the top 3 most common conditions for patients 60+ from last month.",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What were the dominant diagnoses in patients aged 60 and older during last month?",
    "question_concept": "What were the dominant diagnoses in patients aged 60 and older during last month?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What are the most frequent diagnoses in those aged 60 or more from the last month?",
    "question_concept": "What are the most frequent diagnoses in those aged 60 or more from the last month?",
    "sql": "SELECT condition_concept_id, COUNT(*) AS diagnosis_count FROM condition_occurrence WHERE condition_start_date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month') AND condition_start_date < date_trunc('month', CURRENT_DATE) AND person_id IN (SELECT person_id FROM person WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, make_date(year_of_birth, 1, 1))) >= 60) GROUP BY condition_concept_id ORDER BY diagnosis_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent diagnoses of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "List the three most diagnosed conditions in the 60+ age group last month.",
    "question_concept": "List the three most diagnosed conditions in the 60+ age group last month.",
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
  {
    "question_name": "At what percentile does the value 1.3 fall in the <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> test for patients the same age as patient 4924550704026979905 in March last year?",
    "question_concept": "At what percentile does the value 1.3 fall in the <MEASUREMENT>3022217</MEASUREMENT> test for patients the same age as patient 4924550704026979905 in March last year?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "How does a value of 1.3 rank percentile-wise in the <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> lab test for patients the same age as patient 4924550704026979905 during last March?",
    "question_concept": "How does a value of 1.3 rank percentile-wise in the <MEASUREMENT>3022217</MEASUREMENT> lab test for patients the same age as patient 4924550704026979905 during last March?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "What percentile does 1.3 correspond to in the <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> measurement for patients of the same age as patient 4924550704026979905 in March of the previous year?",
    "question_concept": "What percentile does 1.3 correspond to in the <MEASUREMENT>3022217</MEASUREMENT> measurement for patients of the same age as patient 4924550704026979905 in March of the previous year?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "In March last year, what percentile was the value 1.3 in the <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> lab results of patients the same age as patient 4924550704026979905?",
    "question_concept": "In March last year, what percentile was the value 1.3 in the <MEASUREMENT>3022217</MEASUREMENT> lab results of patients the same age as patient 4924550704026979905?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "What was the percentile of 1.3 in the <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> test results among same-age peers of patient 4924550704026979905 last March?",
    "question_concept": "What was the percentile of 1.3 in the <MEASUREMENT>3022217</MEASUREMENT> test results among same-age peers of patient 4924550704026979905 last March?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Among patients the same age as patient 4924550704026979905 in March of last year, what percentile is the lab value 1.3 in <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT>?",
    "question_concept": "Among patients the same age as patient 4924550704026979905 in March of last year, what percentile is the lab value 1.3 in <MEASUREMENT>3022217</MEASUREMENT>?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "What percentile does a 1.3 value hold in the <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> test for similar-aged patients to patient 4924550704026979905 in March last year?",
    "question_concept": "What percentile does a 1.3 value hold in the <MEASUREMENT>3022217</MEASUREMENT> test for similar-aged patients to patient 4924550704026979905 in March last year?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "How does the value 1.3 compare percentile-wise in <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> for patients the same age as patient 4924550704026979905 in March a year ago?",
    "question_concept": "How does the value 1.3 compare percentile-wise in <MEASUREMENT>3022217</MEASUREMENT> for patients the same age as patient 4924550704026979905 in March a year ago?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "What is the percentile ranking of 1.3 in <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> for people the same age as patient 4924550704026979905 last March?",
    "question_concept": "What is the percentile ranking of 1.3 in <MEASUREMENT>3022217</MEASUREMENT> for people the same age as patient 4924550704026979905 last March?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "During last March, what percentile does 1.3 fall into for <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> among those the same age as patient 4924550704026979905?",
    "question_concept": "During last March, what percentile does 1.3 fall into for <MEASUREMENT>3022217</MEASUREMENT> among those the same age as patient 4924550704026979905?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "In the <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> test, what percentile is 1.3 for those the same age as patient 4924550704026979905 during March of last year?",
    "question_concept": "In the <MEASUREMENT>3022217</MEASUREMENT> test, what percentile is 1.3 for those the same age as patient 4924550704026979905 during March of last year?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Where does the lab result 1.3 fall in the percentile distribution of <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> for age-matched patients to 4924550704026979905 last March?",
    "question_concept": "Where does the lab result 1.3 fall in the percentile distribution of <MEASUREMENT>3022217</MEASUREMENT> for age-matched patients to 4924550704026979905 last March?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "What is the percentile for a 1.3 result in <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> among patients matching the age of 4924550704026979905 last year in March?",
    "question_concept": "What is the percentile for a 1.3 result in <MEASUREMENT>3022217</MEASUREMENT> among patients matching the age of 4924550704026979905 last year in March?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "What percentile does 1.3 occupy in <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> for patients born the same year as 4924550704026979905 during March of last year?",
    "question_concept": "What percentile does 1.3 occupy in <MEASUREMENT>3022217</MEASUREMENT> for patients born the same year as 4924550704026979905 during March of last year?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Among peers of patient 4924550704026979905 by age in March last year, where does a 1.3 score rank in the <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> test?",
    "question_concept": "Among peers of patient 4924550704026979905 by age in March last year, where does a 1.3 score rank in the <MEASUREMENT>3022217</MEASUREMENT> test?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "What percentile corresponds to a value of 1.3 in the <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> test among patients of the same age group as 4924550704026979905 last March?",
    "question_concept": "What percentile corresponds to a value of 1.3 in the <MEASUREMENT>3022217</MEASUREMENT> test among patients of the same age group as 4924550704026979905 last March?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "How does 1.3 rank in terms of percentiles in <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> from last March among those the same age as patient 4924550704026979905?",
    "question_concept": "How does 1.3 rank in terms of percentiles in <MEASUREMENT>3022217</MEASUREMENT> from last March among those the same age as patient 4924550704026979905?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "For the <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> test last March, what percentile is 1.3 among same-age patients as 4924550704026979905?",
    "question_concept": "For the <MEASUREMENT>3022217</MEASUREMENT> test last March, what percentile is 1.3 among same-age patients as 4924550704026979905?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "What is the percentile rank for a 1.3 value in the <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> lab test in March last year for same-aged individuals as patient 4924550704026979905?",
    "question_concept": "What is the percentile rank for a 1.3 value in the <MEASUREMENT>3022217</MEASUREMENT> lab test in March last year for same-aged individuals as patient 4924550704026979905?",
    "sql": "WITH patient_birth_year AS (SELECT year_of_birth FROM person WHERE person_id = 4924550704026979905), filtered_measurements AS (SELECT value_as_number FROM measurement WHERE measurement_concept_id = 3022217 AND EXTRACT(YEAR FROM measurement_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1 AND EXTRACT(MONTH FROM measurement_date) = 3 AND person_id IN (SELECT person_id FROM person WHERE year_of_birth = (SELECT year_of_birth FROM patient_birth_year)) AND value_as_number IS NOT NULL), ranked_values AS (SELECT value_as_number, PERCENT_RANK() OVER (ORDER BY value_as_number) AS percentile FROM filtered_measurements) SELECT percentile FROM ranked_values WHERE value_as_number = 1.3 LIMIT 1;",
    "template": "what percentile is the value of {lab_value} in a {lab_name} lab test among patients of the same age as patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "How is the value 1.3 positioned percentile-wise in <MEASUREMENT>INR in Platelet poor plasma by Coagulation assay</MEASUREMENT> among those the same age as patient 4924550704026979905 in March last year?",
    "question_concept": "How is the value 1.3 positioned percentile-wise in <MEASUREMENT>3022217</MEASUREMENT> among those the same age as patient 4924550704026979905 in March last year?",
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
    "question_name": "What was the name of the drug that patient 449512254961891092 was at 2145-09-19 20:00:00 prescribed via route <ROUTE>Subcutaneous</ROUTE>?",
    "question_concept": "What was the name of the drug that patient 449512254961891092 was at 2145-09-19 20:00:00 prescribed via route <ROUTE>4142048</ROUTE>?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;" 
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Please provide the name of the drug prescribed to patient 449512254961891092 was administered via <ROUTE>Subcutaneous</ROUTE> at 2145-09-19 20:00:00?",
    "question_concept": "Please provide the name of the drug prescribed to patient 449512254961891092 was administered through the route <ROUTE>4142048</ROUTE> on 2145-09-19 at 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Please provide the name of the drug prescribed to patient 449512254961891092 received at 2145-09-19 20:00:00 through the route <ROUTE>Subcutaneous</ROUTE>?",
    "question_concept": "Please provide the name of the drug prescribed to patient 449512254961891092 was prescribed via route <ROUTE>4142048</ROUTE> on 2145-09-19 at 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Identify the drug that was given to patient 449512254961891092 got via <ROUTE>Subcutaneous</ROUTE> at the date and time 2145-09-19 20:00:00?",
    "question_concept": "Identify the drug that was given to patient 449512254961891092 was prescribed through <ROUTE>4142048</ROUTE> at exactly 2145-09-19 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Please provide the name of the drug prescribed to patient 449512254961891092 was given by <ROUTE>Subcutaneous</ROUTE> on 2145-09-19 20:00:00?",
    "question_concept": "Please provide the name of the drug prescribed to patient 449512254961891092 was administered via <ROUTE>4142048</ROUTE> at 2145-09-19 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "What is the drug that was prescribed to patient 449512254961891092 was given by <ROUTE>Subcutaneous</ROUTE> on 2145-09-19 20:00:00?",
    "question_concept": "What is the drug that was prescribed to patient 449512254961891092 was prescribed through <ROUTE>4142048</ROUTE> at exactly 2145-09-19 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Which drug was administered to patient 449512254961891092 was given by <ROUTE>Subcutaneous</ROUTE> on 2145-09-19 20:00:00?",
    "question_concept": "Which drug was administered to patient 449512254961891092 was prescribed through <ROUTE>4142048</ROUTE> at exactly 2145-09-19 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Identify the drug that was given to patient 449512254961891092 via route <ROUTE>Subcutaneous</ROUTE> at 2145-09-19 20:00:00?",
    "question_concept": "Identify the drug that was given to patient 449512254961891092 was administered through the route <ROUTE>4142048</ROUTE> on 2145-09-19 at 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Which medication was administered to patient 449512254961891092 was administered via <ROUTE>Subcutaneous</ROUTE> at 2145-09-19 20:00:00?",
    "question_concept": "Which medication was administered to patient 449512254961891092 was given by <ROUTE>4142048</ROUTE> on 2145-09-19 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Which medication was administered to patient 449512254961891092 was given via <ROUTE>Subcutaneous</ROUTE> exactly at 2145-09-19 20:00:00?",
    "question_concept": "Which medication was administered to patient 449512254961891092 was given by <ROUTE>4142048</ROUTE> on 2145-09-19 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Can you tell me the name of the drug prescribed to patient 449512254961891092 was administered via <ROUTE>Subcutaneous</ROUTE> at 2145-09-19 20:00:00?",
    "question_concept": "Can you tell me the name of the drug prescribed to patient 449512254961891092 was administered via <ROUTE>4142048</ROUTE> at 2145-09-19 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Can you tell me the name of the drug prescribed to patient 449512254961891092 was administered via <ROUTE>Subcutaneous</ROUTE> at 2145-09-19 20:00:00?",
    "question_concept": "Can you tell me the name of the drug prescribed to patient 449512254961891092 was given via <ROUTE>4142048</ROUTE> exactly at 2145-09-19 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Name the drug that patient 449512254961891092 received at 2145-09-19 20:00:00 through the route <ROUTE>Subcutaneous</ROUTE>?",
    "question_concept": "Name the drug that patient 449512254961891092 got via <ROUTE>4142048</ROUTE> at the date and time 2145-09-19 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "What medication did patient 449512254961891092 received at 2145-09-19 20:00:00 through the route <ROUTE>Subcutaneous</ROUTE>?",
    "question_concept": "What medication did patient 449512254961891092 was prescribed via route <ROUTE>4142048</ROUTE> on 2145-09-19 at 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "What medication did patient 449512254961891092 was prescribed via route <ROUTE>Subcutaneous</ROUTE> on 2145-09-19 at 20:00:00?",
    "question_concept": "What medication did patient 449512254961891092 was prescribed via route <ROUTE>4142048</ROUTE> on 2145-09-19 at 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Identify the drug that was given to patient 449512254961891092 got via <ROUTE>Subcutaneous</ROUTE> at the date and time 2145-09-19 20:00:00?",
    "question_concept": "Identify the drug that was given to patient 449512254961891092 got via <ROUTE>4142048</ROUTE> at the date and time 2145-09-19 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "What medication did patient 449512254961891092 was given through <ROUTE>Subcutaneous</ROUTE> at 2145-09-19 20:00:00?",
    "question_concept": "What medication did patient 449512254961891092 was given through <ROUTE>4142048</ROUTE> at 2145-09-19 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Which medication was administered to patient 449512254961891092 was administered through the route <ROUTE>Subcutaneous</ROUTE> on 2145-09-19 at 20:00:00?",
    "question_concept": "Which medication was administered to patient 449512254961891092 was given through <ROUTE>4142048</ROUTE> at 2145-09-19 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Tell me which drug patient 449512254961891092 was prescribed through <ROUTE>Subcutaneous</ROUTE> at exactly 2145-09-19 20:00:00?",
    "question_concept": "Tell me which drug patient 449512254961891092 was administered through the route <ROUTE>4142048</ROUTE> on 2145-09-19 at 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Can you tell me the name of the drug prescribed to patient 449512254961891092 got via <ROUTE>Subcutaneous</ROUTE> at the date and time 2145-09-19 20:00:00?",
    "question_concept": "Can you tell me the name of the drug prescribed to patient 449512254961891092 received at 2145-09-19 20:00:00 through the route <ROUTE>4142048</ROUTE>?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
    "template": "what was the name of the drug that patient {patient_id} was [time_filter_exact1] prescribed via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "What is the drug that was prescribed to patient 449512254961891092 was prescribed through <ROUTE>Subcutaneous</ROUTE> at exactly 2145-09-19 20:00:00?",
    "question_concept": "What is the drug that was prescribed to patient 449512254961891092 got via <ROUTE>4142048</ROUTE> at the date and time 2145-09-19 20:00:00?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT drug_concept_id FROM drug_exposure WHERE person_id = 449512254961891092 AND exposure_start_datetime = TIMESTAMP '2145-09-19 20:00:00' AND route_concept_id = 4142048 LIMIT 1) LIMIT 1;",
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
  {
    "question_name": "Which sample was taken first from patient 6819106907993465128 on their first hospital visit?",
    "question_concept": "Which sample was taken first from patient 6819106907993465128 on their first hospital visit?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Can you tell me the name of the specimen first tested for patient 6819106907993465128 at the first hospital visit?",
    "question_concept": "Can you tell me the name of the specimen first tested for patient 6819106907993465128 at the first hospital visit?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Can you tell me the name of the specimen first tested for patient 6819106907993465128 in their first recorded hospital encounter?",
    "question_concept": "Can you tell me the name of the specimen first tested for patient 6819106907993465128 in their first recorded hospital encounter?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Name the specimen that was tested first on patient 6819106907993465128 during the first visit to the hospital?",
    "question_concept": "Name the specimen that was tested first on patient 6819106907993465128 during the first visit to the hospital?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Which specimen was tested first for patient 6819106907993465128 during their initial hospital visit?",
    "question_concept": "Which specimen was tested first for patient 6819106907993465128 during their initial hospital visit?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "What was the specimen tested on the first hospital visit of patient 6819106907993465128 in their first recorded hospital encounter?",
    "question_concept": "What was the specimen tested on the first hospital visit of patient 6819106907993465128 in their first recorded hospital encounter?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Name the specimen that was tested first on patient 6819106907993465128 during the first visit to the hospital?",
    "question_concept": "Name the specimen that was tested first on patient 6819106907993465128 during the first visit to the hospital?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Identify the first specimen that was tested for patient 6819106907993465128 on their first hospital visit?",
    "question_concept": "Identify the first specimen that was tested for patient 6819106907993465128 on their first hospital visit?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Which sample was taken first from patient 6819106907993465128 during their initial hospital visit?",
    "question_concept": "Which sample was taken first from patient 6819106907993465128 during their initial hospital visit?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Give the name of the first tested specimen for patient 6819106907993465128 during the first visit to the hospital?",
    "question_concept": "Give the name of the first tested specimen for patient 6819106907993465128 during the first visit to the hospital?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "What was the specimen tested on the first hospital visit of patient 6819106907993465128 at the first hospital visit?",
    "question_concept": "What was the specimen tested on the first hospital visit of patient 6819106907993465128 at the first hospital visit?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Tell me the name of the first specimen tested during patient 6819106907993465128 at the time of their first hospital stay?",
    "question_concept": "Tell me the name of the first specimen tested during patient 6819106907993465128 at the time of their first hospital stay?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Name the specimen that was tested first on patient 6819106907993465128 on their initial hospitalization?",
    "question_concept": "Name the specimen that was tested first on patient 6819106907993465128 on their initial hospitalization?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Can you tell me the name of the specimen first tested for patient 6819106907993465128 on their initial hospitalization?",
    "question_concept": "Can you tell me the name of the specimen first tested for patient 6819106907993465128 on their initial hospitalization?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Please provide the specimen name that was tested first for patient 6819106907993465128 during the first visit to the hospital?",
    "question_concept": "Please provide the specimen name that was tested first for patient 6819106907993465128 during the first visit to the hospital?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Which specimen was tested first for patient 6819106907993465128 on the patient's first hospital admission?",
    "question_concept": "Which specimen was tested first for patient 6819106907993465128 on the patient's first hospital admission?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "What specimen was collected first from patient 6819106907993465128 during their initial hospital visit?",
    "question_concept": "What specimen was collected first from patient 6819106907993465128 during their initial hospital visit?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Which specimen was tested first for patient 6819106907993465128 at the time of their first hospital stay?",
    "question_concept": "Which specimen was tested first for patient 6819106907993465128 at the time of their first hospital stay?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Can you tell me the name of the specimen first tested for patient 6819106907993465128 on the occasion of their first hospital visit?",
    "question_concept": "Can you tell me the name of the specimen first tested for patient 6819106907993465128 on the occasion of their first hospital visit?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id = (SELECT specimen_concept_id FROM (SELECT specimen_concept_id FROM specimen WHERE person_id = 6819106907993465128 AND specimen_date BETWEEN (SELECT visit_start_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 6819106907993465128 ORDER BY visit_start_date ASC LIMIT 1) AND specimen_concept_id IS NOT NULL ORDER BY specimen_date, specimen_datetime LIMIT 1) AS first_specimen) LIMIT 1;",
    "template": "what was the name of the specimen that patient {patient_id} was [time_filter_exact1] tested [time_filter_global1]?"
  },
  {
    "question_name": "Give the name of the first tested specimen for patient 6819106907993465128 in their first recorded hospital encounter?",
    "question_concept": "Give the name of the first tested specimen for patient 6819106907993465128 in their first recorded hospital encounter?",
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
  {
    "question_name": "What are the five most frequent diagnoses on on 2123-Aug-23?",
    "question_concept": "What are the five most frequent diagnoses on on 2123-Aug-23?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "Identify the most common five diagnoses on the 23rd of August, 2123?",
    "question_concept": "Identify the most common five diagnoses on the 23rd of August, 2123?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "What are the five most frequent diagnoses on the date August 23, 2123?",
    "question_concept": "What are the five most frequent diagnoses on the date August 23, 2123?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "Name the five most recorded diagnoses on 2123-08-23?",
    "question_concept": "Name the five most recorded diagnoses on 2123-08-23?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "Which are the top 5 most common diagnoses recorded on August/23/2123?",
    "question_concept": "Which are the top 5 most common diagnoses recorded on August/23/2123?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "Name the five most recorded diagnoses on the date August 23, 2123?",
    "question_concept": "Name the five most recorded diagnoses on the date August 23, 2123?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "Give me the 5 most frequent diagnoses that occurred on August 23rd, 2123?",
    "question_concept": "Give me the 5 most frequent diagnoses that occurred on August 23rd, 2123?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "List the top five diagnoses reported for the date 2123/08/23?",
    "question_concept": "List the top five diagnoses reported for the date 2123/08/23?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "Can you list the 5 top diagnoses on 2123-Aug-23?",
    "question_concept": "Can you list the 5 top diagnoses on 2123-Aug-23?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "Name the five most recorded diagnoses for the date 2123/08/23?",
    "question_concept": "Name the five most recorded diagnoses for the date 2123/08/23?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "Can you list the 5 top diagnoses on August/23/2123?",
    "question_concept": "Can you list the 5 top diagnoses on August/23/2123?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "List the top five diagnoses reported on the 23rd of August, 2123?",
    "question_concept": "List the top five diagnoses reported on the 23rd of August, 2123?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "Show the top 5 frequent medical diagnoses for the date August 23, 2123?",
    "question_concept": "Show the top 5 frequent medical diagnoses for the date August 23, 2123?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "Identify the most common five diagnoses from 23 August 2123?",
    "question_concept": "Identify the most common five diagnoses from 23 August 2123?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "Give me the 5 most frequent diagnoses that occurred on 23 August 2123?",
    "question_concept": "Give me the 5 most frequent diagnoses that occurred on 23 August 2123?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "Identify the most common five diagnoses on 23 August 2123?",
    "question_concept": "Identify the most common five diagnoses on 23 August 2123?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "List the top five diagnoses reported on the day 23/08/2123?",
    "question_concept": "List the top five diagnoses reported on the day 23/08/2123?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "Give me the 5 most frequent diagnoses that occurred from the date August 23, 2123?",
    "question_concept": "Give me the 5 most frequent diagnoses that occurred from the date August 23, 2123?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "Can you list the 5 top diagnoses on the 23rd of August, 2123?",
    "question_concept": "Can you list the 5 top diagnoses on the 23rd of August, 2123?",
    "sql": "SELECT concept_name FROM concept WHERE concept_id IN (SELECT condition_concept_id FROM (SELECT condition_concept_id FROM condition_occurrence WHERE condition_start_date = DATE '2123-08-23' AND condition_concept_id IS NOT NULL GROUP BY condition_concept_id ORDER BY COUNT(*) DESC LIMIT 5) AS top_diagnoses) LIMIT 5;",
    "template": "what are_verb the top [n_rank] frequent diagnoses [time_filter_global1]?"
  },
  {
    "question_name": "Can you list the 5 top diagnoses from from the day 23/08/2123?",
    "question_concept": "Can you list the 5 top diagnoses from from the day 23/08/2123?",
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
  {
    "question_name": "Tell me the second measured weight value for patient 1922226694437355804 for July 16th last year?",
    "question_concept": "Tell me the second measured weight value for patient 1922226694437355804 for July 16th last year?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Retrieve the second weight value recorded for patient 1922226694437355804 from July 16 last year?",
    "question_concept": "Retrieve the second weight value recorded for patient 1922226694437355804 from July 16 last year?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Please show the second documented weight of patient 1922226694437355804 measured on 16 July last year?",
    "question_concept": "Please show the second documented weight of patient 1922226694437355804 measured on 16 July last year?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Give me the second weight measurement for patient 1922226694437355804 recorded on July/16 of the previous year?",
    "question_concept": "Give me the second weight measurement for patient 1922226694437355804 recorded on July/16 of the previous year?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Identify the second time weight was measured for patient 1922226694437355804 recorded on 2024-07-16?",
    "question_concept": "Identify the second time weight was measured for patient 1922226694437355804 recorded on 2024-07-16?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Fetch the second time weight was captured for patient 1922226694437355804 recorded on July/16 of the previous year?",
    "question_concept": "Fetch the second time weight was captured for patient 1922226694437355804 recorded on July/16 of the previous year?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Retrieve the second weight value recorded for patient 1922226694437355804 for July 16th last year?",
    "question_concept": "Retrieve the second weight value recorded for patient 1922226694437355804 for July 16th last year?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Identify the second time weight was measured for patient 1922226694437355804 measured on 16 July last year?",
    "question_concept": "Identify the second time weight was measured for patient 1922226694437355804 measured on 16 July last year?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Tell me the second measured weight value for patient 1922226694437355804 measured on 16 July last year?",
    "question_concept": "Tell me the second measured weight value for patient 1922226694437355804 measured on 16 July last year?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Retrieve the second weight value recorded for patient 1922226694437355804 measured on 16 July last year?",
    "question_concept": "Retrieve the second weight value recorded for patient 1922226694437355804 measured on 16 July last year?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Give me the second weight measurement for patient 1922226694437355804 for July 16th last year?",
    "question_concept": "Give me the second weight measurement for patient 1922226694437355804 for July 16th last year?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Identify the second time weight was measured for patient 1922226694437355804 on the previous year's July 16?",
    "question_concept": "Identify the second time weight was measured for patient 1922226694437355804 on the previous year's July 16?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Give me the second weight measurement for patient 1922226694437355804 recorded on 2024-07-16?",
    "question_concept": "Give me the second weight measurement for patient 1922226694437355804 recorded on 2024-07-16?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Identify the second time weight was measured for patient 1922226694437355804 on the previous year's July 16?",
    "question_concept": "Identify the second time weight was measured for patient 1922226694437355804 on the previous year's July 16?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Which value was the second measured weight for patient 1922226694437355804 on the day 16/07/last year?",
    "question_concept": "Which value was the second measured weight for patient 1922226694437355804 on the day 16/07/last year?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Give me the second weight measurement for patient 1922226694437355804 on the previous year's July 16?",
    "question_concept": "Give me the second weight measurement for patient 1922226694437355804 on the previous year's July 16?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Which value was the second measured weight for patient 1922226694437355804 on July/16/last year?",
    "question_concept": "Which value was the second measured weight for patient 1922226694437355804 on July/16/last year?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Give me the second weight measurement for patient 1922226694437355804 on July/16/last year?",
    "question_concept": "Give me the second weight measurement for patient 1922226694437355804 on July/16/last year?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Can you provide the second measured weight of patient 1922226694437355804 on the previous year's July 16?",
    "question_concept": "Can you provide the second measured weight of patient 1922226694437355804 on the previous year's July 16?",
    "sql": "SELECT value_as_number FROM (SELECT value_as_number FROM measurement WHERE person_id = 1922226694437355804 AND measurement_concept_id = 3025315 AND measurement_date = (DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year') + INTERVAL '6 months' + INTERVAL '15 days' AND value_as_number IS NOT NULL ORDER BY measurement_datetime ASC NULLS LAST, measurement_id ASC OFFSET 1 LIMIT 1) AS second_weight LIMIT 1;",
    "template": "what was the [time_filter_exact1] measured weight of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Retrieve the second weight value recorded for patient 1922226694437355804 recorded on July/16 of the previous year?",
    "question_concept": "Retrieve the second weight value recorded for patient 1922226694437355804 recorded on July/16 of the previous year?",
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
  {
    "question_name": "What is the count of deaths on the same day as diagnosis with <CONDITION>Opioid dependence</CONDITION> and passed away that day in the last 7 months.",
    "question_concept": "What is the count of deaths on the same day as diagnosis with <CONDITION>438120</CONDITION> and passed away that day in the last 7 months.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "How many deaths occurred on the same day as diagnosis for <CONDITION>Opioid dependence</CONDITION> on the same day in the last 7 months.",
    "question_concept": "How many deaths occurred on the same day as diagnosis for <CONDITION>438120</CONDITION> on the same day in the last 7 months.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "Calculate the number of patients who died after being diagnosed with <CONDITION>Opioid dependence</CONDITION> on the same day in the last 7 months.",
    "question_concept": "Calculate the number of patients who died after being diagnosed with <CONDITION>438120</CONDITION> on the same day in the last 7 months.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "Find the number of patients who were diagnosed and then died the same day with <CONDITION>Opioid dependence</CONDITION> the same day since seven months ago.",
    "question_concept": "Find the number of patients who were diagnosed and then died the same day with <CONDITION>438120</CONDITION> the same day since seven months ago.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "Find the number of patients who were diagnosed and then died the same day with <CONDITION>Opioid dependence</CONDITION> on the same day in the last 7 months.",
    "question_concept": "Find the number of patients who were diagnosed and then died the same day with <CONDITION>438120</CONDITION> on the same day in the last 7 months.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "How many patients died on the same day they were diagnosed with <CONDITION>Opioid dependence</CONDITION> the same day since seven months ago.",
    "question_concept": "How many patients died on the same day they were diagnosed with <CONDITION>438120</CONDITION> the same day since seven months ago.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "How many individuals died within the same day of being diagnosed with <CONDITION>Opioid dependence</CONDITION> with same-day death from 7 months ago.",
    "question_concept": "How many individuals died within the same day of being diagnosed with <CONDITION>438120</CONDITION> with same-day death from 7 months ago.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "How many deaths occurred on the same day as diagnosis for <CONDITION>Opioid dependence</CONDITION> and passed away that day in the last 7 months.",
    "question_concept": "How many deaths occurred on the same day as diagnosis for <CONDITION>438120</CONDITION> and passed away that day in the last 7 months.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "How many deaths occurred on the same day as diagnosis for <CONDITION>Opioid dependence</CONDITION> on the same day in the last 7 months.",
    "question_concept": "How many deaths occurred on the same day as diagnosis for <CONDITION>438120</CONDITION> on the same day in the last 7 months.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "Count patients who passed away the same day as diagnosis of <CONDITION>Opioid dependence</CONDITION> and died the same day since seven months ago.",
    "question_concept": "Count patients who passed away the same day as diagnosis of <CONDITION>438120</CONDITION> and died the same day since seven months ago.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "Count patients who passed away the same day as diagnosis of <CONDITION>Opioid dependence</CONDITION> the same day over the past seven months.",
    "question_concept": "Count patients who passed away the same day as diagnosis of <CONDITION>438120</CONDITION> the same day over the past seven months.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "What is the count of deaths on the same day as diagnosis with <CONDITION>Opioid dependence</CONDITION> the same day since seven months ago.",
    "question_concept": "What is the count of deaths on the same day as diagnosis with <CONDITION>438120</CONDITION> the same day since seven months ago.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "Calculate the number of patients who died after being diagnosed with <CONDITION>Opioid dependence</CONDITION> with same-day death from 7 months ago.",
    "question_concept": "Calculate the number of patients who died after being diagnosed with <CONDITION>438120</CONDITION> with same-day death from 7 months ago.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "Calculate the number of patients who died after being diagnosed with <CONDITION>Opioid dependence</CONDITION> on the same calendar day over the past 7 months.",
    "question_concept": "Calculate the number of patients who died after being diagnosed with <CONDITION>438120</CONDITION> on the same calendar day over the past 7 months.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "Tell me the number of people who were diagnosed and died the same day from <CONDITION>Opioid dependence</CONDITION> on the same calendar day over the past 7 months.",
    "question_concept": "Tell me the number of people who were diagnosed and died the same day from <CONDITION>438120</CONDITION> on the same calendar day over the past 7 months.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "Give the number of patients who died following a diagnosis of <CONDITION>Opioid dependence</CONDITION> on the same day in the last 7 months.",
    "question_concept": "Give the number of patients who died following a diagnosis of <CONDITION>438120</CONDITION> on the same day in the last 7 months.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "Determine how many patients died the same day they were diagnosed with <CONDITION>Opioid dependence</CONDITION> and passed away that day in the last 7 months.",
    "question_concept": "Determine how many patients died the same day they were diagnosed with <CONDITION>438120</CONDITION> and passed away that day in the last 7 months.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "How many deaths occurred on the same day as diagnosis for <CONDITION>Opioid dependence</CONDITION> and passed away that day in the last 7 months.",
    "question_concept": "How many deaths occurred on the same day as diagnosis for <CONDITION>438120</CONDITION> and passed away that day in the last 7 months.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "Tell me the number of people who were diagnosed and died the same day from <CONDITION>Opioid dependence</CONDITION> the same day over the past seven months.",
    "question_concept": "Tell me the number of people who were diagnosed and died the same day from <CONDITION>438120</CONDITION> the same day over the past seven months.",
    "sql": "SELECT COUNT(DISTINCT c.person_id) FROM (SELECT c.person_id FROM condition_occurrence c WHERE c.condition_concept_id = 438120 AND c.condition_start_date >= CURRENT_DATE - INTERVAL '7 month' AND c.person_id IN (SELECT d.person_id FROM death d WHERE d.death_date = c.condition_start_date)) AS patients_dead_same_day;",
    "template": "count the number of patients who were dead after having been diagnosed with {diagnosis_name} [time_filter_within] [time_filter_global1]."
  },
  {
    "question_name": "Find the number of patients who were diagnosed and then died the same day with <CONDITION>Opioid dependence</CONDITION> on the same calendar day over the past 7 months.",
    "question_concept": "Find the number of patients who were diagnosed and then died the same day with <CONDITION>438120</CONDITION> on the same calendar day over the past 7 months.",
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
  {
    "question_name": "Tell me when the second discharge occurred for patient 2219414084045702174 on May of last year?",
    "question_concept": "Tell me when the second discharge occurred for patient 2219414084045702174 on May of last year?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Fetch the date of second discharge for patient 2219414084045702174 during May from the previous year?",
    "question_concept": "Fetch the date of second discharge for patient 2219414084045702174 during May from the previous year?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "What was the time of the second discharge of patient 2219414084045702174 in the month of May, last year?",
    "question_concept": "What was the time of the second discharge of patient 2219414084045702174 in the month of May, last year?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Tell me when the second discharge occurred for patient 2219414084045702174 on May of last year?",
    "question_concept": "Tell me when the second discharge occurred for patient 2219414084045702174 on May of last year?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "On what date was the second discharge for patient 2219414084045702174 in May/last year?",
    "question_concept": "On what date was the second discharge for patient 2219414084045702174 in May/last year?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "At what time was the second hospital discharge for patient 2219414084045702174 during May from the previous year?",
    "question_concept": "At what time was the second hospital discharge for patient 2219414084045702174 during May from the previous year?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "At what time was the second hospital discharge for patient 2219414084045702174 during last year's May?",
    "question_concept": "At what time was the second hospital discharge for patient 2219414084045702174 during last year's May?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "On what date did patient 2219414084045702174 have their second hospital discharge in May last year?",
    "question_concept": "On what date did patient 2219414084045702174 have their second hospital discharge in May last year?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "At what time was the second hospital discharge for patient 2219414084045702174 from May, a year ago?",
    "question_concept": "At what time was the second hospital discharge for patient 2219414084045702174 from May, a year ago?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "On what date was the second discharge for patient 2219414084045702174 during last year's May?",
    "question_concept": "On what date was the second discharge for patient 2219414084045702174 during last year's May?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "On what date was the second discharge for patient 2219414084045702174 from May, a year ago?",
    "question_concept": "On what date was the second discharge for patient 2219414084045702174 from May, a year ago?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Can you tell me when patient 2219414084045702174 was discharged for the second time in May last year?",
    "question_concept": "Can you tell me when patient 2219414084045702174 was discharged for the second time in May last year?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "On what date was the second discharge for patient 2219414084045702174 in the month of May, last year?",
    "question_concept": "On what date was the second discharge for patient 2219414084045702174 in the month of May, last year?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "At what time was the second hospital discharge for patient 2219414084045702174 during May from the previous year?",
    "question_concept": "At what time was the second hospital discharge for patient 2219414084045702174 during May from the previous year?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "On what date was the second discharge for patient 2219414084045702174 on May of last year?",
    "question_concept": "On what date was the second discharge for patient 2219414084045702174 on May of last year?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "What was the time of the second discharge of patient 2219414084045702174 in May/last year?",
    "question_concept": "What was the time of the second discharge of patient 2219414084045702174 in May/last year?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "What was the time of the second discharge of patient 2219414084045702174 from May, a year ago?",
    "question_concept": "What was the time of the second discharge of patient 2219414084045702174 from May, a year ago?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Provide the second hospital discharge time of patient 2219414084045702174 in May of the previous year?",
    "question_concept": "Provide the second hospital discharge time of patient 2219414084045702174 in May of the previous year?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Give the date of the second hospital discharge for patient 2219414084045702174 on May of last year?",
    "question_concept": "Give the date of the second hospital discharge for patient 2219414084045702174 on May of last year?",
    "sql": "SELECT visit_end_date FROM (SELECT visit_end_date, ROW_NUMBER() OVER (ORDER BY visit_end_date) AS rn FROM (SELECT visit_end_date FROM visit_occurrence WHERE person_id = 2219414084045702174 AND visit_end_date BETWEEN make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 1) AND make_date(EXTRACT(YEAR FROM CURRENT_DATE)::int - 1, 5, 31) AND visit_end_date IS NOT NULL) AS filtered_visits) AS ranked_visits WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] hospital discharge time of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "At what time was the second hospital discharge for patient 2219414084045702174 from May, a year ago?",
    "question_concept": "At what time was the second hospital discharge for patient 2219414084045702174 from May, a year ago?",
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
  {
    "question_name": "Which four drugs were most commonly given to women in their 20s within 2 days after being diagnosed with <CONDITION>Gastroesophageal reflux disease</CONDITION> this month/2?",
    "question_concept": "Which four drugs were most commonly given to women in their 20s within 2 days after being diagnosed with <CONDITION>318800</CONDITION> this month/2?",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "What are the four most frequent medications prescribed to females aged 20-29 within 2 days post-diagnosis of <CONDITION>Gastroesophageal reflux disease</CONDITION> during this month/2?",
    "question_concept": "What are the four most frequent medications prescribed to females aged 20-29 within 2 days post-diagnosis of <CONDITION>318800</CONDITION> during this month/2?",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "List the top four drugs given to 20-something women after a <CONDITION>Gastroesophageal reflux disease</CONDITION> diagnosis within 2 days in this month/2.",
    "question_concept": "List the top four drugs given to 20-something women after a <CONDITION>318800</CONDITION> diagnosis within 2 days in this month/2.",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "During this month/2, which are the top 4 drugs prescribed to female patients in their twenties within 2 days of <CONDITION>Gastroesophageal reflux disease</CONDITION> diagnosis?",
    "question_concept": "During this month/2, which are the top 4 drugs prescribed to female patients in their twenties within 2 days of <CONDITION>318800</CONDITION> diagnosis?",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Can you name the 4 most commonly prescribed medications for 20-year-old women diagnosed with <CONDITION>Gastroesophageal reflux disease</CONDITION> within two days this month/2?",
    "question_concept": "Can you name the 4 most commonly prescribed medications for 20-year-old women diagnosed with <CONDITION>318800</CONDITION> within two days this month/2?",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Top 4 drugs prescribed to females aged 20-29 within 2 days of being diagnosed with <CONDITION>Gastroesophageal reflux disease</CONDITION> during this month/2?",
    "question_concept": "Top 4 drugs prescribed to females aged 20-29 within 2 days of being diagnosed with <CONDITION>318800</CONDITION> during this month/2?",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Identify the top 4 prescriptions for women in their twenties following a <CONDITION>Gastroesophageal reflux disease</CONDITION> diagnosis within 2 days this month/2.",
    "question_concept": "Identify the top 4 prescriptions for women in their twenties following a <CONDITION>318800</CONDITION> diagnosis within 2 days this month/2.",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Which drugs were most frequently prescribed to young adult females after being diagnosed with <CONDITION>Gastroesophageal reflux disease</CONDITION> within 2 days in this month/2?",
    "question_concept": "Which drugs were most frequently prescribed to young adult females after being diagnosed with <CONDITION>318800</CONDITION> within 2 days in this month/2?",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Name the 4 top prescribed medications to 20s female patients shortly after being diagnosed with <CONDITION>Gastroesophageal reflux disease</CONDITION> in this month/2.",
    "question_concept": "Name the 4 top prescribed medications to 20s female patients shortly after being diagnosed with <CONDITION>318800</CONDITION> in this month/2.",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Find the four most commonly issued drugs for women in their 20s with a recent diagnosis of <CONDITION>Gastroesophageal reflux disease</CONDITION> this month/2.",
    "question_concept": "Find the four most commonly issued drugs for women in their 20s with a recent diagnosis of <CONDITION>318800</CONDITION> this month/2.",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "List top 4 drugs prescribed within 2 days to 20-29 year-old women diagnosed with <CONDITION>Gastroesophageal reflux disease</CONDITION> during this month/2.",
    "question_concept": "List top 4 drugs prescribed within 2 days to 20-29 year-old women diagnosed with <CONDITION>318800</CONDITION> during this month/2.",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Show the most prescribed four drugs for females in their twenties after being diagnosed with <CONDITION>Gastroesophageal reflux disease</CONDITION> this month/2.",
    "question_concept": "Show the most prescribed four drugs for females in their twenties after being diagnosed with <CONDITION>318800</CONDITION> this month/2.",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "In this month/2, what are the top 4 drugs prescribed to women aged 20-29 after <CONDITION>Gastroesophageal reflux disease</CONDITION> diagnosis within 2 days?",
    "question_concept": "In this month/2, what are the top 4 drugs prescribed to women aged 20-29 after <CONDITION>318800</CONDITION> diagnosis within 2 days?",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Highlight the four most used drugs among 20s women within 2 days of being diagnosed with <CONDITION>Gastroesophageal reflux disease</CONDITION> this month/2.",
    "question_concept": "Highlight the four most used drugs among 20s women within 2 days of being diagnosed with <CONDITION>318800</CONDITION> this month/2.",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Top four drug prescriptions among women in their twenties diagnosed with <CONDITION>Gastroesophageal reflux disease</CONDITION> this month/2 within 2 days?",
    "question_concept": "Top four drug prescriptions among women in their twenties diagnosed with <CONDITION>318800</CONDITION> this month/2 within 2 days?",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Provide the 4 most prescribed drugs for young women (20s) after being diagnosed with <CONDITION>Gastroesophageal reflux disease</CONDITION> this month/2.",
    "question_concept": "Provide the 4 most prescribed drugs for young women (20s) after being diagnosed with <CONDITION>318800</CONDITION> this month/2.",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Which medications top the list for 20-something female patients post <CONDITION>Gastroesophageal reflux disease</CONDITION> diagnosis this month/2?",
    "question_concept": "Which medications top the list for 20-something female patients post <CONDITION>318800</CONDITION> diagnosis this month/2?",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Name top four prescribed medications for females aged 20-29 after <CONDITION>Gastroesophageal reflux disease</CONDITION> diagnosis within 2 days this month/2.",
    "question_concept": "Name top four prescribed medications for females aged 20-29 after <CONDITION>318800</CONDITION> diagnosis within 2 days this month/2.",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "During this month/2, what are the most prescribed 4 drugs to 20s females right after <CONDITION>Gastroesophageal reflux disease</CONDITION> diagnosis?",
    "question_concept": "During this month/2, what are the most prescribed 4 drugs to 20s females right after <CONDITION>318800</CONDITION> diagnosis?",
    "sql": "SELECT de.drug_concept_id, COUNT(*) AS prescription_count FROM drug_exposure AS de WHERE de.person_id IN (SELECT p.person_id FROM person AS p WHERE p.gender_concept_id = 8532 AND EXTRACT(YEAR FROM age(CURRENT_DATE, p.birth_datetime)) BETWEEN 20 AND 29) AND de.drug_exposure_start_date BETWEEN (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) AND (SELECT co.condition_start_date FROM condition_occurrence AS co WHERE co.condition_concept_id = 318800 AND co.condition_start_date >= DATE_TRUNC('month', CURRENT_DATE) AND co.condition_start_date < DATE_TRUNC('month', CURRENT_DATE) + INTERVAL '1 month' AND de.person_id = co.person_id ORDER BY co.condition_start_date ASC LIMIT 1) + INTERVAL '2 days' GROUP BY de.drug_concept_id ORDER BY prescription_count DESC LIMIT 4;",
    "template": "what are_verb the top [n_rank] frequently prescribed drugs that {gender} patients aged [age_group] were prescribed [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Which drugs are most frequently prescribed to women in their 20s after being diagnosed with <CONDITION>Gastroesophageal reflux disease</CONDITION> this month/2?",
    "question_concept": "Which drugs are most frequently prescribed to women in their 20s after being diagnosed with <CONDITION>318800</CONDITION> this month/2?",
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
  {
    "question_name": "What was the second most recent date when patient 6657709864320620215 received both <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> on the same day during their first ICU stay?",
    "question_concept": "What was the second most recent date when patient 6657709864320620215 received both <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> on the same day during their first ICU stay?",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "On which date did patient 6657709864320620215 receive <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> together for the second to last time during the first ICU visit?",
    "question_concept": "On which date did patient 6657709864320620215 receive <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> together for the second to last time during the first ICU visit?",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Can you identify the second to last day when patient 6657709864320620215 was prescribed both <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> on their initial ICU stay?",
    "question_concept": "Can you identify the second to last day when patient 6657709864320620215 was prescribed both <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> on their initial ICU stay?",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Tell me the date when patient 6657709864320620215 received both <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> for the second most recent time during the first ICU admission.",
    "question_concept": "Tell me the date when patient 6657709864320620215 received both <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> for the second most recent time during the first ICU admission.",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Which day marks the second latest prescription of both <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> for patient 6657709864320620215 on their first ICU visit?",
    "question_concept": "Which day marks the second latest prescription of both <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> for patient 6657709864320620215 on their first ICU visit?",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "What is the second latest occasion when patient 6657709864320620215 was administered <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> together during the first ICU stay?",
    "question_concept": "What is the second latest occasion when patient 6657709864320620215 was administered <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> together during the first ICU stay?",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Find the date of the second to last same-day prescription of <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> for patient 6657709864320620215 during their initial ICU visit.",
    "question_concept": "Find the date of the second to last same-day prescription of <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> for patient 6657709864320620215 during their initial ICU visit.",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Give the second most recent instance when patient 6657709864320620215 was prescribed both <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> on their first ICU admission.",
    "question_concept": "Give the second most recent instance when patient 6657709864320620215 was prescribed both <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> on their first ICU admission.",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "When was the penultimate date patient 6657709864320620215 received both <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> together during their initial ICU stay?",
    "question_concept": "When was the penultimate date patient 6657709864320620215 received both <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> together during their initial ICU stay?",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Identify the second last occurrence where patient 6657709864320620215 was given <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> on the same day during their first ICU visit.",
    "question_concept": "Identify the second last occurrence where patient 6657709864320620215 was given <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> on the same day during their first ICU visit.",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Second to last date patient 6657709864320620215 got both <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> in the same day during first ICU stay?",
    "question_concept": "Second to last date patient 6657709864320620215 got both <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> in the same day during first ICU stay?",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "What date marks the second previous co-prescription of <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> for patient 6657709864320620215 during the first ICU visit?",
    "question_concept": "What date marks the second previous co-prescription of <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> for patient 6657709864320620215 during the first ICU visit?",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "When did patient 6657709864320620215 last receive <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> together before the most recent time in their initial ICU stay?",
    "question_concept": "When did patient 6657709864320620215 last receive <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> together before the most recent time in their initial ICU stay?",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Find the date just before the most recent one when patient 6657709864320620215 received <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> together in their first ICU admission.",
    "question_concept": "Find the date just before the most recent one when patient 6657709864320620215 received <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> together in their first ICU admission.",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "What's the second latest date patient 6657709864320620215 got both <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> during their first ICU visit?",
    "question_concept": "What's the second latest date patient 6657709864320620215 got both <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> during their first ICU visit?",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Determine when was the second-to-latest date that <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> were prescribed together for patient 6657709864320620215 in their first ICU stay.",
    "question_concept": "Determine when was the second-to-latest date that <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> were prescribed together for patient 6657709864320620215 in their first ICU stay.",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Give me the second previous day that patient 6657709864320620215 was given <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> along with <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> on their first ICU visit.",
    "question_concept": "Give me the second previous day that patient 6657709864320620215 was given <DRUG>1742258</DRUG> along with <DRUG>40175218</DRUG> on their first ICU visit.",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "What was the penultimate co-administration date of <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> for patient 6657709864320620215 during their first ICU encounter?",
    "question_concept": "What was the penultimate co-administration date of <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> for patient 6657709864320620215 during their first ICU encounter?",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "When did patient 6657709864320620215 most recently before last receive both <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> during their initial ICU stay?",
    "question_concept": "When did patient 6657709864320620215 most recently before last receive both <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> during their initial ICU stay?",
    "sql": "SELECT prescription_date FROM (SELECT DISTINCT drug_exposure_start_date AS prescription_date FROM drug_exposure WHERE person_id = 6657709864320620215 AND visit_occurrence_id = (SELECT visit_occurrence_id FROM visit_occurrence WHERE person_id = 6657709864320620215 AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM visit_detail WHERE visit_detail_concept_id IN (SELECT concept_id FROM concept WHERE concept_name ILIKE '%intensive care%')) ORDER BY visit_start_date ASC LIMIT 1) AND drug_concept_id IN (1742258, 40175218) AND EXISTS (SELECT 1 FROM drug_exposure AS de2 WHERE de2.person_id = 6657709864320620215 AND de2.drug_concept_id IN (1742258, 40175218) AND de2.drug_exposure_start_date = drug_exposure.drug_exposure_start_date AND de2.drug_concept_id <> drug_exposure.drug_concept_id AND de2.visit_occurrence_id = drug_exposure.visit_occurrence_id)) AS prescription_dates ORDER BY prescription_date DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed {drug_name1} and {drug_name2} [time_filter_within] [time_filter_global1]?"
  },
  {
    "question_name": "Retrieve the second latest day of simultaneous administration of <DRUG>levofloxacin 500 MG Oral Tablet [Levaquin]</DRUG> and <DRUG>levothyroxine sodium 0.05 MG Oral Tablet [Synthroid]</DRUG> to patient 6657709864320620215 on their first ICU admission.",
    "question_concept": "Retrieve the second latest day of simultaneous administration of <DRUG>1742258</DRUG> and <DRUG>40175218</DRUG> to patient 6657709864320620215 on their first ICU admission.",
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
    "question_name": "Count the number of patients who received a <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure on the current hospital visit.",
    "question_concept": "Count the number of patients who received a <PROCEDURE>2786472</PROCEDURE> procedure on the current hospital visit.",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "How many patients received a <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure during their current hospital visit?",
    "question_concept": "How many patients received a <PROCEDURE>2786472</PROCEDURE> procedure during their current hospital visit?",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "Count how many patients underwent a <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure on their current hospital stay.",
    "question_concept": "Count how many patients underwent a <PROCEDURE>2786472</PROCEDURE> procedure on their current hospital stay.",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "How many individuals had a <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure performed during this hospital admission?",
    "question_concept": "How many individuals had a <PROCEDURE>2786472</PROCEDURE> procedure performed during this hospital admission?",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "What is the number of patients who received the <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure on the current visit?",
    "question_concept": "What is the number of patients who received the <PROCEDURE>2786472</PROCEDURE> procedure on the current visit?",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "Determine the count of patients who underwent a <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure during their ongoing hospitalization.",
    "question_concept": "Determine the count of patients who underwent a <PROCEDURE>2786472</PROCEDURE> procedure during their ongoing hospitalization.",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "Give the number of patients treated with a <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure in their current hospital visit.",
    "question_concept": "Give the number of patients treated with a <PROCEDURE>2786472</PROCEDURE> procedure in their current hospital visit.",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "How many patients went through a <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure during this hospital stay?",
    "question_concept": "How many patients went through a <PROCEDURE>2786472</PROCEDURE> procedure during this hospital stay?",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "Total number of patients administered the <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure during their current admission?",
    "question_concept": "Total number of patients administered the <PROCEDURE>2786472</PROCEDURE> procedure during their current admission?",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "Count the patients who had the <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure done on their current hospital encounter.",
    "question_concept": "Count the patients who had the <PROCEDURE>2786472</PROCEDURE> procedure done on their current hospital encounter.",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "What is the total number of patients who had a <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure on this hospital visit?",
    "question_concept": "What is the total number of patients who had a <PROCEDURE>2786472</PROCEDURE> procedure on this hospital visit?",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "Find the number of patients that received a <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure during this admission.",
    "question_concept": "Find the number of patients that received a <PROCEDURE>2786472</PROCEDURE> procedure during this admission.",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "Can you count how many patients had the <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure on the current hospitalization?",
    "question_concept": "Can you count how many patients had the <PROCEDURE>2786472</PROCEDURE> procedure on the current hospitalization?",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "How many were given a <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure during the ongoing hospital stay?",
    "question_concept": "How many were given a <PROCEDURE>2786472</PROCEDURE> procedure during the ongoing hospital stay?",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "Count how many individuals received the <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure on their current visit.",
    "question_concept": "Count how many individuals received the <PROCEDURE>2786472</PROCEDURE> procedure on their current visit.",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "Provide the count of patients who got a <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure during the hospital admission.",
    "question_concept": "Provide the count of patients who got a <PROCEDURE>2786472</PROCEDURE> procedure during the hospital admission.",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "Number of patients who had a <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure performed in the current hospital encounter?",
    "question_concept": "Number of patients who had a <PROCEDURE>2786472</PROCEDURE> procedure performed in the current hospital encounter?",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "What's the patient count for those who had a <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure during their current hospital stay?",
    "question_concept": "What's the patient count for those who had a <PROCEDURE>2786472</PROCEDURE> procedure during their current hospital stay?",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "Find out how many patients underwent the <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure during their present hospitalization.",
    "question_concept": "Find out how many patients underwent the <PROCEDURE>2786472</PROCEDURE> procedure during their present hospitalization.",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "How many patients received the <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure during this visit?",
    "question_concept": "How many patients received the <PROCEDURE>2786472</PROCEDURE> procedure during this visit?",
    "sql": "SELECT COUNT(DISTINCT person_id) AS patient_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2786472 AND po.visit_occurrence_id IN (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = po.person_id AND po.procedure_date BETWEEN vo.visit_start_date AND vo.visit_end_date);",
    "template": "count the number of patients who received a {procedure_name} procedure [time_filter_global1]."
  },
  {
    "question_name": "Give the number of people who got a <PROCEDURE>Introduction of Other Antineoplastic into Central Vein, Percutaneous Approach</PROCEDURE> procedure during the current hospital episode.",
    "question_concept": "Give the number of people who got a <PROCEDURE>2786472</PROCEDURE> procedure during the current hospital episode.",
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
  {
    "question_name": "Determine the number of patients who received a diagnosis of <CONDITION>Nicotine dependence</CONDITION> three months after a prior diagnosis of <CONDITION>Postoperative infection</CONDITION> since the start of last year.",
    "question_concept": "Determine the number of patients who received a diagnosis of <CONDITION>4209423</CONDITION> three months after a prior diagnosis of <CONDITION>437474</CONDITION> since the start of last year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "Report how many patients were diagnosed with <CONDITION>Nicotine dependence</CONDITION> in the 3 months following a diagnosis of <CONDITION>Postoperative infection</CONDITION> starting January 1st of the previous year.",
    "question_concept": "Report how many patients were diagnosed with <CONDITION>4209423</CONDITION> in the 3 months following a diagnosis of <CONDITION>437474</CONDITION> starting January 1st of the previous year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "Tell me how many people have been diagnosed with <CONDITION>Nicotine dependence</CONDITION> in the three-month window after diagnosis with <CONDITION>Postoperative infection</CONDITION> since the beginning of the previous year.",
    "question_concept": "Tell me how many people have been diagnosed with <CONDITION>4209423</CONDITION> in the three-month window after diagnosis with <CONDITION>437474</CONDITION> since the beginning of the previous year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "What is the count of patients diagnosed with <CONDITION>Nicotine dependence</CONDITION> within a 3-month period post-diagnosis of <CONDITION>Postoperative infection</CONDITION> since the beginning of the previous year.",
    "question_concept": "What is the count of patients diagnosed with <CONDITION>4209423</CONDITION> within a 3-month period post-diagnosis of <CONDITION>437474</CONDITION> since the beginning of the previous year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "What is the count of patients diagnosed with <CONDITION>Nicotine dependence</CONDITION> no later than 3 months after they were diagnosed with <CONDITION>Postoperative infection</CONDITION> from the beginning of last year.",
    "question_concept": "What is the count of patients diagnosed with <CONDITION>4209423</CONDITION> no later than 3 months after they were diagnosed with <CONDITION>437474</CONDITION> from the beginning of last year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "How many patients have been diagnosed with <CONDITION>Nicotine dependence</CONDITION> after being diagnosed with, within 3 months <CONDITION>Postoperative infection</CONDITION> from the start of the last calendar year.",
    "question_concept": "How many patients have been diagnosed with <CONDITION>4209423</CONDITION> after being diagnosed with, within 3 months <CONDITION>437474</CONDITION> from the start of the last calendar year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "Give me the count of patients with a diagnosis of <CONDITION>Nicotine dependence</CONDITION> within a 3-month period post-diagnosis of <CONDITION>Postoperative infection</CONDITION> since January 1st of last year.",
    "question_concept": "Give me the count of patients with a diagnosis of <CONDITION>4209423</CONDITION> within a 3-month period post-diagnosis of <CONDITION>437474</CONDITION> since January 1st of last year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "How many patients have been diagnosed with <CONDITION>Nicotine dependence</CONDITION> up to 3 months after being diagnosed with <CONDITION>Postoperative infection</CONDITION> since January 1st of last year.",
    "question_concept": "How many patients have been diagnosed with <CONDITION>4209423</CONDITION> up to 3 months after being diagnosed with <CONDITION>437474</CONDITION> since January 1st of last year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "Total patients diagnosed with <CONDITION>Nicotine dependence</CONDITION> after being diagnosed with, within 3 months <CONDITION>Postoperative infection</CONDITION> dating back to the first day of last year.",
    "question_concept": "Total patients diagnosed with <CONDITION>4209423</CONDITION> after being diagnosed with, within 3 months <CONDITION>437474</CONDITION> dating back to the first day of last year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "Identify the number of patients diagnosed with <CONDITION>Nicotine dependence</CONDITION> no more than 3 months after diagnosis of <CONDITION>Postoperative infection</CONDITION> as of the beginning of last year.",
    "question_concept": "Identify the number of patients diagnosed with <CONDITION>4209423</CONDITION> no more than 3 months after diagnosis of <CONDITION>437474</CONDITION> as of the beginning of last year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "Total patients diagnosed with <CONDITION>Nicotine dependence</CONDITION> no later than 3 months after they were diagnosed with <CONDITION>Postoperative infection</CONDITION> since January 1st of last year.",
    "question_concept": "Total patients diagnosed with <CONDITION>4209423</CONDITION> no later than 3 months after they were diagnosed with <CONDITION>437474</CONDITION> since January 1st of last year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "Give me the count of patients with a diagnosis of <CONDITION>Nicotine dependence</CONDITION> no later than 3 months after they were diagnosed with <CONDITION>Postoperative infection</CONDITION> starting January 1st of the previous year.",
    "question_concept": "Give me the count of patients with a diagnosis of <CONDITION>4209423</CONDITION> no later than 3 months after they were diagnosed with <CONDITION>437474</CONDITION> starting January 1st of the previous year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "What is the count of patients diagnosed with <CONDITION>Nicotine dependence</CONDITION> three months after a prior diagnosis of <CONDITION>Postoperative infection</CONDITION> since the beginning of the previous year.",
    "question_concept": "What is the count of patients diagnosed with <CONDITION>4209423</CONDITION> three months after a prior diagnosis of <CONDITION>437474</CONDITION> since the beginning of the previous year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "Identify the number of patients diagnosed with <CONDITION>Nicotine dependence</CONDITION> within a 3-month period post-diagnosis of <CONDITION>Postoperative infection</CONDITION> since the beginning of the previous year.",
    "question_concept": "Identify the number of patients diagnosed with <CONDITION>4209423</CONDITION> within a 3-month period post-diagnosis of <CONDITION>437474</CONDITION> since the beginning of the previous year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "Retrieve the count of individuals diagnosed with <CONDITION>Nicotine dependence</CONDITION> no more than 3 months after diagnosis of <CONDITION>Postoperative infection</CONDITION> since the first day of last year.",
    "question_concept": "Retrieve the count of individuals diagnosed with <CONDITION>4209423</CONDITION> no more than 3 months after diagnosis of <CONDITION>437474</CONDITION> since the first day of last year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "Give me the count of patients with a diagnosis of <CONDITION>Nicotine dependence</CONDITION> within 3 months after a diagnosis of <CONDITION>Postoperative infection</CONDITION> from the start of the last calendar year.",
    "question_concept": "Give me the count of patients with a diagnosis of <CONDITION>4209423</CONDITION> within 3 months after a diagnosis of <CONDITION>437474</CONDITION> from the start of the last calendar year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "Tell me how many people have been diagnosed with <CONDITION>Nicotine dependence</CONDITION> after being diagnosed with, within 3 months <CONDITION>Postoperative infection</CONDITION> since January 1st of last year.",
    "question_concept": "Tell me how many people have been diagnosed with <CONDITION>4209423</CONDITION> after being diagnosed with, within 3 months <CONDITION>437474</CONDITION> since January 1st of last year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "Retrieve the count of individuals diagnosed with <CONDITION>Nicotine dependence</CONDITION> no more than 3 months after diagnosis of <CONDITION>Postoperative infection</CONDITION> since the beginning of last year.",
    "question_concept": "Retrieve the count of individuals diagnosed with <CONDITION>4209423</CONDITION> no more than 3 months after diagnosis of <CONDITION>437474</CONDITION> since the beginning of last year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "Give me the count of patients with a diagnosis of <CONDITION>Nicotine dependence</CONDITION> three months after a prior diagnosis of <CONDITION>Postoperative infection</CONDITION> from January 1st last year.",
    "question_concept": "Give me the count of patients with a diagnosis of <CONDITION>4209423</CONDITION> three months after a prior diagnosis of <CONDITION>437474</CONDITION> from January 1st last year.",
    "sql": "SELECT COUNT(DISTINCT c1.person_id) AS patient_count FROM condition_occurrence c1 WHERE c1.condition_concept_id = 4209423 AND EXISTS (SELECT 1 FROM condition_occurrence c2 WHERE c2.person_id = c1.person_id AND c2.condition_concept_id = 437474 AND c2.condition_start_date >= DATE_TRUNC('year', CURRENT_DATE) - INTERVAL '1 year' AND c1.condition_start_date BETWEEN c2.condition_start_date AND c2.condition_start_date + INTERVAL '3 months');",
    "template": "count the number of patients who were diagnosed with {diagnosis_name2} [time_filter_within] after having been diagnosed with {diagnosis_name1} [time_filter_global1]."
  },
  {
    "question_name": "Identify the number of patients diagnosed with <CONDITION>Nicotine dependence</CONDITION> after being diagnosed with, within 3 months <CONDITION>Postoperative infection</CONDITION> from the start of last year onward.",
    "question_concept": "Identify the number of patients diagnosed with <CONDITION>4209423</CONDITION> after being diagnosed with, within 3 months <CONDITION>437474</CONDITION> from the start of last year onward.",
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
    "question_name": "When was the second time that patient 6082951626122164742 was diagnosed with <CONDITION>Acute on chronic diastolic heart failure</CONDITION> until last year?",
    "question_concept": "When was the second time that patient 6082951626122164742 was diagnosed with <CONDITION>40481043</CONDITION> until last year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Give the date of the second occurrence for patient 6082951626122164742 received a diagnosis of <CONDITION>Acute on chronic diastolic heart failure</CONDITION> before January 1st of this year?",
    "question_concept": "Give the date of the second occurrence for patient 6082951626122164742 received a diagnosis of <CONDITION>40481043</CONDITION> before January 1st of this year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Could you find when patient 6082951626122164742 was identified with <CONDITION>Acute on chronic diastolic heart failure</CONDITION> prior to this calendar year?",
    "question_concept": "Could you find when patient 6082951626122164742 was identified with <CONDITION>40481043</CONDITION> prior to this calendar year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "When exactly did patient 6082951626122164742 got diagnosed with <CONDITION>Acute on chronic diastolic heart failure</CONDITION> until the last day of the previous year?",
    "question_concept": "When exactly did patient 6082951626122164742 got diagnosed with <CONDITION>40481043</CONDITION> until the last day of the previous year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Give the date of the second occurrence for patient 6082951626122164742 was confirmed with <CONDITION>Acute on chronic diastolic heart failure</CONDITION> as of last year end?",
    "question_concept": "Give the date of the second occurrence for patient 6082951626122164742 was confirmed with <CONDITION>40481043</CONDITION> as of last year end?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Identify the second diagnosis date for patient 6082951626122164742 was diagnosed with <CONDITION>Acute on chronic diastolic heart failure</CONDITION> until the last day of the previous year?",
    "question_concept": "Identify the second diagnosis date for patient 6082951626122164742 was diagnosed with <CONDITION>40481043</CONDITION> until the last day of the previous year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "When did patient 6082951626122164742 was treated for <CONDITION>Acute on chronic diastolic heart failure</CONDITION> before the beginning of this year?",
    "question_concept": "When did patient 6082951626122164742 was treated for <CONDITION>40481043</CONDITION> before the beginning of this year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "When exactly did patient 6082951626122164742 showed signs of <CONDITION>Acute on chronic diastolic heart failure</CONDITION> up to the end of the previous year?",
    "question_concept": "When exactly did patient 6082951626122164742 showed signs of <CONDITION>40481043</CONDITION> up to the end of the previous year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Identify the second diagnosis date for patient 6082951626122164742 was diagnosed with <CONDITION>Acute on chronic diastolic heart failure</CONDITION> before this year started?",
    "question_concept": "Identify the second diagnosis date for patient 6082951626122164742 was diagnosed with <CONDITION>40481043</CONDITION> before this year started?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Can you tell me when patient 6082951626122164742 was treated for <CONDITION>Acute on chronic diastolic heart failure</CONDITION> up to the end of the previous year?",
    "question_concept": "Can you tell me when patient 6082951626122164742 was treated for <CONDITION>40481043</CONDITION> up to the end of the previous year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Please provide the date for the second diagnosis of 6082951626122164742 had a diagnosis of <CONDITION>Acute on chronic diastolic heart failure</CONDITION> until the last day of the previous year?",
    "question_concept": "Please provide the date for the second diagnosis of 6082951626122164742 had a diagnosis of <CONDITION>40481043</CONDITION> until the last day of the previous year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "What was the date of the second time patient 6082951626122164742 was identified with <CONDITION>Acute on chronic diastolic heart failure</CONDITION> before this year started?",
    "question_concept": "What was the date of the second time patient 6082951626122164742 was identified with <CONDITION>40481043</CONDITION> before this year started?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Can you tell me when patient 6082951626122164742 was found to have <CONDITION>Acute on chronic diastolic heart failure</CONDITION> until the end of last year?",
    "question_concept": "Can you tell me when patient 6082951626122164742 was found to have <CONDITION>40481043</CONDITION> until the end of last year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Could you find when patient 6082951626122164742 was identified with <CONDITION>Acute on chronic diastolic heart failure</CONDITION> by the close of last year?",
    "question_concept": "Could you find when patient 6082951626122164742 was identified with <CONDITION>40481043</CONDITION> by the close of last year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "When did patient 6082951626122164742 was treated for <CONDITION>Acute on chronic diastolic heart failure</CONDITION> before January 1st of this year?",
    "question_concept": "When did patient 6082951626122164742 was treated for <CONDITION>40481043</CONDITION> before January 1st of this year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Identify the second diagnosis date for patient 6082951626122164742 got diagnosed with <CONDITION>Acute on chronic diastolic heart failure</CONDITION> prior to this calendar year?",
    "question_concept": "Identify the second diagnosis date for patient 6082951626122164742 got diagnosed with <CONDITION>40481043</CONDITION> prior to this calendar year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Give the date of the second occurrence for patient 6082951626122164742 had a diagnosis of <CONDITION>Acute on chronic diastolic heart failure</CONDITION> before the beginning of this year?",
    "question_concept": "Give the date of the second occurrence for patient 6082951626122164742 had a diagnosis of <CONDITION>40481043</CONDITION> before the beginning of this year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Can you tell me when patient 6082951626122164742 was diagnosed with <CONDITION>Acute on chronic diastolic heart failure</CONDITION> until the last day of the previous year?",
    "question_concept": "Can you tell me when patient 6082951626122164742 was diagnosed with <CONDITION>40481043</CONDITION> until the last day of the previous year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "When exactly did patient 6082951626122164742 was found to have <CONDITION>Acute on chronic diastolic heart failure</CONDITION> prior to this calendar year?",
    "question_concept": "When exactly did patient 6082951626122164742 was found to have <CONDITION>40481043</CONDITION> prior to this calendar year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "When exactly did patient 6082951626122164742 received a diagnosis of <CONDITION>Acute on chronic diastolic heart failure</CONDITION> by the close of last year?",
    "question_concept": "When exactly did patient 6082951626122164742 received a diagnosis of <CONDITION>40481043</CONDITION> by the close of last year?",
    "sql": "SELECT condition_occurrence_id FROM (SELECT co.condition_occurrence_id, co.condition_start_date, ROW_NUMBER() OVER (ORDER BY co.condition_start_date) AS rn FROM condition_occurrence co WHERE co.person_id = 6082951626122164742 AND co.condition_concept_id = 40481043 AND co.condition_start_date < DATE_TRUNC('year', CURRENT_DATE)) AS ordered_conditions WHERE rn = 2;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  {
    "question_name": "Identify the second diagnosis date for patient 6082951626122164742 showed signs of <CONDITION>Acute on chronic diastolic heart failure</CONDITION> before the beginning of this year?",
    "question_concept": "Identify the second diagnosis date for patient 6082951626122164742 showed signs of <CONDITION>40481043</CONDITION> before the beginning of this year?",
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
    "question_name": "What is the age of patient <PERSON_ID>7333484583531995140</PERSON_ID> until last month?",
    "question_concept": "What is the age of patient <PERSON_ID>7333484583531995140</PERSON_ID> until last month?",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "How old was the patient <PERSON_ID>7333484583531995140</PERSON_ID> as of the end of last month?",
    "question_concept": "How old was the patient <PERSON_ID>7333484583531995140</PERSON_ID> as of the end of last month?",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Can you tell me the age of patient <PERSON_ID>7333484583531995140</PERSON_ID> up to the last month?",
    "question_concept": "Can you tell me the age of patient <PERSON_ID>7333484583531995140</PERSON_ID> up to the last month?",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "What was the patient's age <PERSON_ID>7333484583531995140</PERSON_ID> before this month?",
    "question_concept": "What was the patient's age <PERSON_ID>7333484583531995140</PERSON_ID> before this month?",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Give me the age of patient <PERSON_ID>7333484583531995140</PERSON_ID> as of last month.",
    "question_concept": "Give me the age of patient <PERSON_ID>7333484583531995140</PERSON_ID> as of last month.",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "What is the patient's age <PERSON_ID>7333484583531995140</PERSON_ID> calculated until the previous month?",
    "question_concept": "What is the patient's age <PERSON_ID>7333484583531995140</PERSON_ID> calculated until the previous month?",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Find the age of <PERSON_ID>7333484583531995140</PERSON_ID> as of the last completed month.",
    "question_concept": "Find the age of <PERSON_ID>7333484583531995140</PERSON_ID> as of the last completed month.",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "What was the age of <PERSON_ID>7333484583531995140</PERSON_ID> by the end of last month?",
    "question_concept": "What was the age of <PERSON_ID>7333484583531995140</PERSON_ID> by the end of last month?",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Please provide the age of patient <PERSON_ID>7333484583531995140</PERSON_ID> up to last month.",
    "question_concept": "Please provide the age of patient <PERSON_ID>7333484583531995140</PERSON_ID> up to last month.",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "How old is <PERSON_ID>7333484583531995140</PERSON_ID> if you calculate until the last month?",
    "question_concept": "How old is <PERSON_ID>7333484583531995140</PERSON_ID> if you calculate until the last month?",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Determine the age of patient <PERSON_ID>7333484583531995140</PERSON_ID> before this month started.",
    "question_concept": "Determine the age of patient <PERSON_ID>7333484583531995140</PERSON_ID> before this month started.",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "I need the age of <PERSON_ID>7333484583531995140</PERSON_ID> up to the end of last month.",
    "question_concept": "I need the age of <PERSON_ID>7333484583531995140</PERSON_ID> up to the end of last month.",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Retrieve the age of patient <PERSON_ID>7333484583531995140</PERSON_ID> calculated through last month.",
    "question_concept": "Retrieve the age of patient <PERSON_ID>7333484583531995140</PERSON_ID> calculated through last month.",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Could you tell me the age of <PERSON_ID>7333484583531995140</PERSON_ID> as of last month?",
    "question_concept": "Could you tell me the age of <PERSON_ID>7333484583531995140</PERSON_ID> as of last month?",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "As of the last month, what is the age of <PERSON_ID>7333484583531995140</PERSON_ID>?",
    "question_concept": "As of the last month, what is the age of <PERSON_ID>7333484583531995140</PERSON_ID>?",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Report the patient's age <PERSON_ID>7333484583531995140</PERSON_ID> up to the previous month.",
    "question_concept": "Report the patient's age <PERSON_ID>7333484583531995140</PERSON_ID> up to the previous month.",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Give the age of <PERSON_ID>7333484583531995140</PERSON_ID> ending last month.",
    "question_concept": "Give the age of <PERSON_ID>7333484583531995140</PERSON_ID> ending last month.",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Provide the patient's age <PERSON_ID>7333484583531995140</PERSON_ID> as of the previous month.",
    "question_concept": "Provide the patient's age <PERSON_ID>7333484583531995140</PERSON_ID> as of the previous month.",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "How old is <PERSON_ID>7333484583531995140</PERSON_ID> considered at the end of last month?",
    "question_concept": "How old is <PERSON_ID>7333484583531995140</PERSON_ID> considered at the end of last month?",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Get the age of patient <PERSON_ID>7333484583531995140</PERSON_ID> through the end of last month.",
    "question_concept": "Get the age of patient <PERSON_ID>7333484583531995140</PERSON_ID> through the end of last month.",
    "sql": "SELECT DATE_PART('year', age((date_trunc('month', CURRENT_DATE) - INTERVAL '1 day')::date, (SELECT p.birth_datetime FROM person p WHERE p.person_id = 7333484583531995140))) AS age_last_month;",
    "template": "what is_verb the age of patient {patient_id} [time_filter_global1]?"
  },
  {
    "question_name": "Fetch the age of <PERSON_ID>7333484583531995140</PERSON_ID> till the end of the last month.",
    "question_concept": "Fetch the age of <PERSON_ID>7333484583531995140</PERSON_ID> till the end of the last month.",
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
    "question_name": "How many days have passed since the second time patient <PERSON_ID>4500356454715756250</PERSON_ID> stayed in careunit <CAREUNIT>Psychiatry department</CAREUNIT> on the current hospital visit?",
    "question_concept": "How many days have passed since the second time patient <PERSON_ID>4500356454715756250</PERSON_ID> stayed in careunit <CAREUNIT>4150077</CAREUNIT> on the current hospital visit?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "How long has it been since the second stay of patient <PERSON_ID>4500356454715756250</PERSON_ID> in careunit <CAREUNIT>Psychiatry department</CAREUNIT> during the current hospital visit?",
    "question_concept": "How long has it been since the second stay of patient <PERSON_ID>4500356454715756250</PERSON_ID> in careunit <CAREUNIT>4150077</CAREUNIT> during the current hospital visit?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "What is the number of days since patient <PERSON_ID>4500356454715756250</PERSON_ID> was in careunit <CAREUNIT>Psychiatry department</CAREUNIT> for the second time on this hospital visit?",
    "question_concept": "What is the number of days since patient <PERSON_ID>4500356454715756250</PERSON_ID> was in careunit <CAREUNIT>4150077</CAREUNIT> for the second time on this hospital visit?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "How many days ago was patient <PERSON_ID>4500356454715756250</PERSON_ID>'s second stay in careunit <CAREUNIT>Psychiatry department</CAREUNIT> during the current hospitalization?",
    "question_concept": "How many days ago was patient <PERSON_ID>4500356454715756250</PERSON_ID>'s second stay in careunit <CAREUNIT>4150077</CAREUNIT> during the current hospitalization?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "Since the second admission of <PERSON_ID>4500356454715756250</PERSON_ID> to <CAREUNIT>Psychiatry department</CAREUNIT>, how many days have passed?",
    "question_concept": "Since the second admission of <PERSON_ID>4500356454715756250</PERSON_ID> to <CAREUNIT>4150077</CAREUNIT>, how many days have passed?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "How much time has passed since <PERSON_ID>4500356454715756250</PERSON_ID> was in <CAREUNIT>Psychiatry department</CAREUNIT> for the second time in the current hospital stay?",
    "question_concept": "How much time has passed since <PERSON_ID>4500356454715756250</PERSON_ID> was in <CAREUNIT>4150077</CAREUNIT> for the second time in the current hospital stay?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "Days since the second stay of <PERSON_ID>4500356454715756250</PERSON_ID> in <CAREUNIT>Psychiatry department</CAREUNIT> on this hospital visit?",
    "question_concept": "Days since the second stay of <PERSON_ID>4500356454715756250</PERSON_ID> in <CAREUNIT>4150077</CAREUNIT> on this hospital visit?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "How many days passed since the second occurrence of <PERSON_ID>4500356454715756250</PERSON_ID> being in <CAREUNIT>Psychiatry department</CAREUNIT> during the ongoing hospital visit?",
    "question_concept": "How many days passed since the second occurrence of <PERSON_ID>4500356454715756250</PERSON_ID> being in <CAREUNIT>4150077</CAREUNIT> during the ongoing hospital visit?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "When did the second stay of patient <PERSON_ID>4500356454715756250</PERSON_ID> in careunit <CAREUNIT>Psychiatry department</CAREUNIT> happen, in days from today?",
    "question_concept": "When did the second stay of patient <PERSON_ID>4500356454715756250</PERSON_ID> in careunit <CAREUNIT>4150077</CAREUNIT> happen, in days from today?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "Count the days since <PERSON_ID>4500356454715756250</PERSON_ID> last visited <CAREUNIT>Psychiatry department</CAREUNIT> for the second time this visit.",
    "question_concept": "Count the days since <PERSON_ID>4500356454715756250</PERSON_ID> last visited <CAREUNIT>4150077</CAREUNIT> for the second time this visit.",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "How many calendar days have passed since <PERSON_ID>4500356454715756250</PERSON_ID> was in <CAREUNIT>Psychiatry department</CAREUNIT> for their second visit during this hospital stay?",
    "question_concept": "How many calendar days have passed since <PERSON_ID>4500356454715756250</PERSON_ID> was in <CAREUNIT>4150077</CAREUNIT> for their second visit during this hospital stay?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "Tell me how long it's been since <PERSON_ID>4500356454715756250</PERSON_ID> stayed in <CAREUNIT>Psychiatry department</CAREUNIT> for the second time during the current hospitalization.",
    "question_concept": "Tell me how long it's been since <PERSON_ID>4500356454715756250</PERSON_ID> stayed in <CAREUNIT>4150077</CAREUNIT> for the second time during the current hospitalization.",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "Time in days since the second time <PERSON_ID>4500356454715756250</PERSON_ID> entered <CAREUNIT>Psychiatry department</CAREUNIT> on this hospital visit?",
    "question_concept": "Time in days since the second time <PERSON_ID>4500356454715756250</PERSON_ID> entered <CAREUNIT>4150077</CAREUNIT> on this hospital visit?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "How many days back did <PERSON_ID>4500356454715756250</PERSON_ID> stay in <CAREUNIT>Psychiatry department</CAREUNIT> for the second time during the present visit?",
    "question_concept": "How many days back did <PERSON_ID>4500356454715756250</PERSON_ID> stay in <CAREUNIT>4150077</CAREUNIT> for the second time during the present visit?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "Find the day difference since the second stay of <PERSON_ID>4500356454715756250</PERSON_ID> in <CAREUNIT>Psychiatry department</CAREUNIT> during this hospitalization.",
    "question_concept": "Find the day difference since the second stay of <PERSON_ID>4500356454715756250</PERSON_ID> in <CAREUNIT>4150077</CAREUNIT> during this hospitalization.",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "Number of days since patient <PERSON_ID>4500356454715756250</PERSON_ID>'s second encounter in <CAREUNIT>Psychiatry department</CAREUNIT> on the current visit?",
    "question_concept": "Number of days since patient <PERSON_ID>4500356454715756250</PERSON_ID>'s second encounter in <CAREUNIT>4150077</CAREUNIT> on the current visit?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "Give the days elapsed since <PERSON_ID>4500356454715756250</PERSON_ID> had their second stay in <CAREUNIT>Psychiatry department</CAREUNIT> on this hospital visit.",
    "question_concept": "Give the days elapsed since <PERSON_ID>4500356454715756250</PERSON_ID> had their second stay in <CAREUNIT>4150077</CAREUNIT> on this hospital visit.",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "What is the elapsed time in days since the second time <PERSON_ID>4500356454715756250</PERSON_ID> stayed in <CAREUNIT>Psychiatry department</CAREUNIT> during the ongoing hospital stay?",
    "question_concept": "What is the elapsed time in days since the second time <PERSON_ID>4500356454715756250</PERSON_ID> stayed in <CAREUNIT>4150077</CAREUNIT> during the ongoing hospital stay?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "How many full days since the second time <PERSON_ID>4500356454715756250</PERSON_ID> was admitted to <CAREUNIT>Psychiatry department</CAREUNIT> on this visit?",
    "question_concept": "How many full days since the second time <PERSON_ID>4500356454715756250</PERSON_ID> was admitted to <CAREUNIT>4150077</CAREUNIT> on this visit?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "From today, how many days ago was the second stay of <PERSON_ID>4500356454715756250</PERSON_ID> in <CAREUNIT>Psychiatry department</CAREUNIT> during the current hospitalization?",
    "question_concept": "From today, how many days ago was the second stay of <PERSON_ID>4500356454715756250</PERSON_ID> in <CAREUNIT>4150077</CAREUNIT> during the current hospitalization?",
    "sql": "SELECT CURRENT_DATE - (SELECT visit_detail_start_date FROM (SELECT visit_detail_start_date FROM visit_detail WHERE person_id = 4500356454715756250 AND visit_detail_concept_id = 4150077 AND visit_occurrence_id = (SELECT MAX(visit_occurrence_id) FROM visit_occurrence WHERE person_id = 4500356454715756250) ORDER BY visit_detail_start_date OFFSET 1 LIMIT 1) AS second_visit) AS days_since_second_careunit_visit;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} stayed in careunit {careunit} on the current hospital visit?"
  },
  {
    "question_name": "What duration in days has passed since the second instance of patient <PERSON_ID>4500356454715756250</PERSON_ID> in careunit <CAREUNIT>Psychiatry department</CAREUNIT> this visit?",
    "question_concept": "What duration in days has passed since the second instance of patient <PERSON_ID>4500356454715756250</PERSON_ID> in careunit <CAREUNIT>4150077</CAREUNIT> this visit?",
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
  {
    "question_name": "Which three procedures are most common for patients in their 50s during their first hospital stay?",
    "question_concept": "Which three procedures are most common for patients in their 50s during their first hospital stay?",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What are the three most frequent procedures undergone by patients aged 50 to 59 on their first hospital visit?",
    "question_concept": "What are the three most frequent procedures undergone by patients aged 50 to 59 on their first hospital visit?",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "List the top 3 procedures for patients aged in their 50s at the time of their initial hospital admission.",
    "question_concept": "List the top 3 procedures for patients aged in their 50s at the time of their initial hospital admission.",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What procedures are most frequently performed for patients in their 50s on their first hospital visit?",
    "question_concept": "What procedures are most frequently performed for patients in their 50s on their first hospital visit?",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Can you list the top three procedures for patients aged between 50 and 59 during their initial hospitalization?",
    "question_concept": "Can you list the top three procedures for patients aged between 50 and 59 during their initial hospitalization?",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Which procedures are most commonly recorded for patients in their 50s on their first visit to the hospital?",
    "question_concept": "Which procedures are most commonly recorded for patients in their 50s on their first visit to the hospital?",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What are the most frequent three procedures among 50-something patients during their first hospital stay?",
    "question_concept": "What are the most frequent three procedures among 50-something patients during their first hospital stay?",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Identify the top 3 procedures for patients aged 50-59 on their first hospital admission.",
    "question_concept": "Identify the top 3 procedures for patients aged 50-59 on their first hospital admission.",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What are the leading three procedures in patients aged in their fifties on first admission?",
    "question_concept": "What are the leading three procedures in patients aged in their fifties on first admission?",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Top three procedures for patients in their 50s on their first hospital encounter?",
    "question_concept": "Top three procedures for patients in their 50s on their first hospital encounter?",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What are the most common procedures among patients in their fifties on their first hospital visit?",
    "question_concept": "What are the most common procedures among patients in their fifties on their first hospital visit?",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Tell me the three most performed procedures for 50-year-old patients on their first hospital stay.",
    "question_concept": "Tell me the three most performed procedures for 50-year-old patients on their first hospital stay.",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Which are the top three procedures among patients aged 50s at the time of their first hospitalization?",
    "question_concept": "Which are the top three procedures among patients aged 50s at the time of their first hospitalization?",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What are the most frequent three procedures received by patients in their 50s on their initial visit?",
    "question_concept": "What are the most frequent three procedures received by patients in their 50s on their initial visit?",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "List the top 3 most common procedures for patients aged between 50 and 59 on their first hospital visit.",
    "question_concept": "List the top 3 most common procedures for patients aged between 50 and 59 on their first hospital visit.",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What are the three top-used procedures for people aged 50-59 during their first hospital visit?",
    "question_concept": "What are the three top-used procedures for people aged 50-59 during their first hospital visit?",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Name the top three procedures conducted most often for patients aged in their 50s on first hospital contact.",
    "question_concept": "Name the top three procedures conducted most often for patients aged in their 50s on first hospital contact.",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Which procedures were most frequent in patients aged 50s during their initial hospitalization?",
    "question_concept": "Which procedures were most frequent in patients aged 50s during their initial hospitalization?",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "What three procedures are most frequent among patients aged 50 to 59 on their first hospital visit?",
    "question_concept": "What three procedures are most frequent among patients aged 50 to 59 on their first hospital visit?",
    "sql": "SELECT procedure_concept_id, COUNT(*) AS procedure_count FROM procedure_occurrence WHERE person_id IN (SELECT person_id FROM (SELECT person_id, EXTRACT(YEAR FROM visit_start_date) - year_of_birth AS age, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM (SELECT person_id, visit_start_date FROM visit_occurrence) v INNER JOIN (SELECT person_id, year_of_birth FROM person) p USING (person_id)) sub WHERE rn = 1 AND age BETWEEN 50 AND 59) AND visit_occurrence_id IN (SELECT visit_occurrence_id FROM (SELECT person_id, visit_occurrence_id, ROW_NUMBER() OVER (PARTITION BY person_id ORDER BY visit_start_date) AS rn FROM visit_occurrence) vo WHERE rn = 1) GROUP BY procedure_concept_id ORDER BY procedure_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent procedures of patients aged [age_group] [time_filter_global1]?"
  },
  {
    "question_name": "Give the most common three procedures performed on patients aged in their 50s on first hospital entry.",
    "question_concept": "Give the most common three procedures performed on patients aged in their 50s on first hospital entry.",
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
    "question_name": "What was the name of the measurement that patient <PERSON_ID>2185246955166355889</PERSON_ID> at 7:12:33 had on the first hospital visit?",
    "question_concept": "What was the name of the measurement that patient <PERSON_ID>2185246955166355889</PERSON_ID> at 7:12:33 had on the first hospital visit?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "Which measurement name was recorded for patient <PERSON_ID>2185246955166355889</PERSON_ID> at 7:12:33 during their first hospital stay?",
    "question_concept": "Which measurement name was recorded for patient <PERSON_ID>2185246955166355889</PERSON_ID> at 7:12:33 during their first hospital stay?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "What measurement did patient <PERSON_ID>2185246955166355889</PERSON_ID> undergo at 7:12:33 on their first hospital admission?",
    "question_concept": "What measurement did patient <PERSON_ID>2185246955166355889</PERSON_ID> undergo at 7:12:33 on their first hospital admission?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "At 7:12:33, what was the name of the measurement for patient <PERSON_ID>2185246955166355889</PERSON_ID> during their initial hospital visit?",
    "question_concept": "At 7:12:33, what was the name of the measurement for patient <PERSON_ID>2185246955166355889</PERSON_ID> during their initial hospital visit?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "Name the measurement taken at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> during the first hospital visit.",
    "question_concept": "Name the measurement taken at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> during the first hospital visit.",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "What was the title of the measurement done at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> during their first hospital stay?",
    "question_concept": "What was the title of the measurement done at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> during their first hospital stay?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "Patient <PERSON_ID>2185246955166355889</PERSON_ID> had a measurement at 7:12:33 - what was its name during their first hospital visit?",
    "question_concept": "Patient <PERSON_ID>2185246955166355889</PERSON_ID> had a measurement at 7:12:33 - what was its name during their first hospital visit?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "During the first hospital admission, what measurement was recorded at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID>?",
    "question_concept": "During the first hospital admission, what measurement was recorded at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID>?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "Identify the measurement name for patient <PERSON_ID>2185246955166355889</PERSON_ID> taken at 7:12:33 on their first hospital visit.",
    "question_concept": "Identify the measurement name for patient <PERSON_ID>2185246955166355889</PERSON_ID> taken at 7:12:33 on their first hospital visit.",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "What was the measurement called that was taken at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> during their first hospital stay?",
    "question_concept": "What was the measurement called that was taken at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> during their first hospital stay?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "Give the name of the measurement recorded at 7:12:33 during patient <PERSON_ID>2185246955166355889</PERSON_ID>'s first hospital visit.",
    "question_concept": "Give the name of the measurement recorded at 7:12:33 during patient <PERSON_ID>2185246955166355889</PERSON_ID>'s first hospital visit.",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "What is the name of the measurement that was performed at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> during their first admission?",
    "question_concept": "What is the name of the measurement that was performed at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> during their first admission?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "Which measurement was documented at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> during their first hospital admission?",
    "question_concept": "Which measurement was documented at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> during their first hospital admission?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "What was the designation of the measurement for patient <PERSON_ID>2185246955166355889</PERSON_ID> taken at 7:12:33 during their initial hospital stay?",
    "question_concept": "What was the designation of the measurement for patient <PERSON_ID>2185246955166355889</PERSON_ID> taken at 7:12:33 during their initial hospital stay?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "Name the test performed on patient <PERSON_ID>2185246955166355889</PERSON_ID> at 7:12:33 on their first hospital visit.",
    "question_concept": "Name the test performed on patient <PERSON_ID>2185246955166355889</PERSON_ID> at 7:12:33 on their first hospital visit.",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "At 7:12:33, which measurement was noted for patient <PERSON_ID>2185246955166355889</PERSON_ID> on their initial hospital admission?",
    "question_concept": "At 7:12:33, which measurement was noted for patient <PERSON_ID>2185246955166355889</PERSON_ID> on their initial hospital admission?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "What measurement was conducted for patient <PERSON_ID>2185246955166355889</PERSON_ID> at 7:12:33 during their first hospital encounter?",
    "question_concept": "What measurement was conducted for patient <PERSON_ID>2185246955166355889</PERSON_ID> at 7:12:33 during their first hospital encounter?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "What was the label of the measurement at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> on their first visit to the hospital?",
    "question_concept": "What was the label of the measurement at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> on their first visit to the hospital?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "What measurement was logged at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> on their first hospital stay?",
    "question_concept": "What measurement was logged at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> on their first hospital stay?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "Can you name the measurement for patient <PERSON_ID>2185246955166355889</PERSON_ID> at 7:12:33 on their first hospital admission?",
    "question_concept": "Can you name the measurement for patient <PERSON_ID>2185246955166355889</PERSON_ID> at 7:12:33 on their first hospital admission?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
    "template": "what was the name of the measurement that patient {patient_id} [time_filter_exact1] had [time_filter_global1]?"
  },
  {
    "question_name": "What test name corresponds to the measurement done at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> during their first hospital visit?",
    "question_concept": "What test name corresponds to the measurement done at 7:12:33 for patient <PERSON_ID>2185246955166355889</PERSON_ID> during their first hospital visit?",
    "sql": "SELECT c.concept_name AS measurement_name FROM person p JOIN visit_occurrence vo ON p.person_id = vo.person_id JOIN measurement m ON m.person_id = p.person_id AND m.visit_occurrence_id = vo.visit_occurrence_id JOIN concept c ON m.measurement_concept_id = c.concept_id WHERE p.person_id = 2185246955166355889 AND m.measurement_datetime::time = '07:12:33' AND vo.visit_occurrence_id = (SELECT vo2.visit_occurrence_id FROM visit_occurrence vo2 WHERE vo2.person_id = p.person_id ORDER BY vo2.visit_start_datetime LIMIT 1);",
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
    "question_name": "How many patients are currently admitted?",
    "question_concept": "How many patients are currently admitted?",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "What is the number of patients still in the hospital?",
    "question_concept": "What is the number of patients still in the hospital?",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "Give the count of current inpatients.",
    "question_concept": "Give the count of current inpatients.",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "How many patients are currently staying in the hospital?",
    "question_concept": "How many patients are currently staying in the hospital?",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "What is the total number of patients currently admitted?",
    "question_concept": "What is the total number of patients currently admitted?",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "Count how many patients are presently hospitalized.",
    "question_concept": "Count how many patients are presently hospitalized.",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "How many individuals are still admitted to the hospital?",
    "question_concept": "How many individuals are still admitted to the hospital?",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "Provide the count of patients currently under hospital care.",
    "question_concept": "Provide the count of patients currently under hospital care.",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "What's the number of patients currently in the hospital?",
    "question_concept": "What's the number of patients currently in the hospital?",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "Can you count the patients who haven't been discharged yet?",
    "question_concept": "Can you count the patients who haven't been discharged yet?",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "How many patients have not yet left the hospital?",
    "question_concept": "How many patients have not yet left the hospital?",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "What\u2019s the number of patients still undergoing treatment in the hospital?",
    "question_concept": "What\u2019s the number of patients still undergoing treatment in the hospital?",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "Count all the patients with ongoing hospital visits.",
    "question_concept": "Count all the patients with ongoing hospital visits.",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "How many people are currently listed as inpatients?",
    "question_concept": "How many people are currently listed as inpatients?",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "Give the number of patients who are still checked into the hospital.",
    "question_concept": "Give the number of patients who are still checked into the hospital.",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "Tell me how many patients are still present in the hospital.",
    "question_concept": "Tell me how many patients are still present in the hospital.",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "What is the hospital's current inpatient count?",
    "question_concept": "What is the hospital's current inpatient count?",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "Report the total of current hospital admissions.",
    "question_concept": "Report the total of current hospital admissions.",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "How many hospital stays are still active?",
    "question_concept": "How many hospital stays are still active?",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
  {
    "question_name": "Number of patients currently being treated in the hospital?",
    "question_concept": "Number of patients currently being treated in the hospital?",
    "sql": "SELECT COUNT(*) AS current_patient_count FROM (SELECT DISTINCT v.person_id FROM visit_occurrence v WHERE v.visit_end_date IS NULL AND v.discharge_to_concept_id IS NULL) AS current_patients;",
    "template": "count the number of current patients."
  },
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
    "question_name": "In this month\u2019s first <MEASUREMENT>Chlamydia trachomatis [Presence] in Urine sediment by Organism specific culture</MEASUREMENT> test for patient <PERSON_ID>7776408132511994203</PERSON_ID>, has any organism been found?",
    "question_concept": "In this month\u2019s first <MEASUREMENT>3007813</MEASUREMENT> test for patient <PERSON_ID>7776408132511994203</PERSON_ID>, has any organism been found?",
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
    "question_name": "Is the <MEASUREMENT>Body temperature</MEASUREMENT> of patient <PERSON_ID>6333223435366125024</PERSON_ID> at 07:03:17 measured on the first ICU visit greater than the first value measured this year?",
    "question_concept": "Is the <MEASUREMENT>3020891</MEASUREMENT> of patient <PERSON_ID>6333223435366125024</PERSON_ID> at 07:03:17 measured on the first ICU visit greater than the first value measured this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "Was the <MEASUREMENT>Body temperature</MEASUREMENT> for patient <PERSON_ID>6333223435366125024</PERSON_ID> at 07:03:17 during the first ICU visit higher than the first value recorded this year?",
    "question_concept": "Was the <MEASUREMENT>3020891</MEASUREMENT> for patient <PERSON_ID>6333223435366125024</PERSON_ID> at 07:03:17 during the first ICU visit higher than the first value recorded this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "At 07:03:17, did patient <PERSON_ID>6333223435366125024</PERSON_ID> have a higher <MEASUREMENT>Body temperature</MEASUREMENT> in their first ICU stay than their first reading this year?",
    "question_concept": "At 07:03:17, did patient <PERSON_ID>6333223435366125024</PERSON_ID> have a higher <MEASUREMENT>3020891</MEASUREMENT> in their first ICU stay than their first reading this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "Is the <MEASUREMENT>Body temperature</MEASUREMENT> recorded at 07:03:17 for patient <PERSON_ID>6333223435366125024</PERSON_ID> on the first ICU visit greater than the first measurement this year?",
    "question_concept": "Is the <MEASUREMENT>3020891</MEASUREMENT> recorded at 07:03:17 for patient <PERSON_ID>6333223435366125024</PERSON_ID> on the first ICU visit greater than the first measurement this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "Did the <MEASUREMENT>Body temperature</MEASUREMENT> of patient <PERSON_ID>6333223435366125024</PERSON_ID> at 07:03:17 on their first ICU visit exceed the first value measured this year?",
    "question_concept": "Did the <MEASUREMENT>3020891</MEASUREMENT> of patient <PERSON_ID>6333223435366125024</PERSON_ID> at 07:03:17 on their first ICU visit exceed the first value measured this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "During their initial ICU stay, was the <MEASUREMENT>Body temperature</MEASUREMENT> of patient <PERSON_ID>6333223435366125024</PERSON_ID> at 07:03:17 higher than the year's first recorded value?",
    "question_concept": "During their initial ICU stay, was the <MEASUREMENT>3020891</MEASUREMENT> of patient <PERSON_ID>6333223435366125024</PERSON_ID> at 07:03:17 higher than the year's first recorded value?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "Was patient <PERSON_ID>6333223435366125024</PERSON_ID>'s <MEASUREMENT>Body temperature</MEASUREMENT> at 07:03:17 on the first ICU visit greater than the first measurement of this year?",
    "question_concept": "Was patient <PERSON_ID>6333223435366125024</PERSON_ID>'s <MEASUREMENT>3020891</MEASUREMENT> at 07:03:17 on the first ICU visit greater than the first measurement of this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "At 07:03:17, was the <MEASUREMENT>Body temperature</MEASUREMENT> for patient <PERSON_ID>6333223435366125024</PERSON_ID> during their first ICU stay more than the first value taken this year?",
    "question_concept": "At 07:03:17, was the <MEASUREMENT>3020891</MEASUREMENT> for patient <PERSON_ID>6333223435366125024</PERSON_ID> during their first ICU stay more than the first value taken this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "Was the <MEASUREMENT>Body temperature</MEASUREMENT> at 07:03:17 for patient <PERSON_ID>6333223435366125024</PERSON_ID> in the first ICU visit greater than the earliest measurement this year?",
    "question_concept": "Was the <MEASUREMENT>3020891</MEASUREMENT> at 07:03:17 for patient <PERSON_ID>6333223435366125024</PERSON_ID> in the first ICU visit greater than the earliest measurement this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "Is patient <PERSON_ID>6333223435366125024</PERSON_ID>'s <MEASUREMENT>Body temperature</MEASUREMENT> taken at 07:03:17 on their first ICU stay higher than the first value recorded this year?",
    "question_concept": "Is patient <PERSON_ID>6333223435366125024</PERSON_ID>'s <MEASUREMENT>3020891</MEASUREMENT> taken at 07:03:17 on their first ICU stay higher than the first value recorded this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "Did the first ICU visit value of <MEASUREMENT>Body temperature</MEASUREMENT> at 07:03:17 for patient <PERSON_ID>6333223435366125024</PERSON_ID> exceed the first recorded value this year?",
    "question_concept": "Did the first ICU visit value of <MEASUREMENT>3020891</MEASUREMENT> at 07:03:17 for patient <PERSON_ID>6333223435366125024</PERSON_ID> exceed the first recorded value this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "Was the <MEASUREMENT>Body temperature</MEASUREMENT> for patient <PERSON_ID>6333223435366125024</PERSON_ID> at 07:03:17 during the first ICU visit higher than the first value recorded this year?",
    "question_concept": "Was the <MEASUREMENT>3020891</MEASUREMENT> for patient <PERSON_ID>6333223435366125024</PERSON_ID> at 07:03:17 during the first ICU visit higher than the first value recorded this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "At 07:03:17, did patient <PERSON_ID>6333223435366125024</PERSON_ID> have a higher <MEASUREMENT>Body temperature</MEASUREMENT> in their first ICU stay than their first reading this year?",
    "question_concept": "At 07:03:17, did patient <PERSON_ID>6333223435366125024</PERSON_ID> have a higher <MEASUREMENT>3020891</MEASUREMENT> in their first ICU stay than their first reading this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "Is the <MEASUREMENT>Body temperature</MEASUREMENT> recorded at 07:03:17 for patient <PERSON_ID>6333223435366125024</PERSON_ID> on the first ICU visit greater than the first measurement this year?",
    "question_concept": "Is the <MEASUREMENT>3020891</MEASUREMENT> recorded at 07:03:17 for patient <PERSON_ID>6333223435366125024</PERSON_ID> on the first ICU visit greater than the first measurement this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "Did the <MEASUREMENT>Body temperature</MEASUREMENT> of patient <PERSON_ID>6333223435366125024</PERSON_ID> at 07:03:17 on their first ICU visit exceed the first value measured this year?",
    "question_concept": "Did the <MEASUREMENT>3020891</MEASUREMENT> of patient <PERSON_ID>6333223435366125024</PERSON_ID> at 07:03:17 on their first ICU visit exceed the first value measured this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "During their initial ICU stay, was the <MEASUREMENT>Body temperature</MEASUREMENT> of patient <PERSON_ID>6333223435366125024</PERSON_ID> at 07:03:17 higher than the year's first recorded value?",
    "question_concept": "During their initial ICU stay, was the <MEASUREMENT>3020891</MEASUREMENT> of patient <PERSON_ID>6333223435366125024</PERSON_ID> at 07:03:17 higher than the year's first recorded value?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "Was patient <PERSON_ID>6333223435366125024</PERSON_ID>'s <MEASUREMENT>Body temperature</MEASUREMENT> at 07:03:17 on the first ICU visit greater than the first measurement of this year?",
    "question_concept": "Was patient <PERSON_ID>6333223435366125024</PERSON_ID>'s <MEASUREMENT>3020891</MEASUREMENT> at 07:03:17 on the first ICU visit greater than the first measurement of this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "At 07:03:17, was the <MEASUREMENT>Body temperature</MEASUREMENT> for patient <PERSON_ID>6333223435366125024</PERSON_ID> during their first ICU stay more than the first value taken this year?",
    "question_concept": "At 07:03:17, was the <MEASUREMENT>3020891</MEASUREMENT> for patient <PERSON_ID>6333223435366125024</PERSON_ID> during their first ICU stay more than the first value taken this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "Was the <MEASUREMENT>Body temperature</MEASUREMENT> at 07:03:17 for patient <PERSON_ID>6333223435366125024</PERSON_ID> in the first ICU visit greater than the earliest measurement this year?",
    "question_concept": "Was the <MEASUREMENT>3020891</MEASUREMENT> at 07:03:17 for patient <PERSON_ID>6333223435366125024</PERSON_ID> in the first ICU visit greater than the earliest measurement this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "Is patient <PERSON_ID>6333223435366125024</PERSON_ID>'s <MEASUREMENT>Body temperature</MEASUREMENT> taken at 07:03:17 on their first ICU stay higher than the first value recorded this year?",
    "question_concept": "Is patient <PERSON_ID>6333223435366125024</PERSON_ID>'s <MEASUREMENT>3020891</MEASUREMENT> taken at 07:03:17 on their first ICU stay higher than the first value recorded this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  {
    "question_name": "Did the first ICU visit value of <MEASUREMENT>Body temperature</MEASUREMENT> at 07:03:17 for patient <PERSON_ID>6333223435366125024</PERSON_ID> exceed the first recorded value this year?",
    "question_concept": "Did the first ICU visit value of <MEASUREMENT>3020891</MEASUREMENT> at 07:03:17 for patient <PERSON_ID>6333223435366125024</PERSON_ID> exceed the first recorded value this year?",
    "sql": "WITH icu_concepts AS (SELECT concept_id FROM concept WHERE domain_id = 'Visit' AND concept_name ILIKE '%intensive care%' AND standard_concept = 'S'), first_icu_visit AS (SELECT vd.visit_detail_id FROM visit_detail vd JOIN icu_concepts ic ON vd.visit_detail_concept_id = ic.concept_id WHERE vd.person_id = 6333223435366125024 ORDER BY vd.visit_detail_start_datetime LIMIT 1), icu_measurement AS (SELECT m.value_as_number FROM measurement m JOIN first_icu_visit icu ON m.visit_detail_id = icu.visit_detail_id WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND TO_CHAR(m.measurement_datetime, 'HH24:MI:SS') = '07:03:17' ORDER BY m.measurement_datetime LIMIT 1), first_year_measurement AS (SELECT m.value_as_number FROM measurement m WHERE m.person_id = 6333223435366125024 AND m.measurement_concept_id = 3020891 AND m.measurement_datetime >= DATE_TRUNC('year', CURRENT_DATE) ORDER BY m.measurement_datetime LIMIT 1) SELECT (icu.value_as_number > first.value_as_number) AS result FROM icu_measurement icu CROSS JOIN first_year_measurement first;",
    "template": "is the {vital_name} of patient {patient_id} [time_filter_exact2] measured [time_filter_global2] [comparison] than the [time_filter_exact1] value measured [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Is the <MEASUREMENT>3024171</MEASUREMENT> of patient 1462077129225667345 second to last measured on the current ICU visit less than the second value measured on the first ICU visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Is the <MEASUREMENT>3036277</MEASUREMENT> of patient 6009130791199453547 last measured on the current ICU visit less than the at 2138-01-24 10:33:25 value measured this year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Is the <MEASUREMENT>3025315</MEASUREMENT> of patient 4378476518267020730 second measured since 03/01/2199) greater than the second to last value measured this month?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Is the <MEASUREMENT>3027018</MEASUREMENT> of patient 1503762333444408214 at 2139-02-22 11:40:54 measured on the current ICU visit greater than the second to last value measured since 06/24/2138)?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Has patient <PERSON_ID>1027943263163534509</PERSON_ID> received a <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test since last year?",
    "question_concept": "Has patient <PERSON_ID>1027943263163534509</PERSON_ID> received a <MEASUREMENT>3000620</MEASUREMENT> lab test since last year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Did patient <PERSON_ID>1027943263163534509</PERSON_ID> undergo a <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test since the beginning of last year?",
    "question_concept": "Did patient <PERSON_ID>1027943263163534509</PERSON_ID> undergo a <MEASUREMENT>3000620</MEASUREMENT> lab test since the beginning of last year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Has <PERSON_ID>1027943263163534509</PERSON_ID> been tested for <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test from January 1st of last year?",
    "question_concept": "Has <PERSON_ID>1027943263163534509</PERSON_ID> been tested for <MEASUREMENT>3000620</MEASUREMENT> lab test from January 1st of last year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Was a <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test starting at the beginning of the previous year?",
    "question_concept": "Was a <MEASUREMENT>3000620</MEASUREMENT> lab test starting at the beginning of the previous year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Did <PERSON_ID>1027943263163534509</PERSON_ID> receive the <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test since the start of the last calendar year?",
    "question_concept": "Did <PERSON_ID>1027943263163534509</PERSON_ID> receive the <MEASUREMENT>3000620</MEASUREMENT> lab test since the start of the last calendar year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Has patient <PERSON_ID>1027943263163534509</PERSON_ID> had a <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test since the first day of last year?",
    "question_concept": "Has patient <PERSON_ID>1027943263163534509</PERSON_ID> had a <MEASUREMENT>3000620</MEASUREMENT> lab test since the first day of last year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Was patient <PERSON_ID>1027943263163534509</PERSON_ID> subjected to a <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test since January first of the previous year?",
    "question_concept": "Was patient <PERSON_ID>1027943263163534509</PERSON_ID> subjected to a <MEASUREMENT>3000620</MEASUREMENT> lab test since January first of the previous year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Did patient <PERSON_ID>1027943263163534509</PERSON_ID> get tested with <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test from the first day of the preceding year?",
    "question_concept": "Did patient <PERSON_ID>1027943263163534509</PERSON_ID> get tested with <MEASUREMENT>3000620</MEASUREMENT> lab test from the first day of the preceding year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Has patient <PERSON_ID>1027943263163534509</PERSON_ID> undergone testing for <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test since the previous year's first day?",
    "question_concept": "Has patient <PERSON_ID>1027943263163534509</PERSON_ID> undergone testing for <MEASUREMENT>3000620</MEASUREMENT> lab test since the previous year's first day?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Did the patient <PERSON_ID>1027943263163534509</PERSON_ID> have a test for <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test as of the beginning of last year?",
    "question_concept": "Did the patient <PERSON_ID>1027943263163534509</PERSON_ID> have a test for <MEASUREMENT>3000620</MEASUREMENT> lab test as of the beginning of last year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Did <PERSON_ID>1027943263163534509</PERSON_ID> receive the <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test since the start of the last calendar year?",
    "question_concept": "Did <PERSON_ID>1027943263163534509</PERSON_ID> receive the <MEASUREMENT>3000620</MEASUREMENT> lab test since the start of the last calendar year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Has patient <PERSON_ID>1027943263163534509</PERSON_ID> had a <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test since the first day of last year?",
    "question_concept": "Has patient <PERSON_ID>1027943263163534509</PERSON_ID> had a <MEASUREMENT>3000620</MEASUREMENT> lab test since the first day of last year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Was patient <PERSON_ID>1027943263163534509</PERSON_ID> subjected to a <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test since January first of the previous year?",
    "question_concept": "Was patient <PERSON_ID>1027943263163534509</PERSON_ID> subjected to a <MEASUREMENT>3000620</MEASUREMENT> lab test since January first of the previous year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Did patient <PERSON_ID>1027943263163534509</PERSON_ID> get tested with <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test from the first day of the preceding year?",
    "question_concept": "Did patient <PERSON_ID>1027943263163534509</PERSON_ID> get tested with <MEASUREMENT>3000620</MEASUREMENT> lab test from the first day of the preceding year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Has patient <PERSON_ID>1027943263163534509</PERSON_ID> undergone testing for <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test since the previous year's first day?",
    "question_concept": "Has patient <PERSON_ID>1027943263163534509</PERSON_ID> undergone testing for <MEASUREMENT>3000620</MEASUREMENT> lab test since the previous year's first day?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Did the patient <PERSON_ID>1027943263163534509</PERSON_ID> have a test for <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test as of the beginning of last year?",
    "question_concept": "Did the patient <PERSON_ID>1027943263163534509</PERSON_ID> have a test for <MEASUREMENT>3000620</MEASUREMENT> lab test as of the beginning of last year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Did patient <PERSON_ID>1027943263163534509</PERSON_ID> undergo a <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test since the beginning of last year?",
    "question_concept": "Did patient <PERSON_ID>1027943263163534509</PERSON_ID> undergo a <MEASUREMENT>3000620</MEASUREMENT> lab test since the beginning of last year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Has <PERSON_ID>1027943263163534509</PERSON_ID> been tested for <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test from January 1st of last year?",
    "question_concept": "Has <PERSON_ID>1027943263163534509</PERSON_ID> been tested for <MEASUREMENT>3000620</MEASUREMENT> lab test from January 1st of last year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Did patient <PERSON_ID>1027943263163534509</PERSON_ID> undergo a <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test starting from January 1st of last year?",
    "question_concept": "Did patient <PERSON_ID>1027943263163534509</PERSON_ID> undergo a <MEASUREMENT>3000620</MEASUREMENT> lab test starting from January 1st of last year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Was any <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> test performed on patient <PERSON_ID>1027943263163534509</PERSON_ID> at any time during the previous calendar year or later?",
    "question_concept": "Was any <MEASUREMENT>3000620</MEASUREMENT> test performed on patient <PERSON_ID>1027943263163534509</PERSON_ID> at any time during the previous calendar year or later?",
    "sql": "SELECT EXISTS (SELECT 1 FROM measurement m WHERE m.person_id = 1027943263163534509 AND m.measurement_concept_id = 3000620 AND m.measurement_date >= CURRENT_DATE - INTERVAL '1 year') AS has_received_lab_test;",
    "template": "has_verb patient {patient_id} received a {lab_name} lab test [time_filter_global1]?"
  },
  {
    "question_name": "Has patient <PERSON_ID>1027943263163534509</PERSON_ID> ever had a <MEASUREMENT>Complement C3 [Mass/volume] in Serum or Plasma</MEASUREMENT> lab result recorded starting from the beginning of last year?",
    "question_concept": "Has patient <PERSON_ID>1027943263163534509</PERSON_ID> ever had a <MEASUREMENT>3000620</MEASUREMENT> lab result recorded starting from the beginning of last year?",
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
    "question_name": "What was the name of the lab test that patient <PERSON_ID>1359228978448708169</PERSON_ID> at 2141-03-05 18:48:41 received on the current hospital visit?",
    "question_concept": "What was the name of the lab test that patient 1359228978448708169 at 2141-03-05 18:48:41 received on the current hospital visit?",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "Can you tell me the name of the lab test performed on patient <PERSON_ID>1359228978448708169</PERSON_ID> at 2141-03-05 18:48:41 during their current hospital stay?",
    "question_concept": "Can you tell me the name of the lab test performed on patient <PERSON_ID>1359228978448708169</PERSON_ID> at 2141-03-05 18:48:41 during their current hospital stay?",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "Which lab test was conducted for patient <PERSON_ID>1359228978448708169</PERSON_ID> on 2141-03-05 18:48:41 during their latest hospital visit?",
    "question_concept": "Which lab test was conducted for patient <PERSON_ID>1359228978448708169</PERSON_ID> on 2141-03-05 18:48:41 during their latest hospital visit?",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "I need the name of the lab test done on patient <PERSON_ID>1359228978448708169</PERSON_ID> on March 5, 2141, at 6:48:41 PM in their ongoing hospital encounter.",
    "question_concept": "I need the name of the lab test done on patient <PERSON_ID>1359228978448708169</PERSON_ID> on March 5, 2141, at 6:48:41 PM in their ongoing hospital encounter.",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "Identify the lab test patient <PERSON_ID>1359228978448708169</PERSON_ID> underwent at 6:48:41 PM on 05/03/2141 on this hospital admission.",
    "question_concept": "Identify the lab test patient <PERSON_ID>1359228978448708169</PERSON_ID> underwent at 6:48:41 PM on 05/03/2141 on this hospital admission.",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "What lab test was done for patient <PERSON_ID>1359228978448708169</PERSON_ID> on 2141-03-05 18:48:41 during their current hospitalization?",
    "question_concept": "What lab test was done for patient <PERSON_ID>1359228978448708169</PERSON_ID> on 2141-03-05 18:48:41 during their current hospitalization?",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "Please provide the name of the lab test given to patient <PERSON_ID>1359228978448708169</PERSON_ID> on 2141/03/05 at 18:48:41 during the current visit.",
    "question_concept": "Please provide the name of the lab test given to patient <PERSON_ID>1359228978448708169</PERSON_ID> on 2141/03/05 at 18:48:41 during the current visit.",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "Which laboratory test did patient <PERSON_ID>1359228978448708169</PERSON_ID> receive on 2141-03-05 18:48:41 during their current admission?",
    "question_concept": "Which laboratory test did patient <PERSON_ID>1359228978448708169</PERSON_ID> receive on 2141-03-05 18:48:41 during their current admission?",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "At 2141-03-05 18:48:41, which lab test was ordered for patient <PERSON_ID>1359228978448708169</PERSON_ID> on their present hospital visit?",
    "question_concept": "At 2141-03-05 18:48:41, which lab test was ordered for patient <PERSON_ID>1359228978448708169</PERSON_ID> on their present hospital visit?",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "Tell me the name of the lab test that was recorded for patient <PERSON_ID>1359228978448708169</PERSON_ID> on 2141-03-05 18:48:41 during this hospital stay.",
    "question_concept": "Tell me the name of the lab test that was recorded for patient <PERSON_ID>1359228978448708169</PERSON_ID> on 2141-03-05 18:48:41 during this hospital stay.",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "Which lab exam did patient <PERSON_ID>1359228978448708169</PERSON_ID> receive as of 18:48:41 on the 5th of March, 2141 during this admission?",
    "question_concept": "Which lab exam did patient <PERSON_ID>1359228978448708169</PERSON_ID> receive as of 18:48:41 on the 5th of March, 2141 during this admission?",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "For patient <PERSON_ID>1359228978448708169</PERSON_ID>, what was the lab test done on 2141-03-05 18:48:41 during the current visit?",
    "question_concept": "For patient <PERSON_ID>1359228978448708169</PERSON_ID>, what was the lab test done on 2141-03-05 18:48:41 during the current visit?",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "Provide the lab test name that patient <PERSON_ID>1359228978448708169</PERSON_ID> got at precisely 18:48:41 on March 5th, 2141 in this hospital admission.",
    "question_concept": "Provide the lab test name that patient <PERSON_ID>1359228978448708169</PERSON_ID> got at precisely 18:48:41 on March 5th, 2141 in this hospital admission.",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "What was the laboratory test name for patient <PERSON_ID>1359228978448708169</PERSON_ID> at 2141-03-05 18:48:41 in their active hospital stay?",
    "question_concept": "What was the laboratory test name for patient <PERSON_ID>1359228978448708169</PERSON_ID> at 2141-03-05 18:48:41 in their active hospital stay?",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "Can you identify the lab test for patient <PERSON_ID>1359228978448708169</PERSON_ID> done at 2141-03-05 18:48:41 on this visit?",
    "question_concept": "Can you identify the lab test for patient <PERSON_ID>1359228978448708169</PERSON_ID> done at 2141-03-05 18:48:41 on this visit?",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "What is the name of the lab test patient <PERSON_ID>1359228978448708169</PERSON_ID> received on 2141-03-05 18:48:41 during their present encounter?",
    "question_concept": "What is the name of the lab test patient <PERSON_ID>1359228978448708169</PERSON_ID> received on 2141-03-05 18:48:41 during their present encounter?",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "I'd like to know the lab test name for patient <PERSON_ID>1359228978448708169</PERSON_ID> at 2141-03-05 18:48:41 in the current hospital visit.",
    "question_concept": "I'd like to know the lab test name for patient <PERSON_ID>1359228978448708169</PERSON_ID> at 2141-03-05 18:48:41 in the current hospital visit.",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "What laboratory test was performed on patient <PERSON_ID>1359228978448708169</PERSON_ID> on 2141-03-05 18:48:41 during this encounter?",
    "question_concept": "What laboratory test was performed on patient <PERSON_ID>1359228978448708169</PERSON_ID> on 2141-03-05 18:48:41 during this encounter?",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "Fetch the name of the lab test that patient <PERSON_ID>1359228978448708169</PERSON_ID> received at 2141-03-05 18:48:41 during their current stay.",
    "question_concept": "Fetch the name of the lab test that patient <PERSON_ID>1359228978448708169</PERSON_ID> received at 2141-03-05 18:48:41 during their current stay.",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "Which lab investigation was done for patient <PERSON_ID>1359228978448708169</PERSON_ID> on 2141-03-05 18:48:41 in this hospital visit?",
    "question_concept": "Which lab investigation was done for patient <PERSON_ID>1359228978448708169</PERSON_ID> on 2141-03-05 18:48:41 in this hospital visit?",
    "sql": "SELECT (SELECT c.concept_name FROM concept c WHERE c.concept_id = m.measurement_concept_id) AS lab_test_name FROM measurement m WHERE m.person_id = 1359228978448708169 AND m.measurement_datetime = TIMESTAMP '2141-03-05 18:48:41' AND m.visit_occurrence_id = (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 1359228978448708169 AND vo.visit_start_datetime <= TIMESTAMP '2141-03-05 18:48:41' ORDER BY vo.visit_start_datetime DESC LIMIT 1);",
    "template": "what was the name of the lab test that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  {
    "question_name": "Name the lab test administered to patient <PERSON_ID>1359228978448708169</PERSON_ID> at 2141-03-05 18:48:41 during their current admission.",
    "question_concept": "Name the lab test administered to patient <PERSON_ID>1359228978448708169</PERSON_ID> at 2141-03-05 18:48:41 during their current admission.",
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
    "question_name": "When was the last time that patient <PERSON_ID>4398308024184711278</PERSON_ID> was prescribed a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route last year?",
    "question_concept": "When was the last time that patient <PERSON_ID>4398308024184711278</PERSON_ID> was prescribed a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route last year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Can you tell me when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route in the previous calendar year?",
    "question_concept": "Can you tell me when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route in the previous calendar year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Do you know the date when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route during last year?",
    "question_concept": "Do you know the date when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route during last year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "I'd like to find out when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route in the last year?",
    "question_concept": "I'd like to find out when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route in the last year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Could you check when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route across the past year?",
    "question_concept": "Could you check when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route across the past year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Please find the last time that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route throughout the previous year?",
    "question_concept": "Please find the last time that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route throughout the previous year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "At what date did that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route over the last calendar year?",
    "question_concept": "At what date did that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route over the last calendar year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "What was the last occasion that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route for the entirety of last year?",
    "question_concept": "What was the last occasion that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route for the entirety of last year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "When exactly was that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route at any point last year?",
    "question_concept": "When exactly was that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route at any point last year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Could you tell me the last occurrence that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route during the last full year?",
    "question_concept": "Could you tell me the last occurrence that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route during the last full year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Find out when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route within the previous year?",
    "question_concept": "Find out when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route within the previous year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Let me know the time that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route sometime last year?",
    "question_concept": "Let me know the time that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route sometime last year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Do we know the last instance that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route during the year before this one?",
    "question_concept": "Do we know the last instance that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route during the year before this one?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Tell me when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route in the year prior?",
    "question_concept": "Tell me when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route in the year prior?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Identify the date when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route in the preceding year?",
    "question_concept": "Identify the date when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route in the preceding year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Pinpoint the last time that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route in the 12 months before this year?",
    "question_concept": "Pinpoint the last time that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route in the 12 months before this year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Do you have the date when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route in the year gone by?",
    "question_concept": "Do you have the date when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route in the year gone by?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "I'd like to know the latest date when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route in the past complete year?",
    "question_concept": "I'd like to know the latest date when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route in the past complete year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Retrieve the last prescription date when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route through the course of last year?",
    "question_concept": "Retrieve the last prescription date when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route through the course of last year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Give me the date when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route through the last year?",
    "question_concept": "Give me the date when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route through the last year?",
    "sql": "SELECT MAX(de.drug_exposure_start_date) AS last_prescription_date FROM drug_exposure de WHERE de.person_id = 4398308024184711278 AND de.route_concept_id = 4262914 AND EXTRACT(YEAR FROM de.drug_exposure_start_date) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} was prescribed a medication via {drug_route} route [time_filter_global1]?"
  },
  {
    "question_name": "Track down when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>Nasal</DRUG_ROUTE> route in the last completed year?",
    "question_concept": "Track down when that patient <PERSON_ID>4398308024184711278</PERSON_ID> received a medication via <DRUG_ROUTE>4262914</DRUG_ROUTE> route in the last completed year?",
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
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Which are the top three drugs in terms of intake frequency since three months ago?",
    "question_concept": "Which are the top three drugs in terms of intake frequency since three months ago?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "What are the three most common drugs administered in the past 3 months?",
    "question_concept": "What are the three most common drugs administered in the past 3 months?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "List the top three drug intake events during the last three months?",
    "question_concept": "List the top three drug intake events during the last three months?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Which are the top three drugs in terms of intake frequency over the past 3 months?",
    "question_concept": "Which are the top three drugs in terms of intake frequency over the past 3 months?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Which three medications were prescribed the most within the previous three months?",
    "question_concept": "Which three medications were prescribed the most within the previous three months?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Identify the top three frequent drug uses from the last 3 months?",
    "question_concept": "Identify the top three frequent drug uses from the last 3 months?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Which are the top three drugs in terms of intake frequency for the past three months?",
    "question_concept": "Which are the top three drugs in terms of intake frequency for the past three months?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Show me the top 3 drug intake cases in the last quarter?",
    "question_concept": "Show me the top 3 drug intake cases in the last quarter?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Which are the top three drugs in terms of intake frequency in the last 90 days?",
    "question_concept": "Which are the top three drugs in terms of intake frequency in the last 90 days?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Give me the top three most frequent drug intakes over the previous 3 months?",
    "question_concept": "Give me the top three most frequent drug intakes over the previous 3 months?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Which are the top three drugs in terms of intake frequency since the last 3 months began?",
    "question_concept": "Which are the top three drugs in terms of intake frequency since the last 3 months began?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Which are the top 3 drugs with the most intake events within the last 3 months?",
    "question_concept": "Which are the top 3 drugs with the most intake events within the last 3 months?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Which are the top three drugs in terms of intake frequency from three months back?",
    "question_concept": "Which are the top three drugs in terms of intake frequency from three months back?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Highlight the top three medications given in the time span of three months?",
    "question_concept": "Highlight the top three medications given in the time span of three months?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Which are the top three drugs in terms of intake frequency within the recent 3 months?",
    "question_concept": "Which are the top three drugs in terms of intake frequency within the recent 3 months?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Find the three drugs taken most often starting three months ago?",
    "question_concept": "Find the three drugs taken most often starting three months ago?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Which three drugs were consumed most counting from three months ago?",
    "question_concept": "Which three drugs were consumed most counting from three months ago?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Give a list of the top three drug exposure events during the prior 3 months?",
    "question_concept": "Give a list of the top three drug exposure events during the prior 3 months?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "What are the leading three drug consumption events since approximately 90 days ago?",
    "question_concept": "What are the leading three drug consumption events since approximately 90 days ago?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent intake events [time_filter_global1]?"
  },
  {
    "question_name": "Which are the top three drugs in terms of intake frequency in the course of the last three months?",
    "question_concept": "Which are the top three drugs in terms of intake frequency in the course of the last three months?",
    "sql": "SELECT de.drug_concept_id, c.concept_name, COUNT(*) AS intake_count FROM drug_exposure de JOIN concept c ON de.drug_concept_id = c.concept_id WHERE de.drug_exposure_start_date >= CURRENT_DATE - INTERVAL '3 months' GROUP BY de.drug_concept_id, c.concept_name ORDER BY intake_count DESC LIMIT 3;",
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
    "question_name": "Count the number of <PROCEDURE>Venous catheterization, not elsewhere classified</PROCEDURE> procedure cases until 2022.",
    "question_concept": "Count the number of <PROCEDURE>2002174</PROCEDURE> procedure cases until 2202.",
    "sql": "SELECT COUNT(*) AS procedure_case_count FROM procedure_occurrence po WHERE po.procedure_concept_id = 2002174 AND po.procedure_date <= DATE '2202-12-31';",
    "template": "count the number of {procedure_name} procedure cases [time_filter_global1]."
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of <PROCEDURE>2779573</PROCEDURE> procedure cases since 12 month ago.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of <PROCEDURE>4120120</PROCEDURE> procedure cases today.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of <PROCEDURE>2784578</PROCEDURE> procedure cases since 3/6/2115.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of <PROCEDURE>2779573</PROCEDURE> procedure cases on this month/13.",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What are the top three frequent specimens that patients were tested within 14 days after having been diagnosed with <CONDITION>Anemia in neoplastic disease</CONDITION> since last month?",
    "question_concept": "What are the top three frequent specimens that patients were tested within 14 days after having been diagnosed with <CONDITION>441258</CONDITION> since last month?",
    "sql": "WITH condition_occurrence_filtered AS (SELECT co.person_id, co.condition_start_date FROM condition_occurrence co WHERE co.condition_concept_id = 441258 AND co.condition_start_date >= date_trunc('month', CURRENT_DATE) - INTERVAL '1 month'), specimen_within_14_days AS (SELECT s.specimen_concept_id, s.person_id, s.specimen_date FROM specimen s JOIN condition_occurrence_filtered cof ON s.person_id = cof.person_id AND s.specimen_date BETWEEN cof.condition_start_date AND cof.condition_start_date + INTERVAL '14 days') SELECT s.specimen_concept_id, c.concept_name AS specimen_name, COUNT(*) AS frequency FROM specimen_within_14_days s JOIN concept c ON s.specimen_concept_id = c.concept_id GROUP BY s.specimen_concept_id, c.concept_name ORDER BY frequency DESC LIMIT 3;",
    "template": "what are_verb the top [n_rank] frequent specimens that patients were tested [time_filter_within] after having been diagnosed with {diagnosis_name} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top three frequent specimens that patients were tested within the same hospital visit after having been diagnosed with <CONDITION>434814</CONDITION> this month?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top four frequent specimens that patients were tested within 3 months after having been diagnosed with <CONDITION>29735</CONDITION> in February/last year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top five frequent specimens that patients were tested within the same day after having been diagnosed with <CONDITION>4273391</CONDITION> until last month?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top three frequent specimens that patients were tested within the same icu visit after having been diagnosed with <CONDITION>201618</CONDITION> on the first ICU visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "How many days have passed since the second time patient 7767928252036371506 was prescribed <DRUG>valsartan 160 MG Oral Tablet [Diovan]</DRUG> on the current hospital visit?",
    "question_concept": "How many days have passed since the second time patient 7767928252036371506 was prescribed <DRUG>1308877</DRUG> on the current hospital visit?",
    "sql": "WITH patient_visits AS (SELECT vo.visit_occurrence_id FROM visit_occurrence vo WHERE vo.person_id = 7767928252036371506 ORDER BY vo.visit_start_date DESC LIMIT 1), drug_orders AS (SELECT de.drug_exposure_start_date, ROW_NUMBER() OVER (ORDER BY de.drug_exposure_start_date) AS rn FROM drug_exposure de JOIN patient_visits pv ON de.visit_occurrence_id = pv.visit_occurrence_id WHERE de.person_id = 7767928252036371506 AND de.drug_concept_id = 1308877), second_drug_exposure AS (SELECT drug_exposure_start_date FROM drug_orders WHERE rn = 2) SELECT CURRENT_DATE - sde.drug_exposure_start_date AS days_since_second_exposure FROM second_drug_exposure sde;",
    "template": "how many [unit_count] have passed since the [time_filter_exact1] time patient {patient_id} was prescribed {drug_name} on the current hospital visit?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "How many hours have passed since the second time patient -1668363269138076343 was prescribed <DRUG>19019003</DRUG> on the current hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "How many hours have passed since the second to last time patient -1802883457125002584 was prescribed <DRUG>1322185</DRUG> on the current hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "How many days have passed since the first time patient 2905418371255233675 was prescribed <DRUG>40231925</DRUG> on the current hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "How many hours have passed since the last time patient -6642382245392831054 was prescribed <DRUG>19079154</DRUG> on the current hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What was the last hospital admission type of patient 395982632653845924 until last year?",
    "question_concept": "What was the last hospital admission type of patient 395982632653845924 until last year?",
    "sql": "SELECT c.concept_name FROM visit_occurrence vo JOIN concept c ON vo.visit_concept_id = c.concept_id WHERE vo.person_id = 395982632653845924 AND vo.visit_start_date < DATE_TRUNC('year', CURRENT_DATE) ORDER BY vo.visit_start_date DESC LIMIT 1;",
    "template": "what was the [time_filter_exact1] hospital admission type of patient {patient_id} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the first hospital admission type of patient -2599708291638879817 since last month?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the first hospital admission type of patient -8576511312124354845 this year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the second hospital admission type of patient -1954597784242456354 last month?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the second to last hospital admission type of patient 8249337233050117811 until 6/18/2187?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "When was the second to last hospital admission time of patient <PERSON_ID>8621568400785831320</PERSON_ID> this year?",
    "question_concept": "When was the second to last hospital admission time of patient <PERSON_ID>8621568400785831320</PERSON_ID> this year?",
    "sql": "SELECT vo.visit_start_datetime FROM visit_occurrence vo WHERE vo.person_id = 8621568400785831320 AND EXTRACT(YEAR FROM vo.visit_start_datetime) = EXTRACT(YEAR FROM CURRENT_DATE) ORDER BY vo.visit_start_datetime DESC OFFSET 1 LIMIT 1;",
    "template": "when was the [time_filter_exact1] hospital admission time of patient {patient_id} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the second to last hospital admission time of patient -2800993601113821605 until 4 months ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the first hospital admission time of patient -7680242341205126919 since 2 years ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the second hospital admission time of patient 6867361011915015511 in November/2198?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the last hospital admission time of patient 4826035787532835744 until last month?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "When was the last time that patient <PERSON_ID>4424182300748163057</PERSON_ID> had a <MEASUREMENT>Fluid output.nasogastric tube Measured</MEASUREMENT> output until last year?",
    "question_concept": "When was the last time that patient <PERSON_ID>4424182300748163057</PERSON_ID> had a <MEASUREMENT>43533729</MEASUREMENT> output until last year?",
    "sql": "SELECT MAX(m.measurement_date) AS last_measurement_date FROM measurement m WHERE m.person_id = 4424182300748163057 AND m.measurement_concept_id = 43533729 AND m.measurement_date < DATE_TRUNC('year', CURRENT_DATE);",
    "template": "when was the [time_filter_exact1] time that patient {patient_id} had a {output_name} output [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the second last time that patient <PERSON_ID>6085829274949608737</PERSON_ID> had a <MEASUREMENT>3014315</MEASUREMENT> output until July/2194?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the first time that patient <PERSON_ID>-8687156498294079926</PERSON_ID> had a <MEASUREMENT>3026556</MEASUREMENT> output since 6 months ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the second time that patient <PERSON_ID>717786310180161863</PERSON_ID> had a <MEASUREMENT>3011087</MEASUREMENT> output on the first hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "When was the second time that patient <PERSON_ID>192126527308507793</PERSON_ID> had a <MEASUREMENT>3037537</MEASUREMENT> output on the last ICU visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What was the name of the diagnosis that patient <PERSON_ID>1553236252820857312</PERSON_ID> at 9:13:34 received on 3/11/2203?",
    "question_concept": "What was the name of the diagnosis that patient <PERSON_ID>1553236252820857312</PERSON_ID> at 9:13:34 received on 3/11/2203?",
    "sql": "SELECT con.concept_name AS diagnosis_name FROM condition_occurrence c JOIN concept con ON c.condition_concept_id = con.concept_id WHERE c.person_id = 1553236252820857312 AND c.condition_start_datetime = TIMESTAMP '2203-03-11 09:13:34';",
    "template": "what was the name of the diagnosis that patient {patient_id} [time_filter_exact1] received [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the name of the diagnosis that patient <PERSON_ID>6281560134359256409</PERSON_ID> last received on the current hospital visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the name of the diagnosis that patient <PERSON_ID>8630923276892222760</PERSON_ID> second to last received today?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the name of the diagnosis that patient <PERSON_ID>-3066954246185772934</PERSON_ID> first received since 10 days ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What was the name of the diagnosis that patient <PERSON_ID>3925917628164182573</PERSON_ID> second received this month?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Count the number of patients who received a <MEASUREMENT>Troponin I.cardiac [Mass/volume] in Serum or Plasma</MEASUREMENT> lab test until 2209.",
    "question_concept": "Count the number of patients who received a <MEASUREMENT>3021337</MEASUREMENT> lab test until 2209.",
    "sql": "SELECT COUNT(DISTINCT m.person_id) AS patient_count FROM measurement AS m WHERE m.measurement_concept_id = 3021337 AND m.measurement_date <= DATE '2209-12-31';",
    "template": "count the number of patients who received a {lab_name} lab test [time_filter_global1]."
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who received a <MEASUREMENT>3022616</MEASUREMENT> lab test last year.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who received a <MEASUREMENT>3024629</MEASUREMENT> lab test in September/2176.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who received a <MEASUREMENT>3027114</MEASUREMENT> lab test on 10/18/2164.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of patients who received a <MEASUREMENT>3022616</MEASUREMENT> lab test this month.",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Count the number of discharges for patient <PERSON_ID>8484400133089324627</PERSON_ID> last year.",
    "question_concept": "Count the number of discharges for patient <PERSON_ID>8484400133089324627</PERSON_ID> last year.",
    "sql": "SELECT COUNT(*) AS discharge_count FROM note n WHERE n.person_id = 8484400133089324627 AND LOWER(n.note_title) LIKE '%discharge%' AND n.note_date >= date_trunc('year', CURRENT_DATE) - INTERVAL '1 year' AND n.note_date < date_trunc('year', CURRENT_DATE);",
    "template": "Count the number of discharges for patient {patient_id} [time_filter_global1]."
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of discharges for patient <PERSON_ID>955472141559262470</PERSON_ID> until last month.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of discharges for patient <PERSON_ID>290223184264640186</PERSON_ID> since 8 months ago.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of discharges for patient <PERSON_ID>3983620676567530748</PERSON_ID> in October/this year.",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Count the number of discharges for patient <PERSON_ID>725306438956681908</PERSON_ID> since 11/2152.",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "Have notes for <PERSON_ID>-4054702097524803546</PERSON_ID> mentioned <CONCEPT_ID>100 ML Ambroxol 3 MG/ML Oral Solution [Ambrohexal] Box of 1 by Novartis</CONCEPT_ID> on 03/30/last year?",
    "question_concept": "Have notes for <PERSON_ID>-4054702097524803546</PERSON_ID> mentioned <CONCEPT_ID>41425009</CONCEPT_ID> on 03/30/last year?",
    "sql": "SELECT EXISTS (SELECT 1 FROM note_nlp AS nn JOIN note AS n ON nn.note_id = n.note_id WHERE n.person_id = 4054702097524803546 AND nn.note_nlp_concept_id = 41425009 AND n.note_date = (date_trunc('year', current_date) - interval '1 year') + interval '2 months 29 days') AS concept_mentioned;",
    "template": "has_verb notes for patient {patient_id} mentioned {concept_name} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "Have notes for <PERSON_ID>-1842231389730220518</PERSON_ID> mentioned <CONCEPT_ID>45001002</CONCEPT_ID> on the current ICU visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Have notes for <PERSON_ID>1646657737483777089</PERSON_ID> mentioned <CONCEPT_ID>41425009</CONCEPT_ID> until December/16/2201?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Have notes for <PERSON_ID>-2289485750814676840</PERSON_ID> mentioned <CONCEPT_ID>21219002</CONCEPT_ID> until 10 days ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "Have notes for <PERSON_ID>2441679035011144572</PERSON_ID> mentioned <CONCEPT_ID>45168009</CONCEPT_ID> since 2/7/2117?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What is the specialty of the physician who performed a <PROCEDURE>Drainage of Peritoneal Cavity, Percutaneous Approach, Diagnostic</PROCEDURE> procedure on patient <PERSON_ID>3856814790790267215</PERSON_ID> on the last hospital visit?",
    "question_concept": "What is the specialty of the physician who performed a <PROCEDURE>2779573</PROCEDURE> procedure on patient <PERSON_ID>3856814790790267215</PERSON_ID> on the last hospital visit?",
    "sql": "SELECT c.concept_name AS provider_specialty FROM procedure_occurrence po JOIN visit_occurrence vo ON po.visit_occurrence_id = vo.visit_occurrence_id JOIN provider p ON po.provider_id = p.provider_id JOIN concept c ON p.specialty_concept_id = c.concept_id WHERE po.procedure_occurrence_id = 2779573 AND vo.person_id = 3856814790790267215 AND vo.visit_start_datetime = (SELECT MAX(vo2.visit_start_datetime) FROM visit_occurrence vo2 WHERE vo2.person_id = 3856814790790267215);",
    "template": "what is the specialty of the physician who performed a {procedure_name} procedure on patient {patient_id} [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the specialty of the physician who performed a <PROCEDURE>4150627</PROCEDURE> procedure on patient <PERSON_ID>-3762978167037148669</PERSON_ID> last year?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the specialty of the physician who performed a <PROCEDURE>4048955</PROCEDURE> procedure on patient <PERSON_ID>4310991845472156817</PERSON_ID> since 3 months ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the specialty of the physician who performed a <PROCEDURE>4049832</PROCEDURE> procedure on patient <PERSON_ID>1547576009355889924</PERSON_ID> on the current ICU visit?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What is the specialty of the physician who performed a <PROCEDURE>2007052</PROCEDURE> procedure on patient <PERSON_ID>7616128107871352211</PERSON_ID> yesterday?",
  --   "sql": "",
  --   "template": ""
  -- },
  {
    "question_name": "What are the top six conditions lasting more than 1 year among patients aged 50's until 01/2187?",
    "question_concept": "What are the top six conditions lasting more than 1 year among patients aged 50's until 01/2187?",
    "sql": "SELECT c.concept_name AS condition_name, COUNT(DISTINCT ce.person_id) AS patient_count FROM condition_era ce JOIN concept c ON ce.condition_concept_id = c.concept_id JOIN person p ON ce.person_id = p.person_id WHERE ce.condition_era_start_date <= DATE '2187-02-01' AND ce.condition_era_end_date > ce.condition_era_start_date + INTERVAL '1 year' AND DATE_PART('year', ce.condition_era_start_date) - p.year_of_birth BETWEEN 50 AND 59 GROUP BY c.concept_name ORDER BY patient_count DESC LIMIT 6;",
    "template": "what are_verb the top [n_rank] conditions lasting more than 1 year among patients aged [age_group] [time_filter_global1]?"
  },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top two conditions lasting more than 1 year among patients aged 60 or above this month?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top five conditions lasting more than 1 year among patients aged 40's since 10 years ago?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top four conditions lasting more than 1 year among patients aged 20's in 2158?",
  --   "sql": "",
  --   "template": ""
  -- },
  -- {
  --   "question_name": "",
  --   "question_concept": "What are the top three conditions lasting more than 1 year among patients aged 30's today?",
  --   "sql": "",
  --   "template": ""
  -- },
]

