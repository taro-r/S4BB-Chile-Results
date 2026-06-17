#!/bin/bash
#SBATCH --account mp107a
#SBATCH --constraint cpu
#SBATCH --time 03:00:00
#SBATCH --nodes 1
#SBATCH --cpus-per-task 1
#SBATCH --qos regular
#SBATCH --mail-user=tramacciotti@lbl.gov
#SBATCH --mail-type=ALL
#SBATCH --output=jobs/inj_noise/seeded/mult/mult_n3/slurm-%j.out


module load conda
conda activate s4bb-env

export LD_LIBRARY_PATH=$HOME/usr/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$HOME/Projects/ChileResults:$PYTHONPATH


simtype=("llcdm" "noise" "signoi" "comb")
dirpath="mult/mult_n3"

pwd

echo "mlsearch attempt 2"

/usr/bin/time -v python -u phase2_mlsearch.py 1 20 --nlat 3 --rlz 0 100 --pbs --noffdiag 0 --fpath ${dirpath} \
&> jobs/inj_noise/seeded/${dirpath}/att2_nlat3_mlsearch.out
