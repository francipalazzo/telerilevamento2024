#installing new packages in R

install.packages("Terra") #The terra package has functions for creating, reading, manipulating, and writing raster data
library(terra)

install.packages("devtools")
library(devtools)

installing packaging from Github:
devtools::install_Github #"::" #it means that install_Github is a function of devtools

#installing the imageRy package from GitHub
#a devtools function
devtools::install_github("ducciorocchini/imageRy")
library(imageRy)
