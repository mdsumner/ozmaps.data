unlink("abs-gpkg.tar.gz")
system("tar cvzf abs-gpkg.tar.gz extdata/abs-gpkg")
files <- list.files("extdata/abs-gpkg", recursive = TRUE)
writeLines(files, "abslist-gpkg.txt")
library(piggyback)
pb_upload("abs-gpkg.tar.gz", tag = "v0.0.3")



unlink("abs-shp.tar.gz")
system("tar cvzf abs-shp.tar.gz extdata/abs-shp")
files <- list.files("extdata/abs-shp", recursive = TRUE)
writeLines(files, "abslist-shp.txt")
library(piggyback)
pb_upload("abs-shp.tar.gz", tag = "v0.0.3")


