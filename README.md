
<!-- README.md is generated from README.Rmd. Please edit that file -->

# TidyTuesdayAltText

<!-- badges: start -->
<!-- badges: end -->

The goal of `TidyTuesdayAltText` is to provide insight into the
alternative (alt) text accompanying the data visualizations shared on
Twitter as part of the TidyTuesday social project[1].

The package contains 5 datasets:

``` r
library(TidyTuesdayAltText)
?ttTweets2018
?ttTweets2019
?ttTweets2020
?ttTweets2021
?AltTextSubset
```

## Installation

<!--
You can install the released version of TidyTuesdayAltText from [CRAN](https://CRAN.R-project.org) with:
``` r
install.packages("TidyTuesdayAltText")
```
-->

You can install the development version of `TidyTuesdayAltText` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("spcanelon/TidyTuesdayAltText")
```

### Note about installing from a private repo

While this repo is private, you will first have to make sure to provide
authentication to GitHub using a [Personal Access Token
(PAT)](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token)
as a credential. You can follow the steps in the credential caching
chapter of Happy Git with R (summarized below): [Chapter 10 Cache
credentials for HTTPS \| Happy Git and GitHub for the
useR](https://happygitwithr.com/credential-caching.html)

1.  Create a personal access token using a [`usethis` package helper
    function](https://usethis.r-lib.org/reference/create_github_token.html)
    which pre-selects recommended scopes/permissions:
    `usethis::create_github_token()`

2.  Then store your token somewhere safe and treat it like you would a
    password.

3.  Call an R function to store your credentials using the
    [`credentials` package](https://docs.ropensci.org/credentials/)
    which will prompt you to enter your token:
    `credentials::set_github_pat()`<br> This populates the `GITHUB_PAT`
    environment variable that `install_github()` defaults to as the
    authentication token (i.e. **auth\_token**) argument.

4.  Finally, proceed to install the package as usual:
    `devtools::install_github("spcanelon/TidyTuesdayAltText")`

## Data details

### AltTextSubset

A dataset containing the alternative text for media shared between 2018
and 2021 as part of the TidyTuesday social project, and other attributes
of 441 tweets. This is a subset of the 2018-2021 datasets, containing
only tweets with alternative text that isn’t “Image,” the default
alternative text added by the Twitter app in the absence of customized
alternative text.

-   Dates included: April 10, 2018 to April 4, 2021.
-   Observations (rows): There are 465 rows in this dataset. Each row
    represents a single unique tweet post.
-   Variables (columns): There are 7 columns in this dataset. They are
    described below

| variable    | data\_type | description                                                            |
|:------------|:-----------|:-----------------------------------------------------------------------|
| TweetId     | character  | <chr> Unique tweet identifier.                                         |
| ImageUrl    | character  | <chr> URL to the media shared in the tweet.                            |
| AltText     | character  | <chr> Alternative text corresponding to the media shared in the tweet. |
| HashtagList | list       | <list> List of hashtags used in the tweet.                             |
| TweetDate   | double     | <dttm> Date and time the tweet was posted.                             |
| Year        | integer    | <fct> Year the tweet was posted.                                       |
| UrlCheck    | integer    | <fct> Denotes whether the tweet included an external link.             |

### ttTweets2021

Link to the raw data:
[data-raw/ttTweets2021.csv](data-raw/ttTweets2021.csv)

A dataset containing the alternative text for media shared in 2021 as
part of the TidyTuesday social project, and other attributes.

-   Dates included: January 1, 2021 to April 4, 2021.
-   Observations (rows): There are 1032 rows in this dataset. Each row
    represents a single unique tweet post.
-   Variables (columns): There are 7 columns in this dataset. They are
    described below

| variable    | data\_type | description                                                            |
|:------------|:-----------|:-----------------------------------------------------------------------|
| TweetId     | character  | <chr> Unique tweet identifier.                                         |
| ImageUrl    | character  | <chr> URL to the media shared in the tweet.                            |
| AltText     | character  | <chr> Alternative text corresponding to the media shared in the tweet. |
| HashtagList | list       | <list> List of hashtags used in the tweet.                             |
| TweetDate   | double     | <dttm> Date and time the tweet was posted.                             |
| Year        | integer    | <fct> Year the tweet was posted.                                       |
| UrlCheck    | integer    | <fct> Denotes whether the tweet included an external link.             |

### ttTweets2020

Link to the raw data:
[data-raw/ttTweets2020.csv](data-raw/ttTweets2020.csv)

-   Dates included: January 1, 2020 to December 31, 2020
-   Observations (rows): There are 3374 rows in this dataset. Each row
    represents a single unique tweet post.
-   Variables (columns): There are 7 columns in this dataset. They are
    described below

| variable    | data\_type | description                                                            |
|:------------|:-----------|:-----------------------------------------------------------------------|
| TweetId     | character  | <chr> Unique tweet identifier.                                         |
| ImageUrl    | character  | <chr> URL to the media shared in the tweet.                            |
| AltText     | character  | <chr> Alternative text corresponding to the media shared in the tweet. |
| HashtagList | list       | <list> List of hashtags used in the tweet.                             |
| TweetDate   | double     | <dttm> Date and time the tweet was posted.                             |
| Year        | integer    | <fct> Year the tweet was posted.                                       |
| UrlCheck    | integer    | <fct> Denotes whether the tweet included an external link.             |

### ttTweets2019

Link to the raw data:
[data-raw/ttTweets2019.csv](data-raw/ttTweets2019.csv)

-   Dates included: January 1, 2019 to December 31, 2019.
-   Observations (rows): There are 2022 rows in this dataset. Each row
    represents a single unique tweet post.
-   Variables (columns): There are 7 columns in this dataset. They are
    described below

| variable    | data\_type | description                                                            |
|:------------|:-----------|:-----------------------------------------------------------------------|
| TweetId     | character  | <chr> Unique tweet identifier.                                         |
| ImageUrl    | character  | <chr> URL to the media shared in the tweet.                            |
| AltText     | character  | <chr> Alternative text corresponding to the media shared in the tweet. |
| HashtagList | list       | <list> List of hashtags used in the tweet.                             |
| TweetDate   | double     | <dttm> Date and time the tweet was posted.                             |
| Year        | integer    | <fct> Year the tweet was posted.                                       |
| UrlCheck    | integer    | <fct> Denotes whether the tweet included an external link.             |

### ttTweets2018

Link to the raw data:
[data-raw/ttTweets2018.csv](data-raw/ttTweets2018.csv)

-   Dates included: April 2, 2018 to December 31, 2018.
-   Observations (rows): There are 709 rows in this dataset. Each row
    represents a single unique tweet post.
-   Variables (columns): There are 7 columns in this dataset. They are
    described below

| variable    | data\_type | description                                                            |
|:------------|:-----------|:-----------------------------------------------------------------------|
| TweetId     | character  | <chr> Unique tweet identifier.                                         |
| ImageUrl    | character  | <chr> URL to the media shared in the tweet.                            |
| AltText     | character  | <chr> Alternative text corresponding to the media shared in the tweet. |
| HashtagList | list       | <list> List of hashtags used in the tweet.                             |
| TweetDate   | double     | <dttm> Date and time the tweet was posted.                             |
| Year        | integer    | <fct> Year the tweet was posted.                                       |
| UrlCheck    | integer    | <fct> Denotes whether the tweet included an external link.             |

<!--
## Example
This is a basic example which shows you how to solve a common problem:

```r
library(TidyTuesdayAltText)
## basic example code
```
What is special about using `README.Rmd` instead of just `README.md`? You can include R chunks like so:

```r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```
You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. `devtools::build_readme()` is handy for this. You could also use GitHub Actions to re-render `README.Rmd` every time you push. An example workflow can be found here: <https://github.com/r-lib/actions/tree/master/examples>.
You can also embed plots, for example:
<img src="man/figures/README-pressure-1.png" width="100%" />
In that case, don't forget to commit and push the resulting figure files, so they display on GitHub and CRAN.
-->

[1] [rfordatascience/tidytuesday: Official repo for the \#tidytuesday
project](https://github.com/rfordatascience/tidytuesday#a-weekly-social-data-project-in-r)
