
dir <- "C:/Users/Bobby/Google Drive/Data Science/Data Sets"

setwd(dir)
getwd()

EPC <- read.table("household_power_consumption.txt", header=T, sep=";")

EPC1 <- EPC
EPC <- EPC1

EPC$Date <- as.Date(EPC$Date,"%d/%m/%Y")
# side note: lowercase y is 2 digit yr, upper is 4.
# format in DF is changed to YYYY,MM,DD

class(EPC$Date)

EPC <- EPC[which(EPC$Date>="2007/02/01" & EPC$Date<="2007/02/02"),]
# you need to add these in quotations

EPC$Global_active_power <- as.character(EPC$Global_active_power)
EPC$Global_active_power <- as.numeric(EPC$Global_active_power)
# you have to convert the data into char before numeric otherwise it rounds up/down to 0 dec.

install.packages("lubridate")
library(lubridate)
EPC$Date <- wday(EPC$Date, label=T)
# need to use lubridate to set wdays

EPC$Date <- as.numeric(EPC$Date)

plot(EPC$Global_active_power, type="n",xaxt="n", xlab=" ",
     ylab="Global Active Power (kilowatts)", cex.lab=0.75, cex.axis=0.75) 

lines(EPC$Global_active_power, type="o", lwd=1.5, pch=" ")
  
axis(1, at=c(1, 1440, 2880), labels=c("Thurs", "Fri", "Sat"), cex.axis=0.75)

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
