library(tidyverse)
library(lubridate)

df <- read_delim("data/household_power_consumption.txt", delim = ";", na = "?")

df <- df %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

df <- df %>% mutate(Date = dmy(Date),
                    Time = hms(Time))

png(filename = "plot1.png",
    width = 480, height = 480)
hist(df$Global_active_power, col = "red",
     main = "Global Active Power",
     xlim = c(0,6),
     xlab = "Global Active Power (kilowatts)",
     axes = FALSE
     )
axis(side = 1, at = seq(0,6,2))
axis(side = 2, at = seq(0,1200,200))
dev.off()
