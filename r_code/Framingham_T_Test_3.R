
library(dplyr)

path <- "C:/YOUR_FOLDER_HERE/Data/"
file <- paste0(path, "Framingham_Data.csv")

fram_df <- read.csv(file)

sd(fram_df$TOTCHOL, TRUE)
mean(as.numeric(fram_df$TOTCHOL), na.rm=TRUE)

# 1 = Diabetic
diabetic_chol_df <- fram_df %>%
  filter(DIABETES=="1") %>%
  select(TOTCHOL)

diabetic_chol <- as.numeric(diabetic_chol_df$TOTCHOL)

sd(diabetic_chol, TRUE)
mean(as.numeric(diabetic_chol), na.rm=TRUE)

# 0 = Not a diabetic
NOT_diabetic_chol_df <- fram_df %>%
  filter(DIABETES=="0") %>%
  select(TOTCHOL)

NOT_diabetic_chol <- as.numeric(NOT_diabetic_chol_df$TOTCHOL)

sd(NOT_diabetic_chol, TRUE)
mean(as.numeric(NOT_diabetic_chol), na.rm=TRUE)

# Compute t-test - equal variance
res <- t.test(diabetic_chol, NOT_diabetic_chol, var.equal = TRUE)
res
sprintf(res$p.value, fmt='%#.16f')

# Compute t-test - NOT equal variance
res1 <- t.test(diabetic_chol, NOT_diabetic_chol, var.equal = FALSE)
res1

