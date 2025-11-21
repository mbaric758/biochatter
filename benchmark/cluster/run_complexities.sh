#!/bin/bash
#SBATCH --job-name=biocypher_benchmark
#SBATCH --output=benchmark_output_%j.out
#SBATCH --error=benchmark_error_%j.err
#SBATCH --time=1-00:00:00
#SBATCH --partition=[INSERT_YOUR_PARTITION]
#SBATCH --mem=8G
#SBATCH --cpus-per-task=4

set -euo pipefail
IFS=$'\n\t'

export OPENAI_API_KEY="INSERT_YOUR_API"

cd ~/biochatter
module load Python/3.12.9

# Activate prebuilt venv
source biochatter_venv/bin/activate

MODEL="$1"
echo "Running all complexities for model: $MODEL"

complexities=("simple" "complex" "single_word" "multi_word" \
"safety_simple" "safety_medium" "safety_complex")

for c in "${complexities[@]}"; do
    echo "Running benchmark – model: $MODEL, case: $c"

    benchmark-cli \
        --models "$MODEL" \
        --case "$c" \
        --nb_iterations 100 \
        --test benchmark/test_biocypher_query_generation.py
done


