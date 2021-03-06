#------------------------------------------------------------------#
#                        Linear Regression                         #
#__________________________________________________________________#

# Loading the datasets for an example
library(MASS)


#Simple linear regression
#________________________

# we're going to use the dataset "Boston"
names(Boston) # shows the names of the colunms fot the dataset

fix(Boston)  # Use to visualize the dataset as a table in a editor in a new window

plot(medv~lstat,Boston,col="blue")  # ploting  medv (response) and lstat(predictor) , the ",Boston" tells R to seach the variables in the Boston dataset
lr1 = lm(medv~lstat,Boston)  # fits a linear regression for de data !!! The "~" means "is modeled as..." !!!
summary(lr1) # for a summary of the data
abline(lr1)  # adds a straight line to a plot (uses as argument the intercept and the slope of the line)
names(lr1)  # attibutes of the linear regression model
confint(lr1,level=0.99)  # shows the confidence intervals for the parameters of the linear regression, and sets it to 99% (95% confidence interval by default)
predict(lr1,data.frame(lstat=c(5,10,15)),interval="confidence",level=0.99)  #predict the response for values 5, 10 and 15 with 99% of confidence




# Multiple linear regression
#___________________________

lrm=lm(medv~lstat+age,Boston) # calculates the multiple linear regression using lstat and age as predictors
# medv (as a function of) lstat + age
predict(lrm,data.frame(lstat=c(5,10,15), age=c(20,25,30)),interval = "confidence", level=0.99)

lrtotal=lm(medv~.,Boston) 
# medv (as a funcion of) all the predictors contained in the Boston dataset

#                                              !   IMPORTANT   !
# note that if we take the summary of this lm, the variable age that was significant in the simple regression is no 
# longer relevant if we consider all the predictors, that happens due to correlations between age and other variables
# Since the other variables now are in the model, age (which is corelated to them) are no longer significant

# in such conditions it might be the case that you want to remove the variables thar are not significant to the respose
# and update the model, for that we use the "update" command

lrtotal2=update(lrtotal,~.-age-indus)  #removing age and indus that are no longer significant
summary(lrtotal2)

# Including interaction between the two variables

lr3=lm(medv~lstat*age,Boston) #calculate multiple linear regression taking into account the interaction between the two predictors
                              #linear regression in the form: y = A +Bx +Cy + D(x*y)

# Adding nom linearities by using the predictor sqared as another predictor

lrnlin=lm(medv~lstat+I(lstat^2),Boston) # the identity function I() is necessary to inform R that lstat^2 is another predictor rather than 
                                        # a operation in the linear model equation
lrnlin2=lm(medv~poly(lstat,4))           # writes a polinomial funcion of order 4 in the lstat variable and perform the linear model in this function

# ploting non linear curves

points(lstat,fitted(lrnlin))  # command "fitted" uses the lm model to calculate the response for the predictor
plot(medv~lstat)


# visualizing/ editing data in a in a editor window

fix(Boston)



