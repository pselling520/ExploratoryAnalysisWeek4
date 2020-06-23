#libraries
library(ggplot2)
library(gridExtra)

#Loading in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Getting subsets
baltimore <- subset(NEI, fips=="24510")
vehicles <- SCC[grep("Vehicles",SCC$EI.Sector),]

#merging data
combined <- merge(baltimore,vehicles,by="SCC")
