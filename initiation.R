# Initiation file

## Package upload
if (TRUE) {rm(list = ls() )}
if (TRUE) {
  suppressWarnings(suppressMessages({
    ### PASSWORD
    library(rstudioapi)
    ### DATA: obtain, wrangle and explore
    library(RJDBC)
    library(openxlsx)
    library(tidyverse)
    library(lubridate)
    library(stringi)
    library(janitor)
    ### TABLES: create and modify
    library(gtsummary)
    library(flextable)
    library(kableExtra)
    library(sjPlot)
    ### PLOTS
    library(ggpubr)
    library(cowplot)
    library(ggdist)
    ### STATS
    library(glmmTMB)
    library(nlme)
    library(rms)
    library(rmsb)
    library(brms)
    library(emmeans)
    library(car)
    library(arm)
    library(pROC)
    library(ggbeeswarm)
    library(DHARMa)
  }))
}

## set home directory
setwd("/home/ticf/1_ticf_sec/709_Bittenglova_BITC_cell_cycle/")

## Functions

### set functions clashes
select <- dplyr::select
rename <- dplyr::rename
mutate <- dplyr::mutate
recode <- dplyr::recode
summarise <- dplyr::summarise
count <- dplyr::count

### basic functions
logit <- function(x){log(x/(1-x))}
inv_logit <- function(x){exp(x)/(1+exp(x))}
sem <- function(x) sd(x, na.rm = TRUE) / sqrt(sum(!is.na(x)))


## Create folders
folders <- c("data", 
             "gitignore",
             "gitignore/run",
             "gitignore/figures",
             "gitignore/data",
             "gitignore/html_reports")

invisible(
  lapply(
    folders, function(x) if (!dir.exists(x)) 
      dir.create(x, recursive = TRUE)
  )
)


## Set seed
set.seed(2025)

## Upload data
data <- read.xlsx('data/data_forR_update2.xlsx')

summary(data)

### make long format
data_long <- data %>% 
  pivot_longer(
    cols = expA_04_10:expH,
    names_to = "Experiment",
    values_to = "Proportion"
  ) %>% 
  mutate(
    Time_num = as.numeric(str_extract(Time, "\\d+")),
    is_k = (str_detect(Time, "K") | str_detect(Time, "Control"))
  ) %>% 
  arrange(desc(is_k), Time_num) %>% 
  mutate(
    Time = factor(Time, levels = unique(Time)),
    Table = factor(paste0(Graph, '_X_', Graph2, '_X_', Name.of.population)),
    Experiment = factor(Experiment)
  ) %>% 
  select(-is_k)



data_long <- data %>% 
  pivot_longer(
    cols = expA_04_10:expH,
    names_to = "Experiment",
    values_to = "Proportion"
  ) %>% 
  mutate(
    Time = factor(Time, levels = unique(Time)),
    Table = factor(paste0(Graph, '_X_', Graph2, '_X_', Name.of.population)),
    Experiment = factor(Experiment)
  ) 











