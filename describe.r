#!/usr/bin/Rscript --vanilla

source("ft_math.r");
#import parsing.R

args <- commandArgs(TRUE)

if (is.na(args[1])){
	cat("usage: ./predict file.csv\n")
	q()
}

if (!file.exists(args[1])){
	cat("file does not exist\n")
	q()
}

# all.equal / any / identical
# build consistent data.frame
# [] vs [[]] ?
# is.numeric !! is.finite()

datas <- read.csv(args[1])
a <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9) 
#ft_sum(a)
#watch(a)
#ft_count(a)
#ft_mean(a)
#ft_max(a)
#ft_std(a)

ft_percentile(a, 25)
ft_percentile(a, 50)
ft_percentile(a, 75)
