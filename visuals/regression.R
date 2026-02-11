# Load final dataset
upi_data <- read.csv("data/cleaned/upi_monthly_clean.csv")

# Build regression model
model_volume <- lm(UPI_Volume_Mn ~ Time_Index, data = upi_data)

# Save plot as PNG inside visuals folder
png("visuals/volume_regression.png", width = 800, height = 600)

plot(upi_data$Time_Index,
     upi_data$UPI_Volume_Mn,
     main = "UPI Volume Growth Over Time",
     xlab = "Time Index",
     ylab = "UPI Volume (Million)",
     pch = 19)

abline(model_volume, col = "red", lwd = 2)

dev.off()
