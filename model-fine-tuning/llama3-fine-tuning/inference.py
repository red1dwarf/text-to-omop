from transformers import AutoModelForCausalLM, AutoTokenizer
from peft import PeftModel, PeftConfig
import torch
import os

def load_model_and_tokenizer():
    """Load base model, LoRA adapter, and tokenizer for Llama-3-8B"""
    # Configuration - UPDATE THESE PATHS
    base_model_id = "meta-llama/Meta-Llama-3-8B"
    adapter_path = "/home/paperspace/Desktop/text-to-omop/model-fine-tuning/llama3-fine-tuning/llama3-8b-lora-sql-final"
    
    # Verify adapter files exist
    required_files = ['adapter_config.json']
    for file in required_files:
        if not os.path.exists(os.path.join(adapter_path, file)):
            raise FileNotFoundError(f"Missing required file: {os.path.join(adapter_path, file)}")
    
    # Load tokenizer first
    tokenizer = AutoTokenizer.from_pretrained(adapter_path)
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token
    
    # Load base model
    print("Loading base model...")
    base_model = AutoModelForCausalLM.from_pretrained(
        base_model_id,
        torch_dtype=torch.bfloat16,
        device_map="auto",
        trust_remote_code=True
    )
    
    # Load LoRA adapter
    print("Loading adapter...")
    try:
        model = PeftModel.from_pretrained(base_model, adapter_path)
        model = model.merge_and_unload()  # Merge for inference
        print("Adapter successfully loaded and merged!")
    except Exception as e:
        print(f"Error loading adapter: {e}")
        raise
    
    return model, tokenizer

def format_llama3_prompt(question, schema):
    """Format prompt using Llama-3 chat template"""
    return f"""<|begin_of_text|><|start_header_id|>system<|end_header_id|>

You are a helpful SQL assistant. Generate SQL queries based on the given questions.<|eot_id|><|start_header_id|>user<|end_header_id|>

Question: {question}

Schema: {schema}<|eot_id|><|start_header_id|>assistant<|end_header_id|>

SQL:"""

def generate_sql(model, tokenizer, question, schema, max_length=256):
    """Generate SQL from natural language question"""
    # Format prompt using Llama-3 template
    prompt = format_llama3_prompt(question, schema)
    
    # Tokenize input
    inputs = tokenizer(prompt, return_tensors="pt").to(model.device)
    
    # Generate output
    with torch.no_grad():
        outputs = model.generate(
            **inputs,
            max_new_tokens=max_length,
            do_sample=True,
            temperature=0.7,
            top_p=0.9,
            pad_token_id=tokenizer.eos_token_id
        )
    
    # Decode and clean output
    full_output = tokenizer.decode(outputs[0], skip_special_tokens=True)
    
    # Extract just the SQL part after the last "SQL:" prompt
    sql = full_output.split("SQL:")[-1].strip()
    return sql

if __name__ == "__main__":
    try:
        # Load model and tokenizer
        print("Loading model...")
        model, tokenizer = load_model_and_tokenizer()
        model.eval()
        print("Model loaded successfully!")
        
        # Example question and schema
        question = "What are the top 4 frequent prescribed drugs for patients who were also prescribed drug_concept_id 19041823 at the same time on the last hospital visit?"
        
        schema = """
person.person_id: Unique identifier for each patient
person.year_of_birth: Year of birth of the person
person.gender_concept_id: Gender as concept ID
person.race_concept_id: Race as concept ID
drug_exposure.drug_exposure_id: Unique ID for the drug exposure record
drug_exposure.person_id: Foreign key to person table
drug_exposure.drug_concept_id: Concept ID of the prescribed drug
drug_exposure.drug_exposure_start_date: Start date of drug exposure
condition_occurrence.condition_occurrence_id: Unique ID for condition record
condition_occurrence.person_id: Foreign key to person table
condition_occurrence.condition_concept_id: Concept ID for condition
condition_occurrence.condition_start_date: Date of condition onset
visit_occurrence.visit_occurrence_id: Unique ID for visit record
visit_occurrence.person_id: Foreign key to person table
visit_occurrence.visit_concept_id: Concept ID for type of visit (e.g., outpatient, inpatient)
visit_occurrence.visit_start_date: Date when the visit started
observation.observation_id: Unique ID for observation
observation.person_id: Foreign key to person table
observation.observation_concept_id: Concept ID for observation
observation.observation_date: Date when observation was made
measurement.measurement_id: Unique ID for measurement record
measurement.person_id: Foreign key to person table
measurement.measurement_concept_id: Concept ID for the measurement (e.g., blood pressure)
measurement.measurement_date: Date of the measurement
procedure_occurrence.procedure_occurrence_id: Unique ID for procedure
procedure_occurrence.person_id: Foreign key to person table
procedure_occurrence.procedure_concept_id: Concept ID for performed procedure
procedure_occurrence.procedure_date: Date of the procedure
concept.concept_id: Unique concept identifier across vocabularies
concept.concept_name: Human-readable name of the concept
concept.domain_id: Domain classification (e.g., Condition, Drug, Measurement)
concept.vocabulary_id: Vocabulary source (e.g., SNOMED, RxNorm)
concept_ancestor.ancestor_concept_id: Higher-level (parent) concept
concept_ancestor.descendant_concept_id: Lower-level (child) concept
"""
        
        # Generate SQL
        print("\nGenerating SQL query...")
        sql_query = generate_sql(model, tokenizer, question, schema)

        print(f'\n Input query:"{question}" ')

        print("\nGenerated SQL Query:")
        print(sql_query)
        
    except Exception as e:
        print(f"\nError occurred: {e}")