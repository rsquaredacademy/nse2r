
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
users can manually download data from NSE through a browser and then
importing this data into R becomes cumbersome. The nse2r R package
implements the retrieval of data from NSE and aims to reduce the
pre-processing steps needed in analyzing such data.

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

### Index

##### Fetch Indices Quote

``` r
nse_index_quote()
#> # A tibble: 55 x 4
#>    index_name        last_traded_price  change percent_change
#>    <chr>                         <dbl>   <dbl>          <dbl>
#>  1 NIFTY 50 Pre Open           12047.    29.0            0.24
#>  2 NIFTY 50                    11922.   -96.9           -0.81
#>  3 NIFTY NEXT 50               27854.  -292.            -1.04
#>  4 NIFTY100 LIQ 15              3652    -82.6           -2.21
#>  5 NIFTY BANK                  31342.  -371.            -1.17
#>  6 INDIA VIX                      13.6   -0.66          -4.65
#>  7 NIFTY 100                   12025.  -102.            -0.84
#>  8 NIFTY 500                    9669.   -88.2           -0.9 
#>  9 NIFTY MIDCAP 100            16732   -248.            -1.46
#> 10 NIFTY MIDCAP 50              4556.   -87.6           -1.89
#> # ... with 45 more rows
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#> # A tibble: 9 x 12
#>   symbol series last_corp_annou~ last_corp_annou~ open_price high_price
#>   <chr>  <chr>  <date>           <chr>                 <dbl>      <dbl>
#> 1 INFRA~ EQ     2019-08-22       Interim Dividen~       248.       262 
#> 2 KOTAK~ EQ     2019-07-12       Annual General ~      1650       1680 
#> 3 JSWST~ EQ     2019-07-08       Annual General ~       253.       257.
#> 4 TATAS~ EQ     2019-07-04       Annual General ~       401.       408.
#> 5 DRRED~ EQ     2019-07-15       Annual General ~      2888.      2949 
#> 6 RELIA~ EQ     2019-08-02       Annual General ~      1553       1568 
#> 7 ASIAN~ EQ     2019-10-30       Interim Dividen~      1723.      1748.
#> 8 TCS    EQ     2019-10-17       Interim Dividen~      2124       2128 
#> 9 ULTRA~ EQ     2019-07-10       Annual General ~      4180       4196.
#> # ... with 6 more variables: low_price <dbl>, last_traded_price <dbl>,
#> #   prev_close_price <dbl>, percent_change <dbl>, traded_quantity <dbl>,
#> #   turnover_in_lakhs <dbl>
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#> # A tibble: 16 x 10
#>    symbol symbol_desc date       new_high   year last_traded_pri~ prev_high
#>    <chr>  <chr>       <date>        <dbl>  <dbl>            <dbl>     <dbl>
#>  1 AGROP~ Agro Phos ~ 2019-12-05   139.   139.             139.      138.  
#>  2 AKASH  Akash Infr~ 2019-10-30    68.2   68.2             65.0      66.5 
#>  3 BIOFI~ Biofil Che~ 2019-12-05    10.7   10.7             10.7      10.2 
#>  4 CREAT~ Creative P~ 2019-12-04    89.4   89.4             82.2      85.8 
#>  5 CUB    City Union~ 2019-12-02   237    237              234.      235.  
#>  6 CURAT~ Cura Techn~ 2019-12-05     1.85   1.85             1.85      1.85
#>  7 GUJGA~ Gujarat Ga~ 2019-12-05   228.   228.             228.      228.  
#>  8 IIFLS~ IIFL Secur~ 2019-10-30    32.4   32.4             32.4      31.7 
#>  9 ISEC   ICICI Secu~ 2019-12-04   360.   360.             357.      356   
#> 10 MASFIN MAS Financ~ 2019-12-05   798    798              776.      785   
#> 11 MFSL   Max Financ~ 2019-12-05   535    535              518.      533.  
#> 12 NH     Narayana H~ 2019-11-13   319.   319.             303       317.  
#> 13 SANGI~ Sanginita ~ 2019-12-03   156.   156.             145.      154.  
#> 14 UVSL   Uttam Valu~ 2019-12-05     0.15   0.15             0.15      0.15
#> 15 VIKAS~ Vikas Prop~ 2019-12-05     5.3    5.3              5.3       5.2 
#> 16 VISES~ Visesh Inf~ 2019-12-05     0.1    0.1              0.1       0.1 
#> # ... with 3 more variables: prev_close <dbl>, change <dbl>,
#> #   percent_change <dbl>
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
#>  1 INFRA~ EQ     2019-08-22       Interim Dividen~       248.       262 
#>  2 CENTU~ EQ     2019-10-11       Demerger               473.       491.
#>  3 COLPAL EQ     2019-11-05       Interim Dividen~      1453       1494 
#>  4 KOTAK~ EQ     2019-07-12       Annual General ~      1650       1680 
#>  5 BERGE~ EQ     2019-07-26       Annual General ~       495        516.
#>  6 EQUIT~ EQ     2019-07-25       Annual General ~       113.       114.
#>  7 BIOCON EQ     2019-07-18       Dividend - Rs 0~       288.       293.
#>  8 JSWST~ EQ     2019-07-08       Annual General ~       253.       257.
#>  9 PIDIL~ EQ     2019-07-29       Annual General ~      1313.      1338 
#> 10 MOTHE~ EQ     2019-08-08       Annual General ~       132.       134 
#> # ... with 6 more variables: low_price <dbl>, last_traded_price <dbl>,
#> #   prev_close_price <dbl>, percent_change <dbl>, traded_quantity <dbl>,
#> #   turnover_in_lakhs <dbl>
```

