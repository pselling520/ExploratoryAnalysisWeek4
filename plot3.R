#libraries
library(ggplot2)
library(gridExtra)
library(reshape2)

#Loading in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Restricting to Baltimore by year
baltimore <- subset(NEI, fips=="24510")
bm99 <- subset(NEI, fips=="24510" & year==1999)
bm02 <- subset(NEI, fips=="24510" & year==2002)
bm05 <- subset(NEI, fips=="24510" & year==2005)
bm08 <- subset(NEI, fips=="24510" & year==2008)

#Converting to just sums


x <- tapply(baltimore$Emissions,
            list(as.factor(baltimore$type),
                 as.factor(baltimore$year)),
            sum)
x <- data.frame(x)
df_names <- c("1999","2002","2005","2008")
names(x) <- df_names


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
