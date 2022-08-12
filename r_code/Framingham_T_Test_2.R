
library(dplyr)

path <- "C:/YOUR_FOLDER_HERE/Data/"
file <- paste0(path, "Framingham_Data.csv")

fram_df <- read.csv(file)


length(fram_df$SYSBP)
sd(fram_df$SYSBP, TRUE)
mean(fram_df$SYSBP, na.rm=TRUE)

# 1 = Current smoker
smoker_SysBP_df <- fram_df %>%
  filter(CURSMOKE=="1") %>%
  select(SYSBP)

smoker_SysBP <- as.numeric(smoker_SysBP_df$SYSBP)

length(smoker_SysBP)
sum(smoker_SysBP)
sd(smoker_SysBP, FALSE)
mean(smoker_SysBP, na.rm=FALSE)

# 0 = Not current smoker
Nonsmoker_SysBP_df <- fram_df %>%
  filter(CURSMOKE=="0") %>%
  select(SYSBP)

Nonsmoker_SysBP <- as.numeric(Nonsmoker_SysBP_df$SYSBP)

length(Nonsmoker_SysBP)
sum(Nonsmoker_SysBP)
sd(Nonsmoker_SysBP, TRUE)
mean(as.numeric(Nonsmoker_SysBP), na.rm=FALSE)



# Compute t-test - equal variance
res_eq <- t.test(Nonsmoker_SysBP, smoker_SysBP, var.equal = TRUE)
res_eq
sprintf(res_eq$p.value, fmt='%#.60f')


# Compute t-test - NOT equal variance
res_noteq <- t.test(Nonsmoker_SysBP, smoker_SysBP, var.equal = FALSE)
res_noteq





