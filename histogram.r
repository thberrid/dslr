#!/usr/bin/Rscript --vanilla

library(ggplot2)
library(data.table)
library(patchwork)

#####

train <- fread("datasets/dataset_train.csv")

features.histograms <- Reduce(function(acc, feature.name){
    feature.name <- sym(feature.name)
    acc + wrap_plots(
        
        # for separate histograms :

            ggplot(train, aes(x=!!feature.name)) +
                geom_histogram(color = "black", fill="white") + 
                facet_grid(train$`Hogwarts House` ~ . )

        # for overlayed histograms :
        
        #   ggplot(train, aes(x=!!feature.name, color = train$"Hogwarts House")) +
        #       geom_histogram(position = "identity", alpha = 0.1) + labs(color = "Houses") + 
                
        )
   }, colnames(train[1, c(7:19)]), init = ggplot() + theme_void())

x11(width=20, height=13)
features.histograms

#####

message("Press Enter to close")
invisible(readLines("stdin", n=1))