### Pre Open Market Data

##### Fetch data of pre open session of Nifty Bank.

``` r
nse_preopen_nifty_bank()
#> # A tibble: 12 x 13
#>    symbol series corp_action_date corp_action  price change percent_change
#>    <chr>  <chr>  <date>           <chr>        <dbl>  <dbl>          <dbl>
#>  1 YESBA~ EQ     NA               <NA>          60.1  -2            -3.22 
#>  2 BANKB~ EQ     NA               <NA>         103.    1.05          1.03 
#>  3 RBLBA~ EQ     NA               <NA>         368.    2             0.55 
#>  4 AXISB~ EQ     NA               <NA>         733.    3.55          0.49 
#>  5 INDUS~ EQ     NA               <NA>        1517     7.25          0.48 
#>  6 IDFCF~ EQ     NA               <NA>          44.8   0.2           0.45 
#>  7 PNB    EQ     NA               <NA>          62.6   0.25          0.4  
#>  8 ICICI~ EQ     NA               <NA>         530.    1.95          0.37 
#>  9 FEDER~ EQ     NA               <NA>          87     0.25          0.290
#> 10 HDFCB~ EQ     2019-09-19       FACE VALUE~ 1249.    3.35          0.27 
#> 11 SBIN   EQ     NA               <NA>         337.    0.5           0.15 
#> 12 KOTAK~ EQ     NA               <NA>        1650     0.7           0.04 
#> # ... with 6 more variables: prev_close <dbl>, quantity <dbl>,
#> #   value <dbl>, mkt_cap <dbl>, year_high <dbl>, year_low <dbl>
```

### Advances & Declines

``` r
nse_advances_declines()
#> # A tibble: 59 x 4
#>    index_name      advances declines unchanged
#>    <chr>              <dbl>    <dbl>     <dbl>
#>  1 NIFTY 50               9       41         0
#>  2 NIFTY NEXT 50         11       39         0
#>  3 NIFTY IT               1        9         0
#>  4 NIFTY BANK             1       11         0
#>  5 NIFTY MIDCAP 50        3       47         0
#>  6 NIFTY INFRA            6       24         0
#>  7 NIFTY REALTY           3        7         0
#>  8 NIFTY ENERGY           1        9         0
#>  9 NIFTY FMCG             2       13         0
#> 10 NIFTY MNC              8       22         0
#> # ... with 49 more rows
```

Please note that the ‘nse2r’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
