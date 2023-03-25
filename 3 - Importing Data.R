
## packages not on local can be downloaded from the CRAN repository via
## a CRAN mirror nearest to one's loaction.

install.packages("readr")    ## install readr package, one can also install
## from the bottom-right pane's "Package" >> "Install".

library(readr)    ## load library for current session. A tick mark appears on
## the checkbox of the library under bottom-right pane's "Package".

## to change CRAN mirror on R-studio on Windows system:
## "Tools" >> "Global Options" >> "Packages" >"Package Environment">"CRAN Mirror">"Change"


getwd()   ## get current working directory

## set working directory:
setwd(
  "/Users/jitendrakumarnayak/Desktop/R/Datasets")

## import .txt with space separated values from working directory
titanic = read.table('Titanic_space_separated-1.txt',header=TRUE)
titanic
## "header=TRUE" reads the first line in the dataset as column names.

class(titanic)   ## "data.frame"

## view data

View(titanic)    ## opens imported data in a new tab.   ## same as opening from
## the top-left pane by double clicking on the variable under "Environment" tab.

head(titanic,5)    ## view first 5 rows of the imported dataset.
tail(titanic,10)    ## view last 10 rows of imported dataset.


## see overviews

str(titanic)    ## gives info of imported data
## similar to pandas.DataFrame.info()

## factor datatypes are categorical data. They can store both numbers and strings.
titanic$Sex = as.factor(titanic$Sex)  ## change data-type of column "Sex" from
## "chr" to "Factor".
str(titanic)
titanic$Sex = as.character(titanic$Sex)  ## change back data-type of column
## "Sex" to "chr" from "Factor".

summary(titanic)     ## see summary of imported data.
## above query gives different output for "Sex" column, when "Sex" column is
## "chr" (character) and "Factor" (factor).

## my trial - converting all columns to "Factor" and checking summary:
titanic$Class = as.factor(titanic$Class)
titanic$Sex = as.factor(titanic$Sex)
titanic$Age = as.factor(titanic$Age)
titanic$Survived = as.factor(titanic$Survived)
summary(titanic)


## import .txt with comma separated values
orange = read.table('Orange_comma_separated.txt',header=TRUE,sep=',')
orange
View(orange)

str(orange)
summary(orange)
orange$Tree = as.factor(orange$Tree)
summary(orange)


detach("package:readr", unload = TRUE)    ## detach "readr" library from
## current session. It is same as unticking the checkbox of the library on the
## bottom-right window under "Packages" tab.

library(readr)


## importing .csv file

countries = read_csv("Countries Population.csv")
head(countries)
summary(countries)
countries = countries[,c(1:3)]    ## removing last 2 empty columns
countries
summary(countries)

## changing datatypes
countries$`Country Name` = as.factor(countries$`Country Name`)
countries$`Country Code` = as.factor(countries$`Country Code`)
summary(countries)

## One can also import datasets from the top-left pane's
## "Environment" >> "Import Dataset" then choose the file type or
## library_to_be_used for import, and then "Browse" to select file,
## change the name if you wish to in "Name", and then click "Import".


## import excel files

install.packages("readxl")
library(readxl)
countries_region <- read_excel("Countries Region Mapping.xlsx")
countries_region
class(countries_region)
countries_region = as.data.frame(countries_region)    ## changing to dataframe type
class(countries_region)


