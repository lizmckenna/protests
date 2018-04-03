rm(list=ls())

library(foreign)
file.choose()
doca = read.spss("/Users/lizmckenna/Desktop/final_data.sav", to.data.frame=TRUE)

summary(doca$form1)

library(ggplot2)
g <- ggplot(doca, aes(form1))
g <- g + geom_bar() + scale_x_continuous(breaks=seq(0, 20, 1))
g + xlim(0, 19)

library(car)

x1 <- doca$form1
x2 <- doca$igrp1c1

write.csv(x1, file = "x1.csv")
write.csv(x2, file = "x2.csv")

##################

form <- read.csv(file="/Users/lizmckenna/desktop/form.csv", header=TRUE, sep=",")
f <- ggplot(form, aes(form))
f + geom_bar() + theme(axis.text.x = element_text(angle = 60, hjust = 1))

groups <- read.csv(file="/Users/lizmckenna/desktop/group.csv", header=TRUE, sep=",")
g <- ggplot(groups, aes(group))
g +  geom_bar() + theme(axis.text.x = element_text(angle = 60, hjust = 1))
