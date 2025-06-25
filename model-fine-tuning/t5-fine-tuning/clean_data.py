import json

def remove_schema(input_text):
    if "Schema:" in input_text:
        return input_text.split("Schema:")[0].strip()
    return input_text

input_path = "formatted_data_with_schema.jsonl"     # Input file
output_path = "formatted_data_without_schema.jsonl" # Output file

with open(input_path, "r") as infile, open(output_path, "w") as outfile:
    for line in infile:
        data = json.loads(line)
        data["input"] = remove_schema(data["input"])
        json.dump(data, outfile)
        outfile.write("\n")
