# Draw ggsurvfit object

[`grid::grid.draw()`](https://rdrr.io/r/grid/grid.draw.html) methods for
objects of classes 'ggsurvfit' and 'ggcuminc'. These are implemented to
allow users to directly call
[`ggplot2::ggsave()`](https://ggplot2.tidyverse.org/reference/ggsave.html)
on 'ggsurvfit' figures.

## Usage

``` r
# S3 method for class 'ggsurvfit'
grid.draw(x, recording = TRUE)

# S3 method for class 'ggcuminc'
grid.draw(x, recording = TRUE)
```

## Arguments

- x:

  an object of class 'ggsurvfit' or 'ggcuminc'

- recording:

  A logical value to indicate whether the drawing operation should be
  recorded on the Grid display list.

## Value

None

## Examples

``` r
survfit2(Surv(time, status) ~ surg, data = df_colon) %>%
  ggsurvfit() %>%
  grid.draw()


library(tidycmprsk)
cuminc(Surv(ttdeath, death_cr) ~ trt, trial) %>%
  ggcuminc() %>%
  grid.draw()
#> Plotting outcome "death from cancer".
```
