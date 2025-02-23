# Load required libraries
library(tidyverse)

# Step 1: Load the dataset
data <- read.csv("metabolite.csv")

# Step 2: Remove columns with more than 75% missing values
threshold <- 0.75
missing_percentage <- colMeans(is.na(data))
columns_to_remove <- names(missing_percentage[missing_percentage > threshold])

# Remove columns with more than 75% missing values
data_cleaned <- data %>% select(-all_of(columns_to_remove))

# Step 3: Replace remaining missing values with the median of each column
data_cleaned <- data_cleaned %>%
  mutate(across(where(is.numeric), ~ ifelse(is.na(.), median(., na.rm = TRUE), .)))

# Step 4: Apply PCA (Principal Component Analysis)
pca <- prcomp(data_cleaned %>% select(-Label), center = TRUE, scale. = TRUE)

# Get the principal components (PCs)
pca_data <- as.data.frame(pca$x)

# Add the Label column back for plotting
pca_data$Label <- data_cleaned$Label

# Step 5: Create the scatter plot using the first two principal components, colored by Label
ggplot(pca_data, aes(x = PC1, y = PC2, color = Label)) +
  geom_point() +
  labs(title = "PCA of Metabolites Data", x = "Principal Component 1", y = "Principal Component 2") +
  theme_minimal()

# Save the plot as a PNG file
ggsave("PCA_Scatter_Plot.pdf")

