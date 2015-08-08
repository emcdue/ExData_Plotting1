temp <- read.table('household_power_consumption.txt', 
                   header = TRUE, sep = ';', na.strings = '?')
data <- filter(temp, temp$Date=='1/2/2007' | temp$Date=='2/2/2007')
data <- mutate(data, datetime = paste(data$Date, data$Time))
data$datetime <- strptime(data$datetime, format = '%d/%m/%Y %H:%M:%S')
attach(data)

png("plot2.png", width = 480, height = 480)
plot(datetime, Global_active_power, type = "l", 
     ylab = 'Global Active Power (kilowatts)',  xlab = '')
dev.off()