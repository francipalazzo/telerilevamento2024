#measuring spatial variability

library(terra)
library(imageRy)

im.list()
im.import("sentinel.png")

sent<-im.import("sentinel.png")
plotRGB(sent,1,2,3)

# NIR = band 1
# red = band 2
# green = band 3

#scelta banda  
nir<-sent[[1]]
plot(nir)
col<-colorRampPalette(c("red","orange","yellow"))(100) #scegliamo la palette
plot(nir,col=col)

>sd3<-focal(nir, matrix(1/9,3,3), fun=sd) #(con focal faccio il calcolo su una matrice 3x3)
>plot(sd3)

#installing "viridis" package #serve per fare in modo che anche i daltonici vedano le mappe
install.packages("viridis")
library(viridis)

#cercando su google ci escono delle palette già predefinite con i propri nomi e noi utilizziamo quella chiamata viridis

viridisc<-colorRampPalette(viridis(7))(100)
plot(sd3, col=viridisc)

#esercozio --> ripetiamo gli stessi calcoli considerando una finestra di 7 pixel
sd4<-focal(nir, matrix(1/49,7,7), fun=sd)
plot(sd4)
viridisc<-colorRampPalette(viridis(7))(100)
plot(sd4, col=viridisc)

#facciamo uno stack
sdstack<-c(sd3,sd4)
plot(sdstack, col=viridisc) 


