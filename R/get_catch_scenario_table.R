#' Get Advice Catch Scenario Table
#' 
#' Returns the catch scenario table for the selected stock and year using the advice view web service.
#'
#' @param adviceKey integer value of stock adviceKey
#' @param assessmentYear integer value of assessment year

#' @return data.frame containing the catch scenarios table for the advice view record
#'
#' @examples
#' \dontrun{
#' get_catch_scenario_table(3056,2022)
#' }
#'
#' @references
#' https://sg.ices.dk/adviceview/AdviceList
#' 
#' @importFrom jsonlite fromJSON
#' @importFrom utils URLencode
#' @importFrom rlang is_empty
#' @importFrom dplyr filter %>% select
#' @importFrom tibble add_column
#' @importFrom tidyr pivot_wider
#' 
#' @export
#' 
get_catch_scenario_table <- function(adviceKey, assessmentYear) {
  catch_scenario_table <- jsonlite::fromJSON(
    URLencode(
      sprintf("https://sg.ices.dk/adviceview/API/getCatchScenariosTable/%s", adviceKey)
    )
  )

  if (length(catch_scenario_table) != 0) {
  catch_scenario_table <- catch_scenario_table %>%
    pivot_wider(
      names_from = c(aK_ID, aK_Label, yearLabel, unit, stockDataType),
      names_glue = "{aK_Label} ({yearLabel}) _{stockDataType}_",
      values_from = value
    ) %>%
    select(-assessmentKey, -adviceKey, -cS_Basis, -aR_ID)


  catch_scenario_table <- catch_scenario_table %>% add_column(Year = assessmentYear + 1, .before = "cS_Label")
  } else {
    catch_scenario_table <- character(0) 
  }

  return(catch_scenario_table)
}

utils::globalVariables(c('aK_ID', 'aK_Label','yearLabel','unit','stockDataType','value','assessmentKey','cS_Basis','aR_ID'))