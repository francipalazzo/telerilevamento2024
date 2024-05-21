#importing data from external sources in R

#lounching the packages 
library(terra)
library(imageRy)

#setting the right directoty on my PC 
setwd("/Users/franc/Downloads")

#importing data on my PC
eclissi<-rast("eclissi.png")

#to see the image
plot(eclissi)

#now i can use te image however i want in R

#let's import another immage taken fron earth observatory website 
setwd("/Users/franc/Downloads")
earth<-rast("earth.jpg")
plot(earth)

#login and getting images from the copernicus website
#importing the images in R by using the same steps used before

#cropping data
ext <- c(25, 35, 58, 62)
soilcrop <- crop(copernicus, ext)
