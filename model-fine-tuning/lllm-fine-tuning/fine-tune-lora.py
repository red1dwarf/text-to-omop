from transformers import AutoModelForCausalLM, AutoTokenizer, TrainingArguments, Trainer
from datasets import load_dataset, Dataset
from peft import get_peft_model, LoraConfig, TaskType
import torch
import pandas as pd

# Load model & tokenizer
model_id = "meta-llama/Llama-2-7b-hf"  # or your local model
tokenizer = AutoTokenizer.from_pretrained(model_id, use_fast=False)

# Set pad token to eos token if not set
if tokenizer.pad_token is None:
    tokenizer.pad_token = tokenizer.eos_token

# Load model with 4-bit quantization on GPU
model = AutoModelForCausalLM.from_pretrained(model_id, load_in_4bit=True, device_map="auto")

# Apply LoRA config
peft_config = LoraConfig(
    r=16,
    lora_alpha=32,
    target_modules=["q_proj", "v_proj"],  # works for LLaMA models
    lora_dropout=0.1,
    bias="none",
    task_type=TaskType.CAUSAL_LM
)
model = get_peft_model(model, peft_config)

# Load data from JSONL as Pandas DataFrame
df = pd.read_json("formatted_data_with_schema.jsonl", lines=True)

# Convert pandas DataFrame to HuggingFace Dataset and split train/test 90/10
dataset = Dataset.from_pandas(df)
dataset = dataset.train_test_split(test_size=0.1)

# Format function to create prompt text
def format(example):
    return {"text": f"### Question:\n{example['input']}\n\n### SQL:\n{example['output']}"}

# Map formatting only on train split (you can also format test similarly if needed)
dataset = dataset.map(lambda x: format(x), batched=False)

# Tokenization function with labels added for causal LM
def tokenize(example):
    encodings = tokenizer(
        example["text"],
        truncation=True,
        padding="max_length",
        max_length=512,
    )
    encodings["labels"] = encodings["input_ids"].copy()  # Labels = input_ids for causal LM
    return encodings

# Tokenize the training split
tokenized_dataset = dataset["train"].map(tokenize, batched=False)

# Training arguments
training_args = TrainingArguments(
    output_dir="llama7b-lora-sql",
    per_device_train_batch_size=1,
    gradient_accumulation_steps=4,
    warmup_steps=10,
    num_train_epochs=3,
    learning_rate=2e-4,
    fp16=True,
    logging_steps=10,
    save_strategy="epoch",
    report_to="none"
)

# Initialize Trainer with model and tokenized dataset
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=tokenized_dataset,
)

# Start training
trainer.train()

# Save fine-tuned model and tokenizer
model.save_pretrained("llama7b-lora-sql")
tokenizer.save_pretrained("llama7b-lora-sql")
