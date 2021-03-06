% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/projection.R, R/zzzz_et_names.R
\name{compute_projection}
\alias{compute_projection}
\alias{compute_projection.data.frame}
\alias{compute_projection.numeric}
\alias{et_projection}
\title{compute location of coordinates after great circle projection}
\usage{
compute_projection(x, ..., method = "GC")

\method{compute_projection}{data.frame}(.data, latitude, longitude,
  bearing, distance, method = "GC")

\method{compute_projection}{numeric}(latitude, longitude, bearing,
  distance, output_type = "data.table", method = "GC")

et_projection(x, ..., method = "GC")
}
\arguments{
\item{x}{An object used to determine which implementation to use}

\item{...}{It's an S3 thing. You wouldn't understand.}

\item{method}{Either \code{"GC"} [default] or \code{"rhumb"}. Used to declare
either a great circle calculation or rhumb line calculation}

\item{.data}{An object that inherits from \code{\link[base]{data.frame}}. In 
general this will be on of \code{data.frame}, 
\code{\link[data.table]{data.table}}, or \code{\link[dplyr]{tbl_df}}}

\item{latitude}{Either a numeric vector of latitudes [degrees] or the column
of \code{.data} which contains latitudes. This maybe quoted or unquoted;
see examples.}

\item{longitude}{Either a numeric vector of longitudes [degrees]
corresponding with latitude or the column of \code{.data} which contains
longitudes. This maybe quoted or unquoted; see examples.}

\item{bearing}{Either a numeric vector of bearings [degrees] or the column of
\code{.data} which contains bearings/headings. This maybe quoted or
unquoted see examples.}

\item{distance}{Either a numeric vector of projection distance [nautical
miles] or the column of \code{.data} which contains projection distances.
This maybe quoted or unquoted see examples.}

\item{output_type}{string in \code{c("matrix", "data.table", "data.frame", 
"list")}}
}
\value{
If \code{.data} is supplied, an object of the same type and with the
  same columns as \code{.data} plus two more, \code{end_latitude} and
  \code{end_longitude}.  Otherwise, an object of type determined by
  output_type which will generally have two columns, latitude and longitude.
  If the input coordinates have length 1, then a named numeric vector is
  returned.
}
\description{
This function provides a convienant wrapper to 
\code{\link[geosphere]{destPoint}}
}
\examples{
# basic use
compute_projection(39.86167, -104.6732, 90, 15)
compute_projection(39.86167, -104.6732, 86:90, 1:15)

# use inside a data.table
library(data.table)
apts <- data.table(airport=c("ATL", "DEN", "ORD", "SEA"),
                   latitude=c(33.63670, 39.86167, 41.97933, 47.44989),
                   longitude=c(-84.42786, -104.67317, -87.90739, -122.31178))
apts[, c("platitude", "plongitude"):=compute_projection(latitude, longitude, 90, 15)]

# use with magrittr
library(magrittr)
apts \%>\% compute_projection(latitude, longitude, 90, 15)

# columns as strings
lat_col <- names(apts)[2]
apts \%>\% compute_projection(lat_col, "longitude", 90, 15)

# predict next position
tracks <- data.frame(id = c("a","b","c"),
                     lat = 0,
                     lon = 0,
                     heading = 30,
                     ground_speed = seq(300,360, 30))
time_step <- 1/60 #one minute

tracks \%>\% compute_projection(lat, lon, heading, tracks$ground_speed*time_step)

}
