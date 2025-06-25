from transformers import (
    T5ForConditionalGeneration,
    T5Tokenizer,
    Seq2SeqTrainingArguments,
    Seq2SeqTrainer,
    DataCollatorForSeq2Seq
)
from datasets import Dataset
import pandas as pd
import torch
import os
import numpy as np

# Environment setup
os.environ["TOKENIZERS_PARALLELISM"] = "false"
torch.backends.cuda.matmul.allow_tf32 = True

def load_data(file_path):
    """Load and verify dataset"""
    try:
        dataset = Dataset.from_pandas(pd.read_json(file_path, lines=True))
        required_columns = {'input', 'output'}
        if not required_columns.issubset(dataset.column_names):
            raise ValueError(f"Dataset missing required columns: {required_columns - set(dataset.column_names)}")
        return dataset.train_test_split(test_size=0.1, seed=42)
    except Exception as e:
        raise ValueError(f"Error loading data: {str(e)}")

def main():
    # Configuration
    model_id = "t5-small"
    data_path = "formatted_data_with_schema.jsonl"
    
    try:
        # 1. Load and verify data
        print("Loading dataset...")
        dataset = load_data(data_path)
        print(f"Train samples: {len(dataset['train'])}, Test samples: {len(dataset['test'])}")

        # 2. Initialize model
        print("Loading model and tokenizer...")
        tokenizer = T5Tokenizer.from_pretrained(model_id)
        model = T5ForConditionalGeneration.from_pretrained(model_id)
        
        # 3. Improved tokenization with proper validation
        def preprocess(examples):
            # Verify input/output data
            if not all(k in examples for k in ['input', 'output']):
                raise ValueError("Missing required keys in batch: 'input' or 'output'")
            
            inputs = ["Generate SQL: " + str(x) for x in examples["input"]]
            outputs = [str(x) for x in examples["output"]]
            
            model_inputs = tokenizer(
                inputs,
                max_length=512,
                truncation=True,
                padding="max_length",
                return_tensors="pt"
            )
            
            # Tokenize targets
            with tokenizer.as_target_tokenizer():
                labels = tokenizer(
                    outputs,
                    max_length=256,
                    truncation=True,
                    padding="max_length",
                    return_tensors="pt"
                )
            
            # Replace padding token with -100 for loss calculation
            labels = labels["input_ids"]
            labels[labels == tokenizer.pad_token_id] = -100
            
            model_inputs["labels"] = labels
            return model_inputs
        
        print("Tokenizing dataset...")
        tokenized_dataset = dataset.map(
            preprocess,
            batched=True,
            remove_columns=dataset["train"].column_names,
            batch_size=8  # Smaller batches if memory issues
        )

        # 4. Training setup
        training_args = Seq2SeqTrainingArguments(
            output_dir="./t5-sql-output",
            per_device_train_batch_size=4,
            per_device_eval_batch_size=4,
            num_train_epochs=3,
            learning_rate=3e-4,
            eval_strategy="steps",
            eval_steps=100,
            save_strategy="steps",
            save_steps=100,
            logging_strategy="steps",
            logging_steps=10,
            save_total_limit=1,
            fp16=torch.cuda.is_available(),
            gradient_checkpointing=True,
            predict_with_generate=True,
            load_best_model_at_end=True,
            report_to="none",
            metric_for_best_model="eval_loss"
        )
        
        # 5. Initialize Trainer
        trainer = Seq2SeqTrainer(
            model=model,
            args=training_args,
            train_dataset=tokenized_dataset["train"],
            eval_dataset=tokenized_dataset["test"],
            data_collator=DataCollatorForSeq2Seq(tokenizer, model=model)
        )
        
        # 6. Verify data before training
        print("\nSample verification:")
        sample = next(iter(tokenized_dataset["train"]))
        print("Input:", tokenizer.decode(
            [x for x in sample["input_ids"] if x != tokenizer.pad_token_id], 
            skip_special_tokens=True))
        print("Label:", tokenizer.decode(
            [x for x in sample["labels"] if x != -100], 
            skip_special_tokens=True))
        
        # 7. Start training
        print("\nStarting training...")
        train_result = trainer.train()
        
        # 8. Save results
        trainer.save_model("t5-sql-final")
        tokenizer.save_pretrained("t5-sql-final")
        
        print("\nTraining completed successfully!")
        print(f"Final training loss: {train_result.metrics['train_loss']:.4f}")
        
    except Exception as e:
        print(f"\nError occurred: {str(e)}")
        print("\nTroubleshooting steps:")
        print("1. Verify your dataset contains 'input' and 'output' columns")
        print("2. Check sample data format with:")
        print("   print(dataset['train'][0])")
        print("3. Try reducing batch size if memory errors occur")

if __name__ == "__main__":
    main()