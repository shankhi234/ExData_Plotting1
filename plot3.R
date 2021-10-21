#sets working directory
setwd("C:/Users/Shankhi/Documents/exploratorydataanalysis")

#unzips the file
unzip("exdata_data_household_power_consumption.zip")

#reading in txt file as a table
data <-  read.table("household_power_consumption.txt", skip = 1, sep =";")

#set the names for columns
names(data) <- c("Date", "Time", "Global_Active", "Global_Reactive", "Voltage", "Global_Intensity", "Sub1", "Sub2", "Sub3")

#subset the data needed
dat <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#formatting data
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat$Time <- strptime(dat$Time, format="%H:%M:%S")
dat[1:1440,"Time"] <- format(dat[1:1440,"Time"],"2007-02-01 %H:%M:%S")
dat[1441:2880,"Time"] <- format(dat[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#plotting graph
plot(dat$Time, dat$Sub1, type = "1", xlab = "", ylab = "Energy Sub Metering")
with(dat, lines(Time, as.numeric(as.character(
  Sub1
))))
with(dat, lines(Time, as.numeric(as.character(
  Sub2
)),col = "red"))
with(dat, lines(Time, as.numeric(as.character(
  Sub3
)),col = "blue"))
legend("topright", lty = 1, legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), col = c("black", "red", "blue"))
title(main = "Energy sub-metering")