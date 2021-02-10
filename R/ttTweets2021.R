#' TidyTuesday tweets from 2021 that contain media
#'
#' A dataset containing the alternative text for media shared in 2021 as part of the TidyTuesday social project, and other attributes of 330+ tweets. 
#'
#' @format A tibble with 338 rows and 8 variables:
#' \describe{
#'   \item{TweetId}{<chr> Unique tweet identifer.}
#'   \item{ImageUrl}{<chr> URL to the media shared in the tweet.} 
#'   \item{AltText}{<chr> Alternative text corresponding to the media shared in the tweet. 
#'   
#'   There are four types of entries: 
#'   
#'   1. Customized alternative text written by the tweet author. 
#'   
#'   1. "Image", which is the default alternative text added by the Twitter app in the absence of customized alternative text. 
#'   
#'   1. "ScrapingError", denoting unavailable alternative text due to unavailable tweets, like private or deleted tweets. 
#'   
#'   1. `NA`, denoting unavailable alternative text due to the media being non-static, like a gif or a video.}
#'  
#'   \item{HashtagList}{<list> List of hashtags used in the tweet.}
#'   \item{TweetDate}{<dttm> Date and time the tweet was posted. Ranges from January 1, 2021 to January 31, 2021.}
#'   \item{Year}{<dbl> Year the tweet was posted. Includes only 2021.}
#'   \item{Week}{<dbl> Week the tweet was posted. Ranges from week 1-5.}
#'   \item{UrlCheck}{<fct> Denotes whether the tweet included an external link. 
#'   
#'   There are two types of entries:
#'   
#'   - "IncludesLinks" which denotes the tweet included external links in addition to media, like a link to source code.
#'   - "NoLinks" which denotes the tweet did not include external links (i.e. only included media).}
#' }
#' 
#' @source {Tweets originally collected by Thomas Mock. Thomas Mock (2021). Tidy Tuesday: A weekly data project aimed at the R ecosystem.} \url{https://github.com/rfordatascience/tidytuesday}
#' @source {Alternative text for tweets collected by Silvia Canelón.} \url{https://www.twitter.com}
"ttTweets2021"
