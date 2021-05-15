#!/usr/bin/Rscript --vanilla

#import ft_math.R
#import parsing.R

args <- commandArgs(TRUE)

if (is.na(args[1])){
	cat("usage: ./predict file.csv")
	q()
}

if (!file.exists(args[1])){
	cat("file does not exist\n")
	q()
}

# all.equal / any / identical
# build consistent data.frame
# [] vs [[]] ?

datas <- read.csv(args[1])
identical(datas)

