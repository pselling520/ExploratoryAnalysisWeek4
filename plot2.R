#Loading in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Getting Baltimore data
bm <- subset(NEI,fips=="24510")
bm99 <- subset(NEI, fips=="24510" & year==1999)
bm08 <- subset(NEI, fips=="24510" & year==2008)

#Converting to sums
bm <- aggregate(bm$Emissions,by=list(bm$year),FUN=sum)

#plotting
dev.new(width=480,height=480,unit="px")
plot(bm$Group.1,bm$x, main = "Changes in Baltimore Emissions",xlab="Year",ylab="Total Emissions")
lines(bm$Group.1,bm$x)
dev.copy(png, file="plot2.png")
dev.off()
