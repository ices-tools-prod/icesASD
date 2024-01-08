#' Get Advice View Record
#'
#' Get Advice View Record
#'
#' @param stockcode string value of the stock code you wish to look
#' @param year integer value of assessment year
#' @param assessmentKey integer value of SAG assessmentKey
#' 
#' @examples 
#' \donttest{
#' catch_scenario_list <- getAdviceViewRecord()
#' head(catch_scenario_list, 3)
#' 
#' getAdviceViewRecord("bll.27.3a47de", 2021, 15609)
#' }
#' 
#' @export
getAdviceViewRecord <- function(stockcode = NULL, year = NULL, assessmentKey = NULL) {
  ices_get(
    asd_api("getAdviceViewRecord", stockcode = stockcode, year = year, assessmentKey = assessmentKey)
  )
}
