#!/bin/bash

echo "Clone models"
git lfs install
git clone https://huggingface.co/fudan-generative-ai/hallo pretrained_models
wget -O pretrained_models/hallo/net.pth https://huggingface.co/fudan-generative-ai/hallo/resolve/main/hallo/net.pth?download=true

echo "Install dependencies"
conda create -n hallo python==3.10
conda activate hallo
conda install ffmpeg
pip install -r requirements.txt


echo "Install GPU libraries"
pip install torch==2.2.2+cu121 torchaudio torchvision --index-url https://download.pytorch.org/whl/cu121
pip install onnxruntime-gpu

echo "add path of modules hallo"
export PYTHONPATH="$PYTHONPATH:/home/guillaume/hallo-webui/hallo"

echo "Installation complete"
