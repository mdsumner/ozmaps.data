u <- "https://d28rz98at9flks.cloudfront.net/61395/61395_e00.zip"
f <- basename(u)
curl::curl_download(u, file.path("extdata", "ga", "geodata-coast", f))
unzip(file.path("extdata", "ga", "geodata-coast", f), exdir = "extdata/ga/geodata-coast")
sf::st_layers("extdata/ga/geodata-coast/australia/cstauscd.e00")

cstaus <- sf::read_sf("extdata/ga/geodata-coast/australia/cstauscd.e00", layer = "ARC")
