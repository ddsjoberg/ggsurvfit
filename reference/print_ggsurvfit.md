# Print ggsurvfit object

Print ggsurvfit object

## Usage

``` r
# S3 method for class 'ggsurvfit'
print(x, ...)

# S3 method for class 'ggcuminc'
print(x, ...)
```

## Arguments

- x:

  an object of class 'ggsurvfit' or 'ggcuminc'

- ...:

  These dots are for future extensions and must be empty.

## Value

a printed ggplot2 figure

## Examples

``` r
print(survfit2(Surv(time, status) ~ surg, data = df_colon))
#> Call: survfit(formula = Surv(time, status) ~ surg, data = df_colon)
#> 
#>                                    n events median 0.95LCL 0.95UCL
#> surg=Limited Time Since Surgery  682    327     NA    4.77      NA
#> surg=Extended Time Since Surgery 247    141   3.03    2.01    5.55
```
