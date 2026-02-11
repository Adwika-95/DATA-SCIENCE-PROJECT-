# ==========================================
# UPI TRENDS ANALYSIS
# File: visuals/trends.R
# ==========================================

# -------------------------------
# STEP 1: Load UPI Monthly Data
# -------------------------------

upi_data <- read.csv("data/cleaned/upi_monthly_clean.csv",
                     stringsAsFactors = FALSE)

upi_data$Date <- as.Date(upi_data$Date)

# -------------------------------
# STEP 2: Volume Trend Over Time
# -------------------------------

png("visuals/upi_volume_trend.png", width = 900, height = 600)

plot(upi_data$Date,
     upi_data$UPI_Volume_Mn,
     type = "l",
     col = "blue",
     lwd = 2,
     main = "UPI Transaction Volume Trend",
     xlab = "Year",
     ylab = "Volume (Million)")

dev.off()

# -------------------------------
# STEP 3: Value Trend Over Time
# -------------------------------

png("visuals/upi_value_trend.png", width = 900, height = 600)

plot(upi_data$Date,
     upi_data$UPI_Value_Cr,
     type = "l",
     col = "darkgreen",
     lwd = 2,
     main = "UPI Transaction Value Trend",
     xlab = "Year",
     ylab = "Value (Crore)")

dev.off()

# -------------------------------
# STEP 4: Highlight Covid Period
# -------------------------------

png("visuals/upi_covid_highlight.png", width = 900, height = 600)

plot(upi_data$Date,
     upi_data$UPI_Volume_Mn,
     type = "l",
     col = "black",
     lwd = 2,
     main = "UPI Volume with Covid Period Highlighted",
     xlab = "Year",
     ylab = "Volume (Million)")

# Shade Covid period
covid_start <- as.Date("2020-03-01")
covid_end   <- as.Date("2022-02-01")

rect(covid_start, 
     par("usr")[3],
     covid_end,
     par("usr")[4],
     col = rgb(1, 0, 0, 0.2),
     border = NA)

lines(upi_data$Date,
      upi_data$UPI_Volume_Mn,
      col = "black",
      lwd = 2)

dev.off()

cat("Trend Analysis Completed\n")
