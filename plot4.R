#libraries
library(ggplot2)
library(gridExtra)

#Loading in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Loading in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#grabbing coal data
coal <- SCC[grep("Coal",SCC$EI.Sector),]

#merging datasets
combined <- merge(NEI,coal,by="SCC")

g <- ggplot(data=combined, aes(x=as.factor(year),y=Emissions))
g <- g + geom_col(color="green",fill="green") +
    labs(x="Year",
         y="Total Emissions",
         title="Trending U.S. Coal Emissions")

ggsave(file="plot4.png",g)
