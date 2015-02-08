################################
## plot3.R to graph plot3.png
################################
##      Reading the first 5 rows and 9 columns to determine the column classes 
tab5rows <- read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=5)
##
##      Vector of column classes
classes <- sapply(tab5rows,class)
##
##      Reading the 2,075,259 rows and 9 columns
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses=classes)
feb0102_2007 <- df[(df$Date == "1/2/2007")|(df$Date == "2/2/2007"),]
datetimes <- strptime(paste(feb0102_2007$Date,feb0102_2007$Time), "%d/%m/%Y %H:%M:%S")
df2 <- data.frame(feb0102_2007,datetimes)
xDTS <- df2$datetimes
ySM1 <- df2$Sub_metering_1
ySM2 <- df2$Sub_metering_2
ySM3 <- df2$Sub_metering_3
##      writing the graph to plot3.png
# png(file = "plot3.png",width=504,height=504) 
png(file = "figure/plot3.png",width=480,height=480) 
#       Plotting the 3 Energy Sub Metering Types
par(oma = c(0, 0.15, 0, 0))
plot(xDTS,ySM1,xlab="",ylab="Energy sub metering", type="l",ylim = range(c(ySM1,ySM2,ySM3)),
     cex.lab=1, cex.axis=1)
par(new=TRUE)
plot(xDTS,ySM2,xlab="",ylab="Energy sub metering", type="l",ylim = range(c(ySM1,ySM2,ySM3)),col="red",
     cex.lab=1, cex.axis=1)
par(new=TRUE)
plot(xDTS,ySM3,xlab="",ylab="Energy sub metering", type="l",ylim = range(c(ySM1,ySM2,ySM3)),col="blue",
     cex.lab=1, cex.axis=1)
legend("topright",lty=c(1, 1, 1),col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       x.intersp = 1, y.intersp = 1, cex = 1, lwd = c(1,1), seg.len=c(2,2,2))
##      closing the PNG device
dev.off() 