#' Create The ASD Webservice URL
#'
#' utility to build a url with optional query arguments
#'
#' @param service the name of the service
#' @param ... named arguments will be added as queries
#'
#' @return a complete url as a character string
#'
#' @examples
#'
#' asd_api("hi", bye = 21)
#' asd_api("csquares", argument1 = 2021, argument2 = NULL)
#'
#'
#' @importFrom httr parse_url build_url
#'
#' @export
asd_api <- function(service, ...) {
  url <- paste0(api_url(), "/", service)
  url <- parse_url(url)
  url$query <- list(...)
  url <- build_url(url)

  url
}
