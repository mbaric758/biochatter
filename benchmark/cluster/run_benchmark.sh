#!/bin/bash
#SBATCH --job-name=biocypher_benchmark
#SBATCH --output=benchmark_output_%j.out
#SBATCH --error=benchmark_error_%j.err
#SBATCH --time=1-00:00:00
#SBATCH --partition=YOUR_PARTITION_NAME
#SBATCH --mem=8G
#SBATCH --cpus-per-task=4

set -euo pipefail

# ---- Paths -----------------------------------------------------------------
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"  # folder of this script
VENV="$DIR/biochatter_venv"                           # venv path
TEST_FILE="$DIR/../test_biocypher_query_generation.py" # absolute test file path

# ---- Environment -----------------------------------------------------------
module load Python/3.12.9

bash "$DIR/setup_venv.sh"

# Activate venv
source "$VENV/bin/activate"

# ---- API Key ---------------------------------------------------------------
export OPENAI_API_KEY="YOUR_API_KEY"  # safer: must be set externally

# ---- Benchmark config ------------------------------------------------------
models=(
    gpt-oss-120b
)

complexities=(
    simple
    complex
    single_word
    multi_word
    safety_simple
    safety_medium
    safety_complex
)

NB_ITERATIONS=10

# ---- Run benchmarks --------------------------------------------------------
for model in "${models[@]}"; do
    echo "=================================================="
    echo "Running benchmarks for model: $model"
    echo "=================================================="

    for c in "${complexities[@]}"; do
        echo "Case: $c"

        sbatch  benchmark-cli \
                --models "$model" \
                --case "$c" \
                --nb_iterations "$NB_ITERATIONS" \
                --test "$TEST_FILE"
    done
done