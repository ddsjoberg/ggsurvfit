# Risk Table Themes

Returns ggplot list of calls defining a theme meant to be applied to a
risk table.

## Usage

``` r
theme_risktable_default(axis.text.y.size = 10, plot.title.size = 10.75)

theme_risktable_boxed(axis.text.y.size = 10, plot.title.size = 10.75)
```

## Arguments

- axis.text.y.size:

  text size of the labels on the left of the risk table

- plot.title.size:

  text size of the risk table title

## Value

a ggplot2 figure

## Examples

``` r
p <- survfit2(Surv(time, status) ~ 1, data = df_lung) %>%
  ggsurvfit() +
  scale_ggsurvfit()

# default ------------------------------------
p + add_risktable(theme = theme_risktable_default())


# larger text --------------------------------
p +
  add_risktable(
    size = 4,
    theme = theme_risktable_default(axis.text.y.size = 12,
                                    plot.title.size = 14)
  )


# boxed --------------------------------------
p + add_risktable(theme = theme_risktable_boxed())


# none ---------------------------------------
p + add_risktable(theme = NULL, risktable_height = 0.20)
```
