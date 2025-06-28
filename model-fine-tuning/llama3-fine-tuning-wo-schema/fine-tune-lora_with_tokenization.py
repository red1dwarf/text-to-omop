from transformers import (
    AutoModelForCausalLM,
    AutoTokenizer,
    TrainingArguments,
    Trainer,
    DataCollatorForLanguageModeling
)
from datasets import load_dataset, Dataset
from peft import get_peft_model, LoraConfig, TaskType
import torch
import pandas as pd
import os
from tqdm import tqdm

# Environment setup
os.environ["TOKENIZERS_PARALLELISM"] = "false"
torch.backends.cuda.matmul.allow_tf32 = True  # Enable TF32 for matrix multiplications

def load_and_prepare_data(file_path):
    """Load and prepare the dataset from JSONL file"""
    print("Loading dataset...")
    df = pd.read_json(file_path, lines=True)
    dataset = Dataset.from_pandas(df)
    return dataset.train_test_split(test_size=0.1, seed=42)

def initialize_model_and_tokenizer(model_id):
    """Initialize the model and tokenizer with proper settings"""
    print(f"Loading model and tokenizer for {model_id}...")
    
    tokenizer = AutoTokenizer.from_pretrained(model_id, use_fast=True)
    
    # Set pad token if not available
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token
    
    # Load model with bfloat16 precision
    model = AutoModelForCausalLM.from_pretrained(
        model_id,
        device_map="auto",
        torch_dtype=torch.bfloat16,
        trust_remote_code=True
    )
    
    return model, tokenizer

def apply_lora(model):
    """Apply LoRA configuration to the model"""
    print("Applying LoRA configuration...")
    
    peft_config = LoraConfig(
        r=32,
        lora_alpha=64,
        target_modules=[
            "q_proj", "k_proj", "v_proj", "o_proj",
            "gate_proj", "up_proj", "down_proj"
        ],
        lora_dropout=0.05,
        bias="none",
        task_type=TaskType.CAUSAL_LM
    )
    
    lora_model = get_peft_model(model, peft_config)
    lora_model.print_trainable_parameters()
    
    # Verify we have trainable parameters
    assert any(p.requires_grad for p in lora_model.parameters()), "No trainable parameters found!"
    return lora_model

def format_prompt(example):
    """Format the prompt using Llama-3 chat template"""
    return {
        "text": f"""<|begin_of_text|><|start_header_id|>system<|end_header_id|>

You are a helpful SQL assistant. You generate SQL queries for a clinical database that follows the OMOP Common Data Model (OMOP CDM v5.4).<|eot_id|><|start_header_id|>user<|end_header_id|>

{example['input']}<|eot_id|><|start_header_id|>assistant<|end_header_id|>

{example['output']}<|eot_id|>"""
    }

def tokenize_dataset(dataset, tokenizer):
    """Tokenize the dataset with proper formatting"""
    print("Tokenizing dataset...")
    
    def tokenize_function(examples):
        tokenized = tokenizer(
            examples["text"],
            truncation=True,
            padding=False,
            max_length=512,
            return_tensors="pt"
        )
        tokenized["labels"] = tokenized["input_ids"].clone()
        return tokenized
    
    # Apply formatting and tokenization
    formatted_dataset = dataset.map(format_prompt, batched=False)
    tokenized_dataset = formatted_dataset.map(
        tokenize_function,
        batched=True,
        remove_columns=formatted_dataset["train"].column_names
    )
    
    print(f"Training examples: {len(tokenized_dataset['train'])}")
    print(f"Validation examples: {len(tokenized_dataset['test'])}")
    return tokenized_dataset

def setup_training(lora_model, tokenized_dataset, tokenizer):
    """Configure and setup the training process"""
    print("Setting up training...")
    
    # Data collator for dynamic padding
    data_collator = DataCollatorForLanguageModeling(
        tokenizer=tokenizer,
        mlm=False,
        pad_to_multiple_of=8
    )
    
    # Training arguments - updated parameter names
    training_args = TrainingArguments(
        output_dir="./llama3-8b-lora-sql",
        per_device_train_batch_size=2,
        per_device_eval_batch_size=2,
        gradient_accumulation_steps=4,
        warmup_steps=50,
        num_train_epochs=3,
        learning_rate=2e-5,
        weight_decay=0.01,
        logging_dir="./logs",
        logging_steps=10,
        save_steps=100,
        eval_steps=100,
        save_strategy="steps",
        eval_strategy="steps",  # Correct parameter name
        load_best_model_at_end=True,
        metric_for_best_model="eval_loss",
        greater_is_better=False,
        bf16=True,
        dataloader_pin_memory=True,
        dataloader_num_workers=2,
        remove_unused_columns=True,
        report_to="none",
        seed=42,
        gradient_checkpointing=False,
        max_grad_norm=0.3,
    )
    
    # Initialize Trainer
    trainer = Trainer(
        model=lora_model,
        args=training_args,
        train_dataset=tokenized_dataset["train"],
        eval_dataset=tokenized_dataset["test"],
        data_collator=data_collator,
    )
    
    return trainer

def main():
    # Configuration
    model_id = "meta-llama/Meta-Llama-3-8B"
    data_path = "formatted_data.jsonl"
    
    try:
        # Load and prepare data
        dataset = load_and_prepare_data(data_path)
        
        # Initialize model and tokenizer
        model, tokenizer = initialize_model_and_tokenizer(model_id)
        
        # Apply LoRA
        lora_model = apply_lora(model)
        
        # Tokenize dataset
        tokenized_dataset = tokenize_dataset(dataset, tokenizer)
        
        # Setup training
        trainer = setup_training(lora_model, tokenized_dataset, tokenizer)
        
        # Start training
        print("Starting training...")
        trainer.train()
        
        # Save the final model
        print("Saving model...")
        trainer.save_model("./llama3-8b-lora-sql-final")
        tokenizer.save_pretrained("./llama3-8b-lora-sql-final")
        
        print("Training completed successfully!")
        
    except Exception as e:
        print(f"Error during training: {e}")
        raise

def test_model():
    """Test the trained model"""
    try:
        from peft import PeftModel
        
        print("Loading trained model for testing...")
        tokenizer = AutoTokenizer.from_pretrained("./llama3-8b-lora-sql-final")
        
        base_model = AutoModelForCausalLM.from_pretrained(
            "meta-llama/Meta-Llama-3-8B",
            device_map="auto",
            torch_dtype=torch.bfloat16
        )
        
        model = PeftModel.from_pretrained(base_model, "./llama3-8b-lora-sql-final")
        model = model.merge_and_unload()  # Merge LoRA weights
        
        # Test prompt
        test_prompt = """<|begin_of_text|><|start_header_id|>system<|end_header_id|>

You are a helpful SQL assistant.<|eot_id|><|start_header_id|>user<|end_header_id|>

Show me all customers from California<|eot_id|><|start_header_id|>assistant<|end_header_id|>

"""
        
        inputs = tokenizer(test_prompt, return_tensors="pt").to("cuda")
        
        with torch.no_grad():
            outputs = model.generate(
                **inputs,
                max_new_tokens=100,
                temperature=0.7,
                do_sample=True,
                pad_token_id=tokenizer.eos_token_id
            )
        
        print("Generated SQL:")
        print(tokenizer.decode(outputs[0], skip_special_tokens=True).split("<|eot_id|>")[-1].strip())
        
    except Exception as e:
        print(f"Error during testing: {e}")

if __name__ == "__main__":
    main()
    
    # Uncomment to test the trained model
    # test_model()