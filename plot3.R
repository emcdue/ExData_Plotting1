library(dplyr)
temp <- read.table('household_power_consumption.txt', 
                   header = TRUE, sep = ';', na.strings = '?')
data <- filter(temp, temp$Date=='1/2/2007' | temp$Date=='2/2/2007')
data <- mutate(data, datetime = paste(data$Date, data$Time))
data$datetime <- strptime(data$datetime, format = '%d/%m/%Y %H:%M:%S')
attach(data)

png("plot3.png", width = 480, height = 480)
plot(datetime, Sub_metering_1, type = "l", ylab = 'Energy sub metering', xlab = '')
lines(datetime, Sub_metering_2, col='red')
lines(datetime, Sub_metering_3, col='blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()