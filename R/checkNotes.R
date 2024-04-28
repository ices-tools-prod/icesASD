#' Check catch scenario notes in a browser
#'
#' Check catch scenario notes in a browser
#'
#' @param notes df of culumns element of catch scenario table
#'
#' @examples
#' \dontrun{
#' data(scenarioNotes)
#' checkNotes(scenarioNotes)
#' }
#'
#' @importFrom reactable reactable colDef
#' @export
checkNotes <- function(notes) {
  rownames(notes) <- NULL
  reactable(notes,
    defaultPageSize = 30,
    defaultColDef = colDef(
      headerStyle = list(background = "#99AABF")
    ),
    bordered = TRUE
  )
}