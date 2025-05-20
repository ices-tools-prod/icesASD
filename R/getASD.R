#' Get Any ASD Data
#'
#' This function combines the functionality of \code{\link{getListStocks}},
#' \code{\link{getFishStockReferencePoints}}, \code{\link{getSummaryTable}}
#' and \code{\link{getStockDownloadData}}.
#' It supports querying many stocks and years in one function call.
#'
#' @param stock a stock name, e.g. cod-347d, or cod to find all cod stocks, or
#'        NULL to process all stocks.
#' @param year the assessment year, e.g. 2015, or 0 to process all years.
#' @param assessmentKey the assessmentKey of the stock of interest.
#' @param outputData the data you want to retrieve, either "table", "record", or "notes".
#' @param purpose the purpose of the entry, options are "Advice", "Bench",
#'                "InitAdvice", default is "Advice".
#'
#' @note Only years with "Published" status are returned.
#'
#' @return A data frame (default) or a list if \code{combine} is \code{TRUE}.
#'
#' @seealso
#' \code{\link{getListStocks}}
#'
#' \code{\link{findAssessmentKey}} finds lookup keys.
#'
#' \code{\link{icesSAG-package}} gives an overview of the package.
#'
#' @author Luca Lamoni.
#'
#' @examples
#' \dontrun{
#' # Example usage
#' getASD(stock = "cod.27.7e-k", year = 2023, outputData = "record")
#' # Example usage with assessmentKey
#' getASD(assessmentKey = 18719, outputData = "table") 
#' }
#' @export

getASD <- function(stock = NULL, year = NULL, assessmentKey = NULL,
                   outputData = "table", purpose = "Advice") {
  # Validate outputData argument
  outputData <- match.arg(outputData, c("table", "record", "notes"))

  # Select web service operation
  service <- switch(outputData,
    table = "getCatchScenariosTable",
    record = "getAdviceViewRecord",
    notes = "getCatchScenariosNotes"
  )

  if (is.null(assessmentKey)) {
    # Find assessmentKey key
    assessmentKey <- findAssessmentKey(stock, year, regex = TRUE, full = TRUE)
    assessmentKey <- assessmentKey[assessmentKey$Purpose == purpose, "AssessmentKey"]
  }

  if (outputData == "record") {
    # Get advice view record
    out <- do.call(service, list(assessmentKey = assessmentKey))
    return(out)

  } else if (outputData == "notes") {
    # Get catch scenario notes
    stockRecord <- do.call("getAdviceViewRecord", list(assessmentKey = assessmentKey))
    # out <- getCatchScenariosTable(stockRecord$adviceKey)
    out <- do.call(service, list(adviceKey = stockRecord$adviceKey))
    return(out)

  } else if (outputData == "table") {
    stockRecord <- do.call("getAdviceViewRecord", list(assessmentKey = assessmentKey))
    # out <- getCatchScenariosTable(stockRecord$adviceKey)
    out <- do.call(service, list(adviceKey = stockRecord$adviceKey))

    if (length(out) == 0) {
      return(character(0))
    }

    # Build column name like: "{aK_Label} ({yearLabel}, {unit}) _{stockDataType}_"
    out$colname <- paste0(out$aK_Label, " (", out$yearLabel,",", out$unit, ") _", out$stockDataType, "_")

    # Reshape using base R (wide format), using cS_Label as ID
    out_wide <- reshape(
      out,
      idvar = c("cS_Label","cS_Purpose"),
      timevar = "colname",
      direction = "wide",
      drop = c(
        "assessmentKey", "adviceKey", "cS_Basis", "aR_ID",
        "aK_ID", "aK_Label",  "yearLabel", "unit", "stockDataType"
      )
    )

    # Clean column names
    names(out_wide) <- sub("^value\\.", "", names(out_wide))
    rownames(out_wide) <- NULL
    return(out_wide)
  }
}
