# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# You should have have access to the `vehicles` data.frame
View(vehicles)

# Create a data.frame of vehicles from 1997
y1997.vehicles <- vehicles[vehicles$year == 1997,]

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(y1997.vehicles$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.wheel <- vehicles[vehicles$drive == '2-Wheel Drive',]
green.two.wheel <- two.wheel[two.wheel$cty > 20,]

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
green.two.wheel[green.two.wheel$hwy == min(green.two.wheel$hwy),]$id

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MostHwyMiles <- function(make, year) {
  year.vehicles <- vehicles[vehicles$year == year,]
  year.make.vehicles <- year.vehicles[year.vehicles$make == make,]
  return(year.make.vehicles[year.make.vehicles$hwy == max(year.make.vehicles$hwy),])
}

# What was the most efficient honda model of 1995?
MostHwyMiles('Honda', 1995)
