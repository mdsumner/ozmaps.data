
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ozmaps.data

NOTE: this is a *raw data package*, it is used to help create the
[ozmaps package](https://github.com/mdsumner/ozmaps), which may be more
suitable for your mapping needs.

The goal of ozmaps.data is to provide reasonably detailed data sets for
various spatial subdivisions of Australia.

## Installation

The package is not on CRAN but you can install ozmaps.data with:

``` r
devtools::install_github("mdsumner/ozmaps.data")
```

## Example

Here we plot each available data set with a few variations using various
packages.

``` r
LCC <- "+proj=lcc +lon_0=130 +lat_0=-20 +lat_1=-43 +lat_2=-10 +datum=WGS84"

library(ozmaps.data)
library(sf)
#> Linking to GEOS 3.7.0, GDAL 2.3.2, PROJ 5.2.0
library(ggplot2)
plot(abs_ced, main = "Commonwealth Electoral Divisions")
```

<img src="man/figures/README-plots-1.png" width="100%" />

``` r
plot(st_transform(abs_gccsa, LCC), main = "Greater Capital City Statistical Areas", graticule = TRUE)
```

<img src="man/figures/README-plots-2.png" width="100%" />

``` r
ggplot(abs_ireg, aes(fill = NAME)) + geom_sf() + guides(fill = FALSE) + coord_sf(crs = 3577)  + ggtitle("Indigenous Regions (EPSG:3577)")
```

<img src="man/figures/README-plots-3.png" width="100%" />

``` r


## tmap with localized Local Government Area plus inset map for the state
library(tmap)
kbb <- st_bbox(dplyr::filter(abs_lga, stringr::str_detect(NAME, "Kingborough")))
k_lga <- abs_lga[unlist(st_intersects(st_as_sfc(kbb), abs_lga)), ]
#> although coordinates are longitude/latitude, st_intersects assumes that they are planar

kmap <- tm_shape(k_lga, bbox = kbb) +
  tm_polygons(col = "NAME")

library(grid)
kmap 
#> Legend labels were too wide. The labels have been resized to 0.45, 0.30, 0.41, 0.53, 0.36, 0.34. Increase legend.width (argument of tm_layout) to make the legend wider and therefore the labels larger.
tasmap <- tm_shape(abs_ste %>% dplyr::filter(NAME == "Tasmania")) +
  tm_polygons(col = "NAME", legend.show = FALSE) 
kregion <-   tm_shape(st_as_sfc(kbb)) + 
  tm_borders(lwd = 1) 

print(tasmap + kregion, vp = viewport(0.85, 0.27, width = 0.3, height = 0.5))
```

<img src="man/figures/README-plots-4.png" width="100%" />

``` r


plot(abs_ra, main = "Regional Areas")
```

<img src="man/figures/README-plots-5.png" width="100%" />

``` r


plot(st_transform(abs_sa2, 3112), main = 'abs_sa2', graticule = TRUE)
```

<img src="man/figures/README-plots-6.png" width="100%" />

``` r
plot(st_transform(abs_sa3, 28354), main = 'abs_sa3', graticule = TRUE)
```

<img src="man/figures/README-plots-7.png" width="100%" />

``` r
plot(st_transform(abs_sa4, 28348), main = 'abs_sa4', graticule = TRUE)
```

<img src="man/figures/README-plots-8.png" width="100%" />

``` r
plot(st_transform(abs_sed, 3111), main = 'abs_sed', graticule = TRUE)
```

<img src="man/figures/README-plots-9.png" width="100%" />

``` r
plot(st_transform(abs_ste, "+proj=gnom +lon_0=160 +lat_0=0 +datum=WGS84"), main = 'abs_ste', graticule = TRUE)
```

<img src="man/figures/README-plots-10.png" width="100%" />

Please note that the ‘ozmaps.data’ project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.
