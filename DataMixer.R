#install DPLYR
install.packages("dplyr")
library(dplyr)

#read the file name 
MyData<-read.csv("InData.csv")

#delete rows with a total biomass of <60\
X<-filter(MyData, All_Natives > 60)

#reorder columns in the order Total, Taxon, Scenario, Nutrients, and deleting the rest
Y<-select(X, Total, Taxon, Scenario, Nutrients)

#Make new column TotalG by converting and deleting total
Y<-transmute(Y, TotalG = Total/1000, Taxon, Scenario, Nutrients)

#Make nutrient column only contain first letter
Y$Nutrients <- abbreviate( Y$Nutrients, minlength = 1 )

#replace the period with a comma in the TotalG column
Y$TotalG<-gsub("\\.", ",", Y$TotalG)


