#!/usr/bin/Rscript --vanilla

source("ft_math.r")
source("ft_datacheck.r")

test <- c(1, NA, 1, 1, 1)

args <- commandArgs(TRUE)
filename <- check_file(args[1])
data <- ft_checkdata(filename)

data[[7]]
#####

#data <- read.csv(args[1], stringsAsFactors = FALSE)
#data[[3]]
#smode(data[[3]])

#test <- c("2001-02-16", "2001-02-17")


#as.Date("20210920", "%y-%m-%d")

#all(isDate(test))