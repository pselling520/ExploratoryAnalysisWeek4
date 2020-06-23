#Loading in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Getting Baltimore data
bm99 <- subset(NEI, fips=="24510" & year==1999)
bm08 <- subset(NEI, fips=="24510" & year==2008)

bmEmissions99 <- sum(bm99$Emissions)
bmEmissions08 <- sum(bm08$Emissions)

y <- c(bmEmissions99, bmEmissions08)
x <- c(1999,2008)
y0 <- y[1]
y1 <- y[2]
x0 <- 1999
x1 <- 2008

#plotting 
dev.new(width=480,height=480,unit="px")
plot(x,y, main = "Changes in Baltimore Emissions",xlab="Year",ylab="Total Emissions")
segments(x0,y0,x1,y1)
dev.copy(png, file="plot2.png")
dev.off()
