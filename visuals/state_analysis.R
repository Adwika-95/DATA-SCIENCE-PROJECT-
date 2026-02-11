# ==========================================
# STATE LEVEL ANALYSIS – UPI ADOPTION
# File: visuals/state_analysis.R
# ==========================================

# -------------------------------
# STEP 1: Load State Dataset
# -------------------------------

state_data <- read.csv("data/cleaned/phonepe_state_clean.csv",
                       stringsAsFactors = FALSE)

# -------------------------------
# STEP 2: Sort by Volume
# -------------------------------

state_data_volume <- state_data[order(-state_data$Total_Transaction_Volume), ]

# -------------------------------
# STEP 3: Top 10 States by Volume
# -------------------------------

top10_volume <- head(state_data_volume, 10)

png("visuals/top10_states_volume.png", width = 900, height = 600)

barplot(
  top10_volume$Total_Transaction_Volume,
  names.arg = top10_volume$State,
  las = 2,
  col = "steelblue",
  main = "Top 10 States by UPI Transaction Volume",
  ylab = "Total Transaction Volume"
)

dev.off()

# -------------------------------
# STEP 4: Sort by Amount
# -------------------------------

state_data_amount <- state_data[order(-state_data$Total_Transaction_Amount), ]

top10_amount <- head(state_data_amount, 10)

png("visuals/top10_states_amount.png", width = 900, height = 600)

barplot(
  top10_amount$Total_Transaction_Amount,
  names.arg = top10_amount$State,
  las = 2,
  col = "darkgreen",
  main = "Top 10 States by UPI Transaction Amount",
  ylab = "Total Transaction Amount"
)

dev.off()

# -------------------------------
# STEP 5: Contribution Percentage
# -------------------------------

total_volume <- sum(state_data$Total_Transaction_Volume)
state_data$Volume_Percentage <- 
  (state_data$Total_Transaction_Volume / total_volume) * 100

# Save updated dataset with percentage (optional)
write.csv(state_data,
          "data/final/state_analysis_with_percentage.csv",
          row.names = FALSE)

# -------------------------------
# STEP 6: Summary Statistics
# -------------------------------

summary(state_data$Total_Transaction_Volume)
summary(state_data$Total_Transaction_Amount)

cat("State Analysis Completed\n")
