uber <- read.csv("~/Desktop/R/Rtut8/Uber Request Data.csv")

head(uber)
tail(uber)

#how to deal with time
uber$Request.timestamp
str(uber)

library(lubridate)

#symbol

# %d days in number, 23, 14, 4, 18
# %a abbreviated weekday, Mon, Tue, Wed
# %A weekday, Monday, Tuesday, Wednesday

# %m, month, 1, 2, 3, 4, 5
# %b, abbreviated month, Jan, Feb, Mar, Apr
# %B, month full name, January, Feburary

# %y 2 digit year, 07
# %Y, 4 digit year, 2007
uber$Request.timestamp

library(lubridate)

uber$Request.timestamp2 <- parse_date_time(x = uber$Request.timestamp, order = c("%d/%m/%Y H:M", "%d-%m-%Y H:M:S"))


uber$Drop.timestamp2 <- parse_date_time(x = uber$Drop.timestamp, order = c("%d/%m/%Y H:M", "%d-%m-%Y H:M:S"))

head(uber)

uber$triptime <- uber$Drop.timestamp2 - uber$Request.timestamp2


table(uber$Status)

uber$result <- ifelse(uber$Status == "Trip Completed", "Good", "Bad")
table(uber$result)

#percent of complete cases
2831/(3914+2831)


library(ggplot2)
ggplot(data = uber, aes(x=result)) + geom_bar()

ggplot(data = uber, aes(x=result, fill = Pickup.point)) + geom_bar()

mean(uber$triptime, na.rm = TRUE)

tail(uber$triptime)


ggplot(uber, aes(x = Request.timestamp2, fill=result)) + geom_histogram()
ggplot(uber, aes(x = Request.timestamp2, fill=Status)) + geom_histogram() + facet_wrap(~Pickup.point)

