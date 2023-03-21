#' Get Advice View Record
#'
#' Get Advice View Record
#'
#' @examples 
#' \rundonttest{
#' catch_scenario_list <- getAdviceViewRecord()
#' head(catch_scenario_list, 3)
#' }
#' @export
getAdviceViewRecord <- function() {
  ices_get(
    asd_api("getAdviceViewRecord")
  )
}
