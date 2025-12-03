#' Screen an ASD file and submit for QC checks
#'
#' In this web service the user can upload a file to be screen and
#' validated by the VMS database. The service can be called using post
#' and the file will have to be part of the body of the call. The user
#' needs to be authenticated in order to call this service.
#' This file can be later pushed to the database by the same user.
#'
#' @param file file name of the file containing the data to screen
#' @param verbose return verbose information about the POST request
#'
#' @return text message from the screening process
#'
#'
#' @importFrom httr upload_file
#' @importFrom httr content
#' @export
screen_asd_file <- function(file, verbose = FALSE) {
  url <- "https://data.ices.dk/vms/webapi/ScreenVMSFile"

  body <-
    list(
      fileToScreen = upload_file(file)
    )

  resp <- ices_post(url, body, verbose = verbose, use_token = TRUE)

  content(resp)
}
