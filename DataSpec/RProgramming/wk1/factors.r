## Factors are used for catagorical data: ordered or unordered.
## What are lm() and glm()?

## Factors are better since their self describing rather than integer indexes.
x <- factor(c("yes","yes", "no", "yes", "no"))
x

## Levels are the number of distinct values
## table displays the totals of each factor
table(x)

## Unclass converts the factor name to the Integer index
unclass(x)

## factors(DATA, levels= c("yes", "no"))
## factors will pick the indexes based on alphabetical order
## but, you can overwrite this using "levels="