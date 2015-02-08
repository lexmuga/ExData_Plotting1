# ################################
# ## plot4.R to graph plot4.png
# ################################
# ##      Reading the first 5 rows and 9 columns to determine the column classes 
# tab5rows <- read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=5)
# ##
# ##      Vector of column classes
# classes <- sapply(tab5rows,class)
# ##
# ##      Reading the 2,075,259 rows and 9 columns
# df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses=classes)
# # df$Date <- as.Date(df$Date,"%d/%m/%Y")
# # feb0102_2007 <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]
# feb0102_2007 <- df[(df$Date == "1/2/2007")|(df$Date == "2/2/2007"),]
# datetimes <- strptime(paste(feb0102_2007$Date,feb0102_2007$Time), "%d/%m/%Y %H:%M:%S")
# df2 <- data.frame(feb0102_2007,datetimes)
#         xDTS <- df2$datetimes
#         yGAP <- df2$Global_active_power
#         ySM1 <- df2$Sub_metering_1
#         ySM2 <- df2$Sub_metering_2
#         ySM3 <- df2$Sub_metering_3
#         yVOL <- df2$Voltage
#         yGRP <- df2$Global_reactive_power
png(file = "plot4.png",width=504,height=504) ## copy plot 4 to a PNG file
par(mfrow = c(2,2), oma = c(0.5, 0, 0, 0))

######################
##      upper_left figure
par(mar=c(4.5, 4, 4, 2))
plot(xDTS, yGAP, type = "l", ylab = "Global Active Power", xlab = "",
     cex.lab = 1, cex.axis = 1)
######################
##      upper_right figure
# par(mar=c(4.5, 4.5, 4.5, 1.5))
par(mar=c(4.5, 4, 4, 2))
plot(xDTS, yVOL, type = "l", ylab = "Voltage", xlab = "datetime",
     cex.lab = 1, cex.axis = 1)
#####################
##      lower_left figure
# par(mar = c(4.5, 4.5, 4.5, 1.5))
par(mar=c(4.5, 4, 4, 2))
plot(xDTS,ySM1,xlab="",ylab="Energy sub metering", type="l",ylim = range(c(ySM1,ySM2,ySM3)),
     cex.lab = 1, cex.axis = 1)
par(new=TRUE) #, mar = c(4.5, 4.5, 4.5, 1.5), oma = c(0.5, 0, 0, 0))
plot(xDTS,ySM2,xlab="",ylab="", type="l",ylim = range(c(ySM1,ySM2,ySM3)),col="red",
     cex.lab = 1, cex.axis = 1)
par(new=TRUE) #,mar = c(4.5, 4.5, 4.5, 1.5))
plot(xDTS,ySM3,xlab="",ylab="", type="l",ylim = range(c(ySM1,ySM2,ySM3)),col="blue",
     cex.lab = 1, cex.axis = 1)
legend("topright",lty=c(1, 1, 1),col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex = 1, box.lwd = c(0,0), y.intersp = 1)
       #lwd=c(2,2),cex=0.75, seg.len=2, title.adj = 1, 
       #x.intersp = 1, y.intersp = 0.6, box.lwd = c(0,0), inset = 0)
#####################
##      lower_right figure
# par(mar = c(4.5, 4.5, 4.5, 1.5))
par(mar=c(4.5, 4, 4, 2))
plot(xDTS, yGRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power",
        cex.lab = 1, cex.axis = 1)
dev.off() ## closing the PNG device