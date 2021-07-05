#feed in file
file_in=$1
#file out
file_out=$(echo $file_in | sed 's/^/results\//g')
#run PLINK in parallel (parallel not used for runtime tests)
srun --ntasks=1 plink --bfile $file_in --epistasis --epi1 0.001 --allow-no-sex --parallel 1 5 --out ${file_out}_plink_epi &
srun --ntasks=1 plink --bfile $file_in --epistasis --epi1 0.001 --allow-no-sex --parallel 2 5 --out ${file_out}_plink_epi &
srun --ntasks=1 plink --bfile $file_in --epistasis --epi1 0.001 --allow-no-sex --parallel 3 5 --out ${file_out}_plink_epi &
srun --ntasks=1 plink --bfile $file_in --epistasis --epi1 0.001 --allow-no-sex --parallel 4 5 --out ${file_out}_plink_epi &
srun --ntasks=1 plink --bfile $file_in --epistasis --epi1 0.001 --allow-no-sex --parallel 5 5 --out ${file_out}_plink_epi &
wait
