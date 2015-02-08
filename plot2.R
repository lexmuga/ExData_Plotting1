################################
##      plot4.R to graph plot4.png
################################
##      Reading the first 5 rows and 9 columns to determine the column classes 
tab5rows <- read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=5)
##
##      Vector of column classes
classes <- sapply(tab5rows,class)
##
##      Reading the 2,075,259 rows and 9 columns
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses=classes)
##      extracting the data from 1 February 2007 to 2 February 2007
feb0102_2007 <- df[(df$Date == "1/2/2007")|(df$Date == "2/2/2007"),]
datetimes <- strptime(paste(feb0102_2007$Date,feb0102_2007$Time), "%d/%m/%Y %H:%M:%S")
df2 <- data.frame(feb0102_2007,datetimes)
xDTS <- df2$datetimes
yGAP <- df2$Global_active_power
##      plotting  and writing to file plot2.png
# png(file = "figure/plot2.png",width=504,height=504) ## copy plot 2 to a PNG file
png(file = "figure/plot2.png",width=480,height=480) ## copy plot 2 to a PNG file
plot(xDTS, yGAP, type="l",ylab="Global Active Power (kilowatts)", xlab="",
     cex.lab = 1, cex.axis = 01)
## closing the PNG device
dev.off() 