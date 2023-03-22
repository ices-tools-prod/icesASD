#' Get Catch Scenarios Table
#'
#' Get Catch Scenarios Table for a given record
#'
#' @param adviceKey advice view id(s)
#' 
#' @examples 
#' \donttest{
#' catch_scenario_table <- getCatchScenariosTable(2814)
#' catch_scenario_tables <- getCatchScenariosTable(c(2814, 2815))
#' }
#' 
#' @importFrom glue glue
#' @export
getCatchScenariosTable <- function(adviceKey) {
    if (length(adviceKey) > 1) {
      do.call(
        rbind,
        lapply(adviceKey, getCatchScenariosTable)
      )
    } else {
      ices_get(
        asd_api(glue("getCatchScenariosTable/{adviceKey}"))
      )
    }
}
