
scripts=("mult_n1" "mult_n2" "mult_n3" "mult_n4")

for script in "${scripts[@]}"; do
    echo batch_scripts/inj_noise/seeded/mult/${script}.sh
    sbatch batch_scripts/inj_noise/seeded/mult/${script}.sh

done





