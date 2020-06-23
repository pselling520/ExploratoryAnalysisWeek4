#Loading in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#grouping data by year
pm08 <- subset(NEI, year == 2008)
pm05 <- subset(NEI, year == 2005)
pm02 <- subset(NEI, year == 2002)
pm99 <- subset(NEI, year == 1999)

#getting plot values
emissions08 <- sum(pm08$Emissions)
emissions05 <- sum(pm05$Emissions)
emissions02 <- sum(pm02$Emissions)
emissions99 <- sum(pm99$Emissions)

#creating vector
y <- c(emissions99, emissions02, emissions05, emissions08)
x <- c(1999,2002,2005,2008)

#creating plot
dev.new(width=480,height=480,unit="px")
plot(x,y, main="Emissions over time", xlab="Year",ylab="Total Emissions")
dev.copy(png, file="plot1.png")
dev.off()
