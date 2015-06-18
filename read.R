library(RCurl)
library(XML)

getProvinceCodes <- function() {
  html <- getURL("https://en.wikipedia.org/wiki/ISO_3166-2:VN", .encoding = "UTF-8", .mapUnicode = TRUE)
  province.codes <- as.data.frame(readHTMLTable(html , which = 1)) 
  names(province.codes) = c("code", "province", "cat")
  province.codes$name = gsub("^.*!", "", province.codes$name)
  
  return (province.codes)
}

refineText <- function(texts) {
  texts <- gsub("-|–", " ", texts)
  texts <- gsub("\\s{2,}", " ", texts)
  texts <- gsub("\\(.*\\)", "", texts)
  texts <- trim(texts)
  return (texts)
}

trim <- function (x) {
  return (gsub("^\\s+|\\s+$", "", x))
}