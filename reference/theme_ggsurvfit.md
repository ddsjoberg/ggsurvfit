# Survfit Plot Themes

Returns ggplot list of calls defining a theme.

- `theme_ggsurvfit_default()`: Builds on `theme_bw()` with increased
  text sizes.

- `theme_ggsurvfit_KMunicate()`: Theme to create KMunicate-styled
  figures.
  [doi:10.1136/bmjopen-2019-030215](https://doi.org/10.1136/bmjopen-2019-030215)

## Usage

``` r
theme_ggsurvfit_default()

theme_ggsurvfit_KMunicate()
```

## Value

a ggplot2 theme

## Examples

``` r
survfit2(Surv(time, status) ~ sex, data = df_lung) %>%
  ggsurvfit(theme = theme_ggsurvfit_default()) +
  scale_ggsurvfit()
```
