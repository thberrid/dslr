#!/usr/bin/Rscript --no-save --no-restore

source("ft_math.r")

# x11()


houses <- c("Ravenclaw", "Slytherin", "Gryffindor", "Hufflepuff")
#rm(list = ls())
# create mean by features for each houses
exists("data")
data
#ft_sum(data[data[2] == H, i.f])

# if (FALSE){
# data.hist <- outer(
#                     houses,
#                     index_features,
#                     Vectorize(function(x, y){
#                         ft_mean(data[data[2] == x, y])
#                     })
#             )
# rownames(data.hist) <- houses
# colnames(data.hist) <- colnames(data[index_features])
# data.hist <- scale(data.hist, center = FALSE)
# #data.hist

# test <- c(-5, 0, 10)
# test <- scale(test)
# test


#        F1.sum  F2.sum  F3.  F4. ...
#class1
#class2
#class3
#class4

#message("Press Enter to close")
#invisible(readLines("stdin", n=1))