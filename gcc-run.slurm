#!/bin/bash
#SBATCH --job-name=gcc_run
#SBATCH --output=gcc_run_output_%j.log
#SBATCH --error=gcc_run_error_%j.log
#SBATCH --time=00:30:00
#SBATCH --mem=128G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8


cd $SCRATCH/llama3x.c

module load GCCcore/12.2.0 Python/3.10.8

# Run the command
make clean
make all

./run1b -i "once upon a time" -t 0.0