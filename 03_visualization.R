library(terra) 
library(imageRy)

#list of data in imageRy im.list

#importing data 
b2<-im.import("sentinel.dolomites.b2.tif")

#plotting data
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

#multiframe
> par(mfrow=c(2,2))
> plot(b2,col=viola)
> plot(b3,col=viola)
> plot(b4,col=viola)
> plot(b8,col=viola) 

#creating a satelltite image
stacksent<-c(b2,b3,b4,b8)
plot(stacksent,col=viola)

>plot(stacksent[[4]],col=viola) #per fare lo stack di un solo elemento
>dev.off() #per cancellare una delle funzioni par precedenti
