import json
import psycopg2
from psycopg2.extras import execute_values
from tqdm import tqdm

# Connexion PostgreSQL
db_params = {
    "host": "localhost",
    "port": "5432",
    "dbname": "OMOP",
    "user": "",
    "password": ""
}

# Fichier d'entrée
jsonl_path = r"...\radiology_annotations_per_patient.jsonl"

# Connexion à la base
conn = psycopg2.connect(**db_params)
cur = conn.cursor()

# Création de la table
cur.execute("""
    DROP TABLE IF EXISTS mimiciv_subset.radiology_annotations;
    CREATE TABLE mimiciv_subset.radiology_annotations (
        subject_id TEXT,
        note_id TEXT,
        note_text TEXT,
        nlp_end INTEGER,
        nlp_start INTEGER,
        detected_name TEXT,
        cui TEXT,
        service_model TEXT,
        service_version TEXT,
        timestamp TIMESTAMP,
        presence_value TEXT,
        time_value TEXT,
        subject_value TEXT
    );
""")
conn.commit()

# Lecture & insertion
batch_size = 10000
batch = []

with open(jsonl_path, 'r', encoding='utf-8') as f:
    for line in tqdm(f, desc="Traitement du JSONL"):
        obj = json.loads(line)
        source = obj.get("_source", {})

        row = (
            source.get("meta.subject_id"),
            source.get("meta.note_id"),
            source.get("note_text"),  # peut être None
            source.get("nlp.end"),
            source.get("nlp.start"),
            source.get("nlp.detected_name"),
            source.get("nlp.cui"),
            source.get("service_model"),
            source.get("service_version"),
            source.get("timestamp"),
            source.get("nlp.meta_anns", {}).get("Presence", {}).get("value"),
            source.get("nlp.meta_anns", {}).get("Time", {}).get("value"),
            source.get("nlp.meta_anns", {}).get("Subject", {}).get("value"),
        )

        batch.append(row)

        if len(batch) >= batch_size:
            execute_values(cur,
                """
                INSERT INTO mimiciv_subset.radiology_annotations (
                    subject_id, note_id, note_text, nlp_end, nlp_start, detected_name, cui,
                    service_model, service_version, timestamp,
                    presence_value, time_value, subject_value
                ) VALUES %s
                """, batch)
            conn.commit()
            batch.clear()

# Dernier batch
if batch:
    execute_values(cur,
        """
        INSERT INTO mimiciv_subset.radiology_annotations (
            subject_id, note_id, note_text, nlp_end, nlp_start, detected_name, cui,
            service_model, service_version, timestamp,
            presence_value, time_value, subject_value
        ) VALUES %s
        """, batch)
    conn.commit()

cur.close()
conn.close()
print("✅ Insertion terminée avec succès.")
