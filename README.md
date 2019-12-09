
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
#>  1 NIFTY 50 Pre Open           11939.   17.6            0.15
#>  2 NIFTY 50                    11948.   26.2            0.22
#>  3 NIFTY NEXT 50               27816   -38.0           -0.14
#>  4 NIFTY100 LIQ 15              3668.   15.5            0.42
#>  5 NIFTY BANK                  31327.  -14.8           -0.05
#>  6 INDIA VIX                      13.7   0.04           0.31
#>  7 NIFTY 100                   12046.   20.6            0.17
#>  8 NIFTY 500                    9684.   14.4            0.15
#>  9 NIFTY MIDCAP 100            16774.   42.2            0.25
#> 10 NIFTY MIDCAP 50              4577.   20.9            0.46
#> # ... with 45 more rows

# retain original column names as returned by NSE
nse_index_quote(clean_names = FALSE)
#> # A tibble: 55 x 4
#>    name              lastPrice change pChange
#>    <chr>                 <dbl>  <dbl>   <dbl>
#>  1 NIFTY 50 Pre Open   11939.   17.6     0.15
#>  2 NIFTY 50            11948.   26.2     0.22
#>  3 NIFTY NEXT 50       27816   -38.0    -0.14
#>  4 NIFTY100 LIQ 15      3668.   15.5     0.42
#>  5 NIFTY BANK          31327.  -14.8    -0.05
#>  6 INDIA VIX              13.7   0.04    0.31
#>  7 NIFTY 100           12046.   20.6     0.17
#>  8 NIFTY 500            9684.   14.4     0.15
#>  9 NIFTY MIDCAP 100    16774.   42.2     0.25
#> 10 NIFTY MIDCAP 50      4577.   20.9     0.46
#> # ... with 45 more rows
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#> # A tibble: 10 x 12
#>    symbol series last_corp_annou~ last_corp_annou~ open_price high_price
#>    <chr>  <chr>  <date>           <chr>                 <dbl>      <dbl>
#>  1 ADANI~ EQ     2019-07-26       Annual General ~       368.      378. 
#>  2 HDFC   EQ     2019-07-19       Annual General ~      2263.     2310  
#>  3 BPCL   EQ     2019-08-21       Dividend - Rs 8~       487.      500. 
#>  4 MARUTI EQ     2019-08-14       Dividend - Rs 8~      7007      7108  
#>  5 AXISB~ EQ     2019-07-04       Annual General ~       713.      732. 
#>  6 JSWST~ EQ     2019-07-08       Annual General ~       253       259. 
#>  7 TATAS~ EQ     2019-07-04       Annual General ~       403       412. 
#>  8 YESBA~ EQ     2019-06-03       Annual General ~        56        58.8
#>  9 UPL    EQ     2019-07-02       Bonus 1:2              565       574. 
#> 10 IOC    EQ     2019-08-21       Annual General ~       124.      126. 
#> # ... with 6 more variables: low_price <dbl>, last_traded_price <dbl>,
#> #   prev_close_price <dbl>, percent_change <dbl>, traded_quantity <dbl>,
#> #   turnover_in_lakhs <dbl>

