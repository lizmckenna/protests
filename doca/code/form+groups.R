rm(list=ls())

library(foreign)
file.choose()
doca = read.spss("/Users/lizmckenna/Desktop/final_data.sav", to.data.frame=TRUE)

summary(doca$form1)

x1 <- doca$form1
x2 <- doca$igrp1c1

write.csv(x1, file = "x1.csv")
write.csv(x2, file = "x2.csv")

################## Primary Initiating Group

groups <- read.csv(file="/Users/lizmckenna/desktop/group_count.csv", header=TRUE, sep=",")
groups<-na.omit(groups)

ggplot(groups,aes(x=reorder(group, count), y = count, fill = count))+
  coord_flip() +
  scale_fill_gradient(low = "blue", high = "red")+
  geom_bar(width=0.7, stat = "identity")

dev.copy(png,'doca_groups.png', height =5, width = 7, units = 'in', res=400)
dev.off()

################ Primary Protest Form
