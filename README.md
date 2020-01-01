
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nse2r

> Fetch data from the National Stock Exchange, India.

<!-- badges: start -->

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/nse2r)](https://cran.r-project.org/package=nse2r)
[![cran
checks](https://cranchecks.info/badges/summary/nse2r)](https://cran.r-project.org/web/checks/check_results_nse2r.html)
[![Travis-CI Build
Status](https://travis-ci.org/rsquaredacademy/nse2r.svg?branch=master)](https://travis-ci.org/rsquaredacademy/nse2r)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/rsquaredacademy/nse2r?branch=master&svg=true)](https://ci.appveyor.com/project/rsquaredacademy/nse2r)
[![Coverage
Status](https://img.shields.io/codecov/c/github/rsquaredacademy/nse2r/master.svg)](https://codecov.io/github/rsquaredacademy/nse2r?branch=master)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![](https://cranlogs.r-pkg.org/badges/grand-total/nse2r)](https://cran.r-project.org/package=nse2r)
<!-- badges: end -->

## Overview

[NSE](https://www.nseindia.com/) (National Stock Exchange) is the
leading stock exchange of India, located in the city of Mumbai. While
users can manually download data from NSE through a browser, importing
this data into R becomes cumbersome. The nse2r R package implements the
retrieval of data from NSE and aims to reduce the pre-processing steps
needed in analyzing such data.

nse2r is inspired by and a port of the Python package
[nsetools](https://nsetools.readthedocs.io/en/latest/). The authors and
contributors for this R package are not affiliated with NSE and NSE does
not offer support for this R package.

With nse2r, you can fetch the following data related to:

  - stocks
      - quote for a given stock
      - stock description
      - validate stock symbol/ticker
      - most actively traded stocks in a month
      - 52 week high/low
      - top gainers/losers for the last trading session
  - index
      - list of NSE indices
      - validate index symbol/ticker
      - quote for a given index
  - futures & options
      - top gainers/losers for the last trading session
  - pre open market data
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

## Preprocessing

nse2r does basic data preprocessing which are listed below:

  - modify column data types from `character` to `numeric` and `Date`
  - modify column names
      - make them more descriptive
      - to `snake_case` from `camelCase`

Users can retain the names and format as returned by NSE using the
`clean_names` argument and setting it to `FALSE`.

### Index

##### Fetch Indices Quote

``` r
nse_index_quote()
#> # A tibble: 55 x 4
#>    index_name        last_traded_price change percent_change
#>    <chr>                         <dbl>  <dbl>          <dbl>
#>  1 NIFTY 50 Pre Open           12202.   33.7            0.28
#>  2 NIFTY 50                    12178.    9.4            0.08
#>  3 NIFTY NEXT 50               28292.  -16.0           -0.06
#>  4 NIFTY100 LIQ 15              3832.  -11.7           -0.3 
#>  5 NIFTY BANK                  32091.  -70.4           -0.22
#>  6 INDIA VIX                      11.7   0             -0.02
#>  7 NIFTY 100                   12275.    7.15           0.06
#>  8 NIFTY 500                    9886.   13.2            0.13
#>  9 NIFTY MIDCAP 100            17147.   44.3            0.26
#> 10 NIFTY MIDCAP 50              4711.    9.7            0.21
#> # ... with 45 more rows

# retain original column names as returned by NSE
nse_index_quote(clean_names = FALSE)
#> # A tibble: 55 x 4
#>    name              lastPrice change pChange
#>    <chr>                 <dbl>  <dbl>   <dbl>
#>  1 NIFTY 50 Pre Open   12202.   33.7     0.28
#>  2 NIFTY 50            12178.    9.4     0.08
#>  3 NIFTY NEXT 50       28292.  -16.0    -0.06
#>  4 NIFTY100 LIQ 15      3832.  -11.7    -0.3 
#>  5 NIFTY BANK          32091.  -70.4    -0.22
#>  6 INDIA VIX              11.7   0      -0.02
#>  7 NIFTY 100           12275.    7.15    0.06
#>  8 NIFTY 500            9886.   13.2     0.13
#>  9 NIFTY MIDCAP 100    17147.   44.3     0.26
#> 10 NIFTY MIDCAP 50      4711.    9.7     0.21
#> # ... with 45 more rows
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#> # A tibble: 10 x 12
#>    symbol series last_corp_annou~ last_corp_annou~ open_price high_price
#>    <chr>  <chr>  <date>           <chr>                 <dbl>      <dbl>
#>  1 ADANI~ EQ     2019-07-26       Annual General ~       368        379.
#>  2 POWER~ EQ     2019-08-19       Annual General ~       191.       194 
#>  3 NTPC   EQ     2019-08-13       Dividend - Rs 2~       119.       121.
#>  4 VEDL   EQ     2019-07-04       Annual General ~       153.       155.
#>  5 M&M    EQ     2019-07-18       Annual General ~       533.       538.
#>  6 WIPRO  EQ     2019-06-20       Buyback                246.       249.
#>  7 ASIAN~ EQ     2019-10-30       Interim Dividen~      1790.      1803.
#>  8 LT     EQ     2019-07-24       Annual General ~      1308.      1319.
#>  9 INFRA~ EQ     2019-12-19       Interim Dividen~       254        258.
#> 10 HDFC   EQ     2019-07-19       Annual General ~      2418       2434.
#> # ... with 6 more variables: low_price <dbl>, last_traded_price <dbl>,
#> #   prev_close_price <dbl>, percent_change <dbl>, traded_quantity <dbl>,
#> #   turnover_in_lakhs <dbl>

# retain original column names as returned by NSE
nse_stock_top_gainers(clean_names = FALSE)
#> # A tibble: 10 x 12
#>    symbol series lastCorpAnnounc~ lastCorpAnnounc~ openPrice highPrice
#>    <chr>  <chr>  <date>           <chr>                <dbl>     <dbl>
#>  1 ADANI~ EQ     2019-07-26       Annual General ~      368       379.
#>  2 POWER~ EQ     2019-08-19       Annual General ~      191.      194 
#>  3 NTPC   EQ     2019-08-13       Dividend - Rs 2~      119.      121.
#>  4 VEDL   EQ     2019-07-04       Annual General ~      153.      155.
#>  5 M&M    EQ     2019-07-18       Annual General ~      533.      538.
#>  6 WIPRO  EQ     2019-06-20       Buyback               246.      249.
#>  7 ASIAN~ EQ     2019-10-30       Interim Dividen~     1790.     1803.
#>  8 LT     EQ     2019-07-24       Annual General ~     1308.     1319.
#>  9 INFRA~ EQ     2019-12-19       Interim Dividen~      254       258.
#> 10 HDFC   EQ     2019-07-19       Annual General ~     2418      2434.
#> # ... with 6 more variables: lowPrice <dbl>, ltp <dbl>,
#> #   previousPrice <dbl>, netPrice <dbl>, tradedQuantity <dbl>,
#> #   turnoverInLakhs <dbl>
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#> # A tibble: 35 x 10
#>    symbol symbol_desc date       new_high   year last_traded_pri~ prev_high
#>    <chr>  <chr>       <date>        <dbl>  <dbl>            <dbl>     <dbl>
#>  1 ADANI~ Adani Gree~ 2019-12-31    175.   175.             174.      166. 
#>  2 AKASH  Akash Infr~ 2019-12-23     71.5   71.5             63.5      70.2
#>  3 ALEMB~ Alembic Li~ 2019-12-31     63.6   63.6             61.7      60.9
#>  4 ALKYL~ Alkyl Amin~ 2019-11-27   1135.  1135.            1114.     1107. 
#>  5 APEX   Apex Froze~ 2018-12-31    407    407              399.      383. 
#>  6 APLAP~ APL Apollo~ 2019-12-31   1939   1939             1931.     1893. 
#>  7 ASTER~ Aster DM H~ 2019-01-17    171.   171.             164.      168  
#>  8 AVANT~ Avanti Fee~ 2019-12-24    612.   612.             607.      599  
#>  9 BALRA~ Balrampur ~ 2019-12-30    188.   188.             187.      187  
#> 10 BANSW~ Banswara S~ 2019-12-31    112.   112.             112.      106. 
#> # ... with 25 more rows, and 3 more variables: prev_close <dbl>,
#> #   change <dbl>, percent_change <dbl>

# retain original column names as returned by NSE
nse_stock_year_high(clean_names = FALSE)
#> # A tibble: 35 x 10
#>    symbol symbolDesc dt          value   year    ltp value_old   prev
#>    <chr>  <chr>      <date>      <dbl>  <dbl>  <dbl>     <dbl>  <dbl>
#>  1 ADANI~ Adani Gre~ 2019-12-31  175.   175.   174.      166.   166. 
#>  2 AKASH  Akash Inf~ 2019-12-23   71.5   71.5   63.5      70.2   65  
#>  3 ALEMB~ Alembic L~ 2019-12-31   63.6   63.6   61.7      60.9   59.6
#>  4 ALKYL~ Alkyl Ami~ 2019-11-27 1135.  1135.  1114.     1107.  1085  
#>  5 APEX   Apex Froz~ 2018-12-31  407    407    399.      383.   345. 
#>  6 APLAP~ APL Apoll~ 2019-12-31 1939   1939   1931.     1893.  1878. 
#>  7 ASTER~ Aster DM ~ 2019-01-17  171.   171.   164.      168    161. 
#>  8 AVANT~ Avanti Fe~ 2019-12-24  612.   612.   607.      599    584  
#>  9 BALRA~ Balrampur~ 2019-12-30  188.   188.   187.      187    183. 
#> 10 BANSW~ Banswara ~ 2019-12-31  112.   112.   112.      106.   106. 
#> # ... with 25 more rows, and 2 more variables: change <dbl>, pChange <dbl>
```

##### Most actively traded stocks in a month

``` r
nse_stock_most_traded()
#> # A tibble: 12 x 6
#>    security share_turnover traded_quantity no_of_trades avg_daily_turno~
#>    <chr>             <dbl>           <dbl>        <dbl>            <dbl>
#>  1 Yes Ban~           4.38           57140     11058530            1423.
#>  2 Relianc~           3.93            1715      3803882            1276.
#>  3 Indiabu~           3.91            9077      8060572            1271.
#>  4 State B~           3.43            7114      4624946            1114.
#>  5 Tata Co~           2.69             866      2891204             875.
#>  6 ICICI B~           2.51            3204      2969145             814.
#>  7 HDFC Li~           2.33             670      2510572             756.
#>  8 Tata St~           2.26            3541      3008166             733.
#>  9 HDFC Ba~           2.18            1170      2969084             707.
#> 10 Tata Mo~           2.07            8128      3536571             671.
#> 11 TOTAL o~          29.7            92625     45432672            9640.
#> 12 TOTAL            100             391115    223723721           32475.
#> # ... with 1 more variable: turnover <dbl>

# retain original column names as returned by NSE
nse_stock_most_traded(clean_names = FALSE)
#> # A tibble: 12 x 6
#>    security              sharetotal trdQty nooftrades avgdailyturn turnover
#>    <chr>                      <dbl>  <dbl>      <dbl>        <dbl>    <dbl>
#>  1 Yes Bank Limited            4.38  57140   11058530        1423.   29880.
#>  2 Reliance Industries ~       3.93   1715    3803882        1276.   26799.
#>  3 Indiabulls Hsg Fin L~       3.91   9077    8060572        1271.   26683.
#>  4 State Bank of India         3.43   7114    4624946        1114.   23391.
#>  5 Tata Consultancy Ser~       2.69    866    2891204         875.   18367.
#>  6 ICICI Bank Limited          2.51   3204    2969145         814.   17098.
#>  7 HDFC Limited                2.33    670    2510572         756.   15868.
#>  8 Tata Steel Limited          2.26   3541    3008166         733.   15396.
#>  9 HDFC Bank Limited           2.18   1170    2969084         707.   14848.
#> 10 Tata Motors Limited         2.07   8128    3536571         671.   14100.
#> 11 TOTAL of Top Ten sec~      29.7   92625   45432672        9640.  202431.
#> 12 TOTAL                     100    391115  223723721       32475.  681983.
```

### Futures & Options

##### Top futures and options gainers for the last trading session.

``` r
nse_fo_top_gainers()
#> # A tibble: 10 x 12
#>    symbol series last_corp_annou~ last_corp_annou~ open_price high_price
#>    <chr>  <chr>  <date>           <chr>                 <dbl>      <dbl>
#>  1 ADANI~ EQ     2019-07-26       Annual General ~      368        379. 
#>  2 M&MFIN EQ     2019-07-15       Annual General ~      324.       331. 
#>  3 ADANI~ EQ     2019-07-30       Annual General ~       61.8       63.8
#>  4 POWER~ EQ     2019-08-19       Annual General ~      191.       194  
#>  5 NTPC   EQ     2019-08-13       Dividend - Rs 2~      119.       121. 
#>  6 MINDT~ EQ     2019-10-24       Interim Dividen~      801        814  
#>  7 TATAP~ EQ     2019-06-04       Annual General ~       56.8       57.6
#>  8 PIDIL~ EQ     2019-07-29       Annual General ~     1388.      1412  
#>  9 IDFCF~ EQ     2018-07-23       Dividend Re 0.7~       45.4       45.8
#> 10 MFSL   EQ     2019-09-16       Annual General ~      537        546. 
#> # ... with 6 more variables: low_price <dbl>, last_traded_price <dbl>,
#> #   prev_close_price <dbl>, percent_change <dbl>, traded_quantity <dbl>,
#> #   turnover_in_lakhs <dbl>

# retain original column names as returned by NSE
nse_fo_top_gainers(clean_names = FALSE)
#> # A tibble: 10 x 12
#>    symbol series lastCorpAnnounc~ lastCorpAnnounc~ openPrice highPrice
#>    <chr>  <chr>  <date>           <chr>                <dbl>     <dbl>
#>  1 ADANI~ EQ     2019-07-26       Annual General ~     368       379. 
#>  2 M&MFIN EQ     2019-07-15       Annual General ~     324.      331. 
#>  3 ADANI~ EQ     2019-07-30       Annual General ~      61.8      63.8
#>  4 POWER~ EQ     2019-08-19       Annual General ~     191.      194  
#>  5 NTPC   EQ     2019-08-13       Dividend - Rs 2~     119.      121. 
#>  6 MINDT~ EQ     2019-10-24       Interim Dividen~     801       814  
#>  7 TATAP~ EQ     2019-06-04       Annual General ~      56.8      57.6
#>  8 PIDIL~ EQ     2019-07-29       Annual General ~    1388.     1412  
#>  9 IDFCF~ EQ     2018-07-23       Dividend Re 0.7~      45.4      45.8
#> 10 MFSL   EQ     2019-09-16       Annual General ~     537       546. 
#> # ... with 6 more variables: lowPrice <dbl>, ltp <dbl>,
#> #   previousPrice <dbl>, netPrice <dbl>, tradedQuantity <dbl>,
#> #   turnoverInLakhs <dbl>
```

### Pre Open Market Data

##### Fetch data of pre open session of Nifty Bank.

``` r
nse_preopen_nifty_bank()
#> # A tibble: 12 x 17
#>    symbol series corp_action_date corp_action  price change percent_change
#>    <chr>  <chr>  <date>           <chr>        <dbl>  <dbl>          <dbl>
#>  1 IDFCF~ EQ     NA               <NA>          45.4   0.2            0.44
#>  2 BANKB~ EQ     NA               <NA>         102.    0.35           0.34
#>  3 FEDER~ EQ     NA               <NA>          88.2   0.3            0.34
#>  4 RBLBA~ EQ     NA               <NA>         346     1.15           0.33
#>  5 HDFCB~ EQ     NA               <NA>        1276.    4              0.31
#>  6 KOTAK~ EQ     NA               <NA>        1689     4.65           0.28
#>  7 SBIN   EQ     NA               <NA>         335.    0.95           0.28
#>  8 PNB    EQ     NA               <NA>          64.5   0.15           0.23
#>  9 ICICI~ EQ     NA               <NA>         540.    1              0.19
#> 10 INDUS~ EQ     NA               <NA>        1512     2              0.13
#> 11 AXISB~ EQ     NA               <NA>         755.    0.8            0.11
#> 12 YESBA~ EQ     NA               <NA>          47.0   0              0   
#> # ... with 10 more variables: prev_close <dbl>, quantity <dbl>,
#> #   value <dbl>, mkt_cap <dbl>, year_high <dbl>, year_low <dbl>,
#> #   sum_val <dbl>, sum_quantity <dbl>, fin_quantity <dbl>,
#> #   sum_fin_quantity <dbl>

# retain original column names as returned by NSE
nse_preopen_nifty(clean_names = FALSE)
#> # A tibble: 50 x 17
#>    symbol series xDt        caAct   iep   chn perChn  pCls trdQnty  iVal
#>    <chr>  <chr>  <date>     <chr> <dbl> <dbl>  <dbl> <dbl>   <dbl> <dbl>
#>  1 BAJAJ~ EQ     NA         <NA>  3183  -2     -0.06 3185      840 26.7 
#>  2 ONGC   EQ     NA         <NA>   129. -0.05  -0.04  129.    5623  7.24
#>  3 LT     EQ     NA         <NA>  1308. 10.2    0.79 1298.    5444 71.2 
#>  4 ZEEL   EQ     NA         <NA>   294   1.8    0.62  292.   17926 52.7 
#>  5 CIPLA  EQ     NA         <NA>   481   2.8    0.59  478.    2629 12.6 
#>  6 INFRA~ EQ     2019-12-19 INTE~  254   1.5    0.59  252.    8799 22.4 
#>  7 BRITA~ EQ     NA         <NA>  3045. 16.9    0.56 3028.     126  3.84
#>  8 TITAN  EQ     NA         <NA>  1194.  6.5    0.55 1188.    1196 14.3 
#>  9 ADANI~ EQ     NA         <NA>   368   2      0.55  366    13113 48.3 
#> 10 INFY   EQ     2019-10-23 INTE~  735   3.85   0.53  731.    5174 38.0 
#> # ... with 40 more rows, and 7 more variables: mktCap <dbl>, yHigh <dbl>,
#> #   yLow <dbl>, sumVal <dbl>, sumQnty <dbl>, finQnty <dbl>,
#> #   sumfinQnty <dbl>
```

### Advances & Declines

``` r
nse_advances_declines()
#> # A tibble: 57 x 4
#>    index_name      advances declines unchanged
#>    <chr>              <dbl>    <dbl>     <dbl>
#>  1 NIFTY 50              23       25         2
#>  2 NIFTY NEXT 50         26       23         1
#>  3 NIFTY IT               7        3         0
#>  4 NIFTY BANK             5        6         1
#>  5 NIFTY MIDCAP 50       25       24         1
#>  6 NIFTY INFRA           14       15         1
#>  7 NIFTY REALTY           4        5         1
#>  8 NIFTY ENERGY           7        3         0
#>  9 NIFTY FMCG            11        3         1
#> 10 NIFTY MNC             16       13         1
#> # ... with 47 more rows

# retain original column names as returned by NSE
nse_advances_declines(clean_names = FALSE)
#> # A tibble: 57 x 4
#>    indice          advances declines unchanged
#>    <chr>              <dbl>    <dbl>     <dbl>
#>  1 NIFTY 50              23       25         2
#>  2 NIFTY NEXT 50         26       23         1
#>  3 NIFTY IT               7        3         0
#>  4 NIFTY BANK             5        6         1
#>  5 NIFTY MIDCAP 50       25       24         1
#>  6 NIFTY INFRA           14       15         1
#>  7 NIFTY REALTY           4        5         1
#>  8 NIFTY ENERGY           7        3         0
#>  9 NIFTY FMCG            11        3         1
#> 10 NIFTY MNC             16       13         1
#> # ... with 47 more rows
```

Please note that the ‘nse2r’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
