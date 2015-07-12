
dir <- "C:/Users/Bobby/Google Drive/Data Science/Data Sets"

setwd(dir)
getwd()

EPC <- read.table("household_power_consumption.txt", header=T, sep=";")

EPC$Date <- as.Date(EPC$Date,"%d/%m/%Y")
# side note: lowercase y is 2 digit yr, upper is 4.
# format in DF is changed to YYYY,MM,DD

class(EPC$Date)

EPC <- EPC[which(EPC$Date>="2007/02/01" & EPC$Date<="2007/02/02"),]
# you need to add these in quotations

EPC$Global_active_power <- as.character(EPC$Global_active_power)
EPC$Global_active_power <- as.numeric(EPC$Global_active_power)
# you have to convert the data into char before numeric otherwise it rounds up/down to 0 dec.

hist(EPC$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
