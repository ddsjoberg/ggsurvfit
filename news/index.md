# Changelog

## ggsurvfit 1.2.0

CRAN release: 2025-09-13

- Updates to account for changes in ggplot2 v4.0.0.
  ([\#241](https://github.com/pharmaverse/ggsurvfit/issues/241))

- Improved messaging when users pass competing risks models to
  [`add_pvalue()`](http://www.danieldsjoberg.com/ggsurvfit/reference/add_pvalue.md)
  when more than one outcome is on display.

- Added an example to the gallery for combining multiple survival
  endpoints.
  ([\#212](https://github.com/pharmaverse/ggsurvfit/issues/212))

- Fixed confidence interval labels being incorrectly swapped for
  multi-state models in
  [`tidy_survfit()`](http://www.danieldsjoberg.com/ggsurvfit/reference/tidy_survfit.md).
  Multi-state models now preserve the correct ordering of `conf.low` and
  `conf.high` from the underlying
  [`broom::tidy()`](https://generics.r-lib.org/reference/tidy.html)
  output. ([\#215](https://github.com/pharmaverse/ggsurvfit/issues/215))

- Improved error message when
  [`ggcuminc()`](http://www.danieldsjoberg.com/ggsurvfit/reference/ggcuminc.md)
  is called with `survfit.coxphms` objects.
  ([\#222](https://github.com/pharmaverse/ggsurvfit/issues/222))

- Fixed
  [`add_risktable()`](http://www.danieldsjoberg.com/ggsurvfit/reference/add_risktable.md)
  to respect x-axis breaks when x-axis is duplicated.
  ([\#221](https://github.com/pharmaverse/ggsurvfit/issues/221))

- Correcting an argument name partial match in
  `ggplot2::scale_*(labels)`.
  ([\#211](https://github.com/pharmaverse/ggsurvfit/issues/211),
  [@DanChaltiel](https://github.com/DanChaltiel))

## ggsurvfit 1.1.0

CRAN release: 2024-05-08

- We now allow for negative follow-up times in
  [`tidy_survfit()`](http://www.danieldsjoberg.com/ggsurvfit/reference/tidy_survfit.md)
  (and subsequently
  [`ggsurvfit()`](http://www.danieldsjoberg.com/ggsurvfit/reference/ggsurvfit.md)).
  When negative follow-up times are present users should specify
  `survfit(start.time)` and we print a note to this effect when not set.
  ([\#192](https://github.com/pharmaverse/ggsurvfit/issues/192))

- The
  [`tidy_survfit()`](http://www.danieldsjoberg.com/ggsurvfit/reference/tidy_survfit.md)
  (and subsequently
  [`ggsurvfit()`](http://www.danieldsjoberg.com/ggsurvfit/reference/ggsurvfit.md))
  now honor the `survfit(start.time)` if specified.
  ([\#192](https://github.com/pharmaverse/ggsurvfit/issues/192))

- Updated legend position syntax to account for changes in {ggplot2}
  v3.5.0.

- As of {survival} v3.6-4, the number censored are now returned as a
  matrix for multi-state models (i.e. competing risks models). The
  [`tidy_survfit()`](http://www.danieldsjoberg.com/ggsurvfit/reference/tidy_survfit.md)
  function has been updated to account for this new structure and the
  minimum version of {survival} has been increased to the latest
  version.
  ([\#199](https://github.com/pharmaverse/ggsurvfit/issues/199))

- For non-competing risks multi-state models created with
  [`survfit()`](https://rdrr.io/pkg/survival/man/survfit.html), the
  y-axis label is now “Probability in State”.
  ([\#205](https://github.com/pharmaverse/ggsurvfit/issues/205))

- Added the “`cloglog`” transformation option to `ggsurvfit(type)` and
  `tidy_survfit(type)`.
  ([\#194](https://github.com/pharmaverse/ggsurvfit/issues/194))

## ggsurvfit 1.0.0

CRAN release: 2023-10-31

- By default, a model plot created with
  [`ggsurvfit()`](http://www.danieldsjoberg.com/ggsurvfit/reference/ggsurvfit.md)
  or
  [`ggcuminc()`](http://www.danieldsjoberg.com/ggsurvfit/reference/ggcuminc.md)
  uses the color aesthetic to plot curves by the stratifying
  variable(s), and further,
  [`ggcuminc()`](http://www.danieldsjoberg.com/ggsurvfit/reference/ggcuminc.md)
  uses the linetype aesthetic for plots that contain multiple outcomes
  (i.e. competing events). We now introduce the global option
  `"ggsurvfit.switch-color-linetype"` to switch these defaults, giving
  users more flexibility over the output figures. Furthermore, when the
  `linetype_aes=` argument is called in a situation when it does not
  apply, it will be silently ignored (previously, an error message *may*
  have been thrown).
  ([\#166](https://github.com/pharmaverse/ggsurvfit/issues/166))

- Slightly increased the padding to the right of the plot when
  [`scale_ggsurvfit()`](http://www.danieldsjoberg.com/ggsurvfit/reference/scale_ggsurvfit.md)
  is called.
  ([\#165](https://github.com/pharmaverse/ggsurvfit/issues/165))

- Now exporting the utility function
  [`ggsurvfit_align_plots()`](http://www.danieldsjoberg.com/ggsurvfit/reference/ggsurvfit_align_plots.md)
  that is used to ensure risktable and the primary plot align. By
  exporting this function, users will now be able to construct custom
  risktable graphics. See `?ggsurvfit_align_plots()` for an example.
  ([\#175](https://github.com/pharmaverse/ggsurvfit/issues/175))

## ggsurvfit 0.3.1

CRAN release: 2023-08-28

- For transformations in
  [`tidy_survfit()`](http://www.danieldsjoberg.com/ggsurvfit/reference/tidy_survfit.md)
  that change the monotonicity of the curve, the `conf.low` and
  `conf.high` column names are now switched.
  ([\#154](https://github.com/pharmaverse/ggsurvfit/issues/154))

## ggsurvfit 0.3.0

CRAN release: 2023-03-16

- Added feature in `add_risktable(risktable_stats=)` to accept glue-like
  syntax—anything inside curly brackets will be evaluated. Users can now
  place multiple types of statistics on the same row, including allowing
  users to style the statistics in any way they like by adding
  rounding/formatting functions within the curly brackets. Users may now
  also display estimates and confidence limits in the risk table.
  ([\#135](https://github.com/pharmaverse/ggsurvfit/issues/135))

- Updated
  [`ggsurvfit()`](http://www.danieldsjoberg.com/ggsurvfit/reference/ggsurvfit.md),
  [`tidy_survfit()`](http://www.danieldsjoberg.com/ggsurvfit/reference/tidy_survfit.md),
  and
  [`survfit2()`](http://www.danieldsjoberg.com/ggsurvfit/reference/survfit2.md)
  to handle
  [`survival::coxph()`](https://rdrr.io/pkg/survival/man/coxph.html)
  models. ([\#9](https://github.com/pharmaverse/ggsurvfit/issues/9))

- Updated the default margin size when a risktable is added to a figure.
  Namely, the primary plot’s bottom margin is set to zero, along with
  each risktable’s top and bottom margin. Moreover, the top and bottom
  margin of the legend is also set to zero.

## ggsurvfit 0.2.1

CRAN release: 2022-12-06

- All calls to `aes()` have been migrated from `ggplot()` to the
  individual geoms, e.g. `geom_step()`. This was done because adding the
  `aes()` call in `ggplot()` led to an error when a later geom is added
  with user-created data.
  ([\#127](https://github.com/pharmaverse/ggsurvfit/issues/127))

- Delay adding the `conf.low` and `conf.high` to the ggplot `aes()`
  until
  [`add_confidence_interval()`](http://www.danieldsjoberg.com/ggsurvfit/reference/add_confidence_interval.md)
  has been called. Previously, these were being added in the first call
  to
  `ggplot(tidy_data, aes(x = time, y = estimate, ymin = conf.low, ymax = conf.high))`.
  The result was that figures that did *not* show the confidence
  interval still created space for the CI in the plot area. This update
  eliminates that blank space.
  ([\#123](https://github.com/pharmaverse/ggsurvfit/issues/123))

- Migrated the ‘scales’ package from ‘Imports:’ to ‘Suggests:’,
  i.e. from a strong to a weak dependency.
  ([\#120](https://github.com/pharmaverse/ggsurvfit/issues/120))

- Updated ggplot `size=` argument to `linewidth=` where needed as of
  ggplot2 v3.4.0
  ([\#131](https://github.com/pharmaverse/ggsurvfit/issues/131))

## ggsurvfit 0.2.0

CRAN release: 2022-10-15

#### Breaking changes

- Changed the default of the `ggsurvfit_build(combine_plots=)` argument
  to `TRUE`.

#### New features

- Added function
  [`add_pvalue()`](http://www.danieldsjoberg.com/ggsurvfit/reference/add_pvalue.md)
  to place p-values in the figure caption or as a text annotation.

- Added the `add_quantile(x_value=)` argument that places line segments
  at the time specified.

- Added the
  [`scale_ggsurvfit()`](http://www.danieldsjoberg.com/ggsurvfit/reference/scale_ggsurvfit.md)
  function that wraps both
  [`ggplot2::scale_x_continuous()`](https://ggplot2.tidyverse.org/reference/scale_continuous.html)
  and
  [`ggplot2::scale_y_continuous()`](https://ggplot2.tidyverse.org/reference/scale_continuous.html)
  and uses reduced padding (via the `expand=` argument), labels y-axis
  with percentages (`labels=`), adds additional break points on the
  x-axis (`n.breaks=8`), and sets the y-axis limits to `c(0, 1)`
  (`limits=`).
  ([\#82](https://github.com/pharmaverse/ggsurvfit/issues/82))

- Added function
  [`add_legend_title()`](http://www.danieldsjoberg.com/ggsurvfit/reference/add_legend_title.md)
  that adds a title for the strata in the figure legend.

- Package now depends on {ggplot2}, meaning that it’ll be attached
  anytime {ggsurvfit} is attached.
  ([\#62](https://github.com/pharmaverse/ggsurvfit/issues/62))

- Added S3 methods
  [`grid.draw.ggsurvfit()`](http://www.danieldsjoberg.com/ggsurvfit/reference/grid.draw_ggsurvfit.md)
  and
  [`grid.draw.ggcuminc()`](http://www.danieldsjoberg.com/ggsurvfit/reference/grid.draw_ggsurvfit.md)
  which in turn allows us to save images from the package directly with
  [`ggplot2::ggsave()`](https://ggplot2.tidyverse.org/reference/ggsave.html)
  ([\#107](https://github.com/pharmaverse/ggsurvfit/issues/107))

- Added support for multi-state models created with
  [`survfit()`](https://rdrr.io/pkg/survival/man/survfit.html),
  i.e. competing risks from the survival package.
  ([\#83](https://github.com/pharmaverse/ggsurvfit/issues/83))

#### Minor improvements and fixes

- Updated the default behavior of
  `add_risktable(risktable_group='auto')` to minimize the number of risk
  tables that appear below the figure.
  ([\#117](https://github.com/pharmaverse/ggsurvfit/issues/117))

- Increased the default font size on the plot and in the risk tables,
  and added arguments to control font size in the risk table theme.
  ([\#103](https://github.com/pharmaverse/ggsurvfit/issues/103))

- When using a CDISC ADTTE data frame, the label saved in PARAM/PARAMCD
  will be used as the default x-axis label in
  [`ggsurvfit()`](http://www.danieldsjoberg.com/ggsurvfit/reference/ggsurvfit.md).
  ([\#97](https://github.com/pharmaverse/ggsurvfit/issues/97))

- When the `survfit(weights=)` argument is utilized, the number at risk,
  number of observed events, etc. are a non-integer numbers. The counts
  in the risk table are now rounded to the nearest integer.
  ([\#90](https://github.com/pharmaverse/ggsurvfit/issues/90))

- Converted the gallery vignette to an article.
  ([\#75](https://github.com/pharmaverse/ggsurvfit/issues/75))

- Bug fix when
  [`Surv_CNSR()`](http://www.danieldsjoberg.com/ggsurvfit/reference/Surv_CNSR.md)
  is used in conjunction with
  [`ggsurvfit()`](http://www.danieldsjoberg.com/ggsurvfit/reference/ggsurvfit.md).
  The default x-axis label is incorrectly attributed to a stratifying
  variable, when present.
  ([\#100](https://github.com/pharmaverse/ggsurvfit/issues/100))

- Fix in
  [`survfit2()`](http://www.danieldsjoberg.com/ggsurvfit/reference/survfit2.md)
  that allows users to pass arguments with non-standard evaluation,
  i.e. bare column names.
  ([\#90](https://github.com/pharmaverse/ggsurvfit/issues/90))

## ggsurvfit 0.1.0

CRAN release: 2022-08-27

- First release.
