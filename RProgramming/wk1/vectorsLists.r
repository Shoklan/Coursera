## Talking about the c() function.
## I already know how to use this from the R documentation

x <- c(1:20)

##  I don't know about the vector function though
##  you can use the vector() function to make a vector
##  Atomic type is passed in quotes, length = X
vect <- vector("numeric", length = 10)

## Mixing types vectors creates COERCION; the least common denominator in atomic type.

## how do you create COERCION?
val1 <- 0:6
## what kind of class is it?
class(val1)

## AS must be a class for conversion in this language; not a deep copy.
as.numeric(val1)

as.logical(val1)

as.character(val1)

## Nonsensical coercion results in NA's since they can't be converted.

## What is a list?
val2 <- list(1, "a", TRUE, 1 +4i)
val2
