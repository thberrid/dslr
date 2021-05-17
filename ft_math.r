ft_sum <- function (X){
    Reduce(function(x, y){
        if (is.na(y))
            return (x)
        else
            x + y
    }, X, init = 0)
}

ft_count <- function (X){
    Reduce(function(x, y){
        if (is.na(y))
            return (x)
        else
            x + 1

    }, X, init = 0)
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
    if ((n + 1) %% (100 / percent) == 0){ 
        return (X[(n + 1) * percent / 100])
    }
    ft_mean(c(X[floor((n + 1) * percent / 100)], X[ceiling((n + 1) * percent / 100)]))
}