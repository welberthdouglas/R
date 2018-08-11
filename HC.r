#------------------------------------------------------------------#
#                     Hierarchical clustering                      #
#__________________________________________________________________#

set.seed(666)     # creating a randon dataset
x=matrix(rnorm(100*2),100,2)
plot(x)

# hierarchical clust method hclust

hc.complete=hclust(dist(x),method="complete")  
plot(hc.complete)                             #ploting 
hc.average=hclust(dist(x),method="average")
plot(hc.average) 

# cutting the dendogram  with command cutree

hc.cut=cutree(hc.complete,3)
plot(x,col=hc.cut)
