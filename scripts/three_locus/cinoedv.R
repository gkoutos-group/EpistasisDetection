#load data
args = commandArgs(trailingOnly = TRUE)
input = args[1]
output = args[2]
#load libraries
library(CINOEDV)
library(tidyverse)
library(data.table)
#read in data
fin = fread(paste0(input,".raw"), sep = " ", header = T)
#some daata wrangling
geno = fin %>% select(7:ncol(fin))
geno = as.matrix(geno) + 1
rownames(geno)  = fin$IID

pheno = fin %>% select(PHENOTYPE) %>% t
pheno = as.matrix(pheno)
colnames(pheno) = fin$IID
#run tool function
res = PSOSearch(pts = geno, class = pheno, MaxOrder = 3, TopSNP=250, measure = 1, alpha = 0)
#save output
saveRDS(res$ThreeEffect, paste0(output,".cinoedv.rds"))


