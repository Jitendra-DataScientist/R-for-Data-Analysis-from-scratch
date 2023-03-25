#### EXPORTING DATA

# As CSV file
write.csv(Region_sum, "As_csv_Region_Summary_2017.csv", row.names = FALSE)

## RDS objects are specific to R, and should be preferred if the exported data is to be used in R only.
# As RDS object
saveRDS(Countries_All, "As_RDS_Countries_All_Data_2017.RDS")


# Re-import RDS
Countries_All2 = readRDS("As_RDS_Countries_All_Data_2017.RDS")