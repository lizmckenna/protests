
# Pre-Processing

## Data sources

First, I accessed the ICEWS Coded Event Data from Harvard's dataverse, here:
https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/28075

I only downloaded 2013 as a test. This was theoretically motivated because of the large number of massive, politically-ambiguous protests that took place in June of that year. I wanted to see how the ICEWS automated coding technique would handle those events.

## Subsetting 2013 to only Brazil

The dataset is global, and I only want to analyze Brazil for now, so I subset it. This reduced the number of events from about 735,000 events to 7,900 Brazil-based ones:

```
d <- read.delim(file="/Users/lizmckenna/Desktop/events.2013.20150313084929.tab", header=TRUE, sep="\t")
newdata <- d[ which(d$Country=='Brazil'), ]
write.csv(newdata, file = "brazil2013.csv")
```
## Repertoires

Once I was looking at the raw data, I looked at the event counts by what we would call repertoires (tab 2 of the brazil2013.xls). There are 129 distinct ones! Looking at them by counts, though, we will want to subset. For this first cut, I filtered out the most frequently occuring ones that wouldn't fit our description of contentious politics ("make statement" and "consult"). This reduced the universe to 5,538 contentious politics events that took place in Brazil in 2013.

## Targets

The algorithm had identified more than 600 target types, but a lot of them could be collapsed. I think they can be collapsed still further for our purposes. I used vlookup and the recodes in tab 3 to add a target.recode column. Next, I added a count column so that I would have a y-axis value (the count being # of events that targeted actor X on that day in 2013).

This cleaned/processed version is in this repo as brazil2013targets.csv

