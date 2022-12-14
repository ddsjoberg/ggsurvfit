% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tidy_cuminc.R
\name{tidy_cuminc}
\alias{tidy_cuminc}
\title{Tidy a cuminc object}
\usage{
tidy_cuminc(x, times = NULL)
}
\arguments{
\item{x}{a 'cuminc' object created with \code{tidycmprsk::cuminc()}}

\item{times}{numeric vector of times. Default is \code{NULL},
which returns all observed times.}
}
\value{
a tibble
}
\description{
The tidycmprsk package exports a tidier for \code{"cuminc"} objects.
This function adds on top of that and returns more information.
}
\examples{
library(tidycmprsk)

cuminc(Surv(ttdeath, death_cr) ~ trt, trial) \%>\%
  tidy_cuminc()
}
