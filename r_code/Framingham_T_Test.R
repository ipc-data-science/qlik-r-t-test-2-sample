
library(dplyr)

path <- "C:/YOUR_FOLDER_HERE/Data/"
file <- paste0(path, "Framingham_Data.csv")

fram_df <- read.csv(file)

sd(fram_df$TOTCHOL, TRUE)
mean(as.numeric(fram_df$TOTCHOL), na.rm=TRUE)

# 1 = Male
male_chol_df <- fram_df %>%
  filter(SEX=="1") %>%
  select(TOTCHOL)

male_chol <- as.numeric(male_chol_df$TOTCHOL)

sd(male_chol, TRUE)
mean(as.numeric(male_chol), na.rm=TRUE)

# 2 = Female
female_chol_df <- fram_df %>%
  filter(SEX=="2") %>%
  select(TOTCHOL)

female_chol <- as.numeric(female_chol_df$TOTCHOL)

sd(female_chol, TRUE)
mean(as.numeric(female_chol), na.rm=TRUE)

# Compute t-test - equal variance
res <- t.test(female_chol, male_chol, var.equal = TRUE)
res
sprintf(res$p.value, fmt='%#.16f')

# Compute t-test - NOT equal variance
res1 <- t.test(female_chol, male_chol, var.equal = FALSE)
res1

