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
#' @importFrom rlang is_empty 
#' 
#' @export
get_advice_view_info <- function(stock_name = NULL, year = NULL) {
  catch_scenario_list <- getAdviceViewRecord(stock_name, year)
  
  if (length(catch_scenario_list) == 0) {
    list()
  } else {
    filt <- catch_scenario_list$adviceViewPublished == TRUE & catch_scenario_list$adviceStatus == "Advice"
    catch_scenario_list[filt, ]
  }
}
