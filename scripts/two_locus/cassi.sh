#feed in file
file_in=$1
#file out
file_out=$(echo $file_in | sed 's/^/results\//g')
#run cassi
./cassi -mem2 -lr -o ${file_out}_cassi.txt ${file_in}

