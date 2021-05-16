# dslr

##R installation

`sudo apt install r-base`

##notes:

#pipes : `f(x)` is equal to `x %>% f`, and `f(x,  y)` as `x %>% f(y)` or `x %>% f( ., y)`

#`na` : not available

```
a <- c(1, 2, NA)
is.na(a) # FALSE FALSE TRUE
```

#index :
    - `x[is.na(x)] <- 0` replace missing values with zero
    - `foo <- list(i="5", r="8")` then `foo$i` (see also `attach()/detach()`) is the same as `foo[[1]]`, but `foo[1]` includes the name.

#misc : 
    - `ls()` to list the current objects
    - `rm()` to remmove objects
    - `typeof()` and `class()`
    - `seq()`, `rep()`, `(:)` 
    - `?something`, `fn_name_without_parenthesis`, `methods(class="class_name")`