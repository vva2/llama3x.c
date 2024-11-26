import os
import shutil
from huggingface_hub import snapshot_download

# Replace 'facebook/llama-3b' with the actual model repo ID
repo_id = "meta-llama/Llama-3.1-8B"

ROOT = os.path.dirname(os.path.abspath(__file__))

# Download only the 'original' folder
snapshot_download(
    repo_id=repo_id,
    allow_patterns=["original/*"],
    cache_dir=os.path.dirname(__file__)
)

folder_path = os.path.join(ROOT, 'models--meta-llama--Llama-3.1-8B', 'blobs')

file_mappings = {
    '82e9d31979e92ab929cd544440f129d9ecd797b69e327f80f17e1c50d5551b55': 'tokenizer.model',
    'a4bf93805847a87006dfc036ec518dc1ff94605f3a0bcd819916477ae9dcafbc': 'consolidated.00.pth',
    '0df11e3fad3f9420c84418a4b57cc2e87564d91b': 'params.json'
}

for k, v in file_mappings.items():
    src = os.path.join(folder_path, k)
    dst = os.path.join(ROOT, v)

    print(f'Moved src: {src} | dst: {dst}')

    shutil.move(src, dst)
