#' Get Catch Scenarios Notes
#'
#' Get Catch Scenarios Notes for a given record
#'
#' @param adviceKey advice view id(s)
#' 
#' @examples 
#' \donttest{
#' catch_scenario_note <- getCatchScenariosNotes(2814)
#' catch_scenario_notes <- getCatchScenariosNotes(c(2814, 2815))
#' }
#' 
#' @importFrom glue glue
#' @export
getCatchScenariosNotes <- function(adviceKey) {
  
  if (length(adviceKey) > 1) {
    do.call(
      rbind,
      lapply(adviceKey, getCatchScenariosNotes)
    )
  } else {
    ices_get(
      asd_api(glue("getCatchScenariosNotes/{adviceKey}"))
    )
  }
}
