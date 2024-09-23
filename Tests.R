# This is a script to save your own tests for the function
source("FunctionsLR.R")


#constructing a test for my class probabilities function
# Generate a random X matrix (n samples, p features)
n <- 5  
p <- 3
X <- matrix(rnorm(n * p), nrow = n, ncol = p)

# Generate a random beta matrix (p features, K classes)
K <- 4  
beta <- matrix(rnorm(p * K), nrow = p, ncol = K)

probabilities = class_probabilities(X, beta)
#should all be 1s
rowSums(probabilities)

#constructing a test for my objective function 
Y <- sample(1:K, n, replace=TRUE)
lambda <- 0.1
objective_fx(X, Y, beta, lambda, probabilities)