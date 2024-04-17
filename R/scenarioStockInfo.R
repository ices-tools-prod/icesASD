
scenarioStockInfo <- function(StockCode, AssessmentYear, Purpose, ContactPerson) {
  out <-
    list(
      StockCode = StockCode, AssessmentYear = AssessmentYear, Purpose = Purpose, ContactPerson = ContactPerson
    )

  return(out)
}
