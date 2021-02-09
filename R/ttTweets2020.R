#' Data of TidyTuesday tweets from 2020 that contain media 
#'
#' A dataset containing the alternative text for media shared in 2020 as part of the TidyTuesday social project, and other attributes of 3300+ tweets. 
#'
#' @format A tibble with 3374 rows and 8 variables:
#' \describe{
#'   \item{TweetId}{chr Unique tweet identifer.}
#'   \item{ImageUrl}{chr URL to the media shared in the tweet.} 
#'   \item{AltText}{chr Alternative text corresponding to the media shared in the tweet. There are four kinds: Customized alternative text written by the tweet author; "Image", which is the default alternative text added by the Twitter app in the absence of customized alternative text; "ScrapingError", denoting unavailable alternative text due to unavailable tweets, like private or deleted tweets; and NA, denoting unavailable alternative text due to the media being non-static, like a gif or a video.}
#'   \item{HashtagList}{list List of hashtags used in the tweet.}
#'   \item{TweetDate}{dttm Date and time the tweet was posted. Ranges from January 1, 2020 to December 31, 2020}
#'   \item{Year}{dbl Year the tweet was posted. Includes only 2020.}
#'   \item{Week}{dbl Week the tweet was posted. Ranges from week 1-53.}
#'   \item{UrlCheck}{chr Denotes whether the tweet included a link. There are two options: "Links included" which denotes the tweet included external links in addition to media, like a link to source code; and "Images-only" which denotes the tweet only included media.}
#' }
#' @source TidyTuesday tweets were originally obtained using the Twitter API and the corresponding alternative text was obtained through web harvesting \url{https://www.twitter.com}
"ttTweets2020"