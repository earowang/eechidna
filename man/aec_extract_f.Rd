% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cartogram.R
\name{aec_extract_f}
\alias{aec_extract_f}
\title{aec_extract_f - extract subsets geographically}
\usage{
aec_extract_f(aec_data, ctr = c(151.2, -33.8), expand = c(3, 4.5), ...)
}
\arguments{
\item{aec_data}{data with centroids of electoral divisions}

\item{ctr}{centroids of subset}

\item{expand}{how large a chunk to cut out}

\item{...}{other arguments}
}
\description{
The dorling algorithm doesn't work on the entire country,
because it is very clustered at the cities. To get a reasonable
cartogram we need to extract out the cities, expand these
with dorling independently. This function does the extraction.
}
\examples{
library(dplyr)
library(ggplot2)
data(nat_map)
data(nat_data)
adelaide <- aec_extract_f(nat_data, ctr=c(138.6, -34.9), expand=c(2,3))
ggplot(data=nat_map) + 
  geom_polygon(aes(x=long, y=lat, group=group, order=order),
    fill="grey90", colour="white") +
  geom_point(data=adelaide, aes(x=long_c, y=lat_c), size=2, alpha=0.4,
    colour="#f0027f") + 
  xlim(c(136, 142)) + ylim(-36, -33) +
  coord_equal()
}
