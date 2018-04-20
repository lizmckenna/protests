# Replication and processing workflow for Nonprofit Handbook chapter

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
summary(df1$Source.Sectors)

df1.subset <- subset(df1, subset = Source.Sectors %in% 
                       c('International Government Organization,Regional,Regional Diplomatic IGOs',
                         'Dissident,Protestors / Popular Opposition / Mobs',
                         'Social,General Population / Civilian / Social',
                         'General Population / Civilian / Social,Social',
                         'Protestors / Popular Opposition / Mobs,Dissident',
                         'Global,International Government Organization,Global Defense / Security IGOs',
                         'Global Diplomatic IGOs,International Government Organization,Global',
                         'Regional Diplomatic IGOs,International Government Organization,Regional',
                         'International Government Organization,Global,Global Diplomatic IGOs',
                         'Global,International Government Organization,Global Diplomatic IGOs',
                         'Rebel,Dissident',
                         'Dissident,Rebel',
                         'International Government Organization,Regional Diplomatic IGOs,Regional',
                         'Regional Diplomatic IGOs,Regional,International Government Organization',
                         'Global Diplomatic IGOs,Global,International Government Organization',
                         'International Government Organization,Global,Global Defense / Security IGOs',
                         'International Government Organization,Global Diplomatic IGOs,Global',
                         'Regional,International Government Organization,Regional Diplomatic IGOs',
                         'Global Defense / Security IGOs,Global,International Government Organization'))

# Going to do repertoires with filters, so writing to csv

write.csv(df1.subset, file = "subset1995.csv")

```

Then I did this the lazy/easy way (excel filters, just unchecking repertoires to limit to these 61:

