#' TidyTuesday tweets from 2018 that contain media 
#'
#' A dataset containing the alternative text for media shared in 2018 as part of the TidyTuesday social project, along with other tweet attributes. 
#'
#' @format A tibble with 709 rows and 7 variables:
#' \describe{
#'   \item{TweetId}{<chr> Unique tweet identifier.}
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
#'   \item{TweetDate}{<dttm> Date and time the tweet was posted. Ranges from April 2, 2018 to December 31, 2018.}
#'   \item{Year}{<dbl> Year the tweet was posted. Includes only 2018.}
#'   \item{UrlCheck}{<fct> Denotes whether the tweet included an external link. 
#'   
#'   There are two types of entries:
#'   
#'   - "IncludesLinks" which denotes the tweet included external links in addition to media, like a link to source code.
#'   - "NoLinks" which denotes the tweet did not include external links (i.e. only included media).}
#' }
#' 
#' @source {Tweets were originally collected by Thomas Mock. Thomas Mock (2021). Tidy Tuesday: A weekly data project aimed at the R ecosystem.} \url{https://github.com/rfordatascience/tidytuesday}
#' @source {Alternative text for tweets was scraped by Silvia Canelón after further processing.} \url{https://www.twitter.com}
"ttTweets2018"
