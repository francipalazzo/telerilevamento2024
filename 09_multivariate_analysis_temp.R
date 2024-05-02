#how to make multivariate analysis with R

library(terra)
library(imageRy)
library(viridis)

#open the list
im.list()

#importing images
b2<-im.import("sentinel.dolomites.b2.tif") #blue
b3<-im.import("sentinel.dolomites.b3.tif") #green
b4<-im.import("sentinel.dolomites.b4.tif") #red
b8<-im.import("sentinel.dolomites.b8.tif") #nir

#making a stack
bstack<-c(b2,b3,b4,b8)
bstack

making a plot with the RGB scheme
im.plotRGB(bstack,4,3,2)
im.plotRGB(bstack,3,4,2)

#to see the bands correlation 
pairs(bstack)

#PCA
pcimage<-im.pca(bstack)

#stats
tot<-sum(1400.59077,454.92569,41.80340,27.30552)
1924.625*100/tot

#images with viridis
plot(pcimage, col=viridis(100))

