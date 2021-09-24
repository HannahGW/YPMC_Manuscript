# Attach packages ----

library(tidyverse)
library(janitor)
library(naniar)

# Read in data ----

# Cleveland NF
cnf_fia <- read_csv("CNF_FSVEG_VXPT_V.csv")

# Angeles NF
anf_fia <- read_csv("ANF_FSVEG_VXPT_V.csv")

# Los Padres NF
lpf_fia <- read_csv("LPF_FSVEG_VXPT_V.csv")

# San Bernardino NF
bdf_fia <- read_csv("BDF_FSVEG_VXPT_V.csv")

# FIA Metadata notes ----

# Link: https://www.fs.fed.us/r5/rsl/projects/inventory/fsveg-veg.shtml

# According to FIA metadata, the following conditions apply to conifer species
# - Special Features (SPFE) and Surface Cover (SRFC) are not applicable so they'll be NA anyways
# - Number of Stems (NCNT) is optional

# SRFC refers to non-vegetative cover (ie. rocks, water/snow/ice, moss/lichen/fungi, etc).
# NCNT is just number of cover stems...still have no idea what that means.

# Observing NA values for ANF ----

# Total Count of NA values - 80259
anf_na <- n_miss(anf_fia)

# Total Count of complete values - 194861
anf_complete <- n_complete(anf_fia)

# Percentage of NA values - 29.17%
anf_na_pct <- pct_miss(anf_fia)

# Summary of NA values
anf_na_summ <- miss_var_summary(anf_fia)
# Note #1: NCNT has 0 NA values here...does that mean those 0's represent 0's or are some of them NA values?
# Note #2: This summary would be more or less the same for the other forests.

# Summary of NA values by observations (rows)
anf_na_summ_row <-  miss_case_table(anf_fia)

# Observing NA values for CNF ----

# Total Count of NA values - 55371
cnf_na <- n_miss(cnf_fia)

# Total Count of complete values - 131989
cnf_complete <- n_complete(cnf_fia)

# Percentage of NA values - 29.55%
cnf_na_pct <- pct_miss(cnf_fia)

# Summary of NA values
cnf_na_summ <- miss_var_summary(cnf_fia)

# Summary of NA values by observations (rows)
cnf_na_summ_row <-  miss_case_table(cnf_fia)

# Observing NA values for LPF ----

# Total Count of NA values - 246437
lpf_na <- n_miss(lpf_fia)

# Total Count of complete values - 565323
lpf_complete <- n_complete(lpf_fia)

# Percentage of NA values - 30.36%
lpf_na_pct <- pct_miss(lpf_fia)

# Summary of NA values
lpf_na_summ <- miss_var_summary(lpf_fia)

# Summary of NA values by observations (rows)
lpf_na_summ_row <-  miss_case_table(lpf_fia)

# Observing NA values for BDF ----

# Total Count of NA values - 145939
bdf_na <- n_miss(bdf_fia)

# Total Count of complete values - 345021
bdf_complete <- n_complete(bdf_fia)

# Percentage of NA values - 29.72%
bdf_na_pct <- pct_miss(bdf_fia)

# Summary of NA values
bdf_na_summ <- miss_var_summary(bdf_fia)

# Summary of NA values by observations (rows)
bdf_na_summ_row <-  miss_case_table(bdf_fia)

# Combining NA stats together in one df ----

# Create vectors
nf_name <- c("ANF", "CNF", "LPF", "BDF")
nf_na <- c(anf_na, cnf_na, lpf_na, bdf_na)
nf_complete <- c(anf_complete, cnf_complete, lpf_complete, bdf_complete)
nf_na_pct <- c(anf_na_pct, cnf_na_pct, lpf_na_pct, bdf_na_pct)

# Combine vectors into data frame
na_df <- tibble(nf_name, nf_na, nf_complete, nf_na_pct)
