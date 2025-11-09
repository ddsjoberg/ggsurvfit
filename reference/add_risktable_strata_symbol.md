# Use Symbol for Strata in Risk Table

Replace the stratum level names with a color symbol in the risk tables.
Use this function when stratum level names are long.

## Usage

``` r
add_risktable_strata_symbol(
  symbol = NULL,
  size = 15,
  face = "bold",
  vjust = 0.3,
  ...
)
```

## Arguments

- symbol:

  [UTF-8 code](https://en.wikipedia.org/wiki/UTF-8) of shape to replace
  strata level with. Default is a rectangle (`"\U25AC"`). Other common
  options are circle (`"\U25CF"`) and diamond (`"\U25C6"`). While a
  symbol is the most common string to pass here, any string is
  acceptable.

- size, face, vjust, ...:

  arguments passed to a function similar to `ggtext::element_markdown()`

## Value

a ggplot2 figure

## See also

Visit the
[gallery](https://www.danieldsjoberg.com/ggsurvfit/articles/gallery.html)
for examples modifying the default figures

## Examples

``` r
p <-
  survfit2(Surv(time, status) ~ sex, data = df_lung) %>%
  ggsurvfit(linewidth = 1) +
  add_confidence_interval() +
  add_risktable(risktable_group = "risktable_stats") +
  scale_ggsurvfit()

 p + add_risktable_strata_symbol()

 p + add_risktable_strata_symbol(symbol = "\U25CF", size = 10)
```
