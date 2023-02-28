library(dplyr)
library(ggplot2)
library("scales")
library(stringr)
library(tidyverse)
library(RColorBrewer)

material_ranking_df <- library_df %>% select(MaterialType, Checkouts) %>% group_by(MaterialType) %>% summarize(total_checkouts = sum(Checkouts)) %>% arrange(-total_checkouts) %>% slice_head(n=3)

ggplot(data = material_ranking_df) + 
  geom_col(aes(x = material_ranking_df$MaterialType, y = material_ranking_df$total_checkouts, fill = material_ranking_df$MaterialType)) +
  scale_color_brewer(palette = "Set2") +
  labs(title = "Material Total Checkout Comparisons", x = "Material Type", y = "Checkouts", fill = "MaterialType")
