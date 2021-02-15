
#apply
X <- matrix(rnorm(30), nrow = 5, ncol = 6)

#summing in the columns
apply(X, MARGIN = 2, FUN = sum)

#summing in the row
apply(X, MARGIN = 1, FUN = sum)

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

#sapply
# Return a list with `lapply()`
W <- lapply(MyList,"[", 2, 1 )
W
# Return a vector with `sapply()`
sapply(MyList,"[", 2, 1 )

# Return a list with `sapply()`
sapply(MyList,"[", 2, 1, simplify=F)

# Return a vector with `unlist()`
unlist(lapply(MyList,"[", 2, 1 ))

#rep() function

# Initialize `Z`
Z <- sapply(MyList,"[", 1,1 )

# Return `Z`
Z

# Replicate the values of `Z`
Z <- rep(Z,c(3,1,2))

# Return `Z`
Z

#mapply()

# Create a 4x4 matrix
Q1 <- matrix(c(rep(1, 4), rep(2, 4), rep(3, 4), rep(4, 4)),4,4)

# Print `Q1`
print(Q1)

# Or use `mapply()`
Q2 <- mapply(rep,1:4,4)

# Print `Q2`
print(Q2)

#The sweep() function

dataPoints <- matrix(4:15, nrow = 4, ncol = 3)

# Find means per column with `apply()`
dataPoints_means <- apply(dataPoints, MARGIN = 2, FUN = mean)

# Find standard deviation with `apply()`
dataPoints_sdev <- apply(dataPoints, MARGIN = 2, FUN = sd)

# Center the points 
dataPoints_Trans1 <- sweep(x = dataPoints, MARGIN = 2, STATS = dataPoints_means, FUN = "-")
print(dataPoints_Trans1)

# Return the result
dataPoints_Trans1

# Normalize
dataPoints_Trans2 <- sweep(dataPoints_Trans1, MARGIN = 2, STATS = dataPoints_sdev, FUN = "/")

# Return the result
dataPoints_Trans2


# Normalize the data with a nested call
dataPoints_Trans <- sweep(sweep(dataPoints, 2, dataPoints_means,"-"), 2, dataPoints_sdev,"/")

# Return the result
dataPoints_Trans

# an example of aggregate
Mydf <- read.csv("Mydf.csv", sep = ";")

# Explore the first 15 records with `head()`
head(Mydf,15)

# See the last 5 records with `tail()`
tail(Mydf,5) 

# Show data types for each column
sapply(Mydf, class)

# Return number of rows and columns with `dim()`
dim(Mydf) 

# How many departments? 
unique(Mydf$DepPC)

aggregate(Mydf$Qty, by=Mydf["DepPC"], FUN=sum)

# Load in `ggplot2`
library(ggplot2)

# Plot the sales per department
ggplot(data=aggregate(Mydf$Qty,by=Mydf["DepPC"],FUN=sum), aes(x=DepPC, y=x)) +
  geom_point()+
  ggtitle("Sales per department - All")

# select only for delivered=True
Y <- Mydf[Mydf$Delivered==TRUE,]

# Plot the sales by department
ggplot(data=aggregate(Y$Qty,by=Y["DepPC"],FUN=sum), aes(x=DepPC, y=x)) +
  geom_point()+
  ggtitle("Sales per department - Delivered")
