% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shapefiles.R
\name{getElectorateShapes}
\alias{getElectorateShapes}
\title{Extract shapefiles (of Australian electorates) from shp file}
\usage{
getElectorateShapes(shapeFile, mapinfo = TRUE, layer = NULL, keep = 0.05)
}
\arguments{
\item{shapeFile}{path to the shp file}

\item{mapinfo}{Is the data mapInfo format, rather than ESRI? default=TRUE}

\item{layer}{If the format is mapInfo, the layer name also needs to be provided, default is NULL}

\item{keep}{percent of polygon points to keep, the default is set to 5\%.}
}
\value{
list with two data frames: map and data; `map` is a data set with geographic latitude and longitude, and a grouping variable to define each entity.
The `data` data set consists of demographic or geographic information for each electorate, such as size in square kilometers or corresponding state.
Additionally, geographic latitude and longitude of the electorate's centroid are added.
}
\description{
Extract polygon information and demographics for each of Australia's electorates. 
The map and data corresponding to the shapefiles of the 2013 Australian electorates (available at \url{http://www.aec.gov.au/Electorates/gis/gis_datadownload.htm}) are part of this package as nat_map.rda and nat_data.rda in the data folder.
The function will take several minutes to complete.
}
\examples{
\dontrun{
fl <- "vignettes/national-midmif-09052016/COM_ELB.TAB"
electorates <- getElectorateShapes(shapeFile = fl, layer="COM_ELB")
library(ggplot2)
ggplot(data=electorates$data) + 
   geom_map(aes(fill=Area_SqKm, map_id=id), map=electorates$map) + 
   expand_limits(
     x=range(electorates$map$long), 
     y=range(electorates$map$lat)
   )
}
}
