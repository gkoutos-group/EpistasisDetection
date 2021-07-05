#input and output filenames
args = commandArgs(trailingOnly = TRUE)
input = args[1]
output = args[2]
#load libraries
library(wtest)
library(tidyverse)
library(data.table)
#load data
fin = fread(paste0(input,".raw"), sep = " ", header = T)
#daata wrangling
geno = fin %>% select(7:ncol(fin))
pheno = fin$PHENOTYPE
pheno[pheno == 1] = 0
pheno[pheno == 2] = 1

#run tool function
res.high = wtest.high(geno, pheno, w.order = 3, hf1 = "default.hf1", hf.high.order = "default.high", which.marker = NULL, output.pval = NULL, sort = TRUE, input.pval = NULL, input.poolsize = NULL)
#write output
write_tsv(res.high$results, paste0(output,"_wtest_3rd_ord.tsv"))

