library(lidR)
las <- readLAS("vgyteszt/tile_638000_289000.las", select = "xyzrn")
las <- readLAS("vgyteszt/tile_638500_289000.las", select = "xyzrn")
las <- readLAS("vgyteszt/tile_639500_289000.las", select = "xyzrn")

las <- readLAS("vgyteszt/tile_638000_290500.las", select = "xyzrn")
las <- readLAS("vgyteszt/tile_639500_290500.las", select = "xyzrn")

plot(las)

ctg <- readLAScatalog("vgyteszt/")
ctg
