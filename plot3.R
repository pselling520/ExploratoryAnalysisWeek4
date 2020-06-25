#libraries
library(ggplot2)
library(gridExtra)
library(reshape2)

#Loading in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Restricting to Baltimore by year
baltimore <- subset(NEI, fips=="24510")

#Converting to just sums
x <- aggregate(baltimore$Emissions,by=list(baltimore$type,baltimore$year),FUN=sum)
x_names <- c("Type","Year","Total.Emissions")
names(x) <- x_names

#Creating graph
g <- ggplot(data=x, aes(x=as.integer(Year),y=Total.Emissions,col=Type))
g <- g + geom_line() + 
    geom_point() +
    labs(x="Year",
         y="Total Emissions",
         title="Trending Emissions by Type")

ggsave(file="plot3.png",g)
