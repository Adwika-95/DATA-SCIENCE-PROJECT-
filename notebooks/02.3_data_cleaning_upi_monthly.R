# ==========================================
# DATA CLEANING – UPI MONTHLY DATA
# -------------------------------
# Load raw UPI monthly dataset
# -------------------------------
upi_raw <- read.csv(
  "data/raw/upi_india_monthly_enriched.csv",
  stringsAsFactors = FALSE
)

# -------------------------------
# STEP 1: Convert Date column
# -------------------------------
upi_raw$Date <- as.Date(upi_raw$Date)

# -------------------------------
# STEP 2: Select relevant columns
# -------------------------------
upi_clean <- upi_raw[, c(
  "Date",
  "Year",
  "Month_Num",
  "Month_Name",
  "Financial_Year",
  "Volume_Mn",
  "Value_Cr"
)]

# -------------------------------
# STEP 3: Handle missing values
# -------------------------------
upi_clean <- upi_clean[
  complete.cases(
    upi_clean$Volume_Mn,
    upi_clean$Value_Cr
  ),
]

# -------------------------------
# STEP 4: Rename columns clearly
# -------------------------------
colnames(upi_clean) <- c(
  "Date",
  "Year",
  "Month_Num",
  "Month_Name",
  "Financial_Year",
  "UPI_Volume_Mn",
  "UPI_Value_Cr"
)

# -------------------------------
# STEP 5: Sort data chronologically
# -------------------------------
upi_clean <- upi_clean[
  order(upi_clean$Date),
]

# -------------------------------
# STEP 6: Feature Engineering
# -------------------------------

# Time index (useful for trend / regression)
upi_clean$Time_Index <- seq_len(nrow(upi_clean))

# Covid period indicator (Mar 2020 – Feb 2022)
upi_clean$Is_Covid <- ifelse(
  upi_clean$Date >= as.Date("2020-03-01") &
    upi_clean$Date <= as.Date("2022-02-01"),
  1, 0
)

# Festive season indicator (October–November)
upi_clean$Is_Festive <- ifelse(
  upi_clean$Month_Name %in% c("October", "November"),
  1, 0
)

# -------------------------------
# STEP 7: Summary statistics
# -------------------------------
summary(upi_clean)

# -------------------------------
# STEP 8: Save cleaned dataset
# -------------------------------
write.csv(
  upi_clean,
  "data/cleaned/upi_monthly_clean.csv",
  row.names = FALSE
)

# -------------------------------
# FINAL CHECK
# -------------------------------
cat("UPI Monthly Cleaned Data\n")
dim(upi_clean)
head(upi_clean)
