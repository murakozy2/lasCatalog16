library(lidR)
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

## Classify ground
opt_output_files(ctg) <- paste0(tempdir(), "{*}_classified")
classified_ctg <- classify_ground(ctg, csf())
