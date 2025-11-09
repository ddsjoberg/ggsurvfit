# Format p-value

Round and format p-values

## Usage

``` r
format_p(x, digits = 1)
```

## Arguments

- x:

  numeric vector of p-values

- digits:

  number of digits large p-values will be rounded to. Default is 2, and
  must be one of 1, 2, or 3.

## Value

a string

## Examples

``` r
p_vec <- c(0.00001, 0.01111, 0.0500000, 0.15, 0.99999)
format_p(p_vec)
#> [1] "<0.001" "0.011"  "0.050"  "0.15"   ">0.9"  
format_p(p_vec, 2)
#> [1] "<0.001" "0.011"  "0.050"  "0.15"   ">0.99" 
format_p(p_vec, 3)
#> [1] "<0.001" "0.011"  "0.050"  "0.150"  ">0.999"
```
