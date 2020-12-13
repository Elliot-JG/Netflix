# Netflix data analysis 
  # the exploration of Netflix data from 2008-2019
  # For more information on the data please see the link below 
  # DATA: https://www.kaggle.com/shivamb/netflix-shows


# Libraries ---------------------------------------------------------------

library(tidyverse)
library(readr)
library(stringr)
library(ggplot2)
library(lubridate)


# Average time by film genre ----------------------------------------------

# Splitting the 'duration' at the 'min' mark for further analysis was proving... difficult, so this bit was done in Excel. 
# I am SURE I will come back to this!
Netflix <- read_csv("C:/Users/44792/Desktop/Netflix/Netflix_titles.csv")

# Start pipe, with input 'Netflix'
Netflix_avg_time <-Netflix %>%
  
# Remove na's     
  na.omit() %>%

# Filter by movie, we don't want to analyse TV shows
  filter(type == "Movie") %>%

# Group by genre
  group_by(listed_in) %>%

# Average time for each genre, and add result for each row into new column 'avg_time'
  summarise(avg_time = mean(duration)) %>%
  
# Order film length, from shortest to longest
  arrange(avg_time)%>%

# Remove floating values
  mutate(avg_time = round(avg_time, 0))

# Specify data in avg_time as an integer
Netflix_avg_time$avg_time <- as.integer(Netflix_avg_time$avg_time)


# Plot up the result 
ggplot2::ggplot(tail(Netflix_avg_time), 
                aes(x = reorder(listed_in, avg_time), 
                    y = avg_time)) + 
  geom_bar(stat="identity") + 
  xlab("Film genre") +
  ylab("Average time (minutes)") 



# Assess how many films and TV shows were released in each year -----------

Netflix <- read_csv("C:/Users/44792/Desktop/Netflix/Netflix_titles.csv")

# There's a lot of stuff we don't need here so lets take it out
Netflix <- subset(Netflix, select = -c(show_id, director, type, cast, country, release_year, duration, Time, listed_in))

# We need to reformat the 'date_added' column and separate out the 'year'

# Using lubridate to set 'date_added' column to class(date) specifying the format using dmy() 
Netflix_year <- dmy(Netflix$date_added)

# Duplicate the date_added column
Netflix$Date_added <- Netflix_year

# Extract the 'year' from the duplicated column
#   This seemingly odd process was carried out to form nicer plots.
#   If the year was extracted as a class(date), when plotted on the x axis,
#   it would print the date on the x axis with a floating point. Through trial and
#   this seemed to work
Netflix$year <- year(ymd(Netflix$Date_added))


# We now need to count all the unique values that appear in the 'year' column in Netflix
Netflix_year <- Netflix %>%
  
  # Grouped by 'year': 
  group_by(year) %>%


# Add up all the unique values in the year column
  summarise(summed_year = sum(year)) %>%
  
# Divide the sum by unique values to get the count of each unique value 
  mutate(titles_in_year = summed_year/year) %>%

# Threshold to plot more years where less films were released
  filter(titles_in_year > 15)

# Plot the result 
ggplot2::ggplot(Netflix_year, 
                aes(x = year, 
                    y = titles_in_year)) + 
  geom_bar(stat="identity") + 
  xlab("Year") +
  ylab("Films released") 
