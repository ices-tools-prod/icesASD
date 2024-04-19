#' Check catch scenario table in a browser
#'
#' Check catch scenario table in a browser
#'
#' @param columns df of culumns element of catch scenario table
#' @param rows df of rows element of catch scenario table
#' @param values df of values element of catch scenario table
#'
#' @examples
#' \dontrun{
#' check_table(col, rows, vals)
#' }
#'
#' @importFrom reactable
#' @export
checkTable <- function(columns, rows, values) {
  names(values$value) <- paste0(columns$value$name, " ", "[", columns$value$year, "]", " (", columns$value$units, ")")
  table <- cbind(rows$value, values$value)
  rownames(table) <- NULL

  reactable(table,
    defaultPageSize = 30,
    defaultColDef = colDef(
      headerStyle = list(background = "#99AABF")
    ),
    columns = list(
      purpose = colDef(sticky = "left", rowHeader = TRUE, style = list(fontWeight = 600, background = "#b0cae9")),
      basis = colDef(sticky = "left", rowHeader = TRUE, style = list(fontWeight = 600, background = "#b0cae9")),
      label = colDef(sticky = "left", rowHeader = TRUE, style = list(fontWeight = 600, background = "#b0cae9"))
    ),
    bordered = TRUE
  )
}
