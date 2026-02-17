# ==========================================
# MODELLING – UPI ADOPTION ANALYSIS
# -------------------------------
# Load cleaned dataset
# -------------------------------
upi_data <- read.csv(
  "data/cleaned/upi_monthly_clean.csv",
  stringsAsFactors = FALSE
)

upi_data$Date <- as.Date(upi_data$Date)

# -------------------------------
# Linear Regression Model
# -------------------------------
model_volume <- lm(
  UPI_Volume_Mn ~ Time_Index + Is_Covid + Is_Festive,
  data = upi_data
)

summary(model_volume)

# -------------------------------
# Value Model
# -------------------------------
model_value <- lm(
  UPI_Value_Cr ~ Time_Index + Is_Covid + Is_Festive,
  data = upi_data
)

summary(model_value)
