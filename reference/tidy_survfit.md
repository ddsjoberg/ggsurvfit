# Tidy a survfit object

The broom package exports a tidier for `"survfit"` objects. This
function adds on top of that and returns more information. The function
also utilizes additional information stored when the survfit object is
created with
[`survfit2()`](http://www.danieldsjoberg.com/ggsurvfit/reference/survfit2.md).
It's recommended to always use this function with
[`survfit2()`](http://www.danieldsjoberg.com/ggsurvfit/reference/survfit2.md).

## Usage

``` r
tidy_survfit(
  x,
  times = NULL,
  type = c("survival", "risk", "cumhaz", "cloglog")
)
```

## Arguments

- x:

  a 'survfit' object created with
  [`survfit2()`](http://www.danieldsjoberg.com/ggsurvfit/reference/survfit2.md)

- times:

  numeric vector of times. Default is `NULL`, which returns all observed
  times.

- type:

  type of statistic to report. Available for Kaplan-Meier estimates
  only. Default is `"survival"`. Must be one of the following or a
  function:

  |              |                |
  |--------------|----------------|
  | type         | transformation |
  | `"survival"` | `x`            |
  | `"risk"`     | `1 - x`        |
  | `"cumhaz"`   | `-log(x)`      |
  | `"cloglog"`  | `log(-log(x))` |

## Value

a tibble

## Examples

``` r
survfit2(Surv(time, status) ~ factor(ph.ecog), data = df_lung) %>%
  tidy_survfit()
#> # A tibble: 220 × 16
#>     time n.risk n.event n.censor cum.event cum.censor estimate std.error
#>    <dbl>  <dbl>   <dbl>    <dbl>     <dbl>      <dbl>    <dbl>     <dbl>
#>  1 0         63       0        0         0          0    1        0     
#>  2 0.164     63       1        0         1          0    0.984    0.0160
#>  3 0.361     62       1        0         2          0    0.968    0.0228
#>  4 0.493     61       1        0         3          0    0.952    0.0282
#>  5 1.02      60       1        0         4          0    0.937    0.0328
#>  6 1.74      59       1        0         5          0    0.921    0.0370
#>  7 2.14      58       1        0         6          0    0.905    0.0409
#>  8 2.66      57       1        0         7          0    0.889    0.0445
#>  9 4.83      56       1        0         8          0    0.873    0.0480
#> 10 5.45      55       1        0         9          0    0.857    0.0514
#> # ℹ 210 more rows
#> # ℹ 8 more variables: conf.high <dbl>, conf.low <dbl>, strata <fct>,
#> #   estimate_type <chr>, estimate_type_label <chr>, monotonicity_type <chr>,
#> #   strata_label <chr>, conf.level <dbl>
```
