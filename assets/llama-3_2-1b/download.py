import os
import shutil
from huggingface_hub import snapshot_download

# Replace 'facebook/llama-3b' with the actual model repo ID
repo_id = "meta-llama/Llama-3.2-1B"

ROOT = os.path.dirname(os.path.abspath(__file__))

# Download only the 'original' folder
snapshot_download(
    repo_id=repo_id,
    allow_patterns=["original/*"],
    cache_dir=os.path.dirname(__file__)
)

folder_path = os.path.join(ROOT, 'models--meta-llama--Llama-3.2-1B', 'blobs')

file_mappings = {
    '82e9d31979e92ab929cd544440f129d9ecd797b69e327f80f17e1c50d5551b55': 'tokenizer.model',
    'cfa47fb7185ebd1c3712fff5fa04fdbb0675c1e345fc72e12f6c7b65b8da6f05': 'consolidated.00.pth',
    'e1ea21c4ff6e1905e1f42ecf8ebe0ee10a063b98': 'params.json'
}

for k, v in file_mappings.items():
    src = os.path.join(folder_path, k)
    dst = os.path.join(ROOT, v)

    print(f'src: {src} | dst: {dst}')

    shutil.move(src, dst)

shutil.rmtree(os.path.join(ROOT, '.locks'))
