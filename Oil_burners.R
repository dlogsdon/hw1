##
#section 1 - load and process data
##

#Data description: NYC Opendata on buildings burning polluting #6 and #4 fuel oils.
#Data source: exporting a .csv file from: http://bit.ly/16wkKlD 

#read in the data file to a new data frame:
oil_burners <- read.csv("Oil_Boilers_-_Detailed_Fuel_Consumption_and_Building_Data.csv", as.is=T)

#change the names for the columns i'm interested in to less cumbersome names
names(oil_burners)[names(oil_burners)=='Natural.Gas.Utility..Con.Edison.or.National.Grid'] <- 'Gas.Utility'
names(oil_burners)[names(oil_burners)=='Primary.Fuel'] <- 'Primary.Fuel'
names(oil_burners)[names(oil_burners)=='Deadline.for.complying.with.Audit.and.Retrocommissioning.Law'] <- 'Compliance.Deadline'

#create a new data frame that only has my values of interest
oil_burners_sub <- oil_burners[,c('Gas.Utility','Primary.Fuel', 'Compliance.Deadline')]

#A little scrubbing to remove NA entries for Compliance Deadline
oil_burners_sub <- na.omit(oil_burners_sub)

#Before visualization I further need to change to factors from characters for two columns:
oil_burners_sub$"Gas.Utility" <- as.factor(oil_burners_sub$Gas.Utility)
oil_burners_sub$"Primary.Fuel" <- as.factor(oil_burners_sub$Primary.Fuel)

##
#Step 2: Visualize the data
##

#make sure ggplot and scales are loaded
library(ggplot2)
library(scales)

#call up ggplot and pass all the commands to get our violin chart
p <- ggplot(data=oil_burners_sub)

p <- ggplot(data=oil_burners_sub)
p <- p + aes(x=Gas.Utility, y=Compliance.Deadline,fill=Primary.Fuel)
p <- ggplot(data=oil_burners_sub)
p <- p + aes(x=Gas.Utility, y=Compliance.Deadline,fill=Primary.Fuel)
p <- p + geom_violin() + coord_flip()

#set a title
p <- p + labs(title='Fuel Conversion Deadlines by Utility and Fuel Type')

#print the final graph
p
