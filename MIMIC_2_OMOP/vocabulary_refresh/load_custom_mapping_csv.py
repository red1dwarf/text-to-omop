import os
import pandas as pd
from sqlalchemy import create_engine


user = "postgres"
password = "K*38/juowae12"
host = "localhost"
port = 5432
database = "OMOP"
schema = "omop"
table = "tmp_custom_mapping"


engine = create_engine(f'postgresql://{user}:{password}@{host}:{port}/{database}')


folder = r"C:\Users\paule\Documents\IHI\MIMIC_to_OMOP\MIMIC\custom_mapping_csv"


for file in os.listdir(folder):
    if file.endswith(".csv"):
        path = os.path.join(folder, file)
        print(f"Import de {file}...")
        try:
            df = pd.read_csv(path)
            if not df.empty:
                df.to_sql(table, engine, if_exists='append', index=False, schema=schema)
                print(f"✓ Fichier {file} chargé.")
            else:
                print(f"⚠️ Fichier {file} vide. Ignoré.")
        except Exception as e:
            print(f"❌ Erreur avec {file} : {e}")