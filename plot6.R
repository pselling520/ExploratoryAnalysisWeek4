#libraries
library(ggplot2)
library(gridExtra)
    
#Loading in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
vehicles <- SCC[grep("Vehicles",SCC$EI.Sector),]

#Getting Baltimore and Los Angeles County data
bal_lac <- subset(NEI, (fips=="24510" | fips=="06037"))
bal_lac_combined <- merge(bal_lac, vehicles, by="SCC")

#Creating graph
g <- ggplot(data=bal_lac_combined, aes(x=as.factor(year),y=Emissions, col=fips,fill=fips))
g <- g + geom_col(na.rm=T) +
     labs(x="Year",
          title="Baltimore and LA Emission Trends")
ggsave(file="plot6.png",g)
