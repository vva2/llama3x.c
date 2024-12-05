# llama3x.c

A C implementation for running LLaMA 3.1 and 3.2 inference. This project supports multiple model variants including LLaMA 3.2 1B, LLaMA 3.2 3B, and LLaMA 3.1 8B models.

## Prerequisites

- Python 3.10
- GCC compiler
- OpenMP support
- Hugging Face account with approved access to LLaMA models

## Installation

1. Create and activate a Python virtual environment:
```bash
python -m venv .venv
source .venv/bin/activate  # On Unix/macOS
# or
.venv\Scripts\activate     # On Windows
```

2. Install required Python package:
```bash
pip install huggingface_hub
```

3. Login to Hugging Face:
```bash
huggingface-cli login
```

**Note:** You need to request access to LLaMA 3.1 and 3.2 models on the Hugging Face website. Wait for email confirmation of your approval before proceeding.

4. Download model assets:
```bash
./download.sh
```

This script will set up the required `assets` folder with the model files.

## Building and Running

The project includes a Makefile with targets for different model variants:

- `make run1b`: Builds LLaMA 3.2 1B model
- `make run3b`: Builds LLaMA 3.2 3B model
- `make run8b`: Builds LLaMA 3.1 8B model

To clean build files:
```bash
make clean
```

### Running Inference

Basic usage:
```bash
./run1b -i "once upon a time" -t 0.8
```

### Command Line Options

- `-t <float>`: Temperature (default: 1.0)
- `-p <float>`: Top-p sampling value (default: 0.9)
- `-s <int>`: Random seed (default: current time)
- `-n <int>`: Number of steps to run (default: 256, 0 = max_seq_len)
- `-i <string>`: Input prompt
- `-z <string>`: Path to custom tokenizer
- `-m <string>`: Mode: generate|chat (default: generate)
- `-y <string>`: System prompt for chat mode

## Project Structure

- `main.c`: Core implementation file
- `Makefile`: Build configuration
- `download.sh`: Script for downloading model assets
- `assets/`: Directory containing model files (created by download script)
  - `llama-3_2-1b/`
  - `llama-3_2-3b/`
  - `llama-3_1-8b/`

## Acknowledgements

This implementation is based on [llama2.c](https://github.com/karpathy/llama2.c) by Andrej Karpathy.

## License

[Include your license information here]