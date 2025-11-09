# Create survival curves

Simple wrapper for
[`survival::survfit()`](https://rdrr.io/pkg/survival/man/survfit.html)
except the environment is also included in the returned object.

Use this function with all other functions in this package to ensure all
elements are calculable.

## Usage

``` r
survfit2(formula, ...)
```

## Arguments

- formula:

  a formula object, which must have a `Surv` object as the response on
  the left of the `~` operator and, if desired, terms separated by +
  operators on the right. One of the terms may be a `strata` object. For
  a single survival curve the right hand side should be `~ 1`.

- ...:

  Arguments passed on to
  [`survival::survfit.formula`](https://rdrr.io/pkg/survival/man/survfit.formula.html)

  `data`

  :   a data frame in which to interpret the variables named in the
      formula, `subset` and `weights` arguments.

  `weights`

  :   The weights must be nonnegative and it is strongly recommended
      that they be strictly positive, since zero weights are ambiguous,
      compared to use of the `subset` argument.

  `subset`

  :   expression saying that only a subset of the rows of the data
      should be used in the fit.

  `na.action`

  :   a missing-data filter function, applied to the model frame, after
      any `subset` argument has been used. Default is
      `options()$na.action`.

  `stype`

  :   the method to be used estimation of the survival curve: 1 =
      direct, 2 = exp(cumulative hazard).

  `ctype`

  :   the method to be used for estimation of the cumulative hazard: 1 =
      Nelson-Aalen formula, 2 = Fleming-Harrington correction for tied
      events.

  `id`

  :   identifies individual subjects, when a given person can have
      multiple lines of data.

  `cluster`

  :   used to group observations for the infinitesimal jackknife
      variance estimate, defaults to the value of id.

  `robust`

  :   logical, should the function compute a robust variance. For
      multi-state survival curves or interval censored data this is true
      by default. For single state data see details, below.

  `istate`

  :   for multi-state models, identifies the initial state of each
      subject or observation. This also forces `time0 =TRUE`.

  `timefix`

  :   process times through the `aeqSurv` function to eliminate
      potential roundoff issues.

  `etype`

  :   a variable giving the type of event. This has been superseded by
      multi-state Surv objects and is deprecated; see example below.

  `model`

  :   include a copy of the model frame in the output

  `error`

  :   this argument is no longer used

  `entry`

  :   if TRUE, the output will contain `n.enter` which is the number of
      observations entering the risk set at any time; extra rows of
      output are created, if needed, for each unique entry time. Only
      applicable if there is an `id` statement.

  `time0`

  :   if TRUE, the output will include estimates at the starting point
      of the curve or \`time 0'. See discussion below.

## Value

survfit2 object

## `survfit2()` vs [`survfit()`](https://rdrr.io/pkg/survival/man/survfit.html)

Both functions have identical inputs, so why do we need `survfit2()`?

The *only* difference between `survfit2()` and
[`survival::survfit()`](https://rdrr.io/pkg/survival/man/survfit.html)
is that the former tracks the environment from which the call to the
function was made.

The definition of `survfit2()` is unremarkably simple:

    survfit2 <- function(formula, ...) {
      # construct survfit object
      survfit <- survival::survfit(formula, ...)

      # add the environment
      survfit$.Environment = <calling environment>

      # add class and return
      class(survfit) <- c("survfit2", "survfit")
      survfit
    }

The environment is needed to ensure the survfit call can be accurately
reconstructed or parsed at any point post estimation. The call is parsed
when p-values are reported and when labels are created. For example, the
raw variable names appear in the output of a stratified
[`survfit()`](https://rdrr.io/pkg/survival/man/survfit.html) result,
e.g. `"sex=Female"`. When using `survfit2()`, the originating data frame
and formula may be parsed and the raw variable names removed.

Most functions in the package work with both `survfit2()` and
[`survfit()`](https://rdrr.io/pkg/survival/man/survfit.html); however,
the output will be styled in a preferable format with `survfit2()`.

## See also

[`survival::survfit.formula()`](https://rdrr.io/pkg/survival/man/survfit.formula.html)

## Examples

``` r
# With `survfit()`
fit <- survfit(Surv(time, status) ~ sex, data = df_lung)
fit
#> Call: survfit(formula = Surv(time, status) ~ sex, data = df_lung)
#> 
#>              n events median 0.95LCL 0.95UCL
#> sex=Male   138    112   8.87    6.97    10.2
#> sex=Female  90     53  14.00   11.43    18.1

# With `survfit2()`
fit2 <- survfit2(Surv(time, status) ~ sex, data = df_lung)
fit2
#> Call: survfit(formula = Surv(time, status) ~ sex, data = df_lung)
#> 
#>              n events median 0.95LCL 0.95UCL
#> sex=Male   138    112   8.87    6.97    10.2
#> sex=Female  90     53  14.00   11.43    18.1

# Consistent behavior with other functions
summary(fit, times = c(10, 20))
#> Call: survfit(formula = Surv(time, status) ~ sex, data = df_lung)
#> 
#>                 sex=Male 
#>  time n.risk n.event survival std.err lower 95% CI upper 95% CI
#>    10     44      76    0.423  0.0440        0.344        0.518
#>    20     13      27    0.145  0.0353        0.090        0.234
#> 
#>                 sex=Female 
#>  time n.risk n.event survival std.err lower 95% CI upper 95% CI
#>    10     43      27    0.674  0.0523        0.579        0.785
#>    20     11      18    0.343  0.0634        0.239        0.493
#> 

summary(fit2, times = c(10, 20))
#> Call: survfit(formula = Surv(time, status) ~ sex, data = df_lung)
#> 
#>                 sex=Male 
#>  time n.risk n.event survival std.err lower 95% CI upper 95% CI
#>    10     44      76    0.423  0.0440        0.344        0.518
#>    20     13      27    0.145  0.0353        0.090        0.234
#> 
#>                 sex=Female 
#>  time n.risk n.event survival std.err lower 95% CI upper 95% CI
#>    10     43      27    0.674  0.0523        0.579        0.785
#>    20     11      18    0.343  0.0634        0.239        0.493
#> 
```
