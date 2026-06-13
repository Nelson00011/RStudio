# --- Step 1: Generate Mock Sample Data ---
set.seed(42) # Ensures reproducibility

sample_data <- data.frame(
  CustomerID = 1:100,
  Age = sample(18:65, 100, replace = TRUE),
  Spend = round(rnorm(100, mean = 250, sd = 75), 2),
  Group = sample(c("Control", "Treatment"), 100, replace = TRUE)
)

# --- Step 2: Test Data Inspection ---
print("First 6 rows of the generated dataset:")
print(head(sample_data))

# --- Step 3: Split into Train and Test Subsets ---
# Select 80% of rows randomly for a training sample
train_indices <- sample(1:nrow(sample_data), 0.8 * nrow(sample_data))
train_set <- sample_data[train_indices, ]
test_set  <- sample_data[-train_indices, ]

print(paste("Training set rows:", nrow(train_set)))
print(paste("Testing set rows:", nrow(test_set)))

# --- Step 4: Run a Statistical Test (t-test) ---
# Testing if Spend differs significantly between Control and Treatment
t_test_result <- t.test(Spend ~ Group, data = sample_data)
print(t_test_result)

# --- Step 5: Visualizing the Data ---
# This will trigger the VS Code interactive plot viewer
boxplot(Spend ~ Group, data = sample_data,
        main = "Customer Spend by Experiment Group",
        xlab = "Group Assignment",
        ylab = "Total Spend ($)",
        col = c("#ff9999", "#66b3ff"))
