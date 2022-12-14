% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_risktable.R
\name{add_risktable}
\alias{add_risktable}
\title{Add risk table}
\usage{
add_risktable(
  times = NULL,
  risktable_stats = c("n.risk", "cum.event"),
  risktable_group = c("auto", "strata", "risktable_stats"),
  risktable_height = NULL,
  stats_label = NULL,
  combine_groups = FALSE,
  theme = theme_risktable_default(),
  size = 3.5,
  ...
)
}
\arguments{
\item{times}{numeric vector of times where risk table values will be placed.
Default are the times shown on the x-axis. The times passed here will not
modify the tick marks shown on the figure. To modify which tick marks are
shown, use \code{ggplot2::scale_x_continuous(breaks=)}.}

\item{risktable_stats}{character vector of statistics to show in the risk table.
Must be one or more of \code{c("n.risk", "cum.event", "cum.censor", "n.event", "n.censor")}.
Default is \code{c("n.risk", "cum.event")}.
\itemize{
\item \code{"n.risk"} Number of patients at risk
\item \code{"cum.event"} Cumulative number of observed events
\item \code{"cum.censor"} Cumulative number of censored observations
\item \code{"n.event"} Number of events in time interval
\item \code{"n.censor"} Number of censored observations in time interval
}}

\item{risktable_group}{String indicating the grouping variable for the risk tables.
Default is \code{"auto"} and will select \code{"strata"} or \code{"risktable_stats"} based on context.
\itemize{
\item \code{"strata"} groups the risk tables per stratum when present.
\item \code{"risktable_stats"} groups the risk tables per risktable_stats.
}}

\item{risktable_height}{A numeric value between 0 and 1 indicates the proportion of the
final plot the risk table will occupy.}

\item{stats_label}{named vector or list of custom labels. Names are the statistics
from \verb{risktable_stats=} and the value is the custom label.}

\item{combine_groups}{logical indicating whether to combine the statistics
in the risk table across groups. Default is \code{FALSE}}

\item{theme}{A risk table theme. Default is \code{theme_risktable_default()}}

\item{size, ...}{arguments passed to \code{ggplot2::geom_text(...)}. Pass arguments like, \code{size = 4}
to increase the size of the statistics presented in the table.}
}
\value{
a ggplot2 figure
}
\description{
Add risk tables below the plot showing the number at risk, events observed, and
number of censored observations.
}
\section{Competing Risks}{


The \code{ggcuminc()} can plot multiple competing events.
The \code{"cum.event"} and \code{"n.event"} statistics are the sum of all events across
outcomes \emph{shown on the plot}.
}

\examples{
p <-
  survfit2(Surv(time, status) ~ sex, data = df_lung) \%>\%
  ggsurvfit() +
  add_censor_mark() +
  add_confidence_interval()

p + add_risktable()

p +
  add_risktable(
    risktable_stats = c("n.risk", "cum.event"),
    stats_label = list(
      cum.event = "Cumulative Observed Events",
      n.risk = "Number at Risk"
    ),
    risktable_group = "strata",
  )

p +
  add_risktable(
    risktable_stats = c("n.risk", "cum.event"),
    combine_groups = TRUE
  )
}
\seealso{
Visit the \href{https://www.danieldsjoberg.com/ggsurvfit/articles/gallery.html}{gallery} for examples modifying the default figures
}
