
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
      - lot size
      - top gainers/losers for the last trading session
  - pre open data
      - nifty
      - nifty bank
      - nifty futures & options
  - indices advances & declines

## Installation

You can install the development version of nse2r from
[GitHub](https://github.com/rsquaredacademy/nse2r/) with:

``` r
# install.packages("devtools")
devtools::install_github("rsquaredacademy/nse2r")
```

## Articles

  - [Introduction to
    nse2r](https://nse2r.rsquaredacademy.com/articles/introduction-to-nse2r.html)

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
#>    name              lastPrice change pChange
#>    <chr>                 <dbl>  <dbl>   <dbl>
#>  1 NIFTY 50 Pre Open   11919.   35.0    0.290
#>  2 NIFTY 50            11933.   48.4    0.41 
#>  3 NIFTY NEXT 50       28104.  -50.5   -0.18 
#>  4 NIFTY100 LIQ 15      3722.   22.8    0.62 
#>  5 NIFTY BANK          31236.  244.     0.79 
#>  6 INDIA VIX              15.5  -0.27  -1.71 
#>  7 NIFTY 100           12050.   39.2    0.33 
#>  8 NIFTY 500            9698.   29.8    0.31 
#>  9 NIFTY MIDCAP 100    16937.    5.65   0.03 
#> 10 NIFTY MIDCAP 50      4644.    5.05   0.11 
#> # ... with 45 more rows
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#> # A tibble: 10 x 12
#>    symbol series lastCorpAnnounc~ lastCorpAnnounc~ openPrice highPrice
#>    <chr>  <chr>  <date>           <chr>                <dbl>     <dbl>
#>  1 INFRA~ EQ     2019-08-22       Interim Dividen~      228.      243.
#>  2 BHART~ EQ     2019-04-23       Rights 19:67 @ ~      427.      435 
#>  3 CIPLA  EQ     2019-07-31       Annual General ~      461.      478.
#>  4 AXISB~ EQ     2019-07-04       Annual General ~      725       744.
#>  5 RELIA~ EQ     2019-08-02       Annual General ~     1467      1497.
#>  6 INDUS~ EQ     2019-08-08       Annual General ~     1382      1409 
#>  7 TECHM  EQ     2019-07-25       Annual General ~      754       766 
#>  8 GRASIM EQ     2019-08-08       Annual General ~      775       794.
#>  9 INFY   EQ     2019-10-23       Interim Dividen~      710.      712.
#> 10 SUNPH~ EQ     2019-08-20       Annual General ~      425       429.
#> # ... with 6 more variables: lowPrice <dbl>, ltp <dbl>,
#> #   previousPrice <dbl>, netPrice <dbl>, tradedQuantity <dbl>,
#> #   turnoverInLakhs <dbl>
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#> # A tibble: 20 x 10
#>    symbol symbolDesc dt          value   year    ltp value_old    prev
#>    <chr>  <chr>      <date>      <dbl>  <dbl>  <dbl>     <dbl>   <dbl>
#>  1 ABSLB~ Aditya Bi~ 2019-11-04  330    330    328       330    330.  
#>  2 ACCEL~ Accelya S~ 2019-11-18 1245.  1245.  1190      1129   1073.  
#>  3 AGROP~ Agro Phos~ 2019-11-18  125.   125.   125.      124.   124.  
#>  4 ALKEM  Alkem Lab~ 2019-11-18 2150   2150   2122.     2110   2100.  
#>  5 ANKIT~ Ankit Met~ 2019-11-18    0.7    0.7    0.7       0.7    0.65
#>  6 BAJAJ~ Bajaj Fin~ 2019-11-15 9189   9189   9177.     9140   9104.  
#>  7 BHART~ Bharti Ai~ 2019-11-18  435    435    430.      421.   409.  
#>  8 CREDI~ CREDITACC~ 2019-11-18  828.   828.   823.      799    793   
#>  9 DYNPRO Dynemic P~ 2019-11-18  155    155    152.      150.   148.  
#> 10 ESSEL~ Essel Pro~ 2019-11-14  149.   149.   145.      142    137.  
#> 11 IPCAL~ IPCA Labo~ 2019-11-18 1188.  1188.  1150      1176.  1160.  
#> 12 LALPA~ Dr. Lal P~ 2019-10-29 1673.  1673.  1665.     1665   1600   
#> 13 NPBET  Tata Nift~ 2019-11-08  175.   175.   175       175.   173.  
#> 14 POLYC~ Polycab I~ 2019-11-18  949.   949.   926.      944.   933.  
#> 15 RELIA~ Reliance ~ 2019-10-31 1497.  1497.  1495.     1490.  1459.  
#> 16 RITES  RITES Lim~ 2019-07-05  318.   318.   316.      315.   301.  
#> 17 SHRED~ Shree Dig~ 2019-11-18   27.0   27.0   25.9      26.4   26.4 
#> 18 SIRCA  Sirca Pai~ 2019-11-15  249.   249.   244.      247.   242.  
#> 19 VIKAS~ Vikas Pro~ 2019-08-19    4.5    4.5    4.5       4.5    4.45
#> 20 VISES~ Visesh In~ 2019-11-18    0.1    0.1    0.1       0.1    0.05
#> # ... with 2 more variables: change <dbl>, pChange <dbl>
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
#>  1 IDEA   EQ     2019-08-16       Annual General ~      4.85       5.8
#>  2 JUSTD~ EQ     2018-10-11       Buyback             531        564. 
#>  3 INFRA~ EQ     2019-08-22       Interim Dividen~    228.       243. 
#>  4 BHART~ EQ     2019-04-23       Rights 19:67 @ ~    427.       435  
#>  5 CASTR~ EQ     2019-08-08       Interim Dividen~    145.       152. 
#>  6 UNION~ EQ     2019-06-20       Annual General ~     55.0       57.2
#>  7 CIPLA  EQ     2019-07-31       Annual General ~    461.       478. 
#>  8 BANKI~ EQ     2019-06-20       Annual General ~     71.5       73.7
#>  9 TATAE~ EQ     2019-07-08       Annual General ~    792.       831. 
#> 10 L&TFH  EQ     2019-07-19       Annual General ~     97.9      102. 
#> # ... with 6 more variables: lowPrice <dbl>, ltp <dbl>,
#> #   previousPrice <dbl>, netPrice <dbl>, tradedQuantity <dbl>,
#> #   turnoverInLakhs <dbl>
```

Please note that the ‘nse2r’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
