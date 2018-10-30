library(datasets)

data <- iris

# Create a training testing split function here
set.seed(101) # Set Seed so that same sample can be reproduced in future also
# Now Selecting 75% of data as sample from total 'n' rows of the data  
sample <- sample.int(n = nrow(data), size = floor(.75*nrow(data)), replace = F)
train <- data[sample, ]
test  <- data[-sample, ]

trainx <- train[,c(1:4)]
trainy <- train[,5]
testx  <- test[,c(1:4)]
testy  <- test[,5]


# Euclidean Distance Function
EuclidianDistance <- function(a, b, length){
  distance <- 0
  for (i in c(1:length)) {
    distance <- distance + (a[i] -b[i])^2
  }
  as.numeric(sqrt(distance))
}

knn <- function(TrainSetX, TrainSetY, TestInstance, k){
  distances <- vector()
  for (i in c(1:nrow(TrainSetX))) {
    dist <- EuclidianDistance(TestInstance, TrainSetX[i,], ncol(TrainSetX))
    distances[i] <- dist
    # print(dist)
  }
  distances <- as.matrix(distances)
  distancesdf <- data.frame(distances, as.vector(TrainSetY)) # Convert into data frame since matrix can only hold one column type
  distancesdf <- distancesdf[order(distancesdf$distances),]
  #print(distancesdf)
  neighbors <- as.vector(distancesdf[c(1:k),2])
  #print(neighbors)
  #print(names(sort(table(neighbors),decreasing=TRUE)[1]))
  #predict <- (names(sort(table(neighbors),decreasing=TRUE)[1]))
  #print(predict)
}

a <- knn(trainx, trainy, testx[1,],7)

predict <- function(TrainX, TrainY, TestX, TestY, k){
  output <- vector()
  for (i in c(1:nrow(TestX))){
    fit <- knn(TrainX, TrainY, TestX[i,], k)
    output[i] <- fit
    print(paste0("Finish running row ", i))
  }
  #print(as.vector(output))
  #print(as.vector(TestY))
  print(sum(as.vector(output)==as.vector(TestY)))
  sum(as.vector(output)==as.vector(TestY))/nrow(TestX)
}

predict(trainx,trainy,testx,testy,7)
