## Make the matrix
m <- matrix(nrow = 2, ncol = 3)
m

## How many dimension attributes?
dim(m)

attributes(m)

## Matrix fills values based on col1 ->rAll, col2 ->rAll etc.
## In words, it goes down one column at a time filling in values.
m <- matrix(1:6, nrow=2, ncol=3)
m

## You can also create dim() to select the dimensions.
dim(m) <-c(2,5)

## cbind(), rbind()
## cbind sends values down a column, rbind() sends them across the rows.