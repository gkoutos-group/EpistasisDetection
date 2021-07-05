#feed in file
file_in=$1
#run the gss script with slight modification to output results to a results folder
matlab -r "runGssAnalysis(${file_in})"

