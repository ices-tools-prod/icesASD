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
#' @importFrom jsonlite read_json
#' @importFrom rlang is_empty
#' @importFrom dplyr filter %>%
#' 
#' @export
#' 
get_catch_scenario_notes <- function(adviceKey) {
    catch_scenario_table_notes <-
        read_json(
            api(adviceKey = adviceKey, api = "notes"),
            simplifyVector = TRUE
        )

    if (length(catch_scenario_table_notes) != 0) {
        catch_scenario_table_notes <- catch_scenario_table_notes %>% select(-catchOptionsTableKey)
    } else {
        catch_scenario_table_notes <- character(0)
    }

    return(catch_scenario_table_notes)
}

utils::globalVariables(c("catchOptionsTableKey"))