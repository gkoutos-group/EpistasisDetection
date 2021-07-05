#feed in file
file_in=$1
#run epiaco - small change in epiaco matlab script to give location for output result file
matlab -r "epiACO(${file},20000,250,0.2)"
