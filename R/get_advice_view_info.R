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
#' \donttest{
#' get_advice_view_info("bll.27.3a47de", 2021)
#' }
#'
#' @references
#' https://sg.ices.dk/adviceview/AdviceList
#' 
#' @export
get_advice_view_info <- function(stock_name = NULL, year = NULL) {
  out <- getAdviceViewRecord(stock_name, year)
  
  if (length(out) == 0) {
    return(list())
  }
  
  filt <-
    out$adviceViewPublished == TRUE &
    out$adviceStatus == "Advice"
  
  out[filt, ]
}
