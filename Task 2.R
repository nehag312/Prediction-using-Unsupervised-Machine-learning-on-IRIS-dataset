#to predict the optimum number of clusters and represent it visually
#from the famous iris data set

iris<-read.csv(file.choose(),header=T)
dim(iris) #dimension of the dataset
head(iris,5)
summary(iris)
#to see the different kinds of species present in the species column
#use unique function
unique(iris$Species)

iriscopy<-iris 
#copy of the dataset which will be used for clustering process
iriscopy$Species<-NULL 
iriscopy$Id<-NULL
head(iriscopy,5)
#this dataset will now be used for clustering the observation

result<-kmeans(iriscopy,3)
#kmean is an inbuilt function in R which follows the K mean clustering algrithm
result

result$size
result$cluster

#to create a categorical representaion of data with variable name 
#and the frequency in the form of table
table(iris$Species,result$cluster)

#######plotting petal length and petal width
#colouring them according to the cluster in which they belong 
plot(iris[c("PetalLengthCm","PetalWidthCm")],col=result$cluster,cex=1.2,pch=10)

#assigning the 3 species numbers like 1,2 and 3 
#to color them accordingly while plotting the graph

n<-nrow(iris);n
sp<-c()
typ<-c("Iris-versicolor","Iris-setosa","Iris-virginica")
for(i in 1:n){
for(j in 1:3){
if(iris$Species[i]==typ[j]){
sp[i]=j}}}
sp

#colouring it according to the species they belng to
plot(iris[c("PetalLengthCm","PetalWidthCm")],col=sp,cex=1.2,pch=10)

#######plotting sepal length and sepal width 
#colouring it according to the cluster they belng to
plot(iris[c("SepalLengthCm","SepalWidthCm")],col=result$cluster,cex=1.2,pch=16)
#colouring it according to the species they belng to
plot(iris[c("SepalLengthCm","SepalWidthCm")],col=sp,cex=1.2,pch=16)

#we can conclude that k mean clustering was pretty good at its job
#this completes the second task






