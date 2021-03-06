% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/distance.R, R/zzzz_et_names.R
\name{compute_dist_along_path}
\alias{compute_dist_along_path}
\alias{et_dist_along_path}
\title{compute spherical distance along path}
\usage{
compute_dist_along_path(latitude, longitude, path_latitude1,
  path_longitude1, path_latitude2, path_longitude2)

et_dist_along_path(latitude, longitude, path_latitude1, path_longitude1,
  path_latitude2, path_longitude2)
}
\arguments{
\item{latitude}{numeric vector of latitudes [degrees]}

\item{longitude}{numeric vector of longitudes [degrees] corresponding with latitude}

\item{path_latitude1}{numeric vector of latitudes [degrees]}

\item{path_longitude1}{numeric vector of longitudes [degrees] corresponding with path_latitude1}

\item{path_latitude2}{numeric vector of latitudes [degrees]}

\item{path_longitude2}{numeric vector of longitudes [degrees] corresponding with path_latitude2}
}
\value{
numeric, distance along path in nautical miles
}
\description{
This function provides a convienant wrapper to 
\code{\link[geosphere]{alongTrackDistance}}. Per that documentation, this measures
the distance along the great circle defined by the \code{path_*} inputs to the point(s) 
on that path nearest the point(s) defined by \code{latitude} and \code{longitude}. 
Note that the input point(s) need not be on the path
}
