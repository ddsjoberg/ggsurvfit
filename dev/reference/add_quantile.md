# Add Quantile Annotation

Add quantile information annotated on to the plot.

## Usage

``` r
add_quantile(y_value = NULL, x_value = NULL, ...)
```

## Arguments

- y_value, x_value:

  Numeric value where the line segment will be drawn. Default is
  `y_value=0.5` when both `y_value` and `x_value` are unassigned.

- ...:

  Named arguments passed to
  [`ggplot2::geom_segment()`](https://ggplot2.tidyverse.org/reference/geom_segment.html)
  with default `linetype = 2`

## Value

a ggplot2 figure

## See also

Visit the
[gallery](https://www.danieldsjoberg.com/ggsurvfit/articles/gallery.html)
for examples modifying the default figures

## Examples

``` r
survfit2(Surv(time, status) ~ sex, data = df_lung) %>%
  ggsurvfit() +
  add_quantile(linetype = 2) +
  scale_ggsurvfit()


survfit2(Surv(time, status) ~ 1, data = df_lung) %>%
  ggsurvfit() +
  add_quantile(linetype = 2) +
  add_quantile(y_value = 0.9, linetype = 3) +
  scale_ggsurvfit()


survfit2(Surv(time, status) ~ sex, data = df_lung) %>%
  ggsurvfit() +
  add_quantile(linetype = 2, y_value = NULL, x_value = 10) +
  scale_ggsurvfit()
```
