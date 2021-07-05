#feed in file
file_in=$1
#file out
file_out=$(echo $file_in | sed 's/^/results\//g')
#run R script
Rscript di_cinoedv.R $file_in $file_out
