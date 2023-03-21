#' Get Advice Catch Scenario Table Footnotes
#'
#' Returns a data.frame containing the catch scenario table's footnotes. It uses an ASD dedicated web-service.
#'
#' @param adviceKey integer value of stock adviceKey
#'
#' @return data.frame containing the catch scenarios table footnotes and their symbols
#'
#' @examples
#' \dontrun{
#' get_catch_scenario_notes(3056)
#' }
#'
#' @references
#' https://sg.ices.dk/adviceview/AdviceList
#' 
#' @export
get_catch_scenario_notes <- function(adviceKey) {
  catch_scenario_table_notes <-
    getCatchScenariosNotes(adviceKey)

  if (length(catch_scenario_table_notes) == 0) {
    character(0)
  } else {
    catch_scenario_table_notes[, names(catch_scenario_table_notes) %in% "catchOptionsTableKey"]
  }
}
