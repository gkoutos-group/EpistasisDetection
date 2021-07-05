#feed in file
file_in=$1
#file out
file_out=$(echo $file_in | sed 's/^/results\//g')
#run script
Rscript wtest.R $file_in $file_out
