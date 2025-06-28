from transformers import AutoModelForCausalLM, AutoTokenizer
from peft import PeftModel, PeftConfig
import torch
import os

def load_model_and_tokenizer():
    """Load base model, LoRA adapter, and tokenizer for Llama-3-8B"""
    # Configuration - UPDATE THESE PATHS
    base_model_id = "meta-llama/Meta-Llama-3-8B"
    adapter_path = "/home/paperspace/Desktop/text-to-omop/model-fine-tuning/llama3-fine-tuning-wo-schema/llama3-8b-lora-sql-final"
    
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

def format_llama3_prompt(question):
    """Format prompt using Llama-3 chat template"""
    return f"""<|begin_of_text|><|start_header_id|>system<|end_header_id|>

You are a helpful SQL assistant. You generate SQL queries for a clinical database that follows the OMOP Common Data Model (OMOP CDM v5.4).<|eot_id|><|start_header_id|>user<|end_header_id|>

Question: {question}<|eot_id|><|start_header_id|>assistant<|end_header_id|>

SQL:"""

def generate_sql(model, tokenizer, question, max_length=256):
    """Generate SQL from natural language question"""
    # Format prompt using Llama-3 template
    prompt = format_llama3_prompt(question)
    
    # Tokenize input
    inputs = tokenizer(prompt, return_tensors="pt").to(model.device)
    
    # Generate output
    with torch.no_grad():
        outputs = model.generate(
            **inputs,
            max_new_tokens=max_length,
            do_sample=False,
            # temperature=0.7,
            # top_p=0.9,
            eos_token_id=tokenizer.eos_token_id,
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
        
        # Generate SQL
        print("\nGenerating SQL query...")
        sql_query = generate_sql(model, tokenizer, question)

        print(f'\n Input query:"{question}" ')

        print("\nGenerated SQL Query:")
        print(sql_query)
        
    except Exception as e:
        print(f"\nError occurred: {e}")