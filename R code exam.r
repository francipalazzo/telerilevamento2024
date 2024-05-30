# the following codes are the one i used to make my project on Latex
\documentclass{beamer} # to make a presentation
\usepackage{graphicx}  # required for inserting images
\usepackage{hyperref} # useful to make links or labeks work 
\usepackage{ragged2e} # i used it to justify the text
\usepackage{textcomp} # to use special symbols

#codes for the 1th slide
\title{Snowpack in the Sierra Nedava}
#\subtitle is the function to use to put a tiny subtitle under the main title
\author{Francesco Michele Palazzo}
\date{06/06/2024}

#codes for the 2th slide which is the introduction
\begin{frame}{Introduction} #in the {} goes the title of the slide
\justifying ... # this function justify the text
\bigskip #it creates a big gab between everything you want to separate
\begin{minipage}{0.40\linewidth} #this function allows you to creare a column, among other stuff
\centering 
\includegraphics[width=\linewidth]{2007.jpg} #to put the image 
\\[0.1 cm] #to decide the distance between the image and the phrase below
dry winter in 2007
\end{minipage}
\hspace{0.08\linewidth} #to establish the distance between columns
\begin{minipage}{0.40\linewidth}
\centering
\includegraphics[width=\linewidth]{2017.jpg}
\\[0.1 cm]
wet winter in 2017
\end{minipage} #to end the minipage
\end{frame} #to end the slide

#codes for the 3th slide about the codes i used on R to visualize those images
library(terra) #package for manipulating raster files 
library(imageRy) # other useful package for manipulating images
library(ggplot2) #package that allows you to create graphs
library(patchwork) #this is about modify and manipulate graphs

#codes to import the 2007 image
setwd("/Users/franc/OneDrive/Immagini") \\ #to import an outside image in R, the 2007 one in this case
sn2007\texttt{<}-rast("2007.jpg") \\
plot(sn2007) \\ #to visualize the image imported

#codes to import the 2017 image
setwd("/Users/franc/OneDrive/Immagini") \\ #to import the 2017 image in R
sn2017\texttt{<}-rast("2017.jpg") \\
plot(sn2017) \\ #to visualize it

#codes for the 4th slide about the RGB scheme
\begin{frame}{RGB scheme}
\justifying ...
\smallskip
\begin{figure}
\justifying
\includegraphics[width=1\linewidth]{par1.jpg} \\ # this part "[width=1\linewidth]" allows you to choose the width of the image while in {} you have to upload the image you want
\includegraphics[width=1\linewidth]{par2.jpg} 
\end{figure}
\end{frame}

#codes i used to switch bands and create a par (the same as the 5th slide)
im.plotRGB(sn2007,3,2,1) #nir on blue
im.plotRGB(sn2007,1,2,3) #nir on red
im.plotRGB(sn2007,2,1,3) #nir on green
im.plotRGB(sn2017,3,2,1) #nir on blue
im.plotRGB(sn2017,1,2,3) #nir on red
im.plotRGB(sn2017,2,1,3) #nir on green
par(mfrow=c(3,3)) #to glue all 6 images together

#codes for the 6th slide about the classified images
\begin{frame}{Classified images}
... \\ 
\begin{itemize} #to make bullet lists
    \item the covered area in the 2007 image is colored in blue
    \item the covered area in the 2017 image is colored in yellow
\end{itemize}
\centering
\begin{figure}
\centering
\includegraphics[width=0.45\linewidth]{c2007.1.jpg}
\includegraphics[width=0.45\linewidth]{c2017.1.jpg}
\end{figure}
\end{frame}

#codes for the 7th slide about the graphics
\begin{frame}{Graphics}
...
\smallskip
\begin{figure}
\centering
\includegraphics[width=1\linewidth]{grafici.2.jpg}
\end{figure}
\end{frame}

#codes i used to classify the images and to create the graphics (same as the 8th slide)
# % calculation for the 2007 image 
f2007\texttt{<}-freq(c2007) #frequence
t2007\texttt{<}-ncell(c2007) #total number of cells
prop2007=f2007/t2007 #proportion
perc2007=prop2007*100 # %

# % calculation for the 2017 image (same as the ones up above but with different data)
f2017\texttt{<}-freq(c2017) 
t2017\texttt{<}-ncell(c2017)
prop2017=f2017/t2017
perc2017=prop2017*100

# codes to create the graphics
area\texttt{<}-c("covered","dry") # this is what the x axe is gonna show
dry.winter\texttt{<}-c(8,89) # % values obteined of the 2007 image shown in the y axe
wet.winter\texttt{<}-c(31,67) # % values obteined of the 2017 image shown in the y axe
tabout\texttt{<}-data.frame(area,dry.winter,wet.winter) #to put all together 

g1<-ggplot(tabout,aes(x=area,y=dry.winter,color=area))+geom_bar(stat="identity",fill="blue")+ylim(c(0,100)) #to create the graph of the 2007 image
g2<-ggplot(tabout,aes(x=area,y=wet.winter,color=area))+geom_bar(stat="identity",fill="blue")+ylim(c(0,100)) #to create the graph of the 2017 image
g1+g2 #to glue both graphs in one picture

#codes for the 9th slide about more info
\begin{frame}{More Info}
\centering
\textbf{... :} \url{https://earthobservatory.nasa.gov/world-of-change/SierraNevada} \\ #"\url is the function to use for a link to be add"
\end{frame}

#codes for the conclusive slide
\begin{frame}{The End}
\centering
\textbf{...}
\end{frame}

\usetheme{Darmstadt} #to costumise the presentation with a unique theme
