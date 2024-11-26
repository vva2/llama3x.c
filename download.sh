#!/bin/bash

module load GCCcore/12.2.0 Python/3.10.8
source .venv/bin/activate

# Run the second Python script
python assets/llama-3_2-1b/download.py
if [ $? -ne 0 ]; then
    echo "Error: assets/llama-3_2-1b/download.py failed to execute."
    exit 1
fi

python utils/tokenizer_export.py -t assets/llama-3_2-1b/tokenizer.model
if [ $? -ne 0 ]; then
    echo "Error: assets/llama-3_2-1b/download.py failed to execute."
    exit 1
fi

python assets/llama-3_2-1b/llama-3_2-1b.bin utils/model_export.py --meta-llama assets/llama-3_2-1b
if [ $? -ne 0 ]; then
    echo "Error: assets/llama-3_2-1b/download.py failed to execute."
    exit 1
fi

# Run the third Python script
python assets/llama-3_2-3b/download.py
if [ $? -ne 0 ]; then
    echo "Error: assets/llama-3_2-3b/download.py failed to execute."
    exit 1
fi

python utils/tokenizer_export.py -t assets/llama-3_2-3b/tokenizer.model
if [ $? -ne 0 ]; then
    echo "Error: assets/llama-3_2-3b/download.py failed to execute."
    exit 1
fi

python assets/llama-3_2-3b/llama-3_2-3b.bin utils/model_export.py --meta-llama assets/llama-3_2-3b
if [ $? -ne 0 ]; then
    echo "Error: assets/llama-3_2-3b/download.py failed to execute."
    exit 1
fi

# Run the first Python script
python assets/llama-3_1-8b/download.py
if [ $? -ne 0 ]; then
    echo "Error: assets/llama-3_1-8b/download.py failed to execute."
    exit 1
fi

python utils/tokenizer_export.py -t assets/llama-3_1-8b/tokenizer.model
if [ $? -ne 0 ]; then
    echo "Error: assets/llama-3_1-8b/download.py failed to execute."
    exit 1
fi

python assets/llama-3_1-8b/llama-3_1-8b.bin utils/model_export.py --meta-llama assets/llama-3_1-8b
if [ $? -ne 0 ]; then
    echo "Error: assets/llama-3_1-8b/download.py failed to execute."
    exit 1
fi


echo "All scripts executed successfully."
