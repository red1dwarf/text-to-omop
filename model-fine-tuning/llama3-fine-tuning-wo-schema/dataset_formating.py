import json


input_path = 'data_generation/fine-tuning-dataset.json'
output_path = 'model-fine-tuning/llama3-fine-tuning-wo-schema/formatted_data.jsonl'

with open(input_path, 'r', encoding='utf-8') as f:
    data = json.load(f)


def dataset_formating():

    with open(output_path, 'w', encoding='utf-8') as outfile:
        for record in data:
            prompt_input = f"Question: {record['question_concept']}\n\nSQL:"
            transformed = {
                "input": prompt_input,
                "output": record["sql"]
            }
            outfile.write(json.dumps(transformed, ensure_ascii=False) + '\n')

if __name__ == "__main__":
    dataset_formating()



### ADD UNANSWERABLES

# import json

# # Fichiers
# input_file = "data_generation/Unanswerables/UNANSWERABLES.md"
# output_file = "model-fine-tuning/llama3-fine-tuning-wo-schema/formatted_data.jsonl"

# # Lecture et écriture
# with open(input_file, "r", encoding="utf-8") as f_in, open(output_file, "a", encoding="utf-8") as f_out:
#     for line in f_in:
#         line = line.strip()
#         if line:  # ignorer les lignes vides
#             entry = {
#                 "input": f"Question: {line}\n\nSQL:",
#                 "output": "I am unable to respond."
#             }
#             f_out.write(json.dumps(entry) + "\n")