# Total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#Serialization Interface for Single Objects
#Functions to write a single R object to a file, and to restore it

# Load data frames
## This first line will likely take a few seconds. Be patient! (copied from assignment page)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate by sum the total emissions by year
# Compute Summary Statistics of Data Subsets
## Splits the data into subsets, computes summary statistics for each, and returns the result in a convenient form.
TotalEmission <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png",width=480,height=480,units="px",bg="transparent")

#Bar Plots: Creates a bar plot with vertical or horizontal bars
#plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
barplot( (TotalEmission$Emissions)/10^6, names.arg=TotalEmission$year,
  xlab="Year",  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions From All US Sources" )

dev.off()

