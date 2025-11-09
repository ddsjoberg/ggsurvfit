# Add Confidence Interval

Add a confidence interval represented by either a ribbon or lines.

## Usage

``` r
add_confidence_interval(type = c("ribbon", "lines"), ...)
```

## Arguments

- type:

  string indicating the type of confidence interval to draw. Must be one
  of `c("ribbon", "lines")`

- ...:

  arguments pass to geom.

  - `type = 'ribbon'`: Defaults are
    `ggplot2::geom_ribbon(alpha = 0.2, color = NA, ...)`

  - `type = 'lines'`: Defaults are
    `ggplot2::geom_step(linetype = "dashed", na.rm = TRUE, ...)`

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
  add_confidence_interval() +
  scale_ggsurvfit()


survfit2(Surv(time, status) ~ 1, data = df_lung) %>%
  ggsurvfit() +
  add_confidence_interval(type = "lines") +
  scale_ggsurvfit()
```
