#libraries
library(ggplot2)
library(gridExtra)

#Loading in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Restricting to Baltimore in 1999 and 2008
baltimore <- subset(NEI, fips=="24510" & (year == 1999 | year==2008))


plotPoint <- ggplot(data=subset(baltimore,type=="POINT"),aes(x=as.factor(year),y=Emissions))
plotPoint <- plotPoint + geom_col(color="green",fill="green")+ 
    labs(x="Year",
         y="Total Emissions",
         title = "Point Emissions")

plotNonpoint <- ggplot(data=subset(baltimore,type=="NONPOINT"),aes(x=as.factor(year),y=Emissions))
plotNonpoint <- plotNonpoint + geom_col(color="blue",fill="blue")+ 
    labs(x="Year",
         y="Total Emissions",
         title = "Nonpoint Emissions")

plotRoad <- ggplot(data=subset(baltimore,type=="ON-ROAD"),aes(x=as.factor(year),y=Emissions))
plotRoad <- plotRoad + geom_col(color="black",fill="black")+ 
        labs(x="Year",
         y="Total Emissions",
         title = "Road Emissions")

plotNonroad <- ggplot(data=subset(baltimore,type=="NON-ROAD"),aes(x=as.factor(year),y=Emissions))
plotNonroad <- plotNonroad + geom_col(color="red",fill="red")+ 
    labs(x="Year",
         y="Total Emissions",
         title = "Non-Road Emissions")

g <- arrangeGrob(grid.arrange(plotPoint,plotNonpoint,plotRoad,plotNonroad,
             nrow=2,
             top="Trending Emissions in Baltimore by Emission Type"))
ggsave(file="plot3.png",g)
