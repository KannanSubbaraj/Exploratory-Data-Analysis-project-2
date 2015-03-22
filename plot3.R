# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
## Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

# Load data frames
## This first line will likely take a few seconds. Be patient! (copied from assignment page)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
BaltimoreData <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
# Compute Summary Statistics of Data Subsets
## Splits the data into subsets, computes summary statistics for each, and returns the result in a convenient form.
TotalsBaltimoreData <- aggregate(Emissions ~ year, BaltimoreData, sum)

png("plot3.png",width=480,height=480,units="px",bg="transparent")


# ggplot2 is a plotting system for R, based on the grammar of graphics, 
## which tries to take the good parts of base and lattice graphics and none of the bad parts. 
### It takes care of many of the fiddly details that make plotting a hassle (like drawing legends) as well as providing a powerful model of graphics that makes it easy to produce complex multi-layered graphics.

## install.packages("ggplot2")

library(ggplot2)

ggplotTWO <- ggplot(BaltimoreData,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggplotTWO)

dev.off()