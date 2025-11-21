#!/bin/bash

# First, make sure venv is ready
bash setup_venv.sh

# Same model list you had
model_names=()


# Submit each model as a separate job
for m in "${model_names[@]}"; do
    echo "Submitting job for model: $m"
    sbatch run_complexities.sh "$m"
done

