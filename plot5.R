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

g <- ggplot(data=combined, aes(x=as.factor(year),y=Emissions))
g <- g + geom_col(color="green",fill="green") +
    labs(x="Year",
         y="Total Emissions",
         title="Trending Baltimore Vehicle Emissions")

ggsave(file="plot5.png",g)
