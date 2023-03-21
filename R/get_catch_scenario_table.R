#' Get Advice Catch Scenario Table
#' 
#' Returns the catch scenario table for the selected stock and year using the advice view web service.
#'
#' @param adviceKey integer value of stock adviceKey
#' @param assessmentYear integer value of assessment year

#' @return data.frame containing the catch scenarios table for the advice view record
#'
#' @examples
#' \donttest{
#' get_catch_scenario_table(3056,2022)
#' }
#'
#' @references
#' https://sg.ices.dk/adviceview/AdviceList
#' 
#' @importFrom tidyr pivot_wider
#' 
#' @export
#' 
get_catch_scenario_table <- function(adviceKey, assessmentYear) {
  out <- getCatchScenariosTable(adviceKey)

  if (length(out) == 0) {
    return(character(0))
  }

  out <-
    pivot_wider(
      out,
      names_from = c(aK_ID, aK_Label, yearLabel, unit, stockDataType),
      names_glue = "{aK_Label} ({yearLabel}) _{stockDataType}_",
      values_from = value
    )
  
  out <-
    out[
      !names(out) %in% c("assessmentKey", "adviceKey", "cS_Basis", "aR_ID")
    ]
  
  cbind(Year = assessmentYear + 1, out)
}

utils::globalVariables(c("aK_ID", "aK_Label", "yearLabel", "unit", "stockDataType", "value"))
