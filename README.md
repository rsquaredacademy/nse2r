
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nse2r

> Fetch data from the National Stock Exchange, India.

<!-- badges: start -->

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/nse2r)](https://cran.r-project.org/package=nse2r)
[![cran
checks](https://cranchecks.info/badges/summary/nse2r)](https://cran.r-project.org/web/checks/check_results_nse2r.html)
[![R build
status](https://github.com/rsquaredacademy/nse2r/workflows/R-CMD-check/badge.svg)](https://github.com/rsquaredacademy/nse2r/actions)
[![Coverage
Status](https://img.shields.io/codecov/c/github/rsquaredacademy/nse2r/master.svg)](https://codecov.io/github/rsquaredacademy/nse2r?branch=master)
[![status](https://tinyverse.netlify.com/badge/nse2r)](https://CRAN.R-project.org/package=nse2r)
[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
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
#>           index_name last_traded_price change percent_change
#> 1  NIFTY 50 Pre Open        12906.4500  48.05           0.37
#> 2           NIFTY 50        12987.0000 128.60           1.00
#> 3      NIFTY NEXT 50        30186.0500 269.75           0.90
#> 4    NIFTY100 LIQ 15         3151.8500  38.50           1.24
#> 5         NIFTY BANK        29549.7500 353.35           1.21
#> 6          INDIA VIX           20.0225  -3.10         -13.43
#> 7          NIFTY 100        13087.7500 127.95           0.99
#> 8          NIFTY 500        10674.0500  99.10           0.94
#> 9   NIFTY MIDCAP 100        19196.4500 163.85           0.86
#> 10   NIFTY MIDCAP 50         5411.6000  77.15           1.45
#> 11       NIFTY INFRA         3431.6000  24.25           0.71
#> 12      NIFTY REALTY          254.4500   1.95           0.77
#> 13      NIFTY ENERGY        16346.0000 -42.00          -0.26
#> 14        NIFTY FMCG        31701.3000 259.60           0.83
#> 15         NIFTY MNC        14835.4500 121.05           0.82
#> 16      NIFTY PHARMA        11801.2500 166.05           1.43
#> 17         NIFTY PSE         2614.3000  22.90           0.88
#> 18    NIFTY PSU BANK         1539.0500  29.20           1.93
#> 19 NIFTY SERV SECTOR        18208.6000 212.55           1.18
#> 20          NIFTY IT        21859.9000 154.00           0.71
#> 21  NIFTY SMLCAP 100         6377.4000  54.20           0.86
#> 22         NIFTY 200         6710.6500  64.65           0.97
#> 23        NIFTY AUTO         8767.7500  29.30           0.34
#> 24       NIFTY MEDIA         1481.2500   8.75           0.59
#> 25       NIFTY METAL         2925.0500 108.50           3.85
#> 26 NIFTY DIV OPPS 50         2646.2500  20.75           0.79
#> 27 NIFTY COMMODITIES         3604.0500  41.70           1.17
#> 28 NIFTY CONSUMPTION         5368.6500  33.45           0.63
#> 29        NIFTY CPSE         1517.4000  11.35           0.75
#> 30 NIFTY FIN SERVICE        14237.6500 225.95           1.61
#> 31 NIFTY GROWSECT 15         6523.7000  83.15           1.29
#> 32  NIFTY50 VALUE 20         6255.2000  50.90           0.82
#> 33 NIFTY50 TR 2X LEV         6988.1000 136.55           1.99
#> 34 NIFTY50 PR 2X LEV         5262.2500 102.85           1.99
#> 35 NIFTY50 TR 1X INV          293.5000  -2.95          -1.00
#> 36 NIFTY50 PR 1X INV          338.0500  -3.40          -1.00
#> 37    NIFTY ALPHA 50        18660.4000  49.85           0.27
#> 38   NIFTY50 EQL WGT        13523.7500 155.10           1.16
#> 39  NIFTY100 EQL WGT        14377.1000 151.05           1.06
#> 40 NIFTY100 LOWVOL30        10144.0500  85.05           0.85
#> 41  NIFTY MID LIQ 15         4753.7000  59.05           1.26
#> 42    NIFTY PVT BANK        16390.4000 157.50           0.97
#> 43 NIFTY100 QUALTY30         3020.0500  20.60           0.69
#> 44   NIFTY GS 8 13YR         2247.0800   2.25           0.10
#> 45     NIFTY GS 10YR         2026.7400   2.08           0.10
#> 46 NIFTY GS 10YR CLN          970.3800   0.86           0.09
#> 47    NIFTY GS 4 8YR         2393.4200   1.01           0.04
#> 48  NIFTY GS 11 15YR         2435.7900   5.30           0.22
#> 49 NIFTY GS 15YRPLUS         2644.7000   0.18           0.01
#> 50 NIFTY GS COMPSITE         2293.0000   2.21           0.10
#> 51  NIFTY MIDCAP 150         7278.1500  50.60           0.70
#> 52   NIFTY SMLCAP 50         3146.4500  26.85           0.86
#> 53  NIFTY SMLCAP 250         5466.0500  41.85           0.77
#> 54  NIFTY MIDSML 400         6628.7500  47.50           0.72
#> 55 NIFTY200 QUALTY30        11098.7500  60.80           0.55

# retain original column names as returned by NSE
nse_index_quote(clean_names = FALSE)
#>              skipped  lastPrice change pChange
#> 1  NIFTY 50 Pre Open 12906.4500  48.05    0.37
#> 2           NIFTY 50 12987.0000 128.60    1.00
#> 3      NIFTY NEXT 50 30186.0500 269.75    0.90
#> 4    NIFTY100 LIQ 15  3151.8500  38.50    1.24
#> 5         NIFTY BANK 29549.7500 353.35    1.21
#> 6          INDIA VIX    20.0225  -3.10  -13.43
#> 7          NIFTY 100 13087.7500 127.95    0.99
#> 8          NIFTY 500 10674.0500  99.10    0.94
#> 9   NIFTY MIDCAP 100 19196.4500 163.85    0.86
#> 10   NIFTY MIDCAP 50  5411.6000  77.15    1.45
#> 11       NIFTY INFRA  3431.6000  24.25    0.71
#> 12      NIFTY REALTY   254.4500   1.95    0.77
#> 13      NIFTY ENERGY 16346.0000 -42.00   -0.26
#> 14        NIFTY FMCG 31701.3000 259.60    0.83
#> 15         NIFTY MNC 14835.4500 121.05    0.82
#> 16      NIFTY PHARMA 11801.2500 166.05    1.43
#> 17         NIFTY PSE  2614.3000  22.90    0.88
#> 18    NIFTY PSU BANK  1539.0500  29.20    1.93
#> 19 NIFTY SERV SECTOR 18208.6000 212.55    1.18
#> 20          NIFTY IT 21859.9000 154.00    0.71
#> 21  NIFTY SMLCAP 100  6377.4000  54.20    0.86
#> 22         NIFTY 200  6710.6500  64.65    0.97
#> 23        NIFTY AUTO  8767.7500  29.30    0.34
#> 24       NIFTY MEDIA  1481.2500   8.75    0.59
#> 25       NIFTY METAL  2925.0500 108.50    3.85
#> 26 NIFTY DIV OPPS 50  2646.2500  20.75    0.79
#> 27 NIFTY COMMODITIES  3604.0500  41.70    1.17
#> 28 NIFTY CONSUMPTION  5368.6500  33.45    0.63
#> 29        NIFTY CPSE  1517.4000  11.35    0.75
#> 30 NIFTY FIN SERVICE 14237.6500 225.95    1.61
#> 31 NIFTY GROWSECT 15  6523.7000  83.15    1.29
#> 32  NIFTY50 VALUE 20  6255.2000  50.90    0.82
#> 33 NIFTY50 TR 2X LEV  6988.1000 136.55    1.99
#> 34 NIFTY50 PR 2X LEV  5262.2500 102.85    1.99
#> 35 NIFTY50 TR 1X INV   293.5000  -2.95   -1.00
#> 36 NIFTY50 PR 1X INV   338.0500  -3.40   -1.00
#> 37    NIFTY ALPHA 50 18660.4000  49.85    0.27
#> 38   NIFTY50 EQL WGT 13523.7500 155.10    1.16
#> 39  NIFTY100 EQL WGT 14377.1000 151.05    1.06
#> 40 NIFTY100 LOWVOL30 10144.0500  85.05    0.85
#> 41  NIFTY MID LIQ 15  4753.7000  59.05    1.26
#> 42    NIFTY PVT BANK 16390.4000 157.50    0.97
#> 43 NIFTY100 QUALTY30  3020.0500  20.60    0.69
#> 44   NIFTY GS 8 13YR  2247.0800   2.25    0.10
#> 45     NIFTY GS 10YR  2026.7400   2.08    0.10
#> 46 NIFTY GS 10YR CLN   970.3800   0.86    0.09
#> 47    NIFTY GS 4 8YR  2393.4200   1.01    0.04
#> 48  NIFTY GS 11 15YR  2435.7900   5.30    0.22
#> 49 NIFTY GS 15YRPLUS  2644.7000   0.18    0.01
#> 50 NIFTY GS COMPSITE  2293.0000   2.21    0.10
#> 51  NIFTY MIDCAP 150  7278.1500  50.60    0.70
#> 52   NIFTY SMLCAP 50  3146.4500  26.85    0.86
#> 53  NIFTY SMLCAP 250  5466.0500  41.85    0.77
#> 54  NIFTY MIDSML 400  6628.7500  47.50    0.72
#> 55 NIFTY200 QUALTY30 11098.7500  60.80    0.55
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#>        symbol series last_corp_announcement_date
#> 1    JSWSTEEL     EQ                  2020-07-06
#> 2   TATASTEEL     EQ                  2020-08-06
#> 3      GRASIM     EQ                  2020-08-26
#> 4  BAJFINANCE     EQ                  2020-03-03
#> 5    SHREECEM     EQ                  2020-02-24
#> 6  BAJAJ-AUTO     EQ                  2020-03-03
#> 7    HINDALCO     EQ                  2020-09-03
#> 8  ADANIPORTS     EQ                  2020-06-17
#> 9        HDFC     EQ                  2020-07-09
#> 10   HDFCBANK     EQ                  2019-09-19
#>                                                     last_corp_announcement
#> 1                                                Dividend - Rs 2 Per Share
#> 2                                               Dividend - Rs 10 Per Share
#> 3                                                Dividend - Rs 4 Per Share
#> 4                                       Interim Dividend - Rs 10 Per Share
#> 5                                      Interim Dividend - Rs 110 Per Share
#> 6                                      Interim Dividend - Rs 120 Per Share
#> 7                         Annual General Meeting/Dividend - Re 1 Per Share
#> 8                                                   Annual General Meeting
#> 9                        Annual General Meeting/Dividend - Rs 21 Per Share
#> 10 Face Value Split (Sub-Division) - From Rs 2 Per Share To Rs 1 Per Share
#>    open_price high_price low_price last_traded_price prev_close_price
#> 1      338.50     362.20    336.00            362.00           338.25
#> 2      546.00     571.10    541.25            569.40           541.25
#> 3      850.20     881.00    847.05            880.00           843.10
#> 4     4655.00    4854.00   4640.00           4850.00          4689.75
#> 5    23949.00   24600.00  23700.00          24473.70         23698.80
#> 6     3053.00    3150.00   3053.00           3145.00          3051.25
#> 7      224.20     231.25    220.35            230.20           223.45
#> 8      400.80     413.00    395.65            410.45           398.95
#> 9     2197.15    2245.00   2187.65           2242.70          2191.35
#> 10    1415.00    1432.00   1387.00           1431.90          1402.80
#>    percent_change traded_quantity turnover_in_lakhs
#> 1            7.02        10967276          38358.05
#> 2            5.20        22570185         125512.80
#> 3            4.38         4249437          36786.53
#> 4            3.42         6273208         298648.61
#> 5            3.27           74560          17930.17
#> 6            3.07         1264680          39163.72
#> 7            3.02        16363181          36849.88
#> 8            2.88        12856261          51977.86
#> 9            2.34         5026304         111341.68
#> 10           2.07        13971563         197088.46

# retain original column names as returned by NSE
nse_stock_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1    JSWSTEEL     EQ               2020-07-06
#> 2   TATASTEEL     EQ               2020-08-06
#> 3      GRASIM     EQ               2020-08-26
#> 4  BAJFINANCE     EQ               2020-03-03
#> 5    SHREECEM     EQ               2020-02-24
#> 6  BAJAJ-AUTO     EQ               2020-03-03
#> 7    HINDALCO     EQ               2020-09-03
#> 8  ADANIPORTS     EQ               2020-06-17
#> 9        HDFC     EQ               2020-07-09
#> 10   HDFCBANK     EQ               2019-09-19
#>                                                       lastCorpAnnouncement
#> 1                                                Dividend - Rs 2 Per Share
#> 2                                               Dividend - Rs 10 Per Share
#> 3                                                Dividend - Rs 4 Per Share
#> 4                                       Interim Dividend - Rs 10 Per Share
#> 5                                      Interim Dividend - Rs 110 Per Share
#> 6                                      Interim Dividend - Rs 120 Per Share
#> 7                         Annual General Meeting/Dividend - Re 1 Per Share
#> 8                                                   Annual General Meeting
#> 9                        Annual General Meeting/Dividend - Rs 21 Per Share
#> 10 Face Value Split (Sub-Division) - From Rs 2 Per Share To Rs 1 Per Share
#>    openPrice highPrice lowPrice      ltp previousPrice netPrice tradedQuantity
#> 1     338.50    362.20   336.00   362.00        338.25     7.02       10967276
#> 2     546.00    571.10   541.25   569.40        541.25     5.20       22570185
#> 3     850.20    881.00   847.05   880.00        843.10     4.38        4249437
#> 4    4655.00   4854.00  4640.00  4850.00       4689.75     3.42        6273208
#> 5   23949.00  24600.00 23700.00 24473.70      23698.80     3.27          74560
#> 6    3053.00   3150.00  3053.00  3145.00       3051.25     3.07        1264680
#> 7     224.20    231.25   220.35   230.20        223.45     3.02       16363181
#> 8     400.80    413.00   395.65   410.45        398.95     2.88       12856261
#> 9    2197.15   2245.00  2187.65  2242.70       2191.35     2.34        5026304
#> 10   1415.00   1432.00  1387.00  1431.90       1402.80     2.07       13971563
#>    turnoverInLakhs
#> 1         38358.05
#> 2        125512.80
#> 3         36786.53
#> 4        298648.61
#> 5         17930.17
#> 6         39163.72
#> 7         36849.88
#> 8         51977.86
#> 9        111341.68
#> 10       197088.46
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#>        symbol
#> 1       AARON
#> 2         ACE
#> 3  ADANIPORTS
#> 4  AMARAJABAT
#> 5   ASHIMASYN
#> 6        BEPL
#> 7  BIOFILCHEM
#> 8     CGPOWER
#> 9  CHAMBLFERT
#> 10   DBREALTY
#> 11       DHFL
#> 12      DIXON
#> 13   EIDPARRY
#> 14        EKC
#> 15  GALLISPAT
#> 16  GINNIFILA
#> 17     GRASIM
#> 18  GUJGASLTD
#> 19        HCG
#> 20   HINDALCO
#> 21    ICICIGI
#> 22   INDIACEM
#> 23  INTELLECT
#> 24 JINDALSTEL
#> 25      JSWHL
#> 26   JSWSTEEL
#> 27 KAJARIACER
#> 28      KARDA
#> 29 KEYFINSERV
#> 30        M50
#> 31    MAANALU
#> 32     NAUKRI
#> 33 NCPSESDL24
#> 34   ONMOBILE
#> 35 ORCHPHARMA
#> 36  PALREDTEC
#> 37       PGEL
#> 38       PGHL
#> 39     PILITA
#> 40 PLASTIBLEN
#> 41      PURVA
#> 42   RELIGARE
#> 43    RKFORGE
#> 44       ROML
#> 45    SHRADHA
#> 46    SKIPPER
#> 47 SOMANYCERA
#> 48       SPYL
#> 49      TANLA
#> 50  TATASTEEL
#> 51 TATASTLBSL
#> 52    TIINDIA
#> 53      TOTAL
#> 54 TPLPLASTEH
#> 55   TREJHARA
#> 56    TRIDENT
#> 57  UTINEXT50
#> 58   VIDEOIND
#> 59  VISHWARAJ
#> 60       VSSL
#>                                                               symbol_desc
#> 1                                                Aaron Industries Limited
#> 2                                   Action Construction Equipment Limited
#> 3                           Adani Ports and Special Economic Zone Limited
#> 4                                            Amara Raja Batteries Limited
#> 5                                                          Ashima Limited
#> 6                                   Bhansali Engineering Polymers Limited
#> 7                              Biofil Chemicals & Pharmaceuticals Limited
#> 8                               CG Power and Industrial Solutions Limited
#> 9                                 Chambal Fertilizers & Chemicals Limited
#> 10                                                     D B Realty Limited
#> 11                              Dewan Housing Finance Corporation Limited
#> 12                                     Dixon Technologies (India) Limited
#> 13                                                EID Parry India Limited
#> 14                                         Everest Kanto Cylinder Limited
#> 15                                                 Gallantt Ispat Limited
#> 16                                                Ginni Filaments Limited
#> 17                                              Grasim Industries Limited
#> 18                                                    Gujarat Gas Limited
#> 19                                  Healthcare Global Enterprises Limited
#> 20                                            Hindalco Industries Limited
#> 21                        ICICI Lombard General Insurance Company Limited
#> 22                                              The India Cements Limited
#> 23                                         Intellect Design Arena Limited
#> 24                                           Jindal Steel & Power Limited
#> 25                                                   JSW Holdings Limited
#> 26                                                      JSW Steel Limited
#> 27                                               Kajaria Ceramics Limited
#> 28                                            Karda Constructions Limited
#> 29                                     Keynote Financial Services Limited
#> 30          Motilal Oswal Mutual Fund - Motilal Oswal MOSt Shares M50 ETF
#> 31                                                 Maan Aluminium Limited
#> 32                                              Info Edge (India) Limited
#> 33  Nippon India Mutual Fund-Nippon India ETF Nifty CPSE Bond Plus SDL-24
#> 34                                                OnMobile Global Limited
#> 35                                                  Orchid Pharma Limited
#> 36                                            Palred Technologies Limited
#> 37                                                PG Electroplast Limited
#> 38                                        Procter & Gamble Health Limited
#> 39                                          PIL ITALICA LIFESTYLE LIMITED
#> 40                                             Plastiblends India Limited
#> 41                                                    Puravankara Limited
#> 42                                           Religare Enterprises Limited
#> 43                                            Ramkrishna Forgings Limited
#> 44                                                  Raj Oil Mills Limited
#> 45                                          Shradha Infraprojects Limited
#> 46                                                        Skipper Limited
#> 47                                                Somany Ceramics Limited
#> 48                                           Shekhawati Poly-Yarn Limited
#> 49                                                Tanla Platforms Limited
#> 50                                                     Tata Steel Limited
#> 51                                                 Tata Steel Bsl Limited
#> 52                                      Tube Investments of India Limited
#> 53                                        Total Transport Systems Limited
#> 54                                                   TPL Plastech Limited
#> 55                                             TREJHARA SOLUTIONS LIMITED
#> 56                                                        Trident Limited
#> 57 UTI Mutual Fund - UTI NIfty Next 50 Exchange Traded Fund - UTI NIFTY N
#> 58                                            Videocon Industries Limited
#> 59                                     Vishwaraj Sugar Industries Limited
#> 60                                        Vardhman Special Steels Limited
#>          date new_high     year last_traded_price prev_high prev_close change
#> 1  2020-11-25    64.75    64.75             64.75     61.70      61.70   3.05
#> 2  2020-11-18   106.40   106.40            101.30     97.60      92.40   8.90
#> 3  2020-11-25   413.00   413.00            410.45    404.70     398.95  11.50
#> 4  2020-11-25   900.00   900.00            889.55    899.00     874.20  15.35
#> 5  2020-11-25    10.55    10.55             10.55     10.35      10.05   0.50
#> 6  2020-11-25   128.00   128.00            126.00    127.60     123.55   2.45
#> 7  2020-11-25   208.35   208.35            208.35    198.45     198.45   9.90
#> 8  2020-11-25    41.00    41.00             39.00     39.65      39.60  -0.60
#> 9  2020-11-25   196.00   196.00            192.50    194.00     189.85   2.65
#> 10 2019-12-03    12.80    12.80             12.80     12.50      10.70   2.10
#> 11 2020-11-25    25.80    25.80             25.80     24.60      24.60   1.20
#> 12 2020-11-24 11490.00 11490.00          11430.00  11000.00   10909.90 520.10
#> 13 2020-11-24   342.55   342.55            336.00    332.40     326.95   9.05
#> 14 2020-11-25    46.45    46.45             46.45     45.35      44.25   2.20
#> 15 2020-06-25    36.25    36.25             32.50     35.80      31.45   1.05
#> 16 2020-11-25    18.90    18.90             17.70     18.55      18.25  -0.55
#> 17 2020-11-25   881.00   881.00            880.00    873.80     843.10  36.90
#> 18 2020-11-25   348.00   348.00            344.00    345.55     338.05   5.95
#> 19 2020-11-25   149.90   149.90            147.00    145.00     143.75   3.25
#> 20 2020-11-25   231.25   231.25            230.20    230.00     223.45   6.75
#> 21 2019-12-26  1468.00  1468.00           1468.00   1440.40    1382.85  85.15
#> 22 2020-11-24   163.85   163.85            155.50    161.90     149.25   6.25
#> 23 2020-11-25   277.00   277.00            277.00    270.00     263.85  13.15
#> 24 2020-11-25   250.80   250.80            250.05    248.00     235.20  14.85
#> 25 2020-11-25  3560.00  3560.00           3445.50   3499.00    3423.40  22.10
#> 26 2020-11-17   362.20   362.20            362.00    350.50     338.25  23.75
#> 27 2020-11-24   632.30   632.30            632.30    630.95     617.80  14.50
#> 28 2020-10-12   114.00   114.00            111.60    112.05     110.50   1.10
#> 29 2020-11-25   117.00   117.00            110.00    111.55     111.45  -1.45
#> 30 2020-11-14   128.95   128.95            127.54    128.95     126.74   0.80
#> 31 2020-11-25    84.60    84.60             83.25     83.05      78.20   5.05
#> 32 2020-11-25  4196.95  4196.95           4180.00   4091.00    4041.80 138.20
#> 33 2020-11-18   123.26   123.26            102.73    102.74     102.70   0.01
#> 34 2020-09-15    56.50    56.50             56.50     52.40      51.40   5.10
#> 35 2020-11-25    40.50    40.50             40.50     38.60      38.60   1.90
#> 36 2020-11-25    41.15    41.15             37.25     39.20      39.20  -1.95
#> 37 2020-11-17   155.00   155.00            150.00    153.10     148.90   1.10
#> 38 2020-11-24  6484.85  6484.85           6360.00   6479.20    6414.90 -54.90
#> 39 2020-11-23     8.35     8.35              7.95      8.30       8.05  -0.10
#> 40 2020-11-25   269.00   269.00            265.65    264.80     253.30  12.35
#> 41 2020-11-25    78.85    78.85             77.35     78.30      76.25   1.10
#> 42 2020-11-25    67.35    67.35             64.55     62.70      60.20   4.35
#> 43 2020-01-20   418.90   418.90            411.95    415.10     389.05  22.90
#> 44 2020-11-25    16.05    16.05             16.05     15.30      15.30   0.75
#> 45 2020-11-23    62.00    62.00             61.00     62.00      59.75   1.25
#> 46 2020-11-25    58.90    58.90             56.00     57.50      56.60  -0.60
#> 47 2020-11-25   272.20   272.20            269.35    272.00     267.15   2.20
#> 48 2020-11-25     0.55     0.55              0.55      0.50       0.50   0.05
#> 49 2020-11-25   583.50   583.50            583.50    555.90     555.75  27.75
#> 50 2020-11-25   571.10   571.10            569.40    558.65     541.25  28.15
#> 51 2020-11-25    35.00    35.00             34.95     34.00      32.85   2.10
#> 52 2020-11-24   857.95   857.95            808.00    857.50     836.80 -28.80
#> 53 2020-11-25    60.00    60.00             60.00     59.80      57.15   2.85
#> 54 2020-11-25   152.40   152.40            146.20    151.90     144.95   1.25
#> 55 2020-11-25    32.20    32.20             32.10     30.70      30.70   1.40
#> 56 2020-11-23     8.55     8.55              8.05      8.55       7.85   0.20
#> 57 2020-11-25   320.00   320.00            309.50    320.00     310.97  -1.47
#> 58 2020-11-25     5.75     5.75              5.75      5.50       5.50   0.25
#> 59 2020-11-09   132.00   132.00            123.50    129.80     120.80   2.70
#> 60 2020-11-25   101.20   101.20            101.20     98.55      96.40   4.80
#>    percent_change
#> 1            4.94
#> 2            9.63
#> 3            2.88
#> 4            1.76
#> 5            4.98
#> 6            1.98
#> 7            4.99
#> 8           -1.52
#> 9            1.40
#> 10          19.63
#> 11           4.88
#> 12           4.77
#> 13           2.77
#> 14           4.97
#> 15           3.34
#> 16          -3.01
#> 17           4.38
#> 18           1.76
#> 19           2.26
#> 20           3.02
#> 21           6.16
#> 22           4.19
#> 23           4.98
#> 24           6.31
#> 25           0.65
#> 26           7.02
#> 27           2.35
#> 28           1.00
#> 29          -1.30
#> 30           0.63
#> 31           6.46
#> 32           3.42
#> 33           0.01
#> 34           9.92
#> 35           4.92
#> 36          -4.97
#> 37           0.74
#> 38          -0.86
#> 39          -1.24
#> 40           4.88
#> 41           1.44
#> 42           7.23
#> 43           5.89
#> 44           4.90
#> 45           2.09
#> 46          -1.06
#> 47           0.82
#> 48          10.00
#> 49           4.99
#> 50           5.20
#> 51           6.39
#> 52          -3.44
#> 53           4.99
#> 54           0.86
#> 55           4.56
#> 56           2.55
#> 57          -0.47
#> 58           4.55
#> 59           2.24
#> 60           4.98

# retain original column names as returned by NSE
nse_stock_year_high(clean_names = FALSE)
#>        symbol
#> 1       AARON
#> 2         ACE
#> 3  ADANIPORTS
#> 4  AMARAJABAT
#> 5   ASHIMASYN
#> 6        BEPL
#> 7  BIOFILCHEM
#> 8     CGPOWER
#> 9  CHAMBLFERT
#> 10   DBREALTY
#> 11       DHFL
#> 12      DIXON
#> 13   EIDPARRY
#> 14        EKC
#> 15  GALLISPAT
#> 16  GINNIFILA
#> 17     GRASIM
#> 18  GUJGASLTD
#> 19        HCG
#> 20   HINDALCO
#> 21    ICICIGI
#> 22   INDIACEM
#> 23  INTELLECT
#> 24 JINDALSTEL
#> 25      JSWHL
#> 26   JSWSTEEL
#> 27 KAJARIACER
#> 28      KARDA
#> 29 KEYFINSERV
#> 30        M50
#> 31    MAANALU
#> 32     NAUKRI
#> 33 NCPSESDL24
#> 34   ONMOBILE
#> 35 ORCHPHARMA
#> 36  PALREDTEC
#> 37       PGEL
#> 38       PGHL
#> 39     PILITA
#> 40 PLASTIBLEN
#> 41      PURVA
#> 42   RELIGARE
#> 43    RKFORGE
#> 44       ROML
#> 45    SHRADHA
#> 46    SKIPPER
#> 47 SOMANYCERA
#> 48       SPYL
#> 49      TANLA
#> 50  TATASTEEL
#> 51 TATASTLBSL
#> 52    TIINDIA
#> 53      TOTAL
#> 54 TPLPLASTEH
#> 55   TREJHARA
#> 56    TRIDENT
#> 57  UTINEXT50
#> 58   VIDEOIND
#> 59  VISHWARAJ
#> 60       VSSL
#>                                                                symbolDesc
#> 1                                                Aaron Industries Limited
#> 2                                   Action Construction Equipment Limited
#> 3                           Adani Ports and Special Economic Zone Limited
#> 4                                            Amara Raja Batteries Limited
#> 5                                                          Ashima Limited
#> 6                                   Bhansali Engineering Polymers Limited
#> 7                              Biofil Chemicals & Pharmaceuticals Limited
#> 8                               CG Power and Industrial Solutions Limited
#> 9                                 Chambal Fertilizers & Chemicals Limited
#> 10                                                     D B Realty Limited
#> 11                              Dewan Housing Finance Corporation Limited
#> 12                                     Dixon Technologies (India) Limited
#> 13                                                EID Parry India Limited
#> 14                                         Everest Kanto Cylinder Limited
#> 15                                                 Gallantt Ispat Limited
#> 16                                                Ginni Filaments Limited
#> 17                                              Grasim Industries Limited
#> 18                                                    Gujarat Gas Limited
#> 19                                  Healthcare Global Enterprises Limited
#> 20                                            Hindalco Industries Limited
#> 21                        ICICI Lombard General Insurance Company Limited
#> 22                                              The India Cements Limited
#> 23                                         Intellect Design Arena Limited
#> 24                                           Jindal Steel & Power Limited
#> 25                                                   JSW Holdings Limited
#> 26                                                      JSW Steel Limited
#> 27                                               Kajaria Ceramics Limited
#> 28                                            Karda Constructions Limited
#> 29                                     Keynote Financial Services Limited
#> 30          Motilal Oswal Mutual Fund - Motilal Oswal MOSt Shares M50 ETF
#> 31                                                 Maan Aluminium Limited
#> 32                                              Info Edge (India) Limited
#> 33  Nippon India Mutual Fund-Nippon India ETF Nifty CPSE Bond Plus SDL-24
#> 34                                                OnMobile Global Limited
#> 35                                                  Orchid Pharma Limited
#> 36                                            Palred Technologies Limited
#> 37                                                PG Electroplast Limited
#> 38                                        Procter & Gamble Health Limited
#> 39                                          PIL ITALICA LIFESTYLE LIMITED
#> 40                                             Plastiblends India Limited
#> 41                                                    Puravankara Limited
#> 42                                           Religare Enterprises Limited
#> 43                                            Ramkrishna Forgings Limited
#> 44                                                  Raj Oil Mills Limited
#> 45                                          Shradha Infraprojects Limited
#> 46                                                        Skipper Limited
#> 47                                                Somany Ceramics Limited
#> 48                                           Shekhawati Poly-Yarn Limited
#> 49                                                Tanla Platforms Limited
#> 50                                                     Tata Steel Limited
#> 51                                                 Tata Steel Bsl Limited
#> 52                                      Tube Investments of India Limited
#> 53                                        Total Transport Systems Limited
#> 54                                                   TPL Plastech Limited
#> 55                                             TREJHARA SOLUTIONS LIMITED
#> 56                                                        Trident Limited
#> 57 UTI Mutual Fund - UTI NIfty Next 50 Exchange Traded Fund - UTI NIFTY N
#> 58                                            Videocon Industries Limited
#> 59                                     Vishwaraj Sugar Industries Limited
#> 60                                        Vardhman Special Steels Limited
#>            dt    value     year      ltp value_old     prev change pChange
#> 1  2020-11-25    64.75    64.75    64.75     61.70    61.70   3.05    4.94
#> 2  2020-11-18   106.40   106.40   101.30     97.60    92.40   8.90    9.63
#> 3  2020-11-25   413.00   413.00   410.45    404.70   398.95  11.50    2.88
#> 4  2020-11-25   900.00   900.00   889.55    899.00   874.20  15.35    1.76
#> 5  2020-11-25    10.55    10.55    10.55     10.35    10.05   0.50    4.98
#> 6  2020-11-25   128.00   128.00   126.00    127.60   123.55   2.45    1.98
#> 7  2020-11-25   208.35   208.35   208.35    198.45   198.45   9.90    4.99
#> 8  2020-11-25    41.00    41.00    39.00     39.65    39.60  -0.60   -1.52
#> 9  2020-11-25   196.00   196.00   192.50    194.00   189.85   2.65    1.40
#> 10 2019-12-03    12.80    12.80    12.80     12.50    10.70   2.10   19.63
#> 11 2020-11-25    25.80    25.80    25.80     24.60    24.60   1.20    4.88
#> 12 2020-11-24 11490.00 11490.00 11430.00  11000.00 10909.90 520.10    4.77
#> 13 2020-11-24   342.55   342.55   336.00    332.40   326.95   9.05    2.77
#> 14 2020-11-25    46.45    46.45    46.45     45.35    44.25   2.20    4.97
#> 15 2020-06-25    36.25    36.25    32.50     35.80    31.45   1.05    3.34
#> 16 2020-11-25    18.90    18.90    17.70     18.55    18.25  -0.55   -3.01
#> 17 2020-11-25   881.00   881.00   880.00    873.80   843.10  36.90    4.38
#> 18 2020-11-25   348.00   348.00   344.00    345.55   338.05   5.95    1.76
#> 19 2020-11-25   149.90   149.90   147.00    145.00   143.75   3.25    2.26
#> 20 2020-11-25   231.25   231.25   230.20    230.00   223.45   6.75    3.02
#> 21 2019-12-26  1468.00  1468.00  1468.00   1440.40  1382.85  85.15    6.16
#> 22 2020-11-24   163.85   163.85   155.50    161.90   149.25   6.25    4.19
#> 23 2020-11-25   277.00   277.00   277.00    270.00   263.85  13.15    4.98
#> 24 2020-11-25   250.80   250.80   250.05    248.00   235.20  14.85    6.31
#> 25 2020-11-25  3560.00  3560.00  3445.50   3499.00  3423.40  22.10    0.65
#> 26 2020-11-17   362.20   362.20   362.00    350.50   338.25  23.75    7.02
#> 27 2020-11-24   632.30   632.30   632.30    630.95   617.80  14.50    2.35
#> 28 2020-10-12   114.00   114.00   111.60    112.05   110.50   1.10    1.00
#> 29 2020-11-25   117.00   117.00   110.00    111.55   111.45  -1.45   -1.30
#> 30 2020-11-14   128.95   128.95   127.54    128.95   126.74   0.80    0.63
#> 31 2020-11-25    84.60    84.60    83.25     83.05    78.20   5.05    6.46
#> 32 2020-11-25  4196.95  4196.95  4180.00   4091.00  4041.80 138.20    3.42
#> 33 2020-11-18   123.26   123.26   102.73    102.74   102.70   0.01    0.01
#> 34 2020-09-15    56.50    56.50    56.50     52.40    51.40   5.10    9.92
#> 35 2020-11-25    40.50    40.50    40.50     38.60    38.60   1.90    4.92
#> 36 2020-11-25    41.15    41.15    37.25     39.20    39.20  -1.95   -4.97
#> 37 2020-11-17   155.00   155.00   150.00    153.10   148.90   1.10    0.74
#> 38 2020-11-24  6484.85  6484.85  6360.00   6479.20  6414.90 -54.90   -0.86
#> 39 2020-11-23     8.35     8.35     7.95      8.30     8.05  -0.10   -1.24
#> 40 2020-11-25   269.00   269.00   265.65    264.80   253.30  12.35    4.88
#> 41 2020-11-25    78.85    78.85    77.35     78.30    76.25   1.10    1.44
#> 42 2020-11-25    67.35    67.35    64.55     62.70    60.20   4.35    7.23
#> 43 2020-01-20   418.90   418.90   411.95    415.10   389.05  22.90    5.89
#> 44 2020-11-25    16.05    16.05    16.05     15.30    15.30   0.75    4.90
#> 45 2020-11-23    62.00    62.00    61.00     62.00    59.75   1.25    2.09
#> 46 2020-11-25    58.90    58.90    56.00     57.50    56.60  -0.60   -1.06
#> 47 2020-11-25   272.20   272.20   269.35    272.00   267.15   2.20    0.82
#> 48 2020-11-25     0.55     0.55     0.55      0.50     0.50   0.05   10.00
#> 49 2020-11-25   583.50   583.50   583.50    555.90   555.75  27.75    4.99
#> 50 2020-11-25   571.10   571.10   569.40    558.65   541.25  28.15    5.20
#> 51 2020-11-25    35.00    35.00    34.95     34.00    32.85   2.10    6.39
#> 52 2020-11-24   857.95   857.95   808.00    857.50   836.80 -28.80   -3.44
#> 53 2020-11-25    60.00    60.00    60.00     59.80    57.15   2.85    4.99
#> 54 2020-11-25   152.40   152.40   146.20    151.90   144.95   1.25    0.86
#> 55 2020-11-25    32.20    32.20    32.10     30.70    30.70   1.40    4.56
#> 56 2020-11-23     8.55     8.55     8.05      8.55     7.85   0.20    2.55
#> 57 2020-11-25   320.00   320.00   309.50    320.00   310.97  -1.47   -0.47
#> 58 2020-11-25     5.75     5.75     5.75      5.50     5.50   0.25    4.55
#> 59 2020-11-09   132.00   132.00   123.50    129.80   120.80   2.70    2.24
#> 60 2020-11-25   101.20   101.20   101.20     98.55    96.40   4.80    4.98
```

##### Most actively traded stocks in a month

``` r
nse_stock_most_traded()
#>                         security share_turnover traded_quantity no_of_trades
#> 1        Reliance Industries Ltd           5.10            2598      6836160
#> 2   Tata Consultancy Service Ltd           3.20            1286      4210702
#> 3          Bajaj Finance Limited           3.07            1013      4243265
#> 4                Infosys Limited           2.88            2850      5107093
#> 5                  HDFC Bank Ltd           2.79            2556      4705854
#> 6          Indusind Bank Limited           2.23            4018      4743872
#> 7              Axis Bank Limited           2.19            5011      4881896
#> 8                 ICICI Bank Ltd           2.15            5899      5031275
#> 9  Dr Reddy Laboratories Limited           2.09             452      2265161
#> 10                  HDFC Limited           2.07            1155      4201521
#> 11   TOTAL of Top Ten securities          27.77           26839     46226799
#> 12                         TOTAL         100.00          418798    318193019
#>    avg_daily_turnonver turnover
#> 1              2670.12    56073
#> 2              1675.49    35185
#> 3              1603.95    33683
#> 4              1507.99    31668
#> 5              1458.27    30624
#> 6              1165.12    24468
#> 7              1147.84    24105
#> 8              1124.54    23615
#> 9              1095.54    23006
#> 10             1082.59    22734
#> 11            14531.46   305161
#> 12            52327.80  1098884

# retain original column names as returned by NSE
nse_stock_most_traded(clean_names = FALSE)
#>                          skipped sharetotal trdQty nooftrades avgdailyturn
#> 1        Reliance Industries Ltd       5.10   2598    6836160      2670.12
#> 2   Tata Consultancy Service Ltd       3.20   1286    4210702      1675.49
#> 3          Bajaj Finance Limited       3.07   1013    4243265      1603.95
#> 4                Infosys Limited       2.88   2850    5107093      1507.99
#> 5                  HDFC Bank Ltd       2.79   2556    4705854      1458.27
#> 6          Indusind Bank Limited       2.23   4018    4743872      1165.12
#> 7              Axis Bank Limited       2.19   5011    4881896      1147.84
#> 8                 ICICI Bank Ltd       2.15   5899    5031275      1124.54
#> 9  Dr Reddy Laboratories Limited       2.09    452    2265161      1095.54
#> 10                  HDFC Limited       2.07   1155    4201521      1082.59
#> 11   TOTAL of Top Ten securities      27.77  26839   46226799     14531.46
#> 12                         TOTAL     100.00 418798  318193019     52327.80
#>    turnover
#> 1     56073
#> 2     35185
#> 3     33683
#> 4     31668
#> 5     30624
#> 6     24468
#> 7     24105
#> 8     23615
#> 9     23006
#> 10    22734
#> 11   305161
#> 12  1098884
```

### Futures & Options

##### Top futures and options gainers for the last trading session.

``` r
nse_fo_top_gainers()
#>        symbol series last_corp_announcement_date
#> 1     SIEMENS     EQ                  2020-02-03
#> 2        SAIL     EQ                  2020-10-14
#> 3    JSWSTEEL     EQ                  2020-07-06
#> 4  JINDALSTEL     EQ                  2020-09-23
#> 5     ICICIGI     EQ                  2019-10-31
#> 6       L&TFH     EQ                  2020-07-20
#> 7   TATASTEEL     EQ                  2020-08-06
#> 8  NATIONALUM     EQ                  2020-12-01
#> 9  BANKBARODA     EQ                  2020-07-22
#> 10   TATACHEM     EQ                  2020-06-22
#>                               last_corp_announcement open_price high_price
#> 1                          Dividend - Rs 7 Per Share    1405.00    1533.90
#> 2                             Annual General Meeting      43.10      46.80
#> 3                          Dividend - Rs 2 Per Share     338.50     362.20
#> 4                             Annual General Meeting     234.60     250.80
#> 5                  Interim Dividend - Rs 3.50 Per Sh    1394.00    1468.00
#> 6                             Annual General Meeting      74.70      78.80
#> 7                         Dividend - Rs 10 Per Share     546.00     571.10
#> 8               Interim Dividend - Rs 0.50 Per Share      35.95      38.15
#> 9                             Annual General Meeting      49.10      51.50
#> 10 Annual General Meeting/Dividend - Rs 11 Per Share     370.10     385.00
#>    low_price last_traded_price prev_close_price percent_change traded_quantity
#> 1    1396.15           1532.95          1364.25          12.37         9591646
#> 2      42.80             46.55            43.05           8.13        60920144
#> 3     336.00            362.00           338.25           7.02        10967276
#> 4     232.25            250.05           235.20           6.31        12732331
#> 5    1390.00           1468.00          1382.85           6.16         2679932
#> 6      73.90             78.70            74.35           5.85        34322810
#> 7     541.25            569.40           541.25           5.20        22570185
#> 8      35.50             37.60            35.75           5.17        26513634
#> 9      48.25             51.30            49.05           4.59        55805690
#> 10    365.40            384.75           368.05           4.54         4880589
#>    turnover_in_lakhs
#> 1          142744.79
#> 2           27420.16
#> 3           38358.05
#> 4           30835.16
#> 5           38528.04
#> 6           26291.27
#> 7          125512.80
#> 8            9823.30
#> 9           27847.04
#> 10          18333.93

# retain original column names as returned by NSE
nse_fo_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1     SIEMENS     EQ               2020-02-03
#> 2        SAIL     EQ               2020-10-14
#> 3    JSWSTEEL     EQ               2020-07-06
#> 4  JINDALSTEL     EQ               2020-09-23
#> 5     ICICIGI     EQ               2019-10-31
#> 6       L&TFH     EQ               2020-07-20
#> 7   TATASTEEL     EQ               2020-08-06
#> 8  NATIONALUM     EQ               2020-12-01
#> 9  BANKBARODA     EQ               2020-07-22
#> 10   TATACHEM     EQ               2020-06-22
#>                                 lastCorpAnnouncement openPrice highPrice
#> 1                          Dividend - Rs 7 Per Share   1405.00   1533.90
#> 2                             Annual General Meeting     43.10     46.80
#> 3                          Dividend - Rs 2 Per Share    338.50    362.20
#> 4                             Annual General Meeting    234.60    250.80
#> 5                  Interim Dividend - Rs 3.50 Per Sh   1394.00   1468.00
#> 6                             Annual General Meeting     74.70     78.80
#> 7                         Dividend - Rs 10 Per Share    546.00    571.10
#> 8               Interim Dividend - Rs 0.50 Per Share     35.95     38.15
#> 9                             Annual General Meeting     49.10     51.50
#> 10 Annual General Meeting/Dividend - Rs 11 Per Share    370.10    385.00
#>    lowPrice     ltp previousPrice netPrice tradedQuantity turnoverInLakhs
#> 1   1396.15 1532.95       1364.25    12.37        9591646       142744.79
#> 2     42.80   46.55         43.05     8.13       60920144        27420.16
#> 3    336.00  362.00        338.25     7.02       10967276        38358.05
#> 4    232.25  250.05        235.20     6.31       12732331        30835.16
#> 5   1390.00 1468.00       1382.85     6.16        2679932        38528.04
#> 6     73.90   78.70         74.35     5.85       34322810        26291.27
#> 7    541.25  569.40        541.25     5.20       22570185       125512.80
#> 8     35.50   37.60         35.75     5.17       26513634         9823.30
#> 9     48.25   51.30         49.05     4.59       55805690        27847.04
#> 10   365.40  384.75        368.05     4.54        4880589        18333.93
```

### Pre Open Market Data

##### Fetch data of pre open session of Nifty Bank.

``` r
nse_preopen_nifty_bank()
#>        symbol series corp_action_date corp_action   price change percent_change
#> 1  FEDERALBNK     EQ             <NA>        <NA>   59.90   0.70           1.18
#> 2    HDFCBANK     EQ             <NA>        <NA> 1415.00  12.20           0.87
#> 3     RBLBANK     EQ             <NA>        <NA>  228.55   1.95           0.86
#> 4   KOTAKBANK     EQ             <NA>        <NA> 1875.00  12.55           0.67
#> 5   ICICIBANK     EQ             <NA>        <NA>  475.10   2.40           0.51
#> 6  BANDHANBNK     EQ             <NA>        <NA>  369.90   1.75           0.48
#> 7        SBIN     EQ             <NA>        <NA>  244.00   1.00           0.41
#> 8    AXISBANK     EQ             <NA>        <NA>  602.25   2.40           0.40
#> 9  INDUSINDBK     EQ             <NA>        <NA>  857.00   1.95           0.23
#> 10        PNB     EQ             <NA>        <NA>   31.40   0.05           0.16
#> 11 BANKBARODA     EQ             <NA>        <NA>   49.10   0.05           0.10
#> 12 IDFCFIRSTB     EQ             <NA>        <NA>   35.80   0.00           0.00
#>    prev_close quantity  value   mkt_cap year_high year_low sum_val sum_quantity
#> 1       59.20   169524 101.54  11809.31     96.95    35.70 1704.65       482740
#> 2     1402.80    28611 404.85 609863.14   1464.40   738.75 1704.65       482740
#> 3      226.60    24743  56.55   8653.43    391.20   101.55 1704.65       482740
#> 4     1862.45    18038 338.21 272776.99   1948.40  1001.00 1704.65       482740
#> 5      472.70    16769  79.67 325973.71    552.20   268.30 1704.65       482740
#> 6      368.15    12859  47.57  24899.64    597.00   152.20 1704.65       482740
#> 7      243.00    94976 231.74  93253.27    351.00   149.45 1704.65       482740
#> 8      599.85    28166 169.63 148682.98    765.85   286.00 1704.65       482740
#> 9      855.05    21933 187.97  48501.43   1596.55   235.55 1704.65       482740
#> 10      31.35    96171  30.20   4130.33     67.70    26.30 1704.65       482740
#> 11      49.05    75211  36.93   5892.61    108.25    36.00 1704.65       482740
#> 12      35.80    55313  19.80   7513.59     47.95    17.65 1704.65       482740
#>    fin_quantity sum_fin_quantity
#> 1        169524           642314
#> 2         28611           642314
#> 3         24743           642314
#> 4         18038           642314
#> 5         16769           642314
#> 6         12859           642314
#> 7         94976           642314
#> 8         28166           642314
#> 9         21933           642314
#> 10        96171           642314
#> 11        75211           642314
#> 12        55313           642314

# retain original column names as returned by NSE
nse_preopen_nifty(clean_names = FALSE)
#>        symbol series        xDt
#> 1          LT     EQ 2020-11-04
#> 2    SHREECEM     EQ       <NA>
#> 3  BAJFINANCE     EQ       <NA>
#> 4         TCS     EQ 2020-11-26
#> 5   POWERGRID     EQ 2020-09-02
#> 6     HCLTECH     EQ 2020-10-22
#> 7   SUNPHARMA     EQ       <NA>
#> 8  HEROMOTOCO     EQ       <NA>
#> 9  BHARTIARTL     EQ       <NA>
#> 10  TATASTEEL     EQ       <NA>
#> 11   HDFCBANK     EQ       <NA>
#> 12     GRASIM     EQ       <NA>
#> 13      TITAN     EQ       <NA>
#> 14  KOTAKBANK     EQ       <NA>
#> 15        ITC     EQ       <NA>
#> 16  EICHERMOT     EQ       <NA>
#> 17  COALINDIA     EQ 2020-11-19
#> 18  ICICIBANK     EQ       <NA>
#> 19    SBILIFE     EQ       <NA>
#> 20      TECHM     EQ 2020-10-29
#> 21 ADANIPORTS     EQ       <NA>
#> 22   DIVISLAB     EQ 2020-09-04
#> 23  NESTLEIND     EQ 2020-10-29
#> 24   HDFCLIFE     EQ       <NA>
#> 25       ONGC     EQ       <NA>
#> 26       BPCL     EQ 2020-09-18
#> 27       SBIN     EQ       <NA>
#> 28   AXISBANK     EQ       <NA>
#> 29       INFY     EQ 2020-10-23
#> 30  BRITANNIA     EQ       <NA>
#> 31   HINDALCO     EQ 2020-09-03
#> 32     MARUTI     EQ       <NA>
#> 33      CIPLA     EQ       <NA>
#> 34      WIPRO     EQ       <NA>
#> 35        M&M     EQ       <NA>
#> 36   RELIANCE     EQ       <NA>
#> 37 BAJAJFINSV     EQ       <NA>
#> 38       HDFC     EQ       <NA>
#> 39 ASIANPAINT     EQ 2020-10-28
#> 40 INDUSINDBK     EQ       <NA>
#> 41 HINDUNILVR     EQ 2020-10-28
#> 42        IOC     EQ       <NA>
#> 43 TATAMOTORS     EQ       <NA>
#> 44    DRREDDY     EQ       <NA>
#> 45   JSWSTEEL     EQ       <NA>
#> 46 BAJAJ-AUTO     EQ       <NA>
#> 47 ULTRACEMCO     EQ       <NA>
#> 48       NTPC     EQ 2020-11-12
#> 49       GAIL     EQ       <NA>
#> 50        UPL     EQ       <NA>
#>                                                  caAct      iep    chn perChn
#> 1                   SPECIAL DIVIDEND - RS 18 PER SHARE  1130.00  14.00   1.25
#> 2                                                 <NA> 23949.00 250.20   1.06
#> 3                                                 <NA>  4655.00 -34.75  -0.74
#> 4                                              BUYBACK  2686.00 -15.30  -0.57
#> 5  ANNUAL GENERAL MEETING/DIVIDEND - RS 4.04 PER SHARE   195.15  -0.15  -0.08
#> 6                    INTERIM DIVIDEND - RS 4 PER SHARE   824.10  -0.60  -0.07
#> 7                                                 <NA>   506.00  -0.20  -0.04
#> 8                                                 <NA>  3008.00  -0.75  -0.02
#> 9                                                 <NA>   468.70   4.60   0.99
#> 10                                                <NA>   546.00   4.75   0.88
#> 11                                                <NA>  1415.00  12.20   0.87
#> 12                                                <NA>   850.20   7.10   0.84
#> 13                                                <NA>  1316.95  10.00   0.77
#> 14                                                <NA>  1875.00  12.55   0.67
#> 15                                                <NA>   195.10   1.25   0.64
#> 16                                                <NA>  2610.00  14.90   0.57
#> 17                INTERIM DIVIDEND - RS 7.50 PER SHARE   124.60   0.65   0.52
#> 18                                                <NA>   475.10   2.40   0.51
#> 19                                                <NA>   853.30   4.25   0.50
#> 20                  SPECIAL DIVIDEND - RS 15 PER SHARE   866.50   4.25   0.49
#> 21                                                <NA>   400.80   1.85   0.46
#> 22                              ANNUAL GENERAL MEETING  3485.50  16.05   0.46
#> 23                 INTERIM DIVIDNED - RS 135 PER SHARE 17599.00  78.80   0.45
#> 24                                                <NA>   668.00   2.90   0.44
#> 25                                                <NA>    81.15   0.35   0.43
#> 26                              ANNUAL GENERAL MEETING   383.70   1.65   0.43
#> 27                                                <NA>   244.00   1.00   0.41
#> 28                                                <NA>   602.25   2.40   0.40
#> 29                  INTERIM DIVIDEND - RS 12 PER SHARE  1119.95   4.30   0.39
#> 30                                                <NA>  3569.80  14.00   0.39
#> 31    ANNUAL GENERAL MEETING/DIVIDEND - RE 1 PER SHARE   224.20   0.75   0.34
#> 32                                                <NA>  7080.00  24.30   0.34
#> 33                                                <NA>   734.00   2.35   0.32
#> 34                                                <NA>   351.00   1.00   0.29
#> 35                                                <NA>   722.00   2.05   0.28
#> 36                                                <NA>  1953.05   5.25   0.27
#> 37                                                <NA>  8740.00  22.25   0.26
#> 38                                                <NA>  2197.15   5.80   0.26
#> 39                INTERIM DIVIDEND - RS 3.35 PER SHARE  2160.00   5.70   0.26
#> 40                                                <NA>   857.00   1.95   0.23
#> 41                  INTERIM DIVIDEND - RS 14 PER SHARE  2140.00   4.15   0.19
#> 42                                                <NA>    85.90   0.15   0.17
#> 43                                                <NA>   171.60   0.15   0.09
#> 44                                                <NA>  4810.00   3.70   0.08
#> 45                                                <NA>   338.50   0.25   0.07
#> 46                                                <NA>  3053.00   1.75   0.06
#> 47                                                <NA>  4822.00   2.15   0.04
#> 48                                            BUY-BACK    93.95   0.00   0.00
#> 49                                                <NA>   102.30   0.00   0.00
#> 50                                                <NA>   418.60   0.00   0.00
#>        pCls trdQnty    iVal    mktCap    yHigh     yLow  sumVal sumQnty finQnty
#> 1   1116.00   19289  217.97 136320.55  1383.70   661.00 7699.46  801840   19289
#> 2  23698.80     287   68.73  31637.61 25355.00 15410.00 7699.46  801840     287
#> 3   4689.75    9881  459.96 124343.29  4923.40  1783.00 7699.46  801840    9881
#> 4   2701.30   16492  442.98 283816.87  2885.00  1506.05 7699.46  801840   16492
#> 5    195.30    9761   19.05  50064.74   211.00   122.15 7699.46  801840    9761
#> 6    824.70    9991   82.34  89518.38   910.70   375.25 7699.46  801840    9991
#> 7    506.20   37432  189.41  54654.45   564.75   312.00 7699.46  801840   37432
#> 8   3008.75    3444  103.60  39064.76  3394.90  1475.00 7699.46  801840    3444
#> 9    464.10   63368  297.01 111404.66   612.00   361.75 7699.46  801840   63368
#> 10   541.25   25227  137.74  40850.73   558.65   250.85 7699.46  801840   25227
#> 11  1402.80   28611  404.85 609863.14  1464.40   738.75 7699.46  801840   28611
#> 12   843.10    1986   16.88  33281.96   873.80   385.05 7699.46  801840    1986
#> 13  1306.95    2093   27.56  54533.73  1375.00   720.90 7699.46  801840    2093
#> 14  1862.45   18038  338.21 272776.99  1948.40  1001.00 7699.46  801840   18038
#> 15   193.85   69514  135.62 169354.31   250.40   134.60 7699.46  801840   69514
#> 16  2595.10    1948   50.84  36160.71  2727.00  1245.01 7699.46  801840    1948
#> 17   123.95   17902   22.31  25971.59   214.60   109.55 7699.46  801840   17902
#> 18   472.70   16769   79.67 325973.71   552.20   268.30 7699.46  801840   16769
#> 19   849.05    2001   17.07  33114.48  1020.00   519.40 7699.46  801840    2001
#> 20   862.25    2274   19.70  53329.97   890.00   471.40 7699.46  801840    2274
#> 21   398.95   18456   73.97  29180.43   404.70   203.00 7699.46  801840   18456
#> 22  3469.45     807   28.13  44209.44  3637.80  1626.00 7699.46  801840     807
#> 23 17520.20      69   12.14  62501.24 18369.95 12200.00 7699.46  801840      69
#> 24   665.10    6376   42.59  52379.37   688.50   340.00 7699.46  801840    6376
#> 25    80.80  167432  135.87  29478.11   133.55    50.00 7699.46  801840  167432
#> 26   382.05    9503   36.46  30664.23   518.45   252.00 7699.46  801840    9503
#> 27   243.00   94976  231.74  93253.27   351.00   149.45 7699.46  801840   94976
#> 28   599.85   28166  169.63 148682.98   765.85   286.00 7699.46  801840   28166
#> 29  1115.65   13759  154.09 408671.51  1186.00   509.25 7699.46  801840   13759
#> 30  3555.80     415   14.81  41942.64  4010.00  2100.00 7699.46  801840     415
#> 31   223.45   15877   35.60  32625.60   230.00    84.90 7699.46  801840   15877
#> 32  7055.70     904   64.00  93781.00  7569.90  4001.10 7699.46  801840     904
#> 33   731.65   12181   89.41  37167.09   829.05   355.30 7699.46  801840   12181
#> 34   350.00   15438   54.19  52001.86   381.70   159.40 7699.46  801840   15438
#> 35   719.95    4594   33.17  68917.81   745.50   245.40 7699.46  801840    4594
#> 36  1947.80   99446 1942.23 629743.11  2369.35   866.98 7699.46  801840   99446
#> 37  8717.75    3491  305.11  52718.13  9950.00  3985.30 7699.46  801840    3491
#> 38  2191.35   15660  344.07 392537.68  2499.90  1473.45 7699.46  801840   15660
#> 39  2154.30    2802   60.52  97120.79  2249.00  1431.20 7699.46  801840    2802
#> 40   855.05   21933  187.97  48501.43  1596.55   235.55 7699.46  801840   21933
#> 41  2135.85    1990   42.59 190695.39  2614.30  1757.30 7699.46  801840    1990
#> 42    85.75   33525   28.80  21796.13   133.70    71.15 7699.46  801840   33525
#> 43   171.45  109920  188.62  30717.07   201.70    63.50 7699.46  801840  109920
#> 44  4806.30    2886  138.82  58332.21  5512.65  2495.05 7699.46  801840    2886
#> 45   338.25    5162   17.47  33522.62   350.50   132.50 7699.46  801840    5162
#> 46  3051.25     693   21.16  39731.90  3315.15  1788.65 7699.46  801840     693
#> 47  4819.85     306   14.76  55645.38  4979.00  2910.00 7699.46  801840     306
#> 48    93.95   33252   31.24  45550.09   125.00    73.20 7699.46  801840   33252
#> 49   102.30   33779   34.56  18916.89   133.35    65.00 7699.46  801840   33779
#> 50   418.60    8181   34.25  23027.72   614.90   240.15 7699.46  801840    8181
#>    sumfinQnty
#> 1     1118287
#> 2     1118287
#> 3     1118287
#> 4     1118287
#> 5     1118287
#> 6     1118287
#> 7     1118287
#> 8     1118287
#> 9     1118287
#> 10    1118287
#> 11    1118287
#> 12    1118287
#> 13    1118287
#> 14    1118287
#> 15    1118287
#> 16    1118287
#> 17    1118287
#> 18    1118287
#> 19    1118287
#> 20    1118287
#> 21    1118287
#> 22    1118287
#> 23    1118287
#> 24    1118287
#> 25    1118287
#> 26    1118287
#> 27    1118287
#> 28    1118287
#> 29    1118287
#> 30    1118287
#> 31    1118287
#> 32    1118287
#> 33    1118287
#> 34    1118287
#> 35    1118287
#> 36    1118287
#> 37    1118287
#> 38    1118287
#> 39    1118287
#> 40    1118287
#> 41    1118287
#> 42    1118287
#> 43    1118287
#> 44    1118287
#> 45    1118287
#> 46    1118287
#> 47    1118287
#> 48    1118287
#> 49    1118287
#> 50    1118287
```

### Advances & Declines

``` r
nse_advances_declines()
#>                                     index_name advances declines unchanged
#> 1                                     NIFTY 50       42        8         0
#> 2                                NIFTY NEXT 50       38       12         0
#> 3                                     NIFTY IT        8        2         0
#> 4                                   NIFTY BANK        9        3         0
#> 5                              NIFTY MIDCAP 50       41        9         0
#> 6                                  NIFTY INFRA       22        8         0
#> 7                                 NIFTY REALTY        6        2         2
#> 8                                 NIFTY ENERGY        6        4         0
#> 9                                   NIFTY FMCG       14        1         0
#> 10                                   NIFTY MNC       19       11         0
#> 11                                NIFTY PHARMA       10        0         0
#> 12                                   NIFTY PSE       15        5         0
#> 13                              NIFTY PSU BANK        8        2         2
#> 14                           NIFTY SERV SECTOR       24        6         0
#> 15                           NIFTY COMMODITIES       23        7         0
#> 16                           NIFTY CONSUMPTION       24        6         0
#> 17                           NIFTY FIN SERVICE       18        2         0
#> 18                                  NIFTY AUTO        9        6         0
#> 19                           NIFTY DIV OPPS 50       38       12         0
#> 20                                 NIFTY MEDIA        8        2         0
#> 21                                 NIFTY METAL       13        2         0
#> 22                             NIFTY100 LIQ 15       11        4         0
#> 23                                  NIFTY CPSE       10        2         0
#> 24                           NIFTY GROWSECT 15       13        2         0
#> 25                            NIFTY50 VALUE 20       16        4         0
#> 26                           NIFTY100 QUALTY30       23        7         0
#> 27                              NIFTY PVT BANK        6        4         0
#> 28                            NIFTY MID LIQ 15       10        5         0
#> 29                                   NIFTY 100       80       20         0
#> 30                                   NIFTY 200      148       52         0
#> 31                                   NIFTY 500      343      154         4
#> 32                            NIFTY MIDCAP 100       68       32         0
#> 33                            NIFTY SMLCAP 100       69       31         0
#> 34                    NIFTY ADITYA BIRLA GROUP        5        2         0
#> 35                              NIFTY ALPHA 50       32       18         0
#> 36                          NIFTY HIGH BETA 50       39       11         0
#> 37                     NIFTY LOW VOLATILITY 50       41        9         0
#> 38                        NIFTY MAHINDRA GROUP        6        3         0
#> 39                            NIFTY MIDCAP 150       96       53         1
#> 40                       NIFTY MIDSMALLCAP 400      262      134         4
#> 41                            NIFTY SHARIAH 25       20        5         0
#> 42                          NIFTY SMALLCAP 250      166       81         3
#> 43                           NIFTY SMALLCAP 50       34       16         0
#> 44                            NIFTY TATA GROUP       18        7         0
#> 45                    NIFTY TATA GROUP 25% CAP        9        1         0
#> 46                            NIFTY100 EQL WGT       80       20         0
#> 47                           NIFTY100 LOWVOL30       27        3         0
#> 48                             NIFTY50 SHARIAH       16        2         0
#> 49                            NIFTY500 SHARIAH      142       68         0
#> 50                             NIFTY50 EQL WGT       42        8         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       26        4         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       25        5         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30       25        5         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30       27        3         0
#> 55                            NIFTY SME EMERGE       22       16        51
#> 56                       NIFTY LARGEMIDCAP 250      176       73         1
#> 57                           NIFTY500 VALUE 50       37       13         0
#> 58                            NIFTY MIDCAP 150       96       53         1
#> 59                             NIFTY SMLCAP 50       34       16         0
#> 60                            NIFTY SMLCAP 250      166       81         3
#> 61                            NIFTY MIDSML 400      262      134         4
#> 62                           NIFTY200 QUALTY30       24        6         0
#> 63                           NIFTY FINSRV25 50       18        2         0
#> 64                          CNX NIFTY Pre Open       41        6         3

# retain original column names as returned by NSE
nse_advances_declines(clean_names = FALSE)
#>                                        skipped advances declines unchanged
#> 1                                     NIFTY 50       42        8         0
#> 2                                NIFTY NEXT 50       38       12         0
#> 3                                     NIFTY IT        8        2         0
#> 4                                   NIFTY BANK        9        3         0
#> 5                              NIFTY MIDCAP 50       41        9         0
#> 6                                  NIFTY INFRA       22        8         0
#> 7                                 NIFTY REALTY        6        2         2
#> 8                                 NIFTY ENERGY        6        4         0
#> 9                                   NIFTY FMCG       14        1         0
#> 10                                   NIFTY MNC       19       11         0
#> 11                                NIFTY PHARMA       10        0         0
#> 12                                   NIFTY PSE       15        5         0
#> 13                              NIFTY PSU BANK        8        2         2
#> 14                           NIFTY SERV SECTOR       24        6         0
#> 15                           NIFTY COMMODITIES       23        7         0
#> 16                           NIFTY CONSUMPTION       24        6         0
#> 17                           NIFTY FIN SERVICE       18        2         0
#> 18                                  NIFTY AUTO        9        6         0
#> 19                           NIFTY DIV OPPS 50       38       12         0
#> 20                                 NIFTY MEDIA        8        2         0
#> 21                                 NIFTY METAL       13        2         0
#> 22                             NIFTY100 LIQ 15       11        4         0
#> 23                                  NIFTY CPSE       10        2         0
#> 24                           NIFTY GROWSECT 15       13        2         0
#> 25                            NIFTY50 VALUE 20       16        4         0
#> 26                           NIFTY100 QUALTY30       23        7         0
#> 27                              NIFTY PVT BANK        6        4         0
#> 28                            NIFTY MID LIQ 15       10        5         0
#> 29                                   NIFTY 100       80       20         0
#> 30                                   NIFTY 200      148       52         0
#> 31                                   NIFTY 500      343      154         4
#> 32                            NIFTY MIDCAP 100       68       32         0
#> 33                            NIFTY SMLCAP 100       69       31         0
#> 34                    NIFTY ADITYA BIRLA GROUP        5        2         0
#> 35                              NIFTY ALPHA 50       32       18         0
#> 36                          NIFTY HIGH BETA 50       39       11         0
#> 37                     NIFTY LOW VOLATILITY 50       41        9         0
#> 38                        NIFTY MAHINDRA GROUP        6        3         0
#> 39                            NIFTY MIDCAP 150       96       53         1
#> 40                       NIFTY MIDSMALLCAP 400      262      134         4
#> 41                            NIFTY SHARIAH 25       20        5         0
#> 42                          NIFTY SMALLCAP 250      166       81         3
#> 43                           NIFTY SMALLCAP 50       34       16         0
#> 44                            NIFTY TATA GROUP       18        7         0
#> 45                    NIFTY TATA GROUP 25% CAP        9        1         0
#> 46                            NIFTY100 EQL WGT       80       20         0
#> 47                           NIFTY100 LOWVOL30       27        3         0
#> 48                             NIFTY50 SHARIAH       16        2         0
#> 49                            NIFTY500 SHARIAH      142       68         0
#> 50                             NIFTY50 EQL WGT       42        8         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       26        4         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       25        5         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30       25        5         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30       27        3         0
#> 55                            NIFTY SME EMERGE       22       16        51
#> 56                       NIFTY LARGEMIDCAP 250      176       73         1
#> 57                           NIFTY500 VALUE 50       37       13         0
#> 58                            NIFTY MIDCAP 150       96       53         1
#> 59                             NIFTY SMLCAP 50       34       16         0
#> 60                            NIFTY SMLCAP 250      166       81         3
#> 61                            NIFTY MIDSML 400      262      134         4
#> 62                           NIFTY200 QUALTY30       24        6         0
#> 63                           NIFTY FINSRV25 50       18        2         0
#> 64                          CNX NIFTY Pre Open       41        6         3
```
