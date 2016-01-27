## R has five basic atomic object classes
## There are characters, numeric, integers, complex, and boolean/logical

# the Most basic object is called a vector.
# It cannot contain of a mixed type; so, it's R's version on an array
# except lists, which we're not working with yet

## All numbers are treated as double precision doubles.
## Lsuffix formats to Int type.

## Inf stands for Infinity; it's treated like a number
## NaN stands for Not a Number; like Perl/Python

##  R Attributes:
##     names, dimnames
##     dimensions
##     class
##     length
##     user-defined attributes

## You can use attributes() to access functions

x <- 1:20
attributes(x)
