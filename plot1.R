#############################
## plot1.R to graph plot1.png
#############################
##      Reading the first 5 rows and 9 columns to determine the column classes 
tab5rows <- read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=5)
##
##      Vector of column classes
classes <- sapply(tab5rows,class)
##
##      Reading the 2,075,259 rows and 9 columns
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses=classes)
##
##      Converting df$Date as a Date class
df$Date <- as.Date(df$Date,"%d/%m/%Y")
##      Extracting the year 2007
df2 <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]
##
##      plotting histogram and copy to file plot1.png
png(file = "figure/plot1.png",width=480,height=480) 
# png(file = "plot1.png",width=504,height=504) 
par(mar=c(5, 4, 3, 3),oma=c(0,0,0,0))
hist(df2$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",
     cex.main = 1, cex.lab = 1, cex.axis = 1)
## closing the PNG device
dev.off() 