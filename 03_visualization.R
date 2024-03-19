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

#RGB plotting
#stacksent[(1)] = b2 = blue
#stacksent[(2)] = b3 = green
#stacksent[(3)] = b4 = red
#stacksent[(4)] = b8 = nir (vicino infrarosso)

im.plotRGB(stacksent, 3, 2, 1)
im.plotRGB(stacksent, 4, 2, 1) # ho sostituito il rosso con l'infrarosso

#dev.off()
#vediamo che il colore non cambia perchè l'infrarosso è il meno correlato alle altre bande
im.plotRGB(stacksent, 3, 2, 1)
im.plotRGB(stacksent, 4, 2, 1)
im.plotRGB(stacksent, 4, 3, 2)

#nir on green
im.plotRGB(stacksent, 3, 4, 2)

#nir on blue
im.plotRGB(stacksent, 3, 2, 4) 
