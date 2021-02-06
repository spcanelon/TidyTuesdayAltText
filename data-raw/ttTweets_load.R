# ttTweetsLoad.R

library(tidyverse)
library(here)
library(fs)
library(janitor)

#### read in all relevant files ####
# resource: https://www.gerkelab.com/blog/2018/09/import-directory-csv-purrr-readr/

# match Rds files with string "Tweets"
files <- fs::dir_ls(here("data-raw"), regexp = "Tweets(.*).Rds")

# read in all files into one dataframe
files_df <-
  files %>%
  purrr::map_df(readr::read_rds)

#### wrangle data ####
files_df_new <-
  files_df %>%
  # rename columns to upper camel case
  janitor::clean_names(case = "upper_camel") %>%
  # reorder columns
  dplyr::select(TweetId,
                ImageUrl,
                AltText,
                HashtagList,
                TweetDate,
                Year,
                Week,
                UrlCheck) %>%
  # convert TweetId from numeric to character variable
  dplyr::mutate(TweetId = as.character(TweetId))

# split HashtagList vector into individual hashtags
files_df_new <-
  files_df_new %>%
  dplyr::mutate(
    HashtagList = stringr::str_split(HashtagList, ", ")
    )

#### wrangle AltText variable ####
files_df_new <-
  files_df_new %>%
  # extract values from named AltText list
  dplyr::mutate(AltText = unname(AltText)) %>%
  # give more descriptive cases for AltText
  dplyr::mutate(
    AltText = dplyr::case_when(
      AltText == "" ~ NA_character_,
      AltText == "needs inspection" ~ "ScrapingError",
      TRUE ~ AltText
    )
  )

#### split dataset into years again ####

# split by year
df_splits <- 
  files_df_new %>% 
    group_split(Year)

# naming the separate tibbles
ttTweets2018 <- df_splits[[1]]
ttTweets2019 <- df_splits[[2]]
ttTweets2020 <- df_splits[[3]]
ttTweets2021 <- df_splits[[4]]

#### exporting new data to `data` folder ####

usethis::use_data(ttTweets2018, overwrite = TRUE)
usethis::use_data(ttTweets2019, overwrite = TRUE)
usethis::use_data(ttTweets2020, overwrite = TRUE)
usethis::use_data(ttTweets2021, overwrite = TRUE)
