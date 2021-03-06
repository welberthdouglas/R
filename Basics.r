#
#  R basics
#______________

x=c(1,2,3,4)   #write a vector  (combine)
y=seq(from=1, to=10, by=0.1)  # or seq(1,10,0.1) write a vector folowing a sequence - see seq
y[3] #shows the 3rd element of y
x[-2]  # remove the 2th element from x and shows the new vector
y[-c(1:10)] # remove elements from 1 to 10 of y and show the result


# There are no scalar numbers in R, all numbers are vectors!


z=matrix(seq(1,16),4,4) #builds a matrix 4X4 containing the numbers of the sequence
z[2,3] #shows element of second row 3 colunm of z
yz=z[,3] # all the lines of 3rd row ###### when doing this the matrix status is droped and the variable becomes a vector
      # to avoid this, use the drop parameter as folows:
zz=z[,3,drop=FALSE]   ### comands are case sensitive !!!
dim(z)   ## dimension of a matrix


#
# Creating random data
#______________________

x=runif(50) # random uniform (generates 50 random points)
y=rnorm(50) # random normal 
plot(x,y) # plots the two vectors
plot(x,y,xlab="Random Uniform",ylab="Random Normal",pch="*",col="red")  #labels and other frills
par(mfrow=c(2,1))   #par is a command to set grafical parameters. mfrow is used to partition the grafical space into 2 rows
                    #and one colunm so we can plot two graphs at a time
hist(y)   #makes a histogram of y


#
# Importing data
#_________________

# Use read.csv or read_delim (more general) or use the "import dataset" menu
# use the dollar sign to access a colunm of a data set, if a dataset is named "dataexample" and have a colunm called "cars" it is possible to access it by using 
# the command dataexample$cars
# Its possible to simplify this by attaching the dataset with the command "attach(dataexample)" and then its possible to call the data in "cars" simply by its name.

