library(dplyr)
library(ggplot2)
library("scales")
library(stringr)
library(tidyverse)
library(RColorBrewer)

books_per_month_df <- library_df %>% filter(MaterialType == "BOOK") %>% select(CheckoutMonth, Checkouts) %>% group_by(CheckoutMonth) %>% summarize(total_checkouts = sum(Checkouts))

ggplot(data = books_per_month_df) + 
      geom_line(aes(x=books_per_month_df$CheckoutMonth, y = books_per_month_df$total_checkouts)) +
      labs(title = "Books Checked Out Per Month", x = "Month", y = "Books Checked Out")

