#------------------------------------------------------------------#
#                        KNN - K- Nearest Neighbors                #
#__________________________________________________________________#

# loading the library for the example
library(class)
?knn
attach(Smarket)
names(Smarket)

# Remember to standarize the data before runing the knn method when dealing with data with
# multiple predictors ( de scale of the predictors matters to knn as it deals with distances)

xlag=cbind(Lag1,Lag2)  # cbind makes a matrix with vectors Lag1 and Lag2 as columns
train=Year<2005   # making a training dataset 
knn.pred=knn(xlag[train,],xlag[!train,],Direction[train],k=1)

# arguments of knn: 1-training data set, 2- test data set, 3-classification variable, 4=#k

#confusion matrix and classification success rate

table(knn.pred,Direction[!train])
mean(knn.pred==Direction[!train])
