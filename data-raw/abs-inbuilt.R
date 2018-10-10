library(dplyr)
fs <- list.files("extdata/abs-simplified", pattern = "AUST.*rds$", full.names = TRUE)

abs <- tribble(
  ~file, ~desc, ~core, ~size,
  #--|--|----
  1, "AUST", FALSE, 1.74,
  2, "CED", TRUE, 2.72,
  3, "DZN",  FALSE, 12.1,
  4, "GCCSA", TRUE, 2.02,
  5, "IARE", FALSE, 3.6,
  6, "ILOC", FALSE, 4.56,
  7, "IREG", TRUE, 2.33,
  8, "LGA", TRUE, 3.86,
  9, "RA",  TRUE, 2.7,
  10, "SA1", FALSE, 56,
  11, "SA2", TRUE, 6.2,
  12, "SA3", TRUE, 3.3,
  13, "SA4", TRUE, 2.6,
  14, "SED", TRUE, 3.34,
  15, "SOS", FALSE, 3.4,
  16, "SOSR", FALSE, 3.4,
  17, "STE", TRUE, 1.93,
  18, "SUA", FALSE, 2.31,
  19, "UCL", FALSE, 4.23
)

abs$file <- fs
absfiles <- dplyr::filter(abs, core)
usethis::use_data(absfiles, internal = TRUE)
library(sf)
object_names <- sprintf("abs_%s", tolower(absfiles$desc))
for (i in seq_along(absfiles$file)) {
#  print(i)
  y <- readRDS(absfiles$file[i])
  jname <- grep(sprintf("%s.*NAME", substr(absfiles$desc[i], 1, 3)),  names(y))
  x <- transmute(y, NAME = 1)
  print(names(y)[jname])
  x[["NAME"]] <- y[[jname]]
  assign(object_names[i], x)
  save(list = object_names[i], file = file.path("data", sprintf("%s.rda", object_names[i])), compress = "bzip2")
}
