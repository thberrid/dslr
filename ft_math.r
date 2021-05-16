ft_sum <- function (X){
    Reduce(function(x, y){ x + y }, X)
}

ft_count <- function (X){
    Reduce(function(x, y){ x + 1 }, X, init = 0)
}

ft_mean <- function (X){
    ft_sum(X) / ft_count(X)
}

ft_min <- function (X){
    Reduce(function(x, y){ if (y < x) x = y ; x }, X, init = X[1])
}

ft_max <- function (X){
    Reduce(function(x, y){ if (y > x) x = y ; x }, X, init = X[1])
}

ft_std <- function (X){
    sqrt(
        ft_sum(
            ((X - ft_mean(X)) ^ 2)
        ) / ft_count(X)
    )
}

ft_percentile <- function(X, percent){
    if (percent < 0 | percent > 100)
        return (NA)
    X <- sort(X)
    n <- ft_count(X)

#    if (n %% 2 == 0){
#       return (ft_mean(c(X[n * (percent / 100)], X[(n + 2)  * (percent / 100)])))
#   }
#    X[ceiling(n  * (percent / 100))]
}