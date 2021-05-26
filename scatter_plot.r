#!/usr/bin/Rscript --vanilla

library(ggplot2)
library(data.table)
library(patchwork)

#####

train <- fread("datasets/dataset_train.csv")

#####

# to generate a set of .png
# of all scatter plottings combination

if (FALSE){

index <- 0
for (Y in colnames(train[1,])) {
    Y <- sym(Y)
    Reduce(function(acc, feature.name){
        X <- sym(feature.name)
        acc + wrap_plots(
                ggplot(train, aes(y = !!Y,
                                  x = !!X,
                                  color = train$"Hogwarts House")) +
                        geom_point() +
                        labs(color = "Houses")

            )
        }, colnames(train[1, c(1:19)]), init = ggplot() + theme_void())
    #
    
    ggsave(paste("test", index, "_(", Y , ").png"), width = 30, height = 20)
    index <- index + 1
    cat("image #", index, "done\n")
}

}

#####

x11(width=20, height=13)

ggplot(train, aes(y = `Astronomy`,
                  x = `Defense Against the Dark Arts`,
                  color = train$"Hogwarts House")) +
    geom_point() +
    labs(color = "Houses")

message("Press Enter to close")
invisible(readLines("stdin", n=1))