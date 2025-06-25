from transformers import (
    T5ForConditionalGeneration,
    T5Tokenizer,
    DataCollatorForSeq2Seq
)
import torch

def load_model_and_tokenizer(model_path):
    """Load fine-tuned model and tokenizer"""
    print("Loading model...")
    tokenizer = T5Tokenizer.from_pretrained(model_path)
    model = T5ForConditionalGeneration.from_pretrained(model_path)
    return model, tokenizer

def generate_sql(model, tokenizer, question, schema=None, max_length=256):
    """Generate SQL from natural language question"""
    # Prepare input
    if schema:
        input_text = f"Generate SQL: {question}\nSchema: {schema}"
    else:
        input_text = f"Generate SQL: {question}"
    
    # Tokenize input
    inputs = tokenizer(
        input_text,
        return_tensors="pt",
        max_length=512,
        truncation=True,
        padding="max_length"
    ).to(model.device)
    
    # Generate output
    with torch.no_grad():
        outputs = model.generate(
            **inputs,
            max_new_tokens=max_length,
            num_beams=4,  # Beam search for better results
            early_stopping=True,
            temperature=0.7
        )
    
    # Decode output
    sql = tokenizer.decode(outputs[0], skip_special_tokens=True)
    return sql

if __name__ == "__main__":
    # Configuration
    MODEL_PATH = "./t5-sql-final"  # Path to your fine-tuned model
    QUESTION = "What are the top 4 frequent prescribed drugs for patients who were also prescribed drug_concept_id 19041823 at the same time on the last hospital visit?"
    
    # Optional schema (same as used in training)
    SCHEMA = """
person.person_id: Unique identifier for each patient
drug_exposure.drug_exposure_id: Unique ID for the drug exposure record
drug_exposure.drug_concept_id: Concept ID of the prescribed drug
visit_occurrence.visit_occurrence_id: Unique ID for visit record
"""
    
    try:
        # 1. Load model
        model, tokenizer = load_model_and_tokenizer(MODEL_PATH)
        model.eval()
        
        # 2. Generate SQL
        print("\nGenerating SQL for question:")
        print(QUESTION)
        
        sql_query = generate_sql(model, tokenizer, QUESTION, SCHEMA)
        
        # 3. Print results
        print("\nGenerated SQL Query:")
        print(sql_query)
        
        # 4. Verify with a simpler question
        TEST_QUESTION = "Show me all patients from California"
        test_sql = generate_sql(model, tokenizer, TEST_QUESTION)
        print("\nTest Query:", TEST_QUESTION)
        print("Generated SQL:", test_sql)
        
    except Exception as e:
        print(f"\nError during inference: {str(e)}")
        print("\nTroubleshooting:")
        print("1. Verify the model path exists")
        print("2. Check if the tokenizer files are present")
        print("3. Ensure the model was properly fine-tuned")