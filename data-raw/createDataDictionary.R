createDataDictionary <- function(dataset) {
  # source: https://gist.github.com/jthomasmock/8fa5a1d4d6e8617b78369c1a8fccc850
  
  # extracting each variable name and class
  dataNameClass <- 
    tibble::tibble(
      variable = names(dataset)
      ) %>%
    dplyr::mutate(
      data_type = purrr::map(
        dataset,
        typeof
      )
    )
  
  # source: https://twitter.com/felipe_mattioni/status/1356963631695597570/photo/1
  
  # extracting name of dataframe as a character string
  datasetChr <- deparse(substitute(dataset))
  
  # parsing metadata from data Roxygen documentation
  docMetadata <-
    Rd2roxygen::parse_file(
      paste0(
        "man/", datasetChr, ".Rd"
      )
    )
  
  # wrangling the metadata into a tidy tibble
  dataDescription <<-
    docMetadata$format %>%
    stringr::str_split(pattern = "\\\\") %>%
    unlist(recursive = FALSE) %>%
    dplyr::as_tibble() %>%
    tail(-2) %>%
    # filtering only the beginning of descriptions
    filter(
      stringr::str_starts(
        value,
        pattern = "item\\{"
      )
    ) %>%
    # matching only the first sentence
    mutate(
      value = stringr::str_extract(
        value, 
        pattern = boundary("sentence"))
    ) %>%
    # remove everything after and including the period at the end of the sentence
    dplyr::mutate(
      value = stringr::str_remove(
        value,
        pattern = "\\..*"
      )
    ) %>%
    # replacing extra strings and special characters, with two backslashes
    # so that <class> notation comes through in GitHub README
    dplyr::mutate(
      value = stringr::str_replace(
        value,
        pattern = "item\\{(.*?)\\}\\{",
        replacement = "\\\\"
      )
    ) %>%
    # renaming metadata variable
    dplyr::rename(description = value)
  
  # creating data dictionary
  dataDictionary <<-
    dataNameClass %>%
    dplyr::bind_cols(dataDescription)
}
