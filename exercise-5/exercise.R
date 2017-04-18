# Exercise 5: DPLYR Grouped Operations

# Install the nycflights13 package and read it in. Require the dplyr package.
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# In which month was the average departure delay the greatest? JULY
# Hint: you'll have to perform a grouping operation before summarizing your data
monthly.dep.delay <- group_by(flights, month) %>%
  summarise(avg.dep.delay = mean(dep_delay, na.rm = TRUE))

# If you create a data.frame with the columns "month", and "delay" above, you should be able to create 
# a scatterplot by passing it to the 'plot' function
plot(monthly.dep.delay)

# In which airport were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
airport.dep.delay <- group_by(flights, dest) %>%
  summarise(avg.arr.delay = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(desc(avg.arr.delay))

### Bonus ###
# Which city was flown to with the highest average speed?
