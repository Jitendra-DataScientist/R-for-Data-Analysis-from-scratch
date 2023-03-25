#### SUMMARY TABLES

## table() returns the contingency table
## prop.table() returns the normalised contingency table

Region_vs_Income_Cat=table(Countries_All$Region,Countries_All$IncomeGroup)
Region_vs_Income_Cat

prop.table(Region_vs_Income_Cat,1) # Row Total is 1

prop.table(Region_vs_Income_Cat,2) # Column Total is 1


## %>% group_by()
## 'dplyr' reads deeplayer
install.packages("dplyr")
library(dplyr)

## '%>%' is present in some, but not all libraries of R.
## '%>%' is present in 'dplyr' library.
## '%>%' is used to cascade functions.
# Extract different Regions
Region_sum= Countries_All %>% group_by(Region)# %>% summarise()
View(Region_sum)

# Extract different combinations of Regions and Income Groups
Region_Income_sum= Countries_All %>% group_by(Region, IncomeGroup) %>% summarise()
View(Region_Income_sum)

# Same with amount of countries in each categories
Region_Income_sum= Countries_All %>% group_by(Region, IncomeGroup) %>% summarise(Number.of.Countries = n())
View(Region_Income_sum)

# Amount of different income groups per region
Region_sum= Countries_All %>% group_by(Region) %>% summarise(Different.Income.Groups= n_distinct(IncomeGroup))
View(Region_sum)

## Big Summary about each region
Region_sum= Countries_All %>% group_by(Region) %>% summarise(Number.of.Countries = n(),
                                                             Total.Population.In.Million = sum (Total.Population.2017)/1000000,
                                                             Countries.With.Low.Income = sum(IncomeGroup == "Low income"),
                                                             Average.GDP.per.Capita= mean(GDP.per.capita.2017, na.rm= TRUE),
                                                             Median.GDP.per.Capita= median(GDP.per.capita.2017, na.rm= TRUE),
                                                             Std.Deviation.GDP.per.Capita = sd(GDP.per.capita.2017, na.rm= TRUE),
                                                             Min.Under.5.Mortality.Rate = min(Under.5.Mortality.Rate.2017,na.rm=TRUE),
                                                             Max.Under.5.Mortality.Rate = max(Under.5.Mortality.Rate.2017,na.rm=TRUE))
## 'na.rm= TRUE' removes missing values before calculation, if not done, the result would be 'na'.
View(Region_sum)


