# ## Vicmap Address
#
# Your order (539272) containing spatial products is complete
# and can be downloaded using the following URL address(es):
#
#   File size (276,105,284 bytes): URL : http://services.land.vic.gov.au/SpatialDatamart/publicAccessOrderDownload.html?fileName=SDM539272.zip&orderId=539272
#
# If the link above fails with "Could not find the file to download" the link has expired and you will need to place a new order.

u <- "http://services.land.vic.gov.au/SpatialDatamart/publicAccessOrderDownload.html?fileName=SDM539272.zip&orderId=539272"
f <- file.path("extdata/vicmap/address", "SDM539272.zip")
curl::curl_download(u, f)

library(piggyback)
pb_upload(f, tag = "v0.0.3")

