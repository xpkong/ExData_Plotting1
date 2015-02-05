plot3 <- function() {
        library(lubridate)
        library(dplyr)
        ## Read the data from file into data.frame
        data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';')
        ## Creating a vector, 'reqDates', containing the dates which we require
        reqDates <- c(dmy('01/02/2007'), dmy('02/02/2007'))
        ## Data is filtered such that only data corresponding to 'reqDates' is selected
        data <- data[dmy(data$Date) %in% reqDates,]
        ## Create a date_time variable in POSIXct class
        data <- mutate(data, Date_time = dmy_hms(paste(Date,Time)))
        ## Convert columns 'Sub_metering_1' to 'Sub_metering_3' to numeric class
        data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
        data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
        data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
        ## Create the plot in png file format
        png(file = 'plot3.png', width = 480, height = 480)
        plot(data$Date_time, data$Sub_metering_1, xlab = '', col = 'black',
             ylab = 'Energy sub metering', type = 'l')
        lines(data$Date_time, data$Sub_metering_2, col = 'red')
        lines(data$Date_time, data$Sub_metering_3, col = 'blue')
        legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
               col = c('black', 'red', 'blue'), lty = c(rep('solid',3)))
        dev.off()
}