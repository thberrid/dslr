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
    data <- read.csv(filename, stringsAsFactors = FALSE, strip.white = TRUE)
    index_features <- c(7:length(data))
    if (

        #check index
        !all(is.integer(data[[1]])) | any(is.na(data[[1]]))

        #check house's name: Ravenclaw - Slytherin - Gryffindor - Hufflepuff
        | !all(data[[2]] %in% c("Ravenclaw", "Slytherin", "Gryffindor", "Hufflepuff"))

        #check first / name name
        | any(data[3:4] == "")
        
        #check birthday
        | !all(isDate(data[[5]]))
        
        #check hand: Left / Right
        | !all(data[[6]] %in% c("Left", "Right"))

        #check features list
        | !all(sapply(data[index_features], is.numeric))
        )
    {
        cat("error in ", filename, "\n")
        quit()
    }
    data[index_features] <- lapply(data[index_features], function(x) replace(x, is.na(x), ft_mean(x)))
    data
}
