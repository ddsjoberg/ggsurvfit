# Calculate p-value

The function `survfit2_p()` wraps
[`survival::survdiff()`](https://rdrr.io/pkg/survival/man/survdiff.html)
and returns a formatted p-value.

## Usage

``` r
survfit2_p(x, pvalue_fun = format_p, prepend_p = TRUE, rho = 0)
```

## Arguments

- x:

  a 'survfit2' object

- pvalue_fun:

  function to round and style p-value with

- prepend_p:

  prepend `"p="` to formatted p-value

- rho:

  argument passed to `survival::survdiff(rho=)`

## Value

a string

## Examples

``` r
sf <- survfit2(Surv(time, status) ~ sex, data = df_lung)

sf %>%
  ggsurvfit() +
  add_confidence_interval() +
  add_risktable() +
  scale_ggsurvfit() +
  labs(caption = glue::glue("Log-rank {survfit2_p(sf)}"))


sf %>%
  ggsurvfit() +
  add_confidence_interval() +
  add_risktable() +
  scale_ggsurvfit() +
  annotate("text", x = 2, y = 0.05, label = glue::glue("{survfit2_p(sf)}"))
```
