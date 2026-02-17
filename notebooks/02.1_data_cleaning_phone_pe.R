# ==========================================
# DATA CLEANING – PHONEPE STATE-WISE DATA
# -------------------------------
# Load raw PhonePe dataset
# -------------------------------
phonepe_raw <- read.csv(
  "data/raw/phonepe_data.csv",
  stringsAsFactors = FALSE
)

# -------------------------------
# STEP 1: Remove duplicate records
# -------------------------------
phonepe_nodup <- unique(phonepe_raw)

# -------------------------------
# STEP 2: Aggregate district-level
# data to STATE level
# -------------------------------
phonepe_state <- aggregate(
  cbind(transaction_volume, transaction_amount) ~ state,
  data = phonepe_nodup,
  sum
)

# -------------------------------
# STEP 3: Rename columns clearly
# -------------------------------
colnames(phonepe_state) <- c(
  "State",
    "Total_Transaction_Volume",
    "Total_Transaction_Amount"
)

# -------------------------------
# STEP 4: Sort states by adoption
# -------------------------------
phonepe_state <- phonepe_state[
  order(phonepe_state$Total_Transaction_Volume, decreasing = TRUE),
]

# -------------------------------
# STEP 5: Summary statistics
# -------------------------------
summary(phonepe_state)

# -------------------------------
# STEP 6: Save cleaned dataset
# -------------------------------
write.csv(
  phonepe_state,
  "data/cleaned/phonepe_state_clean.csv",
  row.names = FALSE
)

# -------------------------------
# FINAL CHECK
# -------------------------------
cat("PhonePe State-wise Cleaned Data\n")
dim(phonepe_state)
head(phonepe_state)
