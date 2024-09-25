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

#creating a test for my beta update 

n <- 10 
p <- 3       
K <- 4      
# Generate a small random training dataset
X_train <- matrix(rnorm(n * p), nrow = n, ncol = p)
Y_train <- sample(1:K, n, replace = TRUE)           
# Initialize beta randomly
beta <- matrix(rnorm(p * K), nrow = p, ncol = K)
# Set learning parameters
lambda <- 0.1 
eta <- 0.01    
# Choose class k to update (e.g., class 2)
k <- 2
P <- class_probabilities(X_train, beta) 

paste("Initial beta_k for class", k, ":\n")
print(beta[, k])

# Update beta_k
beta_k_new <- update_B_k(X_train, P[, k], Y_train, k, beta[, k], lambda, eta)

paste("\nUpdated beta_k for class", k, ":\n")
print(beta_k_new) 


#now let's test our update f_X
update_fx(X_train, Y_train, beta, lambda, eta, P)

#now testing the whole function
n_train <- 100   
n_test <- 100     
p <- 3           
K <- 4           

# Training data
X_train <- matrix(rnorm(n_train * p), nrow = n_train, ncol = p)
y_train <- sample(1:K, n_train, replace = TRUE)
X_train <- cbind(1, X_train)
# Testing data
X_test <- matrix(rnorm(n_test * p), nrow = n_test, ncol = p)
y_test <- sample(1:K, n_test, replace = TRUE)
X_test <- cbind(1, X_test)
LRMultiClass(X_train, y_train, X_test, y_test)