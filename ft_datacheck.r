isDate <- function(test){
	tryCatch(!is.na(as.Date(test, "%Y-%m-%d")),
	error = function(err) {err})
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
        | !all(sapply(data[7:19], is.numeric))
        )
    {
        cat("error in ", filename, "\n")
        quit()
    }
    data[7:19] <- lapply(data[7:19], function(x) replace(x, is.na(x), ft_mean(x)))
    data
}
