# Calculate the correlation between mpg and wt
correlation <- cor(mtcars$mpg, mtcars$wt)
cat("Correlation between mpg and wt:", correlation, "\n")

# Generate a scatter plot
plot(mtcars$wt, mtcars$mpg,
     main = "Scatter plot of MPG vs Weight",
     xlab = "Weight (wt)",
     ylab = "Miles per Gallon (mpg)",
     pch = 19,         # Solid circle for points
     col = "green")     # Blue color for points

# Optionally, add a regression line to the scatter plot
abline(lm(mtcars$mpg ~ mtcars$wt), col = "pink")  # Red regression line
