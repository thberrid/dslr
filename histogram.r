#!/usr/bin/Rscript --no-save --restore

library(ggplot2)
source("ft_math.r")

x11()
if (!exists(c("dslr"))){
    cat("Execute describe.r before using this script.\n")
    quit()
}

#####

features.indexes <- c(7:length(dslr))
houses.names <- c("Ravenclaw", "Slytherin", "Gryffindor", "Hufflepuff")

dslr.means <- outer(
                    houses.names,
                    features.indexes,
                    Vectorize(function(x, y){
                        ft_sum(dslr[dslr[2] == x, y])
                    })
            )
rownames(dslr.means) <- houses.names
colnames(dslr.means) <- colnames(dslr.describe)
#dslr.means

#hist(dslr[dslr[2] == "Ravenclaw", 16])

ggplot(dslr, aes(binwidth = 1)) + 
#    geom_histogram(aes(x = Astronomy), fill="orange", alpha = .2) +
#    geom_histogram(aes(x = Arithmancy), fill="blue", alpha = .2) + 
    geom_histogram(aes(x = Herbology), fill="green", alpha = .2)
#    + geom_histogram(fill="blue", alpha = .2)


# variance
# V <- function (X) {
#     n <- ft_count(X)
#     X <- ft_normalize(X)
#     mean <- ft_mean(X)
#     1 / n * sum((X - mean) ^ 2)
# }

# dslr.means.variance <- apply(dslr.means, MARGIN = 2, FUN = V)
# dslr.means.variance

#hist(dslr.means.variance)


#####

message("Press Enter to close")
invisible(readLines("stdin", n=1))