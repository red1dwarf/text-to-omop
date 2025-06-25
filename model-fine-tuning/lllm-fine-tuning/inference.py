from transformers import AutoModelForCausalLM, AutoTokenizer
from peft import PeftModel
import torch

# Path to your fine-tuned model directory
model_path = "llama7b-lora-sql"

# Load base model
base_model = AutoModelForCausalLM.from_pretrained(
    "meta-llama/Llama-2-7b-hf",  # base model
    torch_dtype=torch.float16,
    device_map="auto"
)

# Load LoRA adapter on top of base model
model = PeftModel.from_pretrained(base_model, model_path)
model.eval()

# Load tokenizer
tokenizer = AutoTokenizer.from_pretrained(model_path)

# Set pad token if missing
if tokenizer.pad_token is None:
    tokenizer.pad_token = tokenizer.eos_token


# Inference prompt
question = "Question: What are the top 3 frequent prescribed drugs for patients who were also prescribed drug_concept_id 19135374 within 2 year until January/last year?"
prompt = f"### Question:\n{question}\n\n### SQL:\n"

# Tokenize input
inputs = tokenizer(prompt, return_tensors="pt").to(model.device)

# Generate output
with torch.no_grad():
    output = model.generate(
        **inputs,
        max_new_tokens=128,
        do_sample=False,  # deterministic output
        temperature=0.7,
        top_p=0.9
    )

# Decode and print result
result = tokenizer.decode(output[0], skip_special_tokens=True)