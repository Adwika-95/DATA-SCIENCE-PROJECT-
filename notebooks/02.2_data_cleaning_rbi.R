# ==========================================
# DATA CLEANING – RBI MONTHLY UPI DATA
# -------------------------------
# Load raw RBI dataset
# -------------------------------
rbi_raw <- read.csv(
  "data/raw/RS_Session_259_AU_1476_C_to_E.csv",
  stringsAsFactors = FALSE
)

# -------------------------------
# STEP 1: Rename columns clearly
# -------------------------------
colnames(rbi_raw) <- c(
  "Month",
  "Volume_Crore",
  "Value_Lakh_Crore"
)

# -------------------------------
# STEP 2: Create Month Number
# (for ordering & merging)
# -------------------------------
month_levels <- c(
  "January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
)

rbi_raw$Month_Num <- match(rbi_raw$Month, month_levels)

# -------------------------------
# STEP 3: Sort data by month
# -------------------------------
rbi_clean <- rbi_raw[
  order(rbi_raw$Month_Num),
]

# -------------------------------
# STEP 4: Summary check
# -------------------------------
summary(rbi_clean)

# -------------------------------
# STEP 5: Save cleaned dataset
# -------------------------------
write.csv(
  rbi_clean,
  "data/cleaned/rbi_monthly_clean.csv",
  row.names = FALSE
)

# -------------------------------
# FINAL CHECK
# -------------------------------
cat("RBI Monthly Cleaned Data\n")
dim(rbi_clean)
head(rbi_clean)
