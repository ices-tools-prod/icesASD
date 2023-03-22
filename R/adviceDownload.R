#' Download advice scenarios
#'
#' Download a zip file of a set of advice scenarios
#'
#' @param adviceKeys a vector of advice view ids.
#' @param dir directory to download to.
#'
#' @examples
#' \dontrun{
#' adviceDownload(c(1009, 1011, 1022))
#' }
#'
#' @importFrom glue glue
#' @importFrom httr POST content_type_json headers content
#' @importFrom jsonlite toJSON
#' @export
adviceDownload <- function(adviceKeys, dir = ".") {
  ret <- 
    POST(
      asd_api("api/download"),
      body = toJSON(as.character(adviceKeys)),
      content_type_json()
    )
  
  disposition <- headers(ret)[['content-disposition']]  
  filename <- gsub(".*filename=(.*)\\;.*", "\\1", disposition)
  
  writeBin(content(ret), file.path(dir, filename))
  
  message(glue("Zip file: {filename}, downloaded to: {dir}"))
  
  invisible(file.path(dir, filename))
}
