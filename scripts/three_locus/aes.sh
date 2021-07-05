#feed in file
file_in=$1
#file out
file_out=$(echo $file_in | sed 's/^/results\//g')
#folder for results
new_folder=$(echo $file_in | sed 's/\//_/g'))
#number of snps in analysis
snps=500
small=$( echo "$snps * 0.1" | bc )
large=$( echo "$small * 0.5" | bc )
#create new folder
mkdir -p params/${new_folder}/digenic
#taking a modified default parameters file (in this dir) so it can be updated using the below 
cp parameters_digenic.txt params/${new_folder}/trigenic/parameters.txt

echo "INPFILE ../../../${file_in}.aes.csv     //input file name for case-control genotype data
OUTFILE ../../../${file_out}.aes.trigenic   //output file name for detected epistatic interactions" >> params/${new_folder}/trigenic/parameters.txt

cd params/${new_folder}/digenic
sed -i "s/snps_in/${snps}/g" parameters.txt
sed -i "s/small_in/${small}/g" parameters.txt
sed -i "s/large_in/${large}/g" parameters.txt

../../../AntEpiSeeker


