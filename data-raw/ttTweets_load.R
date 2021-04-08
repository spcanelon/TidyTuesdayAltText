# ttTweetsLoad.R

library(tidyverse)
library(here)
library(fs)
library(janitor)


# read in all relevant files ----------------------------------------------

# resource: https://www.gerkelab.com/blog/2018/09/import-directory-csv-purrr-readr/

# match Rds files with string "Tweets"
files <- fs::dir_ls(here("data-raw"), regexp = "Tweets(.*).[R|r]ds")

# read in all files into one dataframe
filesDF <-
  files %>%
  purrr::map_df(readr::read_rds) %>%
  distinct()

# wrangle data ------------------------------------------------------------

filesDF_new <-
  filesDF %>%
  # rename columns to upper camel case
  janitor::clean_names(case = "upper_camel") %>%
  # reorder columns
  dplyr::select(TweetId,
                ImageUrl,
                AltText,
                HashtagList,
                TweetDate,
                Year,
                UrlCheck) %>%
  # convert TweetId from numeric to character variable
  dplyr::mutate(TweetId = as.character(TweetId))


# split HashtagList vector into individual hashtags -----------------------

filesDF_new <-
  filesDF_new %>%
  dplyr::mutate(
    HashtagList = stringr::str_split(HashtagList, ", ")
  )


# wrangle AltText variable ------------------------------------------------

filesDF_new <-
  filesDF_new %>%
  # extract values from named AltText list
  dplyr::mutate(AltText = unname(AltText)) %>%
  # define more descriptive cases
  dplyr::mutate(
    # AltText variable
    AltText = dplyr::case_when(
      AltText == "" ~ NA_character_,
      AltText == "needs inspection" ~ "ScrapingError",
      TRUE ~ AltText
    ),
    # UrlCheck variable
    UrlCheck = dplyr::case_when(
      UrlCheck == "Links included" ~ "IncludesLinks",
      UrlCheck == "Images-only" ~ "NoLinks"
    )
  ) %>%
  # convert UrlCheck from character to factor variable
  dplyr::mutate(
    UrlCheck = as.factor(UrlCheck)
  )


# create relevant AltText subset dataset ----------------------------------

AltTextSubset <-
  filesDF_new %>%
  filter(AltText != "Image")

# split dataset into years again ------------------------------------------

# split by year
dfSplits <- 
  filesDF_new %>% 
  group_split(Year)

# naming the separate tibbles
ttTweets2018 <- dfSplits[[1]]
ttTweets2019 <- dfSplits[[2]]
ttTweets2020 <- dfSplits[[3]]
ttTweets2021 <- dfSplits[[4]]

# saving the current year tibble
ttTweets2021 %>% write_rds("data-raw/ttTweets2021.rds")

# exporting new data to `data` folder -------------------------------------

usethis::use_data(ttTweets2018, overwrite = TRUE)
usethis::use_data(ttTweets2019, overwrite = TRUE)
usethis::use_data(ttTweets2020, overwrite = TRUE)
usethis::use_data(ttTweets2021, overwrite = TRUE)
usethis::use_data(AltTextSubset, overwrite = TRUE)
