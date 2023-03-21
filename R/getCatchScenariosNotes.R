#' Get Catch Scenarios Notes
#'
#' Get Catch Scenarios Notes for a given record
#'
#' @param adviceKey advice view id
#' 
#' @examples 
#' \donttest{
#' catch_scenario_notes <- getCatchScenariosNotes(2814)
#' }
#' 
#' @importFrom glue glue
#' @export
getCatchScenariosNotes <- function(adviceKey) {
ices_get(
    asd_api(glue("getCatchScenariosNotes/{adviceKey}"))
  )
}
