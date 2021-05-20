isDate <- function(test){
	tryCatch(!is.na(as.Date(test, "%Y-%m-%d")),
	error = function(err) {err})
}

extract_data <- function (x){
    c(
        ft_count(x),
        ft_mean(x),
        ft_std(x),
        ft_min(x),
        ft_percentile(x, 25),
        ft_percentile(x, 50),
        ft_percentile(x, 75),
        ft_max(x)
    )
}

check_file <- function(filename){
    if (is.na(filename)){
        cat("usage: ./predict file.csv\n")
        q()
    }
    if (!file.exists(filename)){
        cat("file does not exist\n")
        q()
    }
    filename
}

ft_checkdata <- function (filename){
    d <- read.csv(filename, stringsAsFactors = FALSE, strip.white = TRUE)
    features.indexes <- c(7:length(d))
    houses.names <- c("Ravenclaw", "Slytherin", "Gryffindor", "Hufflepuff")
    if (

        #check index
        !all(is.integer(d[[1]])) | any(is.na(d[[1]]))

        #check house's name: Ravenclaw - Slytherin - Gryffindor - Hufflepuff
        | !all(d[[2]] %in% houses.names)

        #check first / name name
        | any(d[3:4] == "")
        
        #check birthday
        | !all(isDate(d[[5]]))
        
        #check hand: Left / Right
        | !all(d[[6]] %in% c("Left", "Right"))

        #check features list
        | !all(sapply(d[features.indexes], is.numeric))
        )
    {
        cat("error in ", filename, "\n")
        quit()
    }
    d[features.indexes] <- lapply(d[features.indexes], function(x) replace(x, is.na(x), ft_mean(x)))
    d
}
