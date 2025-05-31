
# Load required packages
library(tidyverse)

# Read the clean attendance CSV file
attendance <- read_csv("../data/raw/universal_attendance_clean.csv")

# Print the first few rows to check data
print(head(attendance))

# Convert Year and Visitors to appropriate data types
attendance <- attendance %>%
  mutate(
    Year = as.integer(Year),
    Visitors = as.numeric(Visitors)
  )

# Check summary of the data
summary(attendance)

# Save cleaned data to the clean data folder
write_csv(attendance, "../data/clean/universal_attendance_final.csv")

# Optional: Plot attendance trend over the years
library(ggplot2)

ggplot(attendance, aes(x = Year, y = Visitors)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red", size = 3) +
  labs(
    title = "Universal Studios Hollywood Annual Attendance",
    x = "Year",
    y = "Visitors (millions)"
  ) +
  theme_minimal()
library(ggplot2)
