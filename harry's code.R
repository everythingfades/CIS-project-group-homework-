x <- scan('2008 Summer Olympics - The Results (Diving - Men).html', 
          what='', sep = '\n')

##### Part 1   Basic Clean
# Do some basic clean
x <- gsub('</span>', '', x, fixed = TRUE)
x <- gsub('<[^<>]*>', '', x)
x <- gsub(' ', '', x, fixed = TRUE)


# x1 contains the information from the Qualifying to the Final. 
x1 <- x[1158:8549]


# xx contains the information from the Semi-Final to the Final.
xx <- x[1158:4944]
y <- strsplit(xx, ',', fixed = TRUE)
y <- y[sapply(y, length) != 0]
table(sapply(y, length))    # Only length 1 left
z <- unlist(y)

# Get the index of the title containing 'Final'.
a1 <- grep('Final', z)

# We don't need the data of the general scores, which is in the middle part.
length(a1)
z <- z[-c(a1[7]:a1[8]-1)]

# Get the index of the title containing 'Final' again. 
a1 <- grep('Final', z)


# Split the data into 2. z1 is for the Final and z2 is for the Semi-Final. 
z1 <- z[1:1259]
z2 <- z[1260:3095]

##### Part 2   Aggregate Data into matrix
## For the Final
# Get ride of the '&nbsp;'
z1 <- z1[z1 != '&nbsp;']

# Get the index of all the final and delete them. 
a2 <- grep('Final', z1)
z1 <- z1[-a2]

# Put them into matrix 
matrix1 <- matrix(z1, ncol = 15, byrow = TRUE)

## For the Semi-Final
# Get ride of the '&nbsp;'
z2 <- z2[z2 != '&nbsp;']

# Get the index of all the final and delete them. 
a3 <- grep('Final', z2)
z2 <- z2[-a3]

# Put them into matrix 
matrix2 <- matrix(z2, ncol = 15, byrow = TRUE)

# Now we have matrix1 and matrix2, which represents the Final and Semi-Final
# respectively.

## Add the round information to matrix1
name1 <- c('FinalD1', 'FinalD2', 'FinalD3', 'FinalD4', 'FinalD5', 'FinalD6')
name1 <- rep(name1, each = 13)
matrix1 <- cbind(name1, matrix1)
matrix1 <- matrix1[-seq(1, 66, 13), ]

data1 <- data.frame(Round = matrix1[, 1], Rank = matrix1[, 2], 
                    Athelete = matrix1[, 3], Age = matrix1[, 4],
                    Team = matrix1[, 5], NOC = matrix1[, 6],
                    DP = matrix1[, 7], J1S = matrix1[, 8],
                    J2S = matrix1[, 9], J3S = matrix1[, 10], 
                    J4S = matrix1[, 11], J5S = matrix1[, 12],
                    J6S = matrix1[, 13], J7S = matrix1[, 14],
                    DOD = matrix1[, 15], DC = matrix1[, 16])

## Add the round information to matrix1
name2 <- c('SemiFD1', 'SemiFD2', 'SemiFD3', 'SemiFD4', 'SemiFD5', 'SemiFD6')
name2 <- rep(name2, each = 19)
matrix2 <- cbind(name2, matrix2)
matrix2 <- matrix2[-seq(1, 96, 19), ]

data2 <- data.frame(Round = matrix2[, 1], Rank = matrix2[, 2], 
                    Athelete = matrix2[, 3], Age = matrix2[, 4],
                    Team = matrix2[, 5], NOC = matrix2[, 6],
                    DP = matrix2[, 7], J1S = matrix2[, 8],
                    J2S = matrix2[, 9], J3S = matrix2[, 10], 
                    J4S = matrix2[, 11], J5S = matrix2[, 12],
                    J6S = matrix2[, 13], J7S = matrix2[, 14],
                    DOD = matrix2[, 15], DC = matrix2[, 16])








