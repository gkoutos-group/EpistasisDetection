#feed in file
file_in=$1
#file out
file_out=$(echo $file_in | sed 's/^/results\//g')
#slight modification of tped file so it is acceptable to MPI3SNP
sed 's/B/T/g' ${file_in}.tped > ${file_in}1.tped
#run tool
MPI3SNP ${file_in}1.tped ${file_in}.tfam ${file_out}_mpi3snp