# retain original column names as returned by NSE
nse_stock_top_gainers(clean_names = FALSE)
#> # A tibble: 10 x 12
#>    symbol series lastCorpAnnounc~ lastCorpAnnounc~ openPrice highPrice
#>    <chr>  <chr>  <date>           <chr>                <dbl>     <dbl>
#>  1 ADANI~ EQ     2019-07-26       Annual General ~      368.     378. 
#>  2 HDFC   EQ     2019-07-19       Annual General ~     2263.    2310  
#>  3 BPCL   EQ     2019-08-21       Dividend - Rs 8~      487.     500. 
#>  4 MARUTI EQ     2019-08-14       Dividend - Rs 8~     7007     7108  
#>  5 AXISB~ EQ     2019-07-04       Annual General ~      713.     732. 
#>  6 JSWST~ EQ     2019-07-08       Annual General ~      253      259. 
#>  7 TATAS~ EQ     2019-07-04       Annual General ~      403      412. 
#>  8 YESBA~ EQ     2019-06-03       Annual General ~       56       58.8
#>  9 UPL    EQ     2019-07-02       Bonus 1:2             565      574. 
#> 10 IOC    EQ     2019-08-21       Annual General ~      124.     126. 
#> # ... with 6 more variables: lowPrice <dbl>, ltp <dbl>,
#> #   previousPrice <dbl>, netPrice <dbl>, tradedQuantity <dbl>,
#> #   turnoverInLakhs <dbl>
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#> # A tibble: 16 x 10
#>    symbol symbol_desc date       new_high    year last_traded_pri~
#>    <chr>  <chr>       <date>        <dbl>   <dbl>            <dbl>
#>  1 ADANI~ Adani Tran~ 2019-12-02   345.    345.             333.  
#>  2 AGROP~ Agro Phos ~ 2019-12-06   140.    140.             140.  
#>  3 BFUTI~ BF Utiliti~ 2019-11-05   336.    336.             336.  
#>  4 BIOFI~ Biofil Che~ 2019-12-06    11.2    11.2             11.2 
#>  5 COROM~ Coromandel~ 2019-03-29   528     528              514.  
#>  6 CREAT~ Creative P~ 2019-12-06    94      94               86.9 
#>  7 CURAT~ Cura Techn~ 2019-12-06     1.85    1.85             1.85
#>  8 GUJGA~ Gujarat Ga~ 2019-12-06   232.    232.             230   
#>  9 IIFLS~ IIFL Secur~ 2019-12-06    34.0    34.0             34.0 
#> 10 ISEC   ICICI Secu~ 2019-12-06   365.    365.             358.  
#> 11 KIRLF~ Kirloskar ~ 2019-11-13    67.6    67.6             61.0 
#> 12 SRF    SRF Limited 2019-11-20  3286.   3286.            3258   
#> 13 UVSL   Uttam Valu~ 2019-12-06     0.15    0.15             0.15
#> 14 VIKAS~ Vikas Prop~ 2019-12-06     5.4     5.4              5.4 
#> 15 VISES~ Visesh Inf~ 2019-12-06     0.1     0.1              0.05
#> 16 XCHAN~ Xchanging ~ 2019-11-04    60.2    60.2             58.1 
#> # ... with 4 more variables: prev_high <dbl>, prev_close <dbl>,
#> #   change <dbl>, percent_change <dbl>

# retain original column names as returned by NSE
nse_stock_year_high(clean_names = FALSE)
#> # A tibble: 16 x 10
#>    symbol symbolDesc dt           value    year     ltp value_old    prev
#>    <chr>  <chr>      <date>       <dbl>   <dbl>   <dbl>     <dbl>   <dbl>
#>  1 ADANI~ Adani Tra~ 2019-12-02  345.    345.    333.      341.    319.  
#>  2 AGROP~ Agro Phos~ 2019-12-06  140.    140.    140.      139.    139.  
#>  3 BFUTI~ BF Utilit~ 2019-11-05  336.    336.    336.      324.    305.  
#>  4 BIOFI~ Biofil Ch~ 2019-12-06   11.2    11.2    11.2      10.7    10.7 
#>  5 COROM~ Coromande~ 2019-03-29  528     528     514.      517     496.  
#>  6 CREAT~ Creative ~ 2019-12-06   94      94      86.9      89.4    83.6 
#>  7 CURAT~ Cura Tech~ 2019-12-06    1.85    1.85    1.85      1.85    1.85
#>  8 GUJGA~ Gujarat G~ 2019-12-06  232.    232.    230       228.    227.  
#>  9 IIFLS~ IIFL Secu~ 2019-12-06   34.0    34.0    34.0      32.4    32.4 
#> 10 ISEC   ICICI Sec~ 2019-12-06  365.    365.    358.      360.    356.  
#> 11 KIRLF~ Kirloskar~ 2019-11-13   67.6    67.6    61.0      66.0    61.2 
#> 12 SRF    SRF Limit~ 2019-11-20 3286.   3286.   3258      3273.   3230.  
#> 13 UVSL   Uttam Val~ 2019-12-06    0.15    0.15    0.15      0.15    0.1 
#> 14 VIKAS~ Vikas Pro~ 2019-12-06    5.4     5.4     5.4       5.3     5.3 
#> 15 VISES~ Visesh In~ 2019-12-06    0.1     0.1     0.05      0.1     0.1 
#> 16 XCHAN~ Xchanging~ 2019-11-04   60.2    60.2    58.1      58.6    55.8 
#> # ... with 2 more variables: change <dbl>, pChange <dbl>
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

