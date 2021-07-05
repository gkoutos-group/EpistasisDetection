#feed in file
file_in=$1
#file out
file_out=$(echo $file_in | sed 's/^/results\//g')
#unique folder for results
new_folder=$(echo $file_in | sed 's/\//_/g')
#make folder for results
mkdir -p params/${new_folder}

cd params/${new_folder}
#run snp ruler
java -jar ../../SNPRuler/rule.jar 1500 3 0.2 ../../${file_in}
#copy output file to results folder
cp interactions.txt ${file_out}_snpruler_fin.txt
