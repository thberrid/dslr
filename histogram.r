#!/usr/bin/Rscript --vanilla

library(ggplot2)
library(data.table)
library(patchwork)

#####

train <- fread("datasets/dataset_train.csv")

features.histograms <- Reduce(function(acc, feature.name){
    feature.name <- sym(feature.name)
    acc + wrap_plots(
            ggplot(train, aes(x=!!feature.name, color = train$"Hogwarts House")) +
                geom_histogram(position = "identity", alpha = 0.3) + labs(color = "Houses") + 
                plot_layout()
        )
   }, colnames(train[1, c(7:19)]), init = ggplot() + theme_void())

x11(width=20, height=13)
features.histograms

#####

message("Press Enter to close")
invisible(readLines("stdin", n=1))
