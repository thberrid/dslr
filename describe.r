#!/usr/bin/Rscript --save --no-restore

source("ft_math.r")
source("ft_datacheck.r")

#####

args <- commandArgs(TRUE)
filename <- check_file(args[1])
dslr <- ft_checkdata(filename)
features.indexes <- c(7:length(dslr))

#####

dslr.describe <- lapply(dslr[features.indexes], extract_data)
dslr.describe <- do.call(cbind, dslr.describe)
rownames(dslr.describe) <- c("Count", "Mean", "Std", "Min", "25%", "50%", "75%", "Max")

dslr.describe
