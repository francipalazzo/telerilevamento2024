#measuring spatial variability

library(terra)
library(imageRy)
im.list()

#lounching the image and making a plot with the RGB scheme
sent<-im.import("sentinel.png")
plotRGB(sent,1,2,3)
plotRGB(sent,2,1,3)

# NIR = band 1
# red = band 2
# green = band 3

#it is necessery to choose a band sobjectively
nir<-sent[[1]]
plot(nir)
col<-colorRampPalette(c("red","orange","yellow"))(100) #choosing a palette
plot(nir,col=col)

#calculating the standard variation
sd3<-focal(nir, matrix(1/9,3,3), fun=sd) #(with "focal" i can calculate a matrix of 3x3)
plot(sd3)

#installing and lounching the "viridis" package, useful because it allows you to create maps that also daltonic people can see
install.packages("viridis")
library(viridis)

#we can search on google the names of the various palettes we can use
viridisc<-colorRampPalette(viridis(7))(100)
plot(sd3, col=viridisc)

#exercise --> let's repeat the math calculating the standard variation of a window of 7 pixels
sd4<-focal(nir, matrix(1/49,7,7), fun=sd)
plot(sd4)
viridisc<-colorRampPalette(viridis(7))(100)
plot(sd4, col=viridisc)
#facciamo uno stack
sdstack<-c(sd3,sd4)
plot(sdstack, col=viridisc) 


