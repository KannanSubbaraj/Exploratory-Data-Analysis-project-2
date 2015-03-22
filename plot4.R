# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# Load data frames
## This first line will likely take a few seconds. Be patient! (copied from assignment page)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset coal combustion related NEI data
# grep, grepl, regexpr and gregexpr search for matches to argument pattern within each element of a character vector: they differ in the format of and amount of detail in the results.
## sub and gsub perform replacement of the first and all matches respectively.

combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

png("plot4.png",width=480,height=480,units="px",bg="transparent")

# ggplot2 is a plotting system for R, based on the grammar of graphics, 
## which tries to take the good parts of base and lattice graphics and none of the bad parts. 
### It takes care of many of the fiddly details that make plotting a hassle (like drawing legends) as well as providing a powerful model of graphics that makes it easy to produce complex multi-layered graphics.

# Comment out 2nd time
## install.packages("ggplot2")

library(ggplot2)

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
## Upload a PNG file containing your plot addressing this question.

ggplotFour <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(ggplotFour)

dev.off()
