library(lidR)
## settemp
write("TMPDIR = E:\\Temp", file=file.path(Sys.getenv('TMPDIR'), '.Renviron'))
write("R_USER = E:\\Temp", file=file.path(Sys.getenv('R_USER'), '.Renviron'))
tempfile(tmpdir="E:\\Temp")
tempdir <- function() { "E:\\Temp" }

las <- readLAS("vgyteszt/tile_638000_289000.las", select = "xyzrn")
las <- readLAS("vgyteszt/tile_638500_289000.las", select = "xyzrn")
las <- readLAS("vgyteszt/tile_639500_289000.las", select = "xyzrn")

las <- readLAS("vgyteszt/tile_638000_290500.las", select = "xyzrn")
las <- readLAS("vgyteszt/tile_639500_290500.las", select = "xyzrn")

plot(las)

## Create catalog
ctg <- readLAScatalog("vgyteszt/")
ctg
las_check(ctg)

## eredeti osztályozás
dtm <- rasterize_terrain(ctg, 2, tin(), pkg = "terra")


## Classify ground
opt_output_files(ctg) <- paste0(tempdir(), "{*}_classified")
classified_ctg <- classify_ground(ctg, csf())

## DTM csf
dtmcsf <- rasterize_terrain(ctg, 2, tin(), pkg = "terra")
plot_dtm3d(dtmcsf, bg = "white")

## kivonás
diffcsf <- dtm - dtmcsf
