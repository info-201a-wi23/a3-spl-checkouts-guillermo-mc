# Load Libraries
library("dplyr")
library("stringr")
library("ggplot2")

# Load in dataset
# Ideas for data values:
# 1. BOOK Checkouts per Month (Line plot, to show changes over time)
books_per_month_df <- library_df %>% filter(MaterialType == "BOOK") %>% select(CheckoutMonth, Checkouts) %>% group_by(CheckoutMonth) %>% summarize(total_checkouts = sum(Checkouts))

most_pop_book_month <- books_per_month_df %>% filter(total_checkouts == max(total_checkouts)) %>% pull(CheckoutMonth)

# 2. Most popular books (Take like top 20, histogram)
pop_book_table <- library_df %>% filter(MaterialType == "BOOK") %>% arrange(-Checkouts) %>% select(Title, Checkouts) %>% slice_head(n=10)

most_pop_book <- pop_book_table %>% select(Title) %>% slice_head(n=1)

# 3. Material Types ranking (What are people doing when going to the library, histogram)
material_ranking_df <- library_df %>% select(MaterialType, Checkouts) %>% group_by(MaterialType) %>% summarize(total_checkouts = sum(Checkouts)) %>% arrange(-total_checkouts) %>% slice_head(n=3)



# 4. Most popular authors / Most popular author of each month
pop_author_table <- library_df %>% filter(MaterialType == "BOOK") %>% arrange(-Checkouts) %>% select(Creator, Checkouts) %>% slice_head(n=10)

most_pop_author <- pop_author_table %>% filter(Checkouts == max(Checkouts)) %>% select(Creator) 

# 5. VIDEO DISCS Checkouts per Month (Line plot, to show changes over time)
vDiscs_per_month_df <- library_df %>% filter(MaterialType == "VIDEODISC") %>% select(CheckoutMonth, Checkouts) %>% group_by(CheckoutMonth) %>% summarize(total_checkouts = sum(Checkouts))

most_pop_vDisc_month <- vDiscs_per_month_df %>% filter(total_checkouts == max(total_checkouts)) %>% pull(CheckoutMonth)

# Introduction



