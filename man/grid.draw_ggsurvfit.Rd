% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grid.draw_ggsurvfit.R
\name{grid.draw_ggsurvfit}
\alias{grid.draw_ggsurvfit}
\alias{grid.draw.ggsurvfit}
\alias{grid.draw.ggcuminc}
\title{Draw ggsurvfit object}
\usage{
\method{grid.draw}{ggsurvfit}(x, recording = TRUE)

\method{grid.draw}{ggcuminc}(x, recording = TRUE)
}
\arguments{
\item{x}{an object of class 'ggsurvfit' or 'ggcuminc'}

\item{recording}{A logical value to indicate whether the drawing
    operation should be recorded on the Grid display list.}
}
\value{
None
}
\description{
\code{grid::grid.draw()} methods for objects of classes 'ggsurvfit' and 'ggcuminc'.
These are implemented to allow users to directly call \code{ggplot2::ggsave()}
on 'ggsurvfit' figures.
}
\examples{
survfit2(Surv(time, status) ~ surg, data = df_colon) \%>\%
  ggsurvfit() \%>\%
  grid.draw()

library(tidycmprsk)
cuminc(Surv(ttdeath, death_cr) ~ trt, trial) \%>\%
  ggcuminc() \%>\%
  grid.draw()
}
\keyword{internal}
