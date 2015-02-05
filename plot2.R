plot2 <- function() {
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
        ## Convert column 'Global_active_power' to numeric class
        data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
        ## Create the plot in png file format
        png(file = 'plot2.png', width = 480, height = 480)
        plot(data$Date_time,data$Global_active_power, xlab = '',
              ylab = 'Global Active Power (kilowatts)', type = 'l')
        dev.off()
}