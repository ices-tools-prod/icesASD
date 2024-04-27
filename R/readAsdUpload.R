#' Read a file in the ASD upload format
#'
#' Read a file in the ASD upload format, returning a list of metadata and data.frame
#'
#' @param filename the file path of the file to read
#' @param format should the output be formatted into an easy to read table
#'
#' @examples
#' #filename <- system.file("CatchScenarios_AdviceKey_3207.xml", package = "icesASD")
#' #asd <- readAsdUpload(filename)
#'
#'
#' @export
#' @importFrom xml2 read_xml as_list
readAsdUpload <- function(filename, format = FALSE) {
  xml_text <- paste(scan(filename, "", sep = "\n", quiet = TRUE), collapse = "\n")
  xml <- read_xml(enc2utf8(xml_text))
  xml_list <- as_list(xml)$Assessment

  # split out into sections
  AA <- xml_list[c("stockCode", "AssessmentYear", "Purpose", "contact")]

  sections <-
    sapply(
      c("Scenarios_Columns", "Scenarios_Rows", "Scenarios_Values", "Catch_Scenario_Notes_Notes"),
      function(x) {
        sec_list <- xml_list[which(names(xml_list) == x)]
        out <- sapply(sec_list, unlist)
        names <- unique(unlist(sapply(out, names)))
        out <- t(sapply(sec_list, unlist))
        rownames(out) <- NULL
        out
      },
      simplify = FALSE
    )

  sections <- c(sapply(AA, function(x) x), sections)

  if (!format) {
    return(sections)
  }
}