# retain original column names as returned by NSE
nse_stock_most_traded(clean_names = FALSE)
#> # A tibble: 12 x 6
#>    security              sharetotal trdQty nooftrades avgdailyturn turnover
#>    <chr>                      <dbl>  <dbl>      <dbl>        <dbl>    <dbl>
#>  1 ICICI Bank Limited          4.65   7758    4878739        1939.   38780.
#>  2 Yes Bank Limited            4.29  52626   11184742        1787.   35748.
#>  3 Indiabulls Hsg Finan~       4     12930   10805671        1667.   33339.
#>  4 Reliance Industries ~       3.02   1670    3665877        1259.   25186.
#>  5 Zee Entertainment En~       3      7991    5228767        1250.   25005.
#>  6 State Bank Of India         2.9    7471    4682688        1211.   24215.
#>  7 Bharti Airtel Limited       2.22   4447    3632503         924.   18489.
#>  8 HDFC Limited                2.04    762    2883349         853.   17058.
#>  9 Infosys Limited             1.88   2223    3267771         783.   15658.
#> 10 Tata Steel Limited          1.83   3759    3038374         764.   15288.
#> 11 TOTAL of Top Ten sec~      29.8  101637   53268481       12438.  248767.
#> 12 TOTAL                     100    483353  259778999       41713.  834252.
```

### Futures & Options

##### Top futures and options gainers for the last trading session.

``` r
nse_fo_top_gainers()
#> # A tibble: 10 x 12
#>    symbol series last_corp_annou~ last_corp_annou~ open_price high_price
#>    <chr>  <chr>  <date>           <chr>                 <dbl>      <dbl>
#>  1 DISHTV EQ     2018-11-05       Interim Dividen~       12.6       14.4
#>  2 SAIL   EQ     2019-08-22       Annual General ~       38.5       40.0
#>  3 M&MFIN EQ     2019-07-15       Annual General ~      328.       339. 
#>  4 JINDA~ EQ     2019-09-19       Annual General ~      141.       145. 
#>  5 CHOLA~ EQ     2019-07-22       Annual General ~      302.       312. 
#>  6 CENTU~ EQ     2019-10-11       Demerger              489        515. 
#>  7 CANBK  EQ     2019-07-17       Annual General ~      208        216. 
#>  8 JUBLF~ EQ     2019-09-16       Annual General ~     1579       1617  
#>  9 ADANI~ EQ     2019-07-26       Annual General ~      368.       378. 
#> 10 PFC    EQ     2019-08-20       Annual General ~      109.       113. 
#> # ... with 6 more variables: low_price <dbl>, last_traded_price <dbl>,
#> #   prev_close_price <dbl>, percent_change <dbl>, traded_quantity <dbl>,
#> #   turnover_in_lakhs <dbl>

