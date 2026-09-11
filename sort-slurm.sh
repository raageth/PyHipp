#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH -J "sort"
## /SBATCH -p general
#SBATCH -o %x-slurm.%N.%j.out
#SBATCH -e %x-slurm.%N.%j.err

/data/miniconda3/bin/conda init
source ~/.bashrc
envarg=`/data/src/PyHipp/envlist.py`
conda activate $envarg

python -u -c "from PyHipp import mountain_batch; mountain_batch.mountain_batch(); from PyHipp import export_mountain_cells; export_mountain_cells.export_mountain_cells();"

conda deactivate
/data/src/PyHipp/envlist.py $envarg
