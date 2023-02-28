library(dplyr)
library(ggplot2)
library("scales")
library(stringr)
library(tidyverse)
library(RColorBrewer)

vDiscs_per_month_df <- library_df %>% filter(MaterialType == "VIDEODISC") %>% select(CheckoutMonth, Checkouts) %>% group_by(CheckoutMonth) %>% summarize(total_checkouts = sum(Checkouts))

ggplot(data = vDiscs_per_month_df) + 
  geom_line(aes(x=vDiscs_per_month_df$CheckoutMonth, y = vDiscs_per_month_df$total_checkouts)) +
  labs(title = "VideoDiscs Checked Out Per Month", x = "Month", y = "VideoDiscs Checked Out")
