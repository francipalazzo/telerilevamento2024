# other method to see changes in time
#the first one was by classificating the image

# lounching the packages
library(terra)
library(imageRy)
im.list()

#importing data
en01<-im.import("EN_01.png")
en13<-im.import("EN_13.png")

# making a par
par(mfrow=c(2,1))
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN13)

# using the first element (band) of images
dif = EN01[[1]] - EN13[[1]]

# changing the palette
cldif <- colorRampPalette(c("blue", "white", "red")) (100)
plot(dif, col=cldif)

# rapresentation of the ice melt in greenland
#importing the image and choosing a palette
g2000 <- im.import("greenland.2000.tif")
clg <- colorRampPalette(c("black", "blue", "white", "red")) (100)
plot(g2000, col=clg)

#importing the other images
g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")

#making a par
par(mfrow=c(1,2))
plot(g2000, col=clg)
plot(g2005, col=clg)
plot(g2010, col=clg)
plot(g2015, col=clg)

# stacking the data
stackg <- c(g2000, g2005, g2010, g2015)
plot(stackg, col=clg)

# Exercise: make the differencxe between the first and the final elemnts of the stack
difg <- stackg[[4]] - stackg[[1]]
clgreen <- colorRampPalette(c("red","white","blue")) (100)
plot(difg, col=clgreen)

