#!/bin/bash
#SBATCH --job-name=gcc_run
#SBATCH --output=gcc_run_output_%j.log
#SBATCH --error=gcc_run_error_%j.log
#SBATCH --time=00:30:00
#SBATCH --mem=64G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --partition=normal

module load GCCcore/12.2.0

# Run the command
make clean

make run8b

./run8b -i "where is texas a&m located?"