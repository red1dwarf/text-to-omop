import json


input_path = 'data_generation/DATASET.json'
output_path = 'model-fine-tuning/formatted_data.jsonl'

with open(input_path, 'r', encoding='utf-8') as f:
    data = json.load(f)


def dataset_formating():
    """
    Delete 
    """

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
