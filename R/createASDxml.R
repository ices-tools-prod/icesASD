
#' Create the XML format for catch scenario data
#'
#' Create the XML format for catch scenario data
#'
#' @param info details
#' @param scenarioColumns details
#' @param scenarioRows details
#' @param scenarioValues details
#' @param scenarioNotes details
#'
#' @examples
#' \dontrun{
#' checkTable(col, rows, vals)
#' }
#'
#' @importFrom reactable reactable colDef
#' @export
createASDxml <-
  function(info, scenarioColumns, scenarioRows, scenarioValues, scenarioNotes) {
    if (is.null(info$Purpose) || is.na(info$Purpose)) {
      info$Purpose <- "Advice"
    }

    # one value: numbers in full, XML special characters escaped, NA empty
    value2xml <- function(x) {
      if (length(x) == 0 || is.na(x)) {
        return("")
      }
      if (is.numeric(x)) {
        return(format(x, digits = 15, scientific = FALSE, trim = TRUE))
      }
      x <- gsub("&", "&amp;", as.character(x), fixed = TRUE)
      x <- gsub("<", "&lt;", x, fixed = TRUE)
      gsub(">", "&gt;", x, fixed = TRUE)
    }
    # one element for each value of a list
    list2xml <- function(x) {
      paste0("<", names(x), ">", vapply(x, value2xml, ""), "</", names(x), ">",
        collapse = "\n"
      )
    }
    # one block for each row of a table, nothing for an empty table
    table2xml <- function(x, name) {
      x <- as.data.frame(x)
      if (nrow(x) == 0) {
        return(NULL)
      }
      rows <- vapply(
        seq_len(nrow(x)),
        function(i) list2xml(as.list(x[i, , drop = FALSE])), ""
      )
      paste0("<", name, ">\n", rows, "\n</", name, ">", collapse = "\n")
    }

    header <- paste("<?xml version='1.0' encoding='utf-8' standalone='no'?>",
      "<?xml-stylesheet type='text/xsl' href='CatchOptionsTable.xsl'?>",
      "<Assessment xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xsi:noNamespaceSchemaLocation='CatchOptionsTable.xsd'>",
      sep = "\n"
    )
    info <- unclass(info)
    info <- info[!sapply(info, function(x) length(x) == 0 || is.na(x))]

    paste0(
      paste(c(
        header, list2xml(info),
        table2xml(scenarioColumns, "Scenarios_Columns"),
        table2xml(scenarioRows, "Scenarios_Rows"),
        table2xml(scenarioValues, "Scenarios_Values"),
        table2xml(scenarioNotes, "Catch_Scenario_Notes_Notes"),
        "</Assessment>"
      ), collapse = "\n"),
      "\n"
    )
  }
