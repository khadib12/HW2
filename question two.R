# Function to compute Manhattan distance
manhattan_distance <- function(vector1, vector2) {
  # Ensure both vectors are of the same length
  if (length(vector1) != length(vector2)) {
    stop("Vectors must have the same length")
  }
  
  # Compute the Manhattan distance
  distance <- sum(abs(vector1 - vector2))
  return(distance)
}

# Function to compute Euclidean distance
euclidean_distance <- function(vector1, vector2) {
  # Ensure both vectors are of the same length
  if (length(vector1) != length(vector2)) {
    stop("Vectors must have the same length")
  }
  
  # Compute the Euclidean distance
  distance <- sqrt(sum((vector1 - vector2)^2))
  return(distance)
}

# Example vectors (you can modify these for testing)
vector1 <- c(1, 2, 3, 4)
vector2 <- c(4, 5, 6, 7)

# Compute the distances
manhattan_dist <- manhattan_distance(vector1, vector2)
euclidean_dist <- euclidean_distance(vector1, vector2)

# Print the results
cat("Manhattan Distance:", manhattan_dist, "\n")
cat("Euclidean Distance:", euclidean_dist, "\n")


