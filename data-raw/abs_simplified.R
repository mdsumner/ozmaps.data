## focus on something properly central

fs <- list.files("extdata/abs-shp", pattern = "AUST.*shp$", full.names = TRUE)

l <- purrr::map(fs, ~rmapshaper::ms_simplify(sf::read_sf(.x)))
for (i in seq_along(l)) {
  saveRDS(l[[i]], file.path("extdata/ABS-simplified", gsub("shp", "rds", basename(fs[i]))))
}
library(piggyback)
unlink("abs-simplified.tar.gz")
system("tar cvzf abs-simplified.tar.gz extdata/abs-simplified")
files <- list.files("extdata/abs-simplified", recursive = TRUE)
writeLines(files, "abs-simplified-list.txt")
library(piggyback)
pb_upload("abs-simplified.tar.gz", tag = "v0.0.3")


