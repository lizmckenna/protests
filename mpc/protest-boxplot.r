rm(list=ls())

library(ggplot2)
library(extrafont)

fig3=read.csv("/Users/lizmckenna/Dropbox/01_mpc/data/figure-3.csv",header=TRUE)


p <- ggplot(fig3, aes(x = protest_type, y = count_of_participants, color = protest_type, fill = protest_type))+
  geom_boxplot(alpha = 0.2) +
  geom_point(position = "jitter") +
  scale_colour_hue(c = 50, l = 40, aesthetics = c("colour","fill"),"Protest type") +
  theme_bw()
p

p1 <- p + labs(x = "Protest type", y = "Count of participants")
p1

p2 <- p1 + theme(text=element_text(family="Times New Roman", size=12))
p2

#export

dev.copy(png,'mpc-figure-3.png', height =5, width = 7, units = 'in', res=400)
dev.off()
