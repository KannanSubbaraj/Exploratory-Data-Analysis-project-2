# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
# Use the base plotting system to make a plot answering this question.

# Load data frames
## This first line will likely take a few seconds. Be patient! (copied from assignment page)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
BaltimoreData <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
# Compute Summary Statistics of Data Subsets
## Splits the data into subsets, computes summary statistics for each, and returns the result in a convenient form.
TotalsBaltimore <- aggregate(Emissions ~ year, BaltimoreData,sum)

png("plot2.png",width=480,height=480,units="px",bg="transparent")

# Bar Plots: Creates a bar plot with vertical or horizontal bars
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == 24510) from 1999 to 2008? Use the base plotting system to make a plot answering this question.
# Upload a PNG file containing your plot addressing this question.

barplot( TotalsBaltimore$Emissions, names.arg=TotalsBaltimore$year,
  xlab="Year",  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From all Baltimore City Sources" )

dev.off()