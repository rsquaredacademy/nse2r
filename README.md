
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nsetools

> Fetch data from the National Stock Exchange, India.

<!-- badges: start -->

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/nsetools)](https://cran.r-project.org/package=nsetools)
[![Travis-CI Build
Status](https://travis-ci.org/rsquaredacademy/nsetools.svg?branch=master)](https://travis-ci.org/rsquaredacademy/nsetools)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/rsquaredacademy/nsetools?branch=master&svg=true)](https://ci.appveyor.com/project/rsquaredacademy/nsetools)
[![Coverage
Status](https://img.shields.io/codecov/c/github/rsquaredacademy/nsetools/master.svg)](https://codecov.io/github/rsquaredacademy/nsetools?branch=master)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

## Overview

[NSE](https://www.nseindia.com/) (National Stock Exchange) is the
leading stock exchange of India, located in the city of Mumbai. While
users can manually download data from NSE through a browser, importing
this data into R is then cumbersome. The nsetools R package implements
the retrieval of data from NSE and aims to reduce the pre-processing
steps needed in analyzing such data.

nsetools is inspired by and a port of the Python package
[nsetools](https://nsetools.readthedocs.io/en/latest/). The authors and
contributors for this R package are not affiliated with NSE and NSE does
not offer support for this R package.

With nsetools, you can fetch the following data related to:

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
    nsetools](https://nsetools.rsquaredacademy.com/articles/introduction-to-nsetools.html)

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
#>    name              lastPrice change pChange
#>    <chr>                 <dbl>  <dbl>   <dbl>
#>  1 NIFTY 50 Pre Open   11904.   32.1     0.27
#>  2 NIFTY 50            11895.   23.4     0.2 
#>  3 NIFTY NEXT 50       28196.   20.0     0.07
#>  4 NIFTY100 LIQ 15      3680.   10.2     0.28
#>  5 NIFTY BANK          31008.  258.      0.84
#>  6 INDIA VIX              15.0  -0.62   -3.96
#>  7 NIFTY 100           12023.   21.7     0.18
#>  8 NIFTY 500            9667.   16.9     0.18
#>  9 NIFTY MIDCAP 100    16804.   52.6     0.31
#> 10 NIFTY MIDCAP 50      4597.   24.4     0.53
#> # ... with 45 more rows
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#> # A tibble: 10 x 12
#>    symbol series lastCorpAnnounc~ lastCorpAnnounc~ openPrice highPrice
#>    <chr>  <chr>  <date>           <chr>                <dbl>     <dbl>
#>  1 INFRA~ EQ     2019-08-22       Interim Dividen~      204.      234 
#>  2 BHART~ EQ     2019-04-23       Rights 19:67 @ ~      358.      398.
#>  3 SBIN   EQ     2018-06-15       Annual General ~      312       324.
#>  4 ZEEL   EQ     2019-07-15       Annual General ~      285.      293.
#>  5 GRASIM EQ     2019-08-08       Annual General ~      735       768 
#>  6 CIPLA  EQ     2019-07-31       Annual General ~      448       468.
#>  7 GAIL   EQ     2019-08-08       Dividend - Rs 0~      123.      124.
#>  8 ULTRA~ EQ     2019-07-10       Annual General ~     4044.     4094 
#>  9 KOTAK~ EQ     2019-07-12       Annual General ~     1606      1629 
#> 10 SUNPH~ EQ     2019-08-20       Annual General ~      413.      419.
#> # ... with 6 more variables: lowPrice <dbl>, ltp <dbl>,
#> #   previousPrice <dbl>, netPrice <dbl>, tradedQuantity <dbl>,
#> #   turnoverInLakhs <dbl>
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#> # A tibble: 27 x 10
#>    symbol symbolDesc dt           value    year     ltp value_old    prev
#>    <chr>  <chr>      <date>       <dbl>   <dbl>   <dbl>     <dbl>   <dbl>
#>  1 ABBOT~ Abbott In~ 2019-11-04 1.25e+4 1.25e+4 1.24e+4  12400    12043. 
#>  2 AGROP~ Agro Phos~ 2019-11-14 1.23e+2 1.23e+2 1.23e+2    123.     122. 
#>  3 ANKIT~ Ankit Met~ 2019-08-06 6.50e-1 6.50e-1 6.50e-1      0.65     0.6
#>  4 BAJAJ~ Bajaj Fin~ 2019-11-14 9.14e+3 9.14e+3 9.06e+3   9091     9062. 
#>  5 BANSW~ Banswara ~ 2018-11-16 1.02e+2 1.02e+2 9.44e+1     99.3     89.1
#>  6 BHARA~ Bharat Ra~ 2019-11-08 7.02e+3 7.02e+3 6.56e+3   6775.    6599. 
#>  7 BHART~ Bharti Ai~ 2019-10-14 3.98e+2 3.98e+2 3.96e+2    397      362. 
#>  8 CHOLA~ Cholamand~ 2019-11-04 3.31e+2 3.31e+2 3.31e+2    325      309. 
#>  9 CREDI~ CREDITACC~ 2019-11-14 7.87e+2 7.87e+2 7.72e+2    752      732. 
#> 10 DIXON  Dixon Tec~ 2019-11-14 3.38e+3 3.38e+3 3.29e+3   3360.    3263. 
#> # ... with 17 more rows, and 2 more variables: change <dbl>, pChange <dbl>
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
#>  1 IDEA   EQ     2019-08-16       Annual General ~       2.7       3.9
#>  2 INFRA~ EQ     2019-08-22       Interim Dividen~     204.      234  
#>  3 BHART~ EQ     2019-04-23       Rights 19:67 @ ~     358.      398. 
#>  4 CHOLA~ EQ     2019-07-22       Annual General ~     311.      331. 
#>  5 GLENM~ EQ     2019-09-19       Annual General ~     298.      306  
#>  6 SBIN   EQ     2018-06-15       Annual General ~     312       324. 
#>  7 DIVIS~ EQ     2019-08-14       Annual General ~    1645      1759. 
#>  8 BANKI~ EQ     2019-06-20       Annual General ~      66.6      71.2
#>  9 BALKR~ EQ     2019-11-21       Interim Dividend     815.      880  
#> 10 ZEEL   EQ     2019-07-15       Annual General ~     285.      293. 
#> # ... with 6 more variables: lowPrice <dbl>, ltp <dbl>,
#> #   previousPrice <dbl>, netPrice <dbl>, tradedQuantity <dbl>,
#> #   turnoverInLakhs <dbl>
```

Please note that the ‘nsetools’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
