# Set the working directory to where the dataset is located
setwd("C:/Users/khadi/Downloads/csc587")

# Load the dataset
data <- read.csv("income.data.csv")

# Step 1: Remove columns with more than 75% missing values
threshold <- 0.75 * nrow(data)
data_cleaned <- data[, colSums(is.na(data)) <= threshold]

# Step 2: Replace missing values with the median of the column (for the remaining columns)
data_cleaned <- data_cleaned %>%
  mutate(across(everything(), ~ ifelse(is.na(.), median(., na.rm = TRUE), .)))

# Check the result
print(head(data_cleaned))

# Optionally, save the cleaned data to a new CSV file
write.csv(data_cleaned, "income_cleaned.csv", row.names = FALSE)

