
api_url <- function() {
  "https://asd.ices.dk/API"
}

#' @importFrom icesConnect ices_get_jwt
#' @importFrom httr content
ices_get <- function(url, retry = TRUE, quiet = FALSE, verbose = FALSE, content = TRUE, use_token = FALSE) {
  resp <-
    ices_get_jwt(
      url,
      retry = retry, quiet = quiet, verbose = verbose,
      jwt = if (use_token) NULL else ""
    )

  if (content) {
    content(resp, simplifyVector = TRUE)
  } else {
    resp
  }
}

#' @importFrom icesConnect ices_post_jwt
ices_post <- function(url, body = list(), retry = TRUE, verbose = FALSE, use_token = FALSE) {
  out <-
    ices_post_jwt(
      url,
      body,
      encode = "multipart",
      retry = retry,
      verbose = verbose,
      jwt = if (use_token) NULL else ""
    )

  return(out)
}
