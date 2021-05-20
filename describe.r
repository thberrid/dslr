#!/usr/bin/Rscript --save --no-restore

source("ft_math.r")
source("ft_datacheck.r")

args <- commandArgs(TRUE)
filename <- check_file(args[1])
data <- ft_checkdata(filename)

index_features <- c(7:length(data))
data.describe <- lapply(data[index_features], extract_data)
data.describe <- do.call(cbind, data.describe)
rownames(data.describe) <- c("Count", "Mean", "Std", "Min", "25%", "50%", "75%", "Max")
data.describe
