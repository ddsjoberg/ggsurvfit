# Tidy a cuminc object

The tidycmprsk package exports a tidier for `"cuminc"` objects. This
function adds on top of that and returns more information.

## Usage

``` r
tidy_cuminc(x, times = NULL)
```

## Arguments

- x:

  a 'cuminc' object created with
  [`tidycmprsk::cuminc()`](https://mskcc-epi-bio.github.io/tidycmprsk/reference/cuminc.html)

- times:

  numeric vector of times. Default is `NULL`, which returns all observed
  times.

## Value

a tibble

## Examples

``` r
library(tidycmprsk)

cuminc(Surv(ttdeath, death_cr) ~ trt, trial) %>%
  tidy_cuminc()
#> # A tibble: 444 × 16
#>     time outcome     strata estimate std.error conf.low conf.high n.risk n.event
#>    <dbl> <chr>       <fct>     <dbl>     <dbl>    <dbl>     <dbl>  <int>   <int>
#>  1  0    death from… Drug A   0         0      NA         NA          98       0
#>  2  0    death othe… Drug A   0         0      NA         NA          98       0
#>  3  0    death from… Drug B   0         0      NA         NA         102       0
#>  4  0    death othe… Drug B   0         0      NA         NA         102       0
#>  5  3.53 death from… Drug A   0         0      NA         NA          98       0
#>  6  3.53 death othe… Drug A   0.0102    0.0102  8.84e-4    0.0503     98       1
#>  7  3.53 death from… Drug B   0         0      NA         NA         102       0
#>  8  3.53 death othe… Drug B   0         0      NA         NA         102       0
#>  9  5.33 death from… Drug A   0         0      NA         NA          97       0
#> 10  5.33 death othe… Drug A   0.0102    0.0102  8.84e-4    0.0503     97       0
#> # ℹ 434 more rows
#> # ℹ 7 more variables: n.censor <int>, cum.event <int>, cum.censor <int>,
#> #   strata_label <chr>, estimate_type <chr>, estimate_type_label <chr>,
#> #   monotonicity_type <chr>
```
