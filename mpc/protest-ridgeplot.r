rm(list=ls())

library(ggridges)
library(ggplot2)
library(extrafont)

#  read in data
line=read.csv("/Users/lizmckenna/Dropbox/01_mpc/data/time-type-v2.csv",header=TRUE)

# fix date class
line$day <- as.Date(line$day, format = "%m/%d/%y")
class(line$day)
print(line$day)


# plot
g <- ggplot(line, aes(day, code, height = number, group = code, fill =  code, color = code))+ 
  geom_density_ridges(stat = "identity", scale = 1) +  theme_bw()
g

g1 <- g + labs(x = "Date (2014)", 
         y = "Count of protests (range: 0-8 cases)")

# change some aesthetics
g2 <- g1 + scale_fill_manual(values = c("#EBDFDF", "#E0E3D6", "#D7E5E5", "#E6E0EA"))
g3 <- g2 + scale_color_manual(values = c("#8F4B46", "#4D6600", "#006F72", "#734F91"), guide = "none")
g4 <- g3 + theme(text=element_text(family="Times New Roman", size=12))
g4 + theme(legend.position = "none")

#export

dev.copy(png,'mpc-ridges.png', height =5, width = 7, units = 'in', res=400)
dev.off()
