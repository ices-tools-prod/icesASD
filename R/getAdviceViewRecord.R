#' Get Advice View Record
#'
#' Get Advice View Record
#'
#' @param stockcode string value of the stock code you wish to look
#' @param year integer value of assessment year
#'
#' @examples
#' \donttest{
#' catch_scenario_list <- getAdviceViewRecord()
#' head(catch_scenario_list, 3)
#'
#' getAdviceViewRecord("bll.27.3a47de", 2021)
#' }
#'
#' @export
getAdviceViewRecord <- function(stockcode = NULL, year = NULL) {
  ices_get(
    asd_api("getAdviceViewRecord", stockcode = stockcode, year = year)
  )
}
