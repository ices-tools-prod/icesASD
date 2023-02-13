#' Get Advice Record
#'
#' Returns a df with the metadata for the advice view record for a specific stock and year. It uses the advice view web-service.
#'
#' @param stock_name string value of the stock code you wish to look
#' @param year integer value of assessment year
#' 
#' @return data.frame containing metadata for the advice view record
#'
#'
#' @examples
#' \dontrun{
#' get_advice_view_info("bll.27.3a47de", 2021)
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
get_advice_view_info <- function(stock_name, year) {
 
  catch_scenario_list <-
        read_json(
            api(stock_name = stock_name, year = year, api = "record"),
            simplifyVector = TRUE
        )
  
  if (!is_empty(catch_scenario_list)){
  catch_scenario_list <- catch_scenario_list %>% filter(adviceViewPublished == TRUE, adviceStatus == "Advice")
  } else {
     catch_scenario_list <- list()
  }
  
  return(catch_scenario_list)
}

utils::globalVariables(c('adviceViewPublished', 'adviceStatus'))