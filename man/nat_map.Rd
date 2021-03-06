% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{nat_map}
\alias{nat_map}
\title{Map of Australian Electorate from 2013}
\format{An object of class \code{data.frame} with 27595 rows and 9 columns.}
\usage{
nat_map
}
\description{
A dataset containing the map of the all 150 Australian electorates using the 2013 boundaries of the 
electorates (and downsampled to a 5\% file to allow fast plotting).
The data were obtained from the Australian Electoral Commission, and downloaded 
from \url{http://www.aec.gov.au/Electorates/gis/gis_datadownload.htm}.
}
\examples{

data(nat_map)
# choropleth map with Census data
nat_map$region <- nat_map$ELECT_DIV
data(abs2011)
abs2011$region <- abs2011$Electorate
library(ggplot2)
library(ggthemes)
both <- intersect(unique(abs2011$region), unique(nat_map$region))
ggplot(aes(map_id=region), data=subset(abs2011, region \%in\% both)) +
  geom_map(aes(fill=MedianIncome), map=subset(nat_map, region \%in\% both)) +
  expand_limits(x=nat_map$long, y=nat_map$lat) + 
  theme_map()

}
\keyword{datasets}
