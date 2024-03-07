first R script

# R come calcolatrice
a <-5+5
b <- 2*2
a+b

# arrays

flowers<-c(3,,6,8,10,15,18)
insect<-c(10,16,25,42,61,70)

plot(flowers,insect)

#changing plot parameters

#symbols
plot(flowers,insect,pch=19)

#symbol dimensions
plot(flowers,insect,pch=19,cex=2)

#symbol colors
plot(flowers,insect,pch=19,cex=2,col="chocolate1") #facendo così R non legge
