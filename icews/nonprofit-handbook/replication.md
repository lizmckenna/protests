# Replication instructions for ICEWS data used in Nonprofit Handbook chapter

## Data
First, I downloaded the ICEWS coded event data from Harvard's dataverse, here:
https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/28075

Right now I only have time to do 1995 and 2016, the bookend years, but may go back and do others to do more time-series analyses.


## Subsetting


```
# Read in ICEWS data for 2015
df1 <- read.delim(file="/Users/lizmckenna/Desktop/events.1995.20150313082510.tab", header=TRUE, sep="\t")

```
Identify how the repertoires are coded, then subset to data related to collective action events (protests, riots, rallies, demonstrations, etc.). This DB is actor-number agnostic, so there are a lot of political events that just involve two world leaders, for ex.
```
summary(df1$Event.Text)

df1.subset <- subset(df1, subset = Event.Text %in% 
                       c('Demonstrate or rally',
                         'Occupy territory',
                         'Engage in symbolic act',
                         'Conduct strike or boycott',
                         'Protest violently, riot',
                         'Rally support on behalf of',
                         'Accuse of human rights abuses',
                         'Conduct hunger strike'))

# Going to do actors with filters because there are a bajillion, so writing to csv. See other MD file in this folder for the list.

write.csv(df1.subset, file = "subset1995.csv")

```

There were 729 events reported in 1995 that met our criteria (an international entity, IGO, INGO, regional/global collective actor) as either a target or an initiator. 42 were duplicates (i.e. int'l actors were party in both actions). I'm going to map those events that had one vs. two int'l parties involved in the contentious political event.

## Load packages
```
library(rworldmap)
library(ggmap)
library(rworldxtra)
library(ggplot2)
```
## Read in analysis datasets and map
```
one.1995 <- read.csv(file="/Users/lizmckenna/Dropbox/GSM/one1995.csv", header=TRUE,sep=",")
two.1995 <- read.csv(file="/Users/lizmckenna/Dropbox/GSM/two1995.csv", header=TRUE,sep=",")


newmap <- getMap(resolution = "high")
plot(newmap)

e <- points(one.1995$Longitude, one.1995$Latitude, pch=16, col = "goldenrod", cex = 1)
e

e1 <- e + points(two.1995$Longitude, two.1995$Latitude, pch=16, col = "royalblue4", cex = 1)
e1  

##### add a legend

colrs <- c("royalblue4","goldenrod")
legend(x=-20, y=20, c("Ford", "UCSB"), pch=21, pt.bg=colrs, pt.cex=2, cex=.8, bty="n", ncol=1)



# export
  
dev.copy(png,'w2.png', height =5, width = 7, units = 'in', res=400)
dev.off()
```
Meh.
```
####
library(ggmap)

ggmap(newmap) +
  geom_point(data = one.1995,
             aes(x = Longitude, y = Latitude),
             color = "red", alpha = 0.5) +
  geom_point(data = two.1995,
             aes(x = Longitude, y = Latitude),
             color = "purple", alpha = 0.5)


# export
  
dev.copy(png,'w2.png', height =5, width = 7, units = 'in', res=400)
dev.off()
```
