## Import Libraries
library(readr)  ## To import .csv
library(readxl) ## To import .xls/.xlsx

getwd()
# Set Working Directory
setwd("/Users/jitendrakumarnayak/Desktop/R/Datasets")

# Import first dataset
Countries = read_csv("Countries Population.csv")
summary(Countries)
Countries = Countries[,c(1:3)]   ## removing last 2 null columns.
Countries

# Clean column names and set right data types
colnames(Countries) = make.names(colnames(Countries))
Countries$Country.Name = as.factor(Countries$Country.Name)
Countries$Country.Code = as.factor(Countries$Country.Code)
summary(Countries)


# Import second dataset
Countries_Map = read_excel("Countries Region Mapping.xlsx")
summary(Countries_Map)

# Set right data types
Countries_Map$Country.Code = as.factor(Countries_Map$Country.Code)
Countries_Map$Region = as.factor(Countries_Map$Region)
Countries_Map$IncomeGroup = as.factor(Countries_Map$IncomeGroup)
summary(Countries_Map$IncomeGroup)

# Set to ordered factor, and give order
Countries_Map$IncomeGroup = ordered(Countries_Map$IncomeGroup, levels= c("Low income",
                                                                         "Lower middle income",
                                                                         "Upper middle income",
                                                                         "High income"))
class( Countries_Map$IncomeGroup)
summary(Countries_Map)


# Import Third Dataset
Countries_Info= read_csv("Countries Indicators.csv")
summary(Countries_Info)
str(Countries_Info)
Countries_Info = Countries_Info[,c(1:3)]    ## remove last 2 null columns
Countries_Info$Country.Code=as.factor(Countries_Info$Country.Code)
summary(Countries_Info)




#### MERGING DATASETS TOGETHER


# Left Join
temp= merge(Countries,Countries_Map, by="Country.Code", all.x = TRUE )

# Correct Inner Join 
Countries_All = merge(Countries,Countries_Map, by="Country.Code" )

#Full Outer Join 
temp2 = merge(Countries_All,Countries_Info, by="Country.Code",all=TRUE )

# Correct Left Join
Countries_All = merge(Countries_All,Countries_Info, by="Country.Code",all.x=TRUE )


## Remove unwanted object from global environment
rm(temp,temp2)
