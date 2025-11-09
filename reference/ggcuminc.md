# Plot Cumulative Incidence

Plot a cumulative incidence object created with
[`tidycmprsk::cuminc()`](https://mskcc-epi-bio.github.io/tidycmprsk/reference/cuminc.html)
or a multi-state object created with
[`survfit2()`](http://www.danieldsjoberg.com/ggsurvfit/reference/survfit2.md).
Read more on multi-state models
[here](https://cran.r-project.org/package=survival/vignettes/compete.pdf).

## Usage

``` r
ggcuminc(
  x,
  outcome = NULL,
  linetype_aes = FALSE,
  theme = theme_ggsurvfit_default(),
  ...
)
```

## Arguments

- x:

  a 'survfit' object created with
  [`survfit2()`](http://www.danieldsjoberg.com/ggsurvfit/reference/survfit2.md)

- outcome:

  string indicating which outcome(s) to include in plot. Default is to
  include the first competing event.

- linetype_aes:

  logical indicating whether to add `ggplot2::aes(linetype = strata)` to
  the
  [`ggplot2::geom_step()`](https://ggplot2.tidyverse.org/reference/geom_path.html)
  call. When strata are present, the resulting figure will be a mix a
  various line types for each stratum.

- theme:

  a survfit theme. Default is
  [`theme_ggsurvfit_default()`](http://www.danieldsjoberg.com/ggsurvfit/reference/theme_ggsurvfit.md)

- ...:

  arguments passed to `ggplot2::geom_step(...)`, e.g. `size = 2`

## Value

a ggplot2 figure

## Details

*Why not use
[`cmprsk::cuminc()`](https://rdrr.io/pkg/cmprsk/man/cuminc.html)?*

The implementation of
[`cmprsk::cuminc()`](https://rdrr.io/pkg/cmprsk/man/cuminc.html) does
not provide the data required to construct the risk table. Moreover, the
[`tidycmprsk::cuminc()`](https://mskcc-epi-bio.github.io/tidycmprsk/reference/cuminc.html)
has a user-friendly interface making it easy to learn and use.

## See also

Visit the
[gallery](https://www.danieldsjoberg.com/ggsurvfit/articles/gallery.html)
for examples modifying the default figures

## Examples

``` r
# \donttest{
library(tidycmprsk)

cuminc(Surv(ttdeath, death_cr) ~ trt, trial) %>%
  ggcuminc(outcome = "death from cancer") +
  add_confidence_interval() +
  add_risktable() +
  scale_ggsurvfit()


cuminc(Surv(ttdeath, death_cr) ~ trt, trial) %>%
  ggcuminc(outcome = c("death from cancer", "death other causes")) +
  add_risktable() +
  scale_ggsurvfit()


# using the survival multi-state model
survfit2(Surv(ttdeath, death_cr) ~ trt, trial) %>%
  ggcuminc(outcome = "death from cancer") +
  add_confidence_interval() +
  add_risktable() +
  scale_ggsurvfit()

# }
```
