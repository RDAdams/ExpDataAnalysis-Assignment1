
dir <- "C:/Users/Bobby/Google Drive/Data Science/Data Sets"

setwd(dir)
getwd()

EPC <- read.table("household_power_consumption.txt", header=T, sep=";",stringsAsFactors=FALSE)
EPC$Date <- as.Date(EPC$Date,"%d/%m/%Y")
EPC <- EPC[which(EPC$Date>="2007/02/01" & EPC$Date<="2007/02/02"),]
# you need to add these in quotations

par(mfrow=c(2,2))

### TOP LEFT PLOT - GAP~DAY
EPC$Date <- as.numeric(EPC$Date)

plot(EPC$Global_active_power, type="n",xaxt="n", xlab=" ",
     ylab="Global Active Power (kilowatts)", cex.lab=0.75, cex.axis=0.75) 

lines(EPC$Global_active_power, type="o", lwd=1.5, pch=" ")

axis(1, at=c(1, 1440, 2880), labels=c("Thurs", "Fri", "Sat"), cex.axis=0.75)


### TOP RIGHT PLOT - Volt-Datetime

plot(EPC$Voltage, type="n",xaxt="n", xlab=" ",
     ylab="Voltage", cex.lab=0.75, cex.axis=0.75) 

lines(EPC$Voltage, type="o", lwd=1.5, pch=" ")

axis(1, at=c(1, 1440, 2880), labels=c("Thurs", "Fri", "Sat"), cex.axis=0.75)

### BOTTOM LEFT PLOT - plot3

ylimit <- c(0,40)

plot(EPC$Sub_metering_3, type="n",xaxt="n", xlab=" ",
     ylim=ylimit,
     ylab="Energy sub metering", cex.lab=0.75, cex.axis=0.75) 

lines(EPC$Sub_metering_3, ylim=ylimit, lwd=.75, pch=" ", col="blue")
lines(EPC$Sub_metering_2, ylim=ylimit, lwd=.75, pch=" ", col="red")
lines(EPC$Sub_metering_1, ylim=ylimit, lwd=.75, pch=" ", col="black")

axis(1, at=c(1, 1440, 2880), labels=c("Thurs", "Fri", "Sat"), cex.axis=0.75)

legend("topright", inset=.05, c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty="solid", col=c("black", "red", "blue"), cex=0.75, bty="n")

### BOTTOM RIGHT PLOT - GLOBAL REACTIVE POWER

plot(EPC$Global_reactive_power, type="n",xaxt="n", xlab=" ",
     ylab="Global_reactive_power", cex.lab=0.75, cex.axis=0.75) 

lines(EPC$Global_reactive_power, type="o", lwd=1.5, pch=" ")

axis(1, at=c(1, 1440, 2880), labels=c("Thurs", "Fri", "Sat"), cex.axis=0.75)

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
