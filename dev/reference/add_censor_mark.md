# Add Censor Marking

Add a marking on the figure to represent the time an observations was
censored.

## Usage

``` r
add_censor_mark(...)
```

## Arguments

- ...:

  arguments passed to passed to `ggplot2::geom_point(...)` with defaults
  `shape = 3` and `size = 2`

## Value

a ggplot2 figure

## See also

Visit the
[gallery](https://www.danieldsjoberg.com/ggsurvfit/articles/gallery.html)
for examples modifying the default figures

## Examples

``` r
survfit2(Surv(time, status) ~ 1, data = df_lung) %>%
  ggsurvfit() +
  add_confidence_interval() +
  add_censor_mark() +
  scale_ggsurvfit()
```
