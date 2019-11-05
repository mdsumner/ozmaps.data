## focus on something properly central

fs <- list.files("extdata/abs-mif", pattern = "AUST.*mif$", full.names = TRUE)

l <- purrr::map(fs, ~rmapshaper::ms_simplify(sf::read_sf(.x), keep = 0.05, keep_shapes = TRUE))
for (i in seq_along(l)) {
  saveRDS(l[[i]], file.path("extdata/abs-simplified", gsub("mif", "rds", basename(fs[i]))),
          compress = "xz", version = 2)
}


library(piggyback)
unlink("abs-simplified.tar.gz")
system("tar cvzf abs-simplified.tar.gz extdata/abs-simplified")
files <- list.files("extdata/abs-simplified", recursive = TRUE)
writeLines(files, "abs-simplified-list.txt")
library(piggyback)
pb_upload("abs-simplified.tar.gz", tag = "v0.0.3")



abs %>% dplyr::filter(core) %>% summarize(sum(size))

f <- abs %>% dplyr::filter(core) %>% mutate(filename = files[file])
library(gibble)
## which have holes
gibble(readRDS(file.path("extdata/abs-simplified", f$filename[1]))) %>%
  group_by(object, subobject) %>% dplyr::filter(n() > 1) %>% distinct(object)


## UCL Urban Centre and Locality

## SUA Significant Urban Area

## STE State and Territory

## SOS, SOSR Section of State, Section of State Range

## SED State Electoral Divisions

## RA Remoteness Structure

## IARE, ILOC, IREG Indigenous Areas, Locations, Regions

## GCCSA Greater Capital City Statistical Areas

## DZN The Destination Zone regions are not an Australian Statistical Geography
## Standard (ASGS) structure and do not represent an Australian Bureau of
## Statistics (ABS) standard.

## CED Commonwealth Electoral Divisions
