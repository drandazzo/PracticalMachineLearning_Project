#
# Project ML
# R Code

# Read data
library(caret)

# Source of the dataset 
# http://groupware.les.inf.puc-rio.br/har#dataset

projtest<-read.csv("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv")

projtrain<-read.csv("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv")

dim(projtrain)
dim(projtrain)
id = 1:160
for (i in id) {
  if (names(projtrain)[i] != names(projtest)[i] ) {
  print("values are different!") 
  print(i)
}
}
## on i = 160 gives a different value, it's ok because it is the class variable to be predicted.

## select a subset of the variables
#  following the explanation in the paper
## http://groupware.les.inf.puc-rio.br/public/papers/2013.Velloso.QAR-WLE.pdf
## we decide not to use all avg_ or var_ variable and all other stat or aggregated variables
suppressed_features<-grep("var_*|avg_*|stddev_*|max_*|*amplitude_*|min_*|skewness_*|kurtosis_*", names(projtrain))
# this command will suppress 100 variables in the dataset.
projtrain2<-projtrain[,-suppressed_features]

## test with Decision tree
## All 20 id are predicted in class A
##createPartitionData()

# Random forest call

modFit<-train(classe ~ ., data=projtrain2,method="rf",prox=TRUE)

predict<-predict(modFit,newdata=projtest)

# With rpart method only 15 variables remains for the classification


