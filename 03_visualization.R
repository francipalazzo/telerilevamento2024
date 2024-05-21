library(terra) 
library(imageRy)

#list of data in imageRy 
im.list

#importing data 
b2<-im.import("sentinel.dolomites.b2.tif")

#plotting data and choosing a color palette
plot(b2)
> clg<-colorRampPalette(c("black","grey","light grey"))(3)
> plot(b2,col=clg)
viola<-colorRampPalette(c("magenta","cyan4","cyan"))(100)
> plot(b2,col=viola)

importing new bands
> b3<-im.import("sentinel.dolomites.b3.tif")
> plot(b3,col=viola)
> b4<-im.import("sentinel.dolomites.b4.tif")
> plot(b4,col=viola)
> b8<-im.import("sentinel.dolomites.b8.tif")
> plot(b8,col=viola)

#making a multiframe
> par(mfrow=c(2,2))
> plot(b2,col=viola)
> plot(b3,col=viola)
> plot(b4,col=viola)
> plot(b8,col=viola) 

#making a stack and creating a satelltite image
stacksent<-c(b2,b3,b4,b8)
plot(stacksent,col=viola)

>plot(stacksent[[4]],col=viola) #this funcion allows you to make a stack of one element 
>dev.off() #this funcion allows you to delete the previous stack

#RGB plotting
#stacksent[(1)] = b2 = blue
#stacksent[(2)] = b3 = green
#stacksent[(3)] = b4 = red
#stacksent[(4)] = b8 = nir (nir infrared)

#making a plot
im.plotRGB(stacksent, 3, 2, 1)
im.plotRGB(stacksent, 4, 2, 1) #i switched the red with the infrared

#dev.off()

im.plotRGB(stacksent, 3, 2, 1)
im.plotRGB(stacksent, 4, 2, 1)
im.plotRGB(stacksent, 4, 3, 2)
#these plots showed that the colour its the same cause the infrared its not correlated to the other bands much

#nir on green
im.plotRGB(stacksent, 3, 4, 2)

#nir on blue
im.plotRGB(stacksent, 3, 2, 4) 
