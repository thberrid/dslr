#!/usr/bin/Rscript --no-save --restore

source("ft_math.r")

# data 
# index_features <- c(7:length(data))
# describe.table

# data[data[2] == "Ravenclaw", 9]

houses <- c("Ravenclaw", "Slytherin", "Gryffindor", "Hufflepuff")

#ft_sum(data[data[2] == H, i.f])

data.hist <- outer(
                    houses,
                    index_features,
                    Vectorize(function(x, y){
                        ft_mean(data[data[2] == x, y])
                    })
            )
rownames(data.hist) <- houses
colnames(data.hist) <- colnames(data[index_features])
data.hist <- scale(data.hist, center = FALSE)
#data.hist

test <- c(-5, 0, 10)
test <- scale(test)
test

#        F1.sum  F2.sum  F3.  F4. ...
#class1
#class2
#class3
#class4