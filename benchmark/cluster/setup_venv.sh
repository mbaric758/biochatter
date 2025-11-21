#!/bin/bash
cd ~/biochatter

# Create venv if it doesn't exist
if [[ ! -d "biochatter_venv" ]]; then
    python3 -m venv biochatter_venv
fi

source biochatter_venv/bin/activate

# Install all packages
pip install --upgrade pip
pip install pytest openai pandas numpy requests
pip install -r [INSERT_PATH_TO]/requirements.txt
pip install -e .

