# Replication and processing for Nonprofit Handbook chapter

## Data
First, I downloaded the ICEWS coded event data from Harvard's dataverse, here:
https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/28075

Right now I only have time to do 1995 and 2016, the bookend years, but may go back and do others to do more time-series analyses.


## Subsetting


```
# Read in ICEWS data for 2015
df1 <- read.delim(file="/Users/lizmckenna/Desktop/events.1995.20150313082510.tab", header=TRUE, sep="\t")

# Identify how the INGOs and SMOs are coded, then subset data to them
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

Demonstrate for leadership change
Threaten
Demonstrate or rally
Use unconventional violence
Criticize or denounce
Appeal for release of persons or property
Make an appeal or request
Accuse
Occupy territory
Engage in symbolic act
Demand
Rally support on behalf of
fight with small arms and light weapons
Accuse of human rights abuses
Appeal for change in leadership
Conduct strike or boycott
Demand diplomatic cooperation (such as policy support)
Demand settling of dispute
Rally opposition against
Conduct hunger strike
Obstruct passage, block
Bring lawsuit against
Accuse of crime, corruption
Complain officially
Protest violently, riot
Demand de-escalation of military engagement
Appeal for diplomatic cooperation (such as policy support)
Accuse of war crimes
Demand meeting, negotiation
Demand economic aid
Appeal for economic aid
Appeal for policy change
Appeal for humanitarian aid
Conduct strike or boycott for leadership change
Appeal for aid
Appeal for easing of economic sanctions, boycott, or embargo
Demand policy change
Engage in violent protest for policy change
Accuse of aggression
Demonstrate for policy change
Assassinate
Demand change in leadership
Appeal to others to settle dispute
Appeal for rights
Demand economic cooperation
Appeal for change in institutions, regime
Appeal for political reform
Appeal to others to meet or negotiate
Demand release of persons or property
Demand that target yields
Appeal for de-escalation of military engagement
Demonstrate military or police power
Appeal for material cooperation
Demand political reform
Demand rights
Attempt to assassinate
Defend verbally
Demand material cooperation
Demand change in institutions, regime
