#' Check catch scenario notes in a browser
#'
#' Check catch scenario notes in a browser
#'
#' @param notes df of culumns element of catch scenario table
#'
#' @examples
#' \dontrun{
#' checkNotes(notes)
#' }
#'
#' @importFrom reactable
#' @export
checkNotes <- function(notes) {
  notes <- notes$value
  rownames(notes) <- NULL
  reactable(notes,
    defaultPageSize = 30,
    defaultColDef = colDef(
      headerStyle = list(background = "#99AABF")
    ),
    bordered = TRUE
  )
}