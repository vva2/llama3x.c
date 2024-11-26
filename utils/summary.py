from transformers import AutoModelForCausalLM, AutoConfig

# Load the model configuration
model_name = "meta-llama/Llama-3.1-8B"  # Replace with the actual Hugging Face model path
config = AutoConfig.from_pretrained(model_name)

print(config)

# Initialize the model structure without loading weights
model = AutoModelForCausalLM.from_config(config)

# Print the model structure
print(model)
