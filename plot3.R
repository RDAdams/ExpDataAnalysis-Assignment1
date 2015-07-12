
dir <- "C:/Users/Bobby/Google Drive/Data Science/Data Sets"

setwd(dir)
getwd()

EPC <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors = FALSE)

EPC1 <- EPC
EPC <- EPC1

class(EPC$Date)
EPC$Date <- as.Date(EPC$Date,"%d/%m/%Y")
EPC <- EPC[which(EPC$Date>="2007/02/01" & EPC$Date<="2007/02/02"),]

class(EPC$Sub_metering_1)
class(EPC$Sub_metering_2)
class(EPC$Sub_metering_3)
# ran into an issue here, change the read.table to not read numerics as factors and it is fixed.

ylimit <- c(0,40)

plot(EPC$Sub_metering_3, type="n",xaxt="n", xlab=" ",
     ylim=ylimit,
     ylab="Energy sub metering", cex.lab=0.75, cex.axis=0.75) 

lines(EPC$Sub_metering_3, ylim=ylimit, lwd=.75, pch=" ", col="blue")
lines(EPC$Sub_metering_2, ylim=ylimit, lwd=.75, pch=" ", col="red")
lines(EPC$Sub_metering_1, ylim=ylimit, lwd=.75, pch=" ", col="black")

axis(1, at=c(1, 1440, 2880), labels=c("Thurs", "Fri", "Sat"), cex.axis=0.75)

legend("topright", inset=.05, c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty="solid", col=c("black", "red", "blue"), cex=0.75)

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
