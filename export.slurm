#!/bin/bash
#SBATCH --job-name=llama3.2-3b_run
#SBATCH --output=llama3.2-3b_output_%j.log
#SBATCH --error=llama3.2-3b_error_%j.log
#SBATCH --time=00:30:00
#SBATCH --mem=64G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --partition=normal

# Load any necessary modules (adjust as needed for your system)
module load Python/3.10.8

source $SCRATCH/llama3x/.venv/bin/activate

# Run the command
python llama3.2-3b.bin --meta-llama assets/llama-3.2-3b/consolidated.00.pth