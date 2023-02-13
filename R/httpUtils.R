
api_url <- function() {
  "https://sg.ices.dk/adviceview/API"
}

#' @importFrom icesConnect ices_get_jwt
#' @importFrom httr content
ices_get <- function(url, retry = TRUE, quiet = FALSE, verbose = FALSE, content = TRUE, use_token = FALSE) {
  resp <-
    ices_get_jwt(
      url,
      retry = retry, quiet = quiet, verbose = verbose,
      jwt = if (use_token) NULL else ""
    )

  if (content) {
    content(resp, simplifyVector = TRUE)
  } else {
    resp
  }
}

#' @importFrom icesConnect ices_post_jwt
ices_post <- function(url, body = list(), retry = TRUE, verbose = FALSE, use_token = FALSE) {
  out <-
    ices_post_jwt(
      url,
      body,
      encode = "multipart",
      retry = retry,
      verbose = verbose,
      jwt = if (use_token) NULL else ""
    )

  return(out)
}


#' Create The ASD Webservice URL
#' 
#' Returns a string with the webservice URL to be used depending on the ASD entry type.
#'
#' @param stock_name string value of the stock code you wish to look
#' @param year integer value of assessment year
#' @param adviceKey integer value of stock adviceKey
#' @param api string value of different entry types to choose from ("record", "table", "notes")
#'
#' @return string containing URL
#'
#' @examples
#' \dontrun{
#' api(stock = "cod.27.47d20", year = 2022, api = "record")
#' api(adviceKey = 2837, api = "table")
#' api(adviceKey = 2837, api = "notes")
#' }
#'
#' @references
#' https://sg.ices.dk/adviceview/AdviceList
#' 
#' @importFrom httr parse_url build_url
#' 
#' @export
#' 
api <- function(stock_name = NULL, year = NULL, adviceKey = NULL, api = c("record", "table", "notes")) {
  
  record_api_url <- "https://sg.ices.dk/adviceview/API/getAdviceViewRecord"
  table_api_url <- "https://sg.ices.dk/adviceview/API/getCatchScenariosTable"
  notes_api_url <- "https://sg.ices.dk/adviceview/API/getCatchScenariosNotes"


  api <- match.arg(api)
  if (api == "record") {
    api_url <- get(paste0(api, "_api_url"))
    url <- paste0(api_url, "?", "stockcode=", stock_name, "&year=", year)
    url <- parse_url(url)
    url <- build_url(url)
    url
  } else {
    api_url <- get(paste0(api, "_api_url"))
    url <- paste0(api_url, "/", adviceKey)
    url <- parse_url(url)
    url <- build_url(url)
    url
  }
}