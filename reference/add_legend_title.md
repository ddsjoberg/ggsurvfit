# Add Legend Title

Add a default or custom title to the figure legend.

## Usage

``` r
add_legend_title(title = NULL)
```

## Arguments

- title:

  a string to override the default legend title. Default is NULL

## Value

a ggplot2 figure

## See also

Visit the
[gallery](https://www.danieldsjoberg.com/ggsurvfit/articles/gallery.html)
for examples modifying the default figures

## Examples

``` r
survfit2(Surv(time, status) ~ surg, data = df_colon) %>%
  ggsurvfit() +
  add_legend_title() +
  scale_ggsurvfit()
```
