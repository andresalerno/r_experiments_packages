
#apply
X <- matrix(rnorm(30), nrow = 5, ncol = 6)

apply(X, MARGIN = 2, StdDev)

#lapply

A <- matrix(1:9, ncol= 3, nrow = 3, byrow = FALSE)

attributes(A)

A[1,2]

B <- matrix(4:15, ncol = 3, nrow = 4, byrow = FALSE)

C <- matrix(c(8,9,10), ncol = 2, nrow = 3)

MyList <- list(A, B, C)

# Extract the 2nd column from `MyList` with the selection operator `[` with `lapply()`
lapply(MyList, "[", , 2)

# Extract the 1st row from `MyList`
lapply(MyList,"[", 1, )

