
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nse2r

> Fetch data from the National Stock Exchange, India.

<!-- badges: start -->

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/nse2r)](https://cran.r-project.org/package=nse2r)
[![Travis-CI Build
Status](https://travis-ci.org/rsquaredacademy/nse2r.svg?branch=master)](https://travis-ci.org/rsquaredacademy/nse2r)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/rsquaredacademy/nse2r?branch=master&svg=true)](https://ci.appveyor.com/project/rsquaredacademy/nse2r)
[![Coverage
Status](https://img.shields.io/codecov/c/github/rsquaredacademy/nse2r/master.svg)](https://codecov.io/github/rsquaredacademy/nse2r?branch=master)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

## Overview

[NSE](https://www.nseindia.com/) (National Stock Exchange) is the
leading stock exchange of India, located in the city of Mumbai. While
users can manually download data from NSE through a browser, importing
this data into R is then cumbersome. The nse2r R package implements the
retrieval of data from NSE and aims to reduce the pre-processing steps
needed in analyzing such data.

nse2r is inspired by and a port of the Python package
[nsetools](https://nsetools.readthedocs.io/en/latest/). The authors and
contributors for this R package are not affiliated with NSE and NSE does
not offer support for this R package.

With nse2r, you can fetch the following data related to:

  - stocks
      - quote for a given stock
      - symbol & name
      - check validity
      - most actively traded stocks in a month
      - 52 week high/low
      - top gainers/losers for the last trading session
  - index
      - list indices
      - check validity
      - fetch indices quote
  - futures & options
      - top gainers/losers for the last trading session
  - pre open data
      - nifty
      - nifty bank
  - indices advances & declines

## Installation

You can install the development version of nse2r from
[GitHub](https://github.com/rsquaredacademy/nse2r/) with:

``` r
# install.packages("devtools")
devtools::install_github("rsquaredacademy/nse2r")
```

## Usage

nse2r uses consistent prefix `nse_` for easy tab completion.

  - `nse_index_` for index
  - `nse_stock_` for stocks
  - `nse_fo_` for futures and options
  - `nse_preopen_` for preopen data

### Index

##### Fetch Indices Quote

``` r
nse_index_quote()
#> # A tibble: 55 x 4
#>    index_name        last_traded_price  change percent_change
#>    <chr>                         <dbl>   <dbl>          <dbl>
#>  1 NIFTY 50 Pre Open           12137.    81              0.67
#>  2 NIFTY 50                    12048.    -7.85          -0.07
#>  3 NIFTY NEXT 50               28539.    -7             -0.02
#>  4 NIFTY100 LIQ 15              3790.   -38.9           -1.02
#>  5 NIFTY BANK                  31871.   -74.6           -0.23
#>  6 INDIA VIX                      14.2    0.3            2.19
#>  7 NIFTY 100                   12175.    -7.45          -0.06
#>  8 NIFTY 500                    9798    -15.6           -0.16
#>  9 NIFTY MIDCAP 100            17103.  -119.            -0.69
#> 10 NIFTY MIDCAP 50              4689.   -33.4           -0.71
#> # ... with 45 more rows
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#> # A tibble: 10 x 12
#>    symbol series last_corp_annou~ last_corp_annou~ open_price high_price
#>    <chr>  <chr>  <date>           <chr>                 <dbl>      <dbl>
#>  1 BHART~ EQ     2019-04-23       Rights 19:67 @ ~       471.       486.
#>  2 JSWST~ EQ     2019-07-08       Annual General ~       268.       269.
#>  3 RELIA~ EQ     2019-08-02       Annual General ~      1600       1614.
#>  4 GRASIM EQ     2019-08-08       Annual General ~       810        822 
#>  5 ASIAN~ EQ     2019-10-30       Interim Dividen~      1706.      1742.
#>  6 KOTAK~ EQ     2019-07-12       Annual General ~      1614.      1636.
#>  7 AXISB~ EQ     2019-07-04       Annual General ~       739.       746 
#>  8 NESTL~ EQ     2019-12-10       Interim Dividend     14454.     14631.
#>  9 M&M    EQ     2019-07-18       Annual General ~       525        538.
#> 10 ULTRA~ EQ     2019-07-10       Annual General ~      4270       4320 
#> # ... with 6 more variables: low_price <dbl>, last_traded_price <dbl>,
#> #   previous_close_price <dbl>, percent_change <dbl>,
#> #   traded_quantity <dbl>, turnover_in_lakhs <dbl>
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#> # A tibble: 25 x 10
#>    symbol symbol_desc date       new_high   year last_traded_pri~ prev_high
#>    <chr>  <chr>       <date>        <dbl>  <dbl>            <dbl>     <dbl>
#>  1 ADANI~ Adani Tran~ 2019-11-29   341.   3.41e2           332.       318. 
#>  2 AGROP~ Agro Phos ~ 2019-11-29   134.   1.34e2           134.       133. 
#>  3 AHLWE~ Asian Hote~ 2019-09-26   402.   4.02e2           378        395  
#>  4 AMBER  Amber Ente~ 2019-10-31  1070.   1.07e3          1042       1060  
#>  5 ANKIT~ Ankit Meta~ 2019-11-29     1.15 1.15e0             1.05       1.1
#>  6 ASTRA~ AstraZenec~ 2019-10-31  2834    2.83e3          2830       2809  
#>  7 BHART~ Bharti Air~ 2019-11-25   486.   4.86e2           461.       456. 
#>  8 BIOFI~ Biofil Che~ 2019-11-29     8.9  8.90e0             8.9        8.5
#>  9 CHEMB~ Chembond C~ 2019-11-29   241.   2.41e2           228.       240. 
#> 10 CUB    City Union~ 2019-11-29   235.   2.35e2           230.       227  
#> # ... with 15 more rows, and 3 more variables: prev_close <dbl>,
#> #   change <dbl>, percent_change <dbl>
```

##### Most actively traded stocks in a month

``` r
nse_stock_most_traded()
#> # A tibble: 12 x 6
#>    security share_turnover traded_quantity no_of_trades avg_daily_turno~
#>    <chr>             <dbl>           <dbl>        <dbl>            <dbl>
#>  1 ICICI B~           4.65            7758      4878739            1939.
#>  2 Yes Ban~           4.29           52626     11184742            1787.
#>  3 Indiabu~           4              12930     10805671            1667.
#>  4 Relianc~           3.02            1670      3665877            1259.
#>  5 Zee Ent~           3               7991      5228767            1250.
#>  6 State B~           2.9             7471      4682688            1211.
#>  7 Bharti ~           2.22            4447      3632503             924.
#>  8 HDFC Li~           2.04             762      2883349             853.
#>  9 Infosys~           1.88            2223      3267771             783.
#> 10 Tata St~           1.83            3759      3038374             764.
#> 11 TOTAL o~          29.8           101637     53268481           12438.
#> 12 TOTAL            100             483353    259778999           41713.
#> # ... with 1 more variable: turnover <dbl>
```

### Futures & Options

##### Top futures and options gainers for the last trading session.

``` r
nse_fo_top_gainers()
#> # A tibble: 10 x 12
#>    symbol series last_corp_annou~ last_corp_annou~ open_price high_price
#>    <chr>  <chr>  <date>           <chr>                 <dbl>      <dbl>
#>  1 IDEA   EQ     2019-08-16       Annual General ~        7.5        8.8
#>  2 BHART~ EQ     2019-04-23       Rights 19:67 @ ~      471.       486. 
#>  3 IBULH~ EQ     2019-11-18       Interim Dividen~      292.       309  
#>  4 ESCOR~ EQ     2019-07-11       Dividend Rs - 2~      641.       666. 
#>  5 NMDC   EQ     2019-08-22       Annual General ~      102.       106. 
#>  6 DISHTV EQ     2018-11-05       Interim Dividen~       12.2       13.8
#>  7 MOTHE~ EQ     2019-08-08       Annual General ~      128.       134. 
#>  8 PETRO~ EQ     2019-11-07       Interim Dividen~      274.       280. 
#>  9 AMBUJ~ EQ     2019-02-27       Dividend - Rs 1~      206.       211  
#> 10 JSWST~ EQ     2019-07-08       Annual General ~      268.       269. 
#> # ... with 6 more variables: low_price <dbl>, last_traded_price <dbl>,
#> #   previous_close_price <dbl>, percent_change <dbl>,
#> #   traded_quantity <dbl>, turnover_in_lakhs <dbl>
```

Please note that the ‘nse2r’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
