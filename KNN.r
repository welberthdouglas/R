#------------------------------------------------------------------#
#                        KNN - K- Nearest Neighbors                #
#__________________________________________________________________#

# loading the library for the example
library(class)
?knn
attach(Smarket)
names(Smarket)
xlag=cbind(Lag1,Lag2)  # cbind makes a matrix with vectors Lag1 and Lag2 as columns
train=Year<2005   # making a training dataset 
knn.pred=knn(xlag[train,],xlag[!train,],Direction[train],k=1)

# arguments of knn: 1-training data set, 2- test data set, 3-classification variable, 4=#k

#confusion matrix and classification success rate

table(knn.pred,Direction[!train])
mean(knn.pred==Direction[!train])
