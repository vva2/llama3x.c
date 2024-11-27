#!/bin/bash

# author : vva2

module load GCCcore/12.2.0 Python/3.10.8
source .venv/bin/activate

pip install --no-cache-dir --no-user huggingface_hub numpy torch tiktoken blobfile

# Function to execute model tasks
process_model() {
    local model_path=$1
    local model_name=$2

    if [ ! -f "${model_path}/.done" ]; then
        echo "Processing ${model_name}..."
        
        python ${model_path}/download.py
        if [ $? -ne 0 ]; then
            echo "Error: ${model_path}/download.py failed to execute."
            exit 1
        fi
        echo "Downloaded ${model_name} checkpoint."

        python utils/tokenizer_export.py -t ${model_path}/tokenizer.model
        if [ $? -ne 0 ]; then
            echo "Error: ${model_path}/tokenizer_export.py failed to execute."
            exit 1
        fi
        echo "${model_name} tokenizer export done."

        python utils/model_export.py ${model_path}/${model_name}.bin --meta-llama ${model_path}
        if [ $? -ne 0 ]; then
            echo "Error: ${model_path}/model_export.py failed to execute."
            exit 1
        fi
        touch ${model_path}/.done
        echo "${model_name} model export done."
    else
        echo "${model_name} has already been processed. Skipping..."
    fi
}

# Process models
process_model "assets/llama-3_2-1b" "llama-3_2-1b"
process_model "assets/llama-3_2-3b" "llama-3_2-3b"
process_model "assets/llama-3_1-8b" "llama-3_1-8b"

# Build project
make clean
make all
