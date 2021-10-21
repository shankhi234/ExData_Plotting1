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

#plotting graph with annotations
plot1 <- hist(as.numeric(as.character(dat$Global_Active)), col = "red", main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power(kilowatts)")

#convert to png
png(plot1, width = 480, height = 480, units = "px")
