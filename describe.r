#!/usr/bin/Rscript --save --no-restore

source("ft_math.r")
source("ft_datacheck.r")

args <- commandArgs(TRUE)
filename <- check_file(args[1])
data <- ft_checkdata(filename)

index_features <- c(7:length(data))
describe.table <- lapply(data[index_features], extract_data)
describe.table <- do.call(cbind, describe.table)
rownames(describe.table) <- c("Count", "Mean", "Std", "Min", "25%", "50%", "75%", "Max")
describe.table
