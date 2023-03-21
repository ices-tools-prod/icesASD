#' Get Catch Scenarios Table
#'
#' Get Catch Scenarios Table for a given record
#'
#' @param adviceKey advice view id
#' 
#' @examples 
#' \donttest{
#' catch_scenario_table <- getCatchScenariosTable(2814)
#' }
#' 
#' @importFrom glue glue
#' @export
getCatchScenariosTable <- function(adviceKey) {
ices_get(
    asd_api(glue("getCatchScenariosTable/{adviceKey}"))
  )
}