# retain original column names as returned by NSE
nse_fo_top_gainers(clean_names = FALSE)
#> # A tibble: 10 x 12
#>    symbol series lastCorpAnnounc~ lastCorpAnnounc~ openPrice highPrice
#>    <chr>  <chr>  <date>           <chr>                <dbl>     <dbl>
#>  1 DISHTV EQ     2018-11-05       Interim Dividen~      12.6      14.4
#>  2 SAIL   EQ     2019-08-22       Annual General ~      38.5      40.0
#>  3 M&MFIN EQ     2019-07-15       Annual General ~     328.      339. 
#>  4 JINDA~ EQ     2019-09-19       Annual General ~     141.      145. 
#>  5 CHOLA~ EQ     2019-07-22       Annual General ~     302.      312. 
#>  6 CENTU~ EQ     2019-10-11       Demerger             489       515. 
#>  7 CANBK  EQ     2019-07-17       Annual General ~     208       216. 
#>  8 JUBLF~ EQ     2019-09-16       Annual General ~    1579      1617  
#>  9 ADANI~ EQ     2019-07-26       Annual General ~     368.      378. 
#> 10 PFC    EQ     2019-08-20       Annual General ~     109.      113. 
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
#>  1 INDUS~ EQ     NA               <NA>        1457    -8.85         -0.6  
#>  2 AXISB~ EQ     NA               <NA>         713.   -4.15         -0.580
#>  3 SBIN   EQ     NA               <NA>         319.   -1.05         -0.33 
#>  4 ICICI~ EQ     NA               <NA>         524.   -0.75         -0.14 
#>  5 IDFCF~ EQ     NA               <NA>          43.2  -0.05         -0.12 
#>  6 FEDER~ EQ     NA               <NA>          84.0  -0.1          -0.12 
#>  7 HDFCB~ EQ     2019-09-19       FACE VALUE~ 1250.    3.45          0.28 
#>  8 KOTAK~ EQ     NA               <NA>        1678.    3.65          0.22 
#>  9 RBLBA~ EQ     NA               <NA>         339.    0.6           0.18 
#> 10 PNB    EQ     NA               <NA>          60.3   0.1           0.17 
#> 11 BANKB~ EQ     NA               <NA>          97.0   0             0    
#> 12 YESBA~ EQ     NA               <NA>          56     0             0    
#> # ... with 10 more variables: prev_close <dbl>, quantity <dbl>,
#> #   value <dbl>, mkt_cap <dbl>, year_high <dbl>, year_low <dbl>,
#> #   sum_val <dbl>, sum_quantity <dbl>, fin_quantity <dbl>,
#> #   sum_fin_quantity <dbl>

# retain original column names as returned by NSE
nse_preopen_nifty(clean_names = FALSE)
#> # A tibble: 50 x 17
#>    symbol series xDt        caAct   iep    chn perChn  pCls trdQnty  iVal
#>    <chr>  <chr>  <date>     <chr> <dbl>  <dbl>  <dbl> <dbl>   <dbl> <dbl>
#>  1 MARUTI EQ     NA         <NA>  7007  120.    1.75  6887.    5594 392. 
#>  2 INFRA~ EQ     NA         <NA>   258   -1.7  -0.65   260.   24591  63.4
#>  3 INDUS~ EQ     NA         <NA>  1457   -8.85 -0.6   1466.    3829  55.8
#>  4 AXISB~ EQ     NA         <NA>   713.  -4.15 -0.580  718.   22777 162. 
#>  5 JSWST~ EQ     NA         <NA>   253   -1.1  -0.43   254.    5663  14.3
#>  6 SBIN   EQ     NA         <NA>   319.  -1.05 -0.33   320   112019 357. 
#>  7 BPCL   EQ     NA         <NA>   487.  -1.05 -0.21   488.   13495  65.8
#>  8 ITC    EQ     NA         <NA>   243   -0.35 -0.14   243.   20211  49.1
#>  9 ICICI~ EQ     NA         <NA>   524.  -0.75 -0.14   525.   32809 172. 
#> 10 WIPRO  EQ     NA         <NA>   241.  -0.2  -0.08   241     7231  17.4
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
#>  1 NIFTY 50              31       19         0
#>  2 NIFTY NEXT 50         21       29         0
#>  3 NIFTY IT               5        5         0
#>  4 NIFTY BANK             5        7         0
#>  5 NIFTY MIDCAP 50       34       16         0
#>  6 NIFTY INFRA           18       12         0
#>  7 NIFTY REALTY           3        7         0
#>  8 NIFTY ENERGY           8        2         0
#>  9 NIFTY FMCG             3       12         0
#> 10 NIFTY MNC             11       19         0
#> # ... with 47 more rows

# retain original column names as returned by NSE
nse_advances_declines(clean_names = FALSE)
#> # A tibble: 57 x 4
#>    indice          advances declines unchanged
#>    <chr>              <dbl>    <dbl>     <dbl>
#>  1 NIFTY 50              31       19         0
#>  2 NIFTY NEXT 50         21       29         0
#>  3 NIFTY IT               5        5         0
#>  4 NIFTY BANK             5        7         0
#>  5 NIFTY MIDCAP 50       34       16         0
#>  6 NIFTY INFRA           18       12         0
#>  7 NIFTY REALTY           3        7         0
#>  8 NIFTY ENERGY           8        2         0
#>  9 NIFTY FMCG             3       12         0
#> 10 NIFTY MNC             11       19         0
#> # ... with 47 more rows
```

Please note that the ‘nse2r’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
