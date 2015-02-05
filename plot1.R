plot1 <- function() {
        library(lubridate)
        ## Read the data from file into data.frame
        data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';')
        ## Creating a vector, 'reqDates', containing the dates which we require
        reqDates <- c(dmy('01/02/2007'), dmy('02/02/2007'))
        ## Data is filtered such that only data corresponding to 'reqDates' is selected
        data <- data[dmy(data$Date) %in% reqDates,]
        ## Convert column 'Global_active_power' to numeric class
        data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
        ## Create the plot in png file format
        png(file = 'plot1.png', width = 480, height = 480)
        hist(data$Global_active_power,main = 'Global Active Power',
             xlab = 'Global Active Power (kilowatts)', col = 'red')
        dev.off()
}