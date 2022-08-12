
library(dplyr)

path <- "C:/YOUR_FOLDER_HERE/Data/"
file <- paste0(path, "Framingham_Data.csv")

fram_df <- read.csv(file)

# 1 = Diabetic
inclusion_participants_df <- fram_df %>%
  filter(DIABETES=="1") %>%
  filter(DEATH=="1") %>%
  filter(AGE<="50")


sd(inclusion_participants_df$SYSBP, TRUE)
mean(as.numeric(inclusion_participants_df$SYSBP), na.rm=TRUE)

# 1 = Male
male_sysbp_dead_df <- inclusion_participants_df %>%
  filter(SEX=="1") %>%
  select(SYSBP)

male_dead_sysbp <- as.numeric(male_sysbp_dead_df$SYSBP)

sd(male_dead_sysbp, TRUE)
mean(as.numeric(male_dead_sysbp), na.rm=TRUE)

# 2 = Female
female_sysbp_dead_df <- inclusion_participants_df %>%
  filter(SEX=="2") %>%
  select(SYSBP)

female_dead_sysbp <- as.numeric(female_sysbp_dead_df$SYSBP)

sd(female_dead_sysbp, TRUE)
mean(as.numeric(female_dead_sysbp), na.rm=TRUE)


# Compute t-test - equal variance
res <- t.test(female_dead_sysbp, male_dead_sysbp, var.equal = TRUE)
res
sprintf(res$p.value, fmt='%#.16f')

# Compute t-test - NOT equal variance
res1 <- t.test(female_dead_sysbp, male_dead_sysbp, var.equal = FALSE)
res1

