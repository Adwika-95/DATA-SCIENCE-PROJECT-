# ===============================
# DATA UNDERSTANDING – BASE R
# ===============================

# Dataset 1: PhonePe State-District Data
phonepe_raw <- read.csv("data/raw/phonepe_data.csv", stringsAsFactors = FALSE)

# Dataset 2: UPI Monthly Enriched Data
upi_monthly_raw <- read.csv("data/raw/upi_india_monthly_enriched.csv", stringsAsFactors = FALSE)

# Dataset 3: RBI Monthly UPI Summary
rbi_raw <- read.csv("data/raw/RS_Session_259_AU_1476_C_to_E.csv", stringsAsFactors = FALSE)


# -------------------------------
# BASIC STRUCTURE CHECK
# -------------------------------

cat("PHONEPE DATASET\n")
dim(phonepe_raw)
str(phonepe_raw)
head(phonepe_raw)

cat("\nUPI MONTHLY ENRICHED DATASET\n")
dim(upi_monthly_raw)
str(upi_monthly_raw)
head(upi_monthly_raw)

# Date range check (convert to Date if needed)
upi_monthly_raw$Date <- as.Date(upi_monthly_raw$Date)
range(upi_monthly_raw$Date, na.rm = TRUE)

cat("\nRBI MONTHLY DATASET\n")
dim(rbi_raw)
str(rbi_raw)
head(rbi_raw)


# -------------------------------
# MISSING VALUE ANALYSIS
# -------------------------------

colSums(is.na(phonepe_raw))
colSums(is.na(upi_monthly_raw))
colSums(is.na(rbi_raw))


# -------------------------------
# SUMMARY STATISTICS
# -------------------------------

summary(phonepe_raw$transaction_volume)
summary(phonepe_raw$transaction_amount)

summary(upi_monthly_raw$Volume_Mn)
summary(upi_monthly_raw$Value_Cr)
