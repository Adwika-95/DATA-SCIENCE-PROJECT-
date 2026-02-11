# ==========================================
# EXPLORATORY DATA ANALYSIS – UPI MONTHLY
# File: 03_eda.R
# ==========================================

# -------------------------------
# STEP 1: Load cleaned dataset
# -------------------------------
upi_data <- read.csv(
  "data/cleaned/upi_monthly_clean.csv",
  stringsAsFactors = FALSE
)

upi_data$Date <- as.Date(upi_data$Date)

# -------------------------------
# STEP 2: Basic Structure
# -------------------------------
str(upi_data)
summary(upi_data)

# -------------------------------
# STEP 3: Trend Plot – Volume
# -------------------------------
plot(
  upi_data$Date,
  upi_data$UPI_Volume_Mn,
  type = "l",
  col = "blue",
  lwd = 2,
  main = "UPI Monthly Transaction Volume",
  xlab = "Date",
  ylab = "Volume (Million)"
)

# -------------------------------
# STEP 4: Trend Plot – Value
# -------------------------------
plot(
  upi_data$Date,
  upi_data$UPI_Value_Cr,
  type = "l",
  col = "darkgreen",
  lwd = 2,
  main = "UPI Monthly Transaction Value",
  xlab = "Date",
  ylab = "Value (Crore)"
)

# -------------------------------
# STEP 5: Correlation Analysis
# -------------------------------
correlation <- cor(
  upi_data$UPI_Volume_Mn,
  upi_data$UPI_Value_Cr
)

cat("Correlation between Volume and Value:", correlation, "\n")

# -------------------------------
# STEP 6: Covid Impact Analysis
# -------------------------------
aggregate(
  UPI_Volume_Mn ~ Is_Covid,
  data = upi_data,
  mean
)

aggregate(
  UPI_Value_Cr ~ Is_Covid,
  data = upi_data,
  mean
)

# -------------------------------
# STEP 7: Festive Season Impact
# -------------------------------
aggregate(
  UPI_Volume_Mn ~ Is_Festive,
  data = upi_data,
  mean
)

aggregate(
  UPI_Value_Cr ~ Is_Festive,
  data = upi_data,
  mean
)
