# Comments are fun
ages <- c(20, 18, 19, 19, 21, 21)
sum(ages)/6
mean(ages)
yg <- c("SO", "SO", "FR", "JR", "JR", "JR")
class(yg)

loc <- c(FALSE, FALSE, TRUE, TRUE, FALSE, FALSE)

DF <- data.frame(ages, loc, yg)
rm(ages, loc, yg)
DF[1]

### Old School
## Create Data frame wher ages > 20
DF[DF$ages > 20, ]

### Oldest School
subset(DF, subset = ages > 20)

library(dplyr)
DF %>%
  filter(ages > 20)

filter(DF, ages > 20)

filter(DF, !loc)

library(nycflights13)
answer <- (flights$dep_delay > 100)
#answer <- answer[!is.na(answer)]
mean(na.omit(answer)) * 100
mean(answer, na.rm=TRUE) * 100

mean(na.omit(flights$dep_delay > 100))
library(ggplot2)

means = c(1:100000)
for(i in 1:100000) {
  set = sample(c(17,16,10,10,7,10,7,2,2,1))
  means[i] = mean(set[1:5]) - mean(set[6:10])
}
# Basic histogram
ggplot() + aes(means)+ geom_histogram(binwidth=1, color="black", fill="blue")

a = table(means)
sum(a[names(a)>=7.6])
mean(means >= 7.6)

