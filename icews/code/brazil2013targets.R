
rm(list=ls())

# Load libraries
library(dplyr)
library(ggplot2)
library(broom)
library(purrr)
library(tidyr)
library(tibble)
library(tidyverse)
library(plotly)
devtools::install_github('hadley/ggplot2')



b <- read.csv(file="/Users/lizmckenna/Desktop/brazil2013targets.csv", header=TRUE,sep=",")

# Fix date class

b$Event.Date <- as.Date(b$Event.Date, format = "%m/%d/%y")

head(b$Event.Date)
class(b$Event.Date)

# Make initial geom_point
b1 <- ggplot(data=b, aes(x=Event.Date, y=daily.count, group=target.recode, colour=target.recode)) +
  geom_point()
b1

ggplotly(b1)

# Make initial histogram
b2 <- ggplot(data=b, aes(x=Event.Date, group=target.recode, fill=target.recode)) +
  geom_histogram()
b2

ggplotly(b2)

# Make histogram but remove NAs (I need to learn the subset function...)
narm <- read.csv(file="/Users/lizmckenna/Desktop/brazil2013targets.narm.csv", header=TRUE,sep=",")

# Fix date class
narm$Event.Date <- as.Date(narm$Event.Date, format = "%m/%d/%y")

c1 <- ggplot(data=narm, aes(x=Event.Date, group=target.recode, fill=target.recode)) +
  geom_histogram()
c1

ggplotly(c1)
