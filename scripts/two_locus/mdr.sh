#feed in file
file_in=$1
#file out
file_out=$(echo $file_in | sed 's/^/results\//g')
#run MDR
java -jar mdr_3.0.2.jar -parallel -seed=123 -min=2 -max=2 -saveanalysis=${file_out}_mdr_moore.txt ${file_in}.mdr.tsv 
