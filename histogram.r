#!/usr/bin/Rscript --no-save --restore

library(ggplot2)
source("ft_math.r")

x11()
if (!exists(c("dslr"))){
    cat("Execute describe.r before using this script.\n")
    quit()
}

#####

# ggplot(dslr, aes(x=Astronomy, color = "Hogwarts House")) + 
#   geom_histogram()

library(data.table)

train <- fread("datasets/dataset_train.csv")

#p <- ggplot(train, aes(x=Astronomy, color = train$"Hogwarts House")) +
#    geom_histogram(fill="white")q

p <- ggplot(train, aes(x=notes, color = train$"Hogwarts House")) +
    geom_histogram(position = "identity", alpha = 0.3)


p

#ggplot(train, aes(x=Divination))+
#    geom_histogram(color="black", fill="white")+
#   facet_grid(train$`Hogwarts House` ~ .)

message("Press Enter to close")
invisible(readLines("stdin", n=1))
