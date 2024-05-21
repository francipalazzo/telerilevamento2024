# vegetation indices

# calling the packages and opening the list images
library(imageRy)
library(terra)
im.list()

#importing the matogrosso 1992 pic
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg") 

# bands: 1=NIR, 2=RED, 3=GREEN

#plotting with the RGB scheme
im.plotRGB(m1992, r=1, g=2, b=3)
im.plotRGB(m1992, r=2, g=1, b=3)
im.plotRGB(m1992, r=2, g=3, b=1)

# importing the 2006 image
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
im.plotRGB(m2006, r=2, g=3, b=1)

# build a multiframe with 1992 and 2006 images
par(mfrow=c(1,2))
im.plotRGB(m1992, r=2, g=3, b=1)
im.plotRGB(m2006, r=2, g=3, b=1)

# to calculate the DVI --> DVI = NIR - RED
# bands: 1=NIR, 2=RED, 3=GREEN

#finding the DVI of the 1992 image
dvi1992 = m1992[[1]] - m1992[[2]]
plot(dvi1992)

#changing the palette
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black")) (100)
plot(dvi1992, col=cl)

# exercise: calculate dvi of 2006
dvi2006 = m2006[[1]] - m2006[[2]]
plot(dvi2006, col=cl)

# calculating the NDVI of the 1992 image
ndvi1992 = (m1992[[1]] - m1992[[2]]) / (m1992[[1]] + m1992[[2]])
ndvi1992 = dvi1992 / (m1992[[1]] + m1992[[2]])
plot(ndvi1992, col=cl)

# culating the NDVI of the 2006 image
ndvi2006 = dvi2006 / (m2006[[1]] + m2006[[2]])
plot(ndvi2006, col=cl)

# making a par
par(mfrow=c(1,2))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)

# changing the palette of the par and making a plot
clvir <- colorRampPalette(c("violet", "dark blue", "blue", "green", "yellow"))(100) # specifying a color scheme
par(mfrow=c(1,2))
plot(ndvi1992, col=clvir)
plot(ndvi2006, col=clvir)

# speediing up calculation
ndvi2006a <- im.ndvi(m2006, 1, 2)
plot(ndvi2006a, col=cl)
