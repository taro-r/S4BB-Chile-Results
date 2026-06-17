#!/bin/bash
#SBATCH --account mp107a
#SBATCH --constraint cpu
#SBATCH --time 05:00:00
#SBATCH --nodes 1
#SBATCH --cpus-per-task 4
#SBATCH --qos regular
#SBATCH --mail-user=tramacciotti@lbl.gov
#SBATCH --mail-type=ALL
#SBATCH --output=jobs/inj_noise/seeded/gauss_n2/slurm-%j.out


module load conda
conda activate s4bb-env

export LD_LIBRARY_PATH=$HOME/usr/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$HOME/Projects/ChileResults:$PYTHONPATH
export OMP_NUM_THREADS=4

pwd

/usr/bin/time -v python -u phase2_calcspec.py comb 1 20 --nlat 3 --pbs --rlz 0 100 --seed-LTnoise \
    &> jobs/inj_noise/seeded/gauss_n2/nlat3_comb.out

/usr/bin/time -v python -u phase2_mlsearch.py 1 20 --nlat 3 --rlz 0 100 --pbs --noffdiag 0 &> jobs/inj_noise/seeded/gauss_n2/nlat3_mlsearch.out