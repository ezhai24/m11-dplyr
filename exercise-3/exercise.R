# Exercise 3: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1


# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
# Install (if you haven't already) and load the `dplyr`package
library(fueleconomy)
library(dplyr)

# Which Accura model has the best hwy MPG in 2015? (without method chaining)
accuras <- filter(vehicles, make == 'Acura')
y2015.accuras <- filter(accuras, year == 2015)
filter(y2015.accuras, hwy == max(hwy))

# Which Accura model has the best hwy MPG in 2015? (nesting functions)
filter(filter(filter(vehicles, make == 'Acura'), year == 2015), hwy == max(hwy))

# Which Accura model has the best hwy MPG in 2015? (pipe operator)
filter(vehicles, make == 'Acura') %>% filter(year == 2015) %>% filter(hwy == max(hwy))

### Bonus ###

# Write 3 functions, one for each approach.  Then, 
# Test how long it takes to perform each one 1000 times
NoChain <- function(car.make, car.year) {
  accuras <- filter(vehicles, make == car.make)
  y2015.accuras <- filter(accuras, year == car.year)
  filter(y2015.accuras, hwy == max(hwy))
}

Nested <- function(car.make, car.year) {
  filter(filter(filter(vehicles, make == car.make), year == car.year), hwy == max(hwy))
}

Pipe <- function(car.make, car.year) {
  filter(vehicles, make == 'Acura') %>% filter(year == 2015) %>% filter(hwy == max(hwy))
}

TestTime <- function(FUN) {
  start.time <- Sys.time()
  for(i in 1000) {
    FUN('Honda', 1995)
  }
  end.time <-Sys.time()
  return(end.time - start.time)
}

TestTime(NoChain)
TestTime(Nested)
TestTime(Pipe)
