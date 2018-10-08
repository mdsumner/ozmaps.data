##  https://github.com/mdsumner/ozmaps/issues/5#issuecomment-427731457

# #Volume 1 – Main Structure and Greater Capital City Statistical Areas
#
# http://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.001July%202016?OpenDocument
#
# #Volume 2 – Indigenous Structure
#
# http://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.002July%202016?OpenDocument
#
# Volume 3 – Non ABS Structures
#
# http://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.003July%202018?OpenDocument
#
# Volume 4 – Significant Urban Areas, Urban Centres and Localities, Section of State
#
# http://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.004July%202016?OpenDocument
#
# Volume 5 – Remoteness Structure   (this has GPKG)
#
# http://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.005July%202016?OpenDocument
#
# Census of Population and Housing Destination Zones
#
# http://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/8000.0August%202016?OpenDocument

urls <-
c("http://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.001July%202016?OpenDocument",
  "http://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.002July%202016?OpenDocument",
  "http://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.003July%202018?OpenDocument",
  "http://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.004July%202016?OpenDocument",
  "http://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.005July%202016?OpenDocument",
  "http://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/8000.0August%202016?OpenDocument"
)


tx <- unlist(lapply(urls, readLines))


## GPKG
srcs <- grep("geopackage.zip|gpkg.zip", tx, value = TRUE)

src <- file.path("http://www.abs.gov.au", unlist(lapply(strsplit(unlist(lapply(strsplit(srcs, "href=\"/"), function(x) x[2])), "\"><img src="), function(a) a[1])))
src <- gsub(" ", "%20", src)
bname <- unlist(lapply(strsplit(src, "&"), function(a) a[2]))
for (i in seq_along(src)) {
  aname <- file.path("extdata/abs", bname[i])
  if (!file.exists(aname)) {
    curl::curl_download(src[i], aname)
  }
}

for (i in seq_along(src)) {
  aname <- file.path("extdata/abs", bname[i])
  unzip(aname, exdir = "extdata/abs-gpkg")
}

## SHP
srcs <- grep("shp.zip|shape.zip", tx, value = TRUE)

src <- file.path("http://www.abs.gov.au", unlist(lapply(strsplit(unlist(lapply(strsplit(srcs, "href=\"/"), function(x) x[2])), "\"><img src="), function(a) a[1])))
src <- gsub(" ", "%20", src)
bname <- unlist(lapply(strsplit(src, "&"), function(a) a[2]))
for (i in seq_along(src)) {
  aname <- file.path("extdata/abs", bname[i])
  if (!file.exists(aname)) {
    curl::curl_download(src[i], aname)
  }
}

for (i in seq_along(src)) {
  aname <- file.path("extdata/abs", bname[i])
  unzip(aname, exdir = "extdata/abs-shp")
}

#
# ## MIF
# srcs <- grep("midmif.zip", tx, value = TRUE)
#
# src <- file.path("http://www.abs.gov.au", unlist(lapply(strsplit(unlist(lapply(strsplit(srcs, "href=\"/"), function(x) x[2])), "\"><img src="), function(a) a[1])))
# src <- gsub(" ", "%20", src)
# bname <- unlist(lapply(strsplit(src, "&"), function(a) a[2]))
# for (i in seq_along(src)) {
#   aname <- file.path("extdata/abs", bname[i])
#   if (!file.exists(aname)) {
#   curl::curl_download(src[i], aname)
#   }
# }
#
# for (i in seq_along(src)) {
#   aname <- file.path("extdata/abs", bname[i])
#   unzip(aname, exdir = "extdata/abs-mif")
# }
#
#
# ## TAB
# srcs <- grep("tab.zip", tx, value = TRUE)
#
# src <- file.path("http://www.abs.gov.au", unlist(lapply(strsplit(unlist(lapply(strsplit(srcs, "href=\"/"), function(x) x[2])), "\"><img src="), function(a) a[1])))
# src <- gsub(" ", "%20", src)
# bname <- unlist(lapply(strsplit(src, "&"), function(a) a[2]))
# for (i in seq_along(src)) {
#   aname <- file.path("extdata/abs", bname[i])
#   if (!file.exists(aname)) {
#     curl::curl_download(src[i], aname)
#   }
# }
#
# for (i in seq_along(src)) {
#   aname <- file.path("extdata/abs", bname[i])
#   unzip(aname, exdir = "extdata/abs-tab")
# }
#
#
#
#
#
#
