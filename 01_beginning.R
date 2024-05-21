first R script

# R as calculator 
a <-5+5
b <- 2*2
a+b

# arrays
flowers<-c(3,6,8,10,15,18)
insect<-c(10,16,25,42,61,70)

plot(flowers,insect)

#changing plot parameters

#symbols
plot(flowers,insect,pch=19)

#symbol dimensions
plot(flowers,insect,pch=19,cex=2)

#symbol colors
plot(flowers,insect,pch=19,cex=2,col="chocolate1") #if i copy and paste, R won't read it and it won't give me an error 
