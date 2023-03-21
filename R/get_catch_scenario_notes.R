#' Get Advice Catch Scenario Table Footnotes
#'
#' Returns a data.frame containing the catch scenario table's footnotes. It uses an ASD dedicated web-service.
#'
#' @param adviceKey integer value of stock adviceKey
#'
#' @return data.frame containing the catch scenarios table footnotes and their symbols
#'
#' @examples
#' \donttest{
#' get_catch_scenario_notes(3056)
#' }
#'
#' @references
#' https://sg.ices.dk/adviceview/AdviceList
#' 
#' @export
get_catch_scenario_notes <- function(adviceKey) {
  out <- getCatchScenariosNotes(adviceKey)

  if (length(out) == 0) {
    return(character(0))
  } 
  
  out[, !names(out) %in% "catchOptionsTableKey"]
}
