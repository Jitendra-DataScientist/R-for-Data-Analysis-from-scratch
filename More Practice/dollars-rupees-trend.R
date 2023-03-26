## plotting dollor-ruppee relation over the years 1947-2022.

library(readr)
getwd()
setwd("/Users/jitendrakumarnayak/Desktop/R/Datasets/")

dollars = read.table('dollars-rupees.txt',header=FALSE)
View(dollars)

## Data has years in 1st and 3rd columns, values in 2nd and 4th columns.
## We need to segregate and then rbind
df1 = dollars[,c(1:2)]
df2 = dollars[c(1:38),c(3:4)]

## rename columns one by one
colnames(df2)[1]='V1'
colnames(df2)[2]='V2'

## or rename multiple columns
library(dplyr)
df2 = dollars[c(1:38),c(3:4)]
df2 <- df2 %>% 
  rename("V1" = "V3",
         "V2" = "V4")


## rbind the 2 dataframes
df3 = rbind(df1,df2)
str(df3)

## convert 'chr' datatypes to numerical values
df3$V1 = as.numeric(df3$V1)
df3$V2 = as.numeric(df3$V2)
str(df3)

## plot
library(ggplot2)
qplot(V1,V2,data= df3)

## save data
write.csv(df3, "dollars_rupees_mod.csv", row.names = FALSE)
