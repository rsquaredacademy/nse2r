
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nsetools

> Tools for fetching data from the National Stock Exchange, India.

<!-- badges: start -->

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/nsetools)](https://cran.r-project.org/package=nsetools)
[![cran
checks](https://cranchecks.info/badges/summary/nsetools)](https://cran.r-project.org/web/checks/check_results_nsetools.html)
[![Travis-CI Build
Status](https://travis-ci.org/rsquaredacademy/nsetools.svg?branch=master)](https://travis-ci.org/rsquaredacademy/nsetools)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/rsquaredacademy/nsetools?branch=master&svg=true)](https://ci.appveyor.com/project/rsquaredacademy/nsetools)
[![Coverage
Status](https://img.shields.io/codecov/c/github/rsquaredacademy/nsetools/master.svg)](https://codecov.io/github/rsquaredacademy/nsetools?branch=master)
[![](https://cranlogs.r-pkg.org/badges/grand-total/nsetools)](https://cran.r-project.org/package=nsetools)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

## Overview

nsetools fetches data from the National Stock Exchange, India. It is
inspired by and a port of the Python package
[nsetools](https://github.com/vsjha18/nsetools). With nsetools, you can
fetch the following data related to:

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
      - lot size
      - top gainers/losers for the last trading session
  - pre open data
      - nifty
      - nifty bank
      - nifty futures & options
  - indices advances & declines

## Installation

You can install the development version of nsetools from
[GitHub](https://github.com/rsquaredacademy/nsetools/) with:

``` r
# install.packages("devtools")
devtools::install_github("rsquaredacademy/nsetools")
```

## Articles

  - [Introduction to
    nsetools](https://nsetools.rsquaredacademy.com/articles/intro-to-nsetools.html)

## Usage

nsetools uses consistent prefix `nse_` for easy tab completion.

  - `nse_index_` for index
  - `nse_stock_` for stocks
  - `nse_fo_` for futures and options
  - `nse_preopen_` for preopen data

### Index

##### Fetch Indices Quote

``` r
nse_index_quote()
#> # A tibble: 55 x 4
#>    name              lastPrice  change pChange
#>    <chr>                 <dbl>   <dbl>   <dbl>
#>  1 NIFTY 50 Pre Open   11859.    18.3     0.15
#>  2 NIFTY 50            11872.    31.6     0.27
#>  3 NIFTY NEXT 50       28176.  -123      -0.43
#>  4 NIFTY100 LIQ 15      3670.    -9.1    -0.25
#>  5 NIFTY BANK          30750.   208.      0.68
#>  6 INDIA VIX              15.6   -0.81   -4.94
#>  7 NIFTY 100           12001.    20.4     0.17
#>  8 NIFTY 500            9650.    16.4     0.17
#>  9 NIFTY MIDCAP 100    16751.    52.6     0.31
#> 10 NIFTY MIDCAP 50      4572.    24.2     0.53
#> # ... with 45 more rows
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#> # A tibble: 10 x 12
#>    symbol series lastCorpAnnounc~ lastCorpAnnounc~ openPrice highPrice
#>    <chr>  <chr>  <date>           <chr>                <dbl>     <dbl>
#>  1 ICICI~ EQ     2019-07-22       Annual General ~      490.      500.
#>  2 INFY   EQ     2019-10-23       Interim Dividen~      696.      710.
#>  3 BAJFI~ EQ     2019-07-11       Annual General ~     4158      4221 
#>  4 HDFCB~ EQ     2019-09-19       Face Value Spli~     1264.     1277 
#>  5 MARUTI EQ     2019-08-14       Dividend - Rs 8~     7160      7270 
#>  6 BAJAJ~ EQ     2019-07-11       Annual General ~     8980.     9091 
#>  7 EICHE~ EQ     2019-07-24       Annual General ~    21500     21725 
#>  8 HCLTE~ EQ     2019-10-31       Interim Dividen~     1142.     1157.
#>  9 CIPLA  EQ     2019-07-31       Annual General ~      445.      458.
#> 10 TITAN  EQ     2019-07-29       Annual General ~     1164      1176.
#> # ... with 6 more variables: lowPrice <dbl>, ltp <dbl>,
#> #   previousPrice <dbl>, netPrice <dbl>, tradedQuantity <dbl>,
#> #   turnoverInLakhs <dbl>
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#> # A tibble: 25 x 10
#>    symbol symbolDesc dt         value  year   ltp value_old  prev change
#>    <chr>  <chr>      <date>     <dbl> <dbl> <dbl>     <dbl> <dbl>  <dbl>
#>  1 ACCEL~ Accelya S~ 2018-12-05 1125. 1125. 1110      1011.  983. 127.  
#>  2 AFFLE  Affle (In~ 2019-11-13 1704. 1704. 1662      1678  1651.  11.4 
#>  3 AGROP~ Agro Phos~ 2019-11-13  123.  123.  122.      122.  122.   0.15
#>  4 ALKEM  Alkem Lab~ 2019-11-06 2080  2080  2015      2079  2066. -50.8 
#>  5 AUBANK AU Small ~ 2019-11-13  849.  849.  825       815.  808.  16.8 
#>  6 BAJAJ~ Bajaj Fin~ 2019-11-13 9091  9091  9090      9027  8978. 112.  
#>  7 COSMO~ Cosmo Fil~ 2018-11-13  266.  266.  233.      259   238.  -4.85
#>  8 CREDI~ CREDITACC~ 2019-11-13  752   752   738       745   735    3   
#>  9 DIXON  Dixon Tec~ 2019-10-10 3360. 3360. 3279.     3232  3000. 279.  
#> 10 ESSEL~ Essel Pro~ 2019-11-13  142   142   138.      142   135.   3.2 
#> # ... with 15 more rows, and 1 more variable: pChange <dbl>
```

##### Most actively traded stocks in a month

``` r
nse_stock_most_traded()
#> # A tibble: 12 x 6
#>    security              sharetotal trdQty nooftrades avgdailyturn turnover
#>    <chr>                      <dbl>  <dbl>      <dbl>        <dbl>    <dbl>
#>  1 Yes Bank Limited            4.73  74406   13096866         1779    35577
#>  2 State Bank Of India         3.59  10008    6338506         1352    27045
#>  3 Infosys Limited             3.54   3830    6962011         1333    26663
#>  4 Reliance Industries ~       3.03   1643    4045200         1140    22804
#>  5 Indiabulls Hsg Fin L~       2.98  10506   10458041         1121    22424
#>  6 ICICI Bank Limited          2.64   4474    4052944          995    19893
#>  7 Axis Bank Limited           2.38   2595    3254378          897    17947
#>  8 HDFC Bank Limited           2.23   1372    3587458          841    16823
#>  9 Indusind Bank Limited       2.23   1312    3544497          840    16807
#> 10 Tata Motors Limited         2.18  11681    4400657          821    16427
#> 11 TOTAL of Top Ten sec~      29.5  121827   59740558        11120   222410
#> 12 TOTAL                     100    408051  258720343        37647   752931
```

### Futures & Options

##### Top futures and options gainers for the last trading session.

``` r
nse_fo_top_gainers()
#> # A tibble: 10 x 12
#>    symbol series lastCorpAnnounc~ lastCorpAnnounc~ openPrice highPrice
#>    <chr>  <chr>  <date>           <chr>                <dbl>     <dbl>
#>  1 MUTHO~ EQ     2019-09-19       Annual General ~      679       718.
#>  2 SUNTV  EQ     2019-11-21       Interim Dividen~      471.      496 
#>  3 CHOLA~ EQ     2019-07-22       Annual General ~      299.      311.
#>  4 CENTU~ EQ     2019-10-11       Demerger              393.      412.
#>  5 CADIL~ EQ     2019-07-25       Annual General ~      222.      235.
#>  6 DLF    EQ     2019-07-22       Annual General ~      203.      210.
#>  7 GLENM~ EQ     2019-09-19       Annual General ~      275       285.
#>  8 INDIGO EQ     2019-08-19       Annual General ~     1478      1525 
#>  9 AMBUJ~ EQ     2019-02-27       Dividend - Rs 1~      195.      201 
#> 10 MGL    EQ     2019-08-29       Annual General ~     1010.     1041.
#> # ... with 6 more variables: lowPrice <dbl>, ltp <dbl>,
#> #   previousPrice <dbl>, netPrice <dbl>, tradedQuantity <dbl>,
#> #   turnoverInLakhs <dbl>
```

Please note that the ‘nsetools’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
