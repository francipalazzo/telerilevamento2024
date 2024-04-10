#quantifying land cover variability

install.packages("ggplot2")

library(terra)
library(imageRy)
library(ggplot2)

#listing images
im.list()

#importaing matogrosso images
m1992<-im.import("matogrosso_l5_1992219_lrg.jpg")
m2006<-im.import("matogrosso_ast_2006209_lrg.jpg")

#importing and classifying sun image
sun<-im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
> sunc<-im.classify(sun,num_cluster=3)

#classifying matogrosso images
> m1992c<-im.classify(m1992,num_cluster=2)
> m2006c<-im.classify(m2006,num_cluster=2)

# calculating ferquences 1992 image
f1992<-freq(m1992c)
f1992

#calculating total n of pixel 1992 image
tot1992<-ncell(m1992)
tot1992

# calculating prop 1992 image
> prop1992=f1992/tot1992

# calculating
> perc1992=prop1992*100

#% = forest 83%, human 16%

# repeating the math for 2006 image

#% = forest 45%, human 55%

#building the dataframe
class<-c(forest,human)
y1992<-c(83,13)
y2006<-c(45,55)

tabout<-data.frame(class,y1992,y2006)

#ggplot graphics
>ggplot(tabout,aes(x=class, y=y1992, color=class))+ geom_bar(stat="identity", fill="blue")
>ggplot(tabout,aes(x=class, y=y2006, color=class))+ geom_bar(stat="identity", fill="blue")

#installing and lounching patchwork
install.packages("patchwork")
library(patchwork)

> p1<-ggplot(tabout,aes(x=class, y=y1992, color=class))+ geom_bar(stat="identity", fill="blue")
> p2<-ggplot(tabout,aes(x=class, y=y2006, color=class))+ geom_bar(stat="identity", fill="blue")
> p1+p2

#correcting graphics
>a1<-ggplot(tabout,aes(x=class, y=y1992, color=class))+ geom_bar(stat="identity", fill="blue") + ylim(c(o,100))
>a2<-ggplot(tabout,aes(x=class, y=y2006, color=class))+ geom_bar(stat="identity", fill="blue") + ylim(c(o,100))
a1+a2