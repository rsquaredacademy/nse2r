
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nse2r

> Fetch data from the National Stock Exchange, India.

<!-- badges: start -->

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/nse2r)](https://cran.r-project.org/package=nse2r)
[![cran
checks](https://cranchecks.info/badges/summary/nse2r)](https://cran.r-project.org/web/checks/check_results_nse2r.html)
[![Travis-CI Build
Status](https://travis-ci.org/rsquaredacademy/nse2r.svg?branch=master)](https://travis-ci.org/rsquaredacademy/nse2r)
[![Coverage
Status](https://img.shields.io/codecov/c/github/rsquaredacademy/nse2r/master.svg)](https://codecov.io/github/rsquaredacademy/nse2r?branch=master)
[![](https://cranlogs.r-pkg.org/badges/grand-total/nse2r)](https://cran.r-project.org/package=nse2r)
[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![status](https://tinyverse.netlify.com/badge/nse2r)](https://CRAN.R-project.org/package=nse2r)
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
#>           index_name last_traded_price  change percent_change
#> 1  NIFTY 50 Pre Open         10014.800  201.10           2.05
#> 2           NIFTY 50          9914.000  100.30           1.02
#> 3      NIFTY NEXT 50         24863.450   70.15           0.28
#> 4    NIFTY100 LIQ 15          2456.800  -13.45          -0.54
#> 5         NIFTY BANK         20296.700  383.80           1.93
#> 6          INDIA VIX            32.965    0.39           1.18
#> 7          NIFTY 100         10097.350   91.55           0.91
#> 8          NIFTY 500          8152.300   65.85           0.81
#> 9   NIFTY MIDCAP 100         14230.600   62.05           0.44
#> 10   NIFTY MIDCAP 50          3975.500   22.60           0.57
#> 11       NIFTY INFRA          2918.700   -7.25          -0.25
#> 12      NIFTY REALTY           196.850   -1.65          -0.83
#> 13      NIFTY ENERGY         13780.550  -34.90          -0.25
#> 14        NIFTY FMCG         28575.350 -126.45          -0.44
#> 15         NIFTY MNC         12663.350  -34.30          -0.27
#> 16      NIFTY PHARMA          9926.400  -62.65          -0.63
#> 17         NIFTY PSE          2409.650   -7.60          -0.31
#> 18    NIFTY PSU BANK          1358.600  -12.90          -0.94
#> 19 NIFTY SERV SECTOR         13129.300  237.60           1.84
#> 20          NIFTY IT         14450.800   54.10           0.38
#> 21  NIFTY SMLCAP 100          4404.750   -4.85          -0.11
#> 22         NIFTY 200          5154.500   44.15           0.86
#> 23        NIFTY AUTO          6451.050    8.05           0.12
#> 24       NIFTY MEDIA          1314.950   16.15           1.24
#> 25       NIFTY METAL          1955.900   27.35           1.42
#> 26 NIFTY DIV OPPS 50          2158.850    0.55           0.03
#> 27 NIFTY COMMODITIES          2797.200   17.00           0.61
#> 28 NIFTY CONSUMPTION          4601.200   -4.05          -0.09
#> 29        NIFTY CPSE          1404.750   -2.95          -0.21
#> 30 NIFTY FIN SERVICE         10089.950  272.05           2.77
#> 31 NIFTY GROWSECT 15          4966.150   65.30           1.33
#> 32  NIFTY50 VALUE 20          4825.800    6.00           0.12
#> 33 NIFTY50 TR 2X LEV          4132.450   82.45           2.04
#> 34 NIFTY50 PR 2X LEV          3148.950   62.80           2.03
#> 35 NIFTY50 TR 1X INV           386.100   -3.95          -1.01
#> 36 NIFTY50 PR 1X INV           442.000   -4.55          -1.02
#> 37    NIFTY ALPHA 50         13006.800  154.15           1.20
#> 38   NIFTY50 EQL WGT         10304.700   11.85           0.12
#> 39  NIFTY100 EQL WGT         11393.700    4.20           0.04
#> 40 NIFTY100 LOWVOL30          8053.900   10.10           0.13
#> 41  NIFTY MID LIQ 15          3340.300   19.30           0.58
#> 42    NIFTY PVT BANK         11155.000  208.70           1.91
#> 43 NIFTY100 QUALTY30          2347.000    8.80           0.38
#> 44   NIFTY GS 8 13YR          2172.000   -6.93          -0.31
#> 45     NIFTY GS 10YR          1986.150   -7.62          -0.38
#> 46 NIFTY GS 10YR CLN           975.640   -3.92          -0.40
#> 47    NIFTY GS 4 8YR          2309.580   -4.64          -0.20
#> 48  NIFTY GS 11 15YR          2339.530   -8.16          -0.34
#> 49 NIFTY GS 15YRPLUS          2568.510   -1.10          -0.04
#> 50 NIFTY GS COMPSITE          2213.760   -5.88          -0.26
#> 51  NIFTY MIDCAP 150          5399.550   30.10           0.56
#> 52   NIFTY SMLCAP 50          2065.300   -6.50          -0.31
#> 53  NIFTY SMLCAP 250          3881.700   -2.95          -0.08
#> 54  NIFTY MIDSML 400          4852.950   18.00           0.37
#> 55 NIFTY200 QUALTY30          8927.100   19.90           0.22

# retain original column names as returned by NSE
nse_index_quote(clean_names = FALSE)
#>              skipped lastPrice  change pChange
#> 1  NIFTY 50 Pre Open 10014.800  201.10    2.05
#> 2           NIFTY 50  9914.000  100.30    1.02
#> 3      NIFTY NEXT 50 24863.450   70.15    0.28
#> 4    NIFTY100 LIQ 15  2456.800  -13.45   -0.54
#> 5         NIFTY BANK 20296.700  383.80    1.93
#> 6          INDIA VIX    32.965    0.39    1.18
#> 7          NIFTY 100 10097.350   91.55    0.91
#> 8          NIFTY 500  8152.300   65.85    0.81
#> 9   NIFTY MIDCAP 100 14230.600   62.05    0.44
#> 10   NIFTY MIDCAP 50  3975.500   22.60    0.57
#> 11       NIFTY INFRA  2918.700   -7.25   -0.25
#> 12      NIFTY REALTY   196.850   -1.65   -0.83
#> 13      NIFTY ENERGY 13780.550  -34.90   -0.25
#> 14        NIFTY FMCG 28575.350 -126.45   -0.44
#> 15         NIFTY MNC 12663.350  -34.30   -0.27
#> 16      NIFTY PHARMA  9926.400  -62.65   -0.63
#> 17         NIFTY PSE  2409.650   -7.60   -0.31
#> 18    NIFTY PSU BANK  1358.600  -12.90   -0.94
#> 19 NIFTY SERV SECTOR 13129.300  237.60    1.84
#> 20          NIFTY IT 14450.800   54.10    0.38
#> 21  NIFTY SMLCAP 100  4404.750   -4.85   -0.11
#> 22         NIFTY 200  5154.500   44.15    0.86
#> 23        NIFTY AUTO  6451.050    8.05    0.12
#> 24       NIFTY MEDIA  1314.950   16.15    1.24
#> 25       NIFTY METAL  1955.900   27.35    1.42
#> 26 NIFTY DIV OPPS 50  2158.850    0.55    0.03
#> 27 NIFTY COMMODITIES  2797.200   17.00    0.61
#> 28 NIFTY CONSUMPTION  4601.200   -4.05   -0.09
#> 29        NIFTY CPSE  1404.750   -2.95   -0.21
#> 30 NIFTY FIN SERVICE 10089.950  272.05    2.77
#> 31 NIFTY GROWSECT 15  4966.150   65.30    1.33
#> 32  NIFTY50 VALUE 20  4825.800    6.00    0.12
#> 33 NIFTY50 TR 2X LEV  4132.450   82.45    2.04
#> 34 NIFTY50 PR 2X LEV  3148.950   62.80    2.03
#> 35 NIFTY50 TR 1X INV   386.100   -3.95   -1.01
#> 36 NIFTY50 PR 1X INV   442.000   -4.55   -1.02
#> 37    NIFTY ALPHA 50 13006.800  154.15    1.20
#> 38   NIFTY50 EQL WGT 10304.700   11.85    0.12
#> 39  NIFTY100 EQL WGT 11393.700    4.20    0.04
#> 40 NIFTY100 LOWVOL30  8053.900   10.10    0.13
#> 41  NIFTY MID LIQ 15  3340.300   19.30    0.58
#> 42    NIFTY PVT BANK 11155.000  208.70    1.91
#> 43 NIFTY100 QUALTY30  2347.000    8.80    0.38
#> 44   NIFTY GS 8 13YR  2172.000   -6.93   -0.31
#> 45     NIFTY GS 10YR  1986.150   -7.62   -0.38
#> 46 NIFTY GS 10YR CLN   975.640   -3.92   -0.40
#> 47    NIFTY GS 4 8YR  2309.580   -4.64   -0.20
#> 48  NIFTY GS 11 15YR  2339.530   -8.16   -0.34
#> 49 NIFTY GS 15YRPLUS  2568.510   -1.10   -0.04
#> 50 NIFTY GS COMPSITE  2213.760   -5.88   -0.26
#> 51  NIFTY MIDCAP 150  5399.550   30.10    0.56
#> 52   NIFTY SMLCAP 50  2065.300   -6.50   -0.31
#> 53  NIFTY SMLCAP 250  3881.700   -2.95   -0.08
#> 54  NIFTY MIDSML 400  4852.950   18.00    0.37
#> 55 NIFTY200 QUALTY30  8927.100   19.90    0.22
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#>        symbol series last_corp_announcement_date
#> 1    HDFCBANK     EQ                  2019-09-19
#> 2        HDFC     EQ                  2020-07-09
#> 3   ICICIBANK     EQ                  2019-07-22
#> 4    JSWSTEEL     EQ                  2020-07-06
#> 5    HINDALCO     EQ                  2019-08-14
#> 6         UPL     EQ                  2019-07-02
#> 7        INFY     EQ                  2020-05-29
#> 8   KOTAKBANK     EQ                  2019-07-12
#> 9  HEROMOTOCO     EQ                  2020-02-17
#> 10       VEDL     EQ                  2020-03-05
#>                                                     last_corp_announcement
#> 1  Face Value Split (Sub-Division) - From Rs 2 Per Share To Rs 1 Per Share
#> 2                        Annual General Meeting/Dividend - Rs 21 Per Share
#> 3                         Annual General Meeting/Dividend - Re 1 Per Share
#> 4                                                Dividend - Rs 2 Per Share
#> 5                      Annual General Meeting/Dividend - Rs 1.20 Per Share
#> 6                                                                Bonus 1:2
#> 7                                             Dividend - Rs 9.50 Per Share
#> 8                        Annual General Meeting/Dividend Rs 0.80 Per Share
#> 9                                          Interim Dividend - Rs 65 Per Sh
#> 10                                     Interim Dividend - Rs 3.9 Per Share
#>    open_price high_price low_price last_traded_price prev_close_price
#> 1      975.00     993.95    952.00            989.15           949.85
#> 2     1785.00    1834.00   1768.05           1820.00          1751.65
#> 3      342.25     347.90    326.05            342.40           331.10
#> 4      189.00     195.95    185.75            189.00           183.75
#> 5      149.90     154.60    146.90            149.85           145.80
#> 6      416.00     429.40    410.00            414.90           405.00
#> 7      702.00     712.00    699.15            700.00           687.55
#> 8     1276.00    1295.80   1238.10           1271.15          1248.90
#> 9     2380.00    2435.70   2360.00           2386.00          2348.15
#> 10     105.00     105.90    101.65            103.95           102.40
#>    percent_change traded_quantity turnover_in_lakhs
#> 1            4.14        22700113         222131.96
#> 2            3.90         7453412         134946.26
#> 3            3.41        57511276         195590.10
#> 4            2.86        23464025          45001.65
#> 5            2.78        28477572          43117.89
#> 6            2.44        10359468          43640.29
#> 7            1.81        10132423          71441.69
#> 8            1.78         5266312          66988.54
#> 9            1.61         2145404          51604.05
#> 10           1.51        22657943          23584.65

# retain original column names as returned by NSE
nse_stock_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1    HDFCBANK     EQ               2019-09-19
#> 2        HDFC     EQ               2020-07-09
#> 3   ICICIBANK     EQ               2019-07-22
#> 4    JSWSTEEL     EQ               2020-07-06
#> 5    HINDALCO     EQ               2019-08-14
#> 6         UPL     EQ               2019-07-02
#> 7        INFY     EQ               2020-05-29
#> 8   KOTAKBANK     EQ               2019-07-12
#> 9  HEROMOTOCO     EQ               2020-02-17
#> 10       VEDL     EQ               2020-03-05
#>                                                       lastCorpAnnouncement
#> 1  Face Value Split (Sub-Division) - From Rs 2 Per Share To Rs 1 Per Share
#> 2                        Annual General Meeting/Dividend - Rs 21 Per Share
#> 3                         Annual General Meeting/Dividend - Re 1 Per Share
#> 4                                                Dividend - Rs 2 Per Share
#> 5                      Annual General Meeting/Dividend - Rs 1.20 Per Share
#> 6                                                                Bonus 1:2
#> 7                                             Dividend - Rs 9.50 Per Share
#> 8                        Annual General Meeting/Dividend Rs 0.80 Per Share
#> 9                                          Interim Dividend - Rs 65 Per Sh
#> 10                                     Interim Dividend - Rs 3.9 Per Share
#>    openPrice highPrice lowPrice     ltp previousPrice netPrice tradedQuantity
#> 1     975.00    993.95   952.00  989.15        949.85     4.14       22700113
#> 2    1785.00   1834.00  1768.05 1820.00       1751.65     3.90        7453412
#> 3     342.25    347.90   326.05  342.40        331.10     3.41       57511276
#> 4     189.00    195.95   185.75  189.00        183.75     2.86       23464025
#> 5     149.90    154.60   146.90  149.85        145.80     2.78       28477572
#> 6     416.00    429.40   410.00  414.90        405.00     2.44       10359468
#> 7     702.00    712.00   699.15  700.00        687.55     1.81       10132423
#> 8    1276.00   1295.80  1238.10 1271.15       1248.90     1.78        5266312
#> 9    2380.00   2435.70  2360.00 2386.00       2348.15     1.61        2145404
#> 10    105.00    105.90   101.65  103.95        102.40     1.51       22657943
#>    turnoverInLakhs
#> 1        222131.96
#> 2        134946.26
#> 3        195590.10
#> 4         45001.65
#> 5         43117.89
#> 6         43640.29
#> 7         71441.69
#> 8         66988.54
#> 9         51604.05
#> 10        23584.65
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#>        symbol                            symbol_desc       date new_high
#> 1  ADANIGREEN             Adani Green Energy Limited 2020-06-15   363.45
#> 2  ALEMBICLTD                        Alembic Limited 2020-06-15    89.40
#> 3    ALOKINDS                Alok Industries Limited 2020-06-15    31.30
#> 4  ANDHRACEMT                 Andhra Cements Limited 2020-06-15     6.40
#> 5      APLLTD        Alembic Pharmaceuticals Limited 2020-05-21   943.80
#> 6    ASTRAZEN       AstraZeneca Pharma India Limited 2020-06-08  3574.15
#> 7   BAYERCROP              Bayer Cropscience Limited 2020-06-09  5723.00
#> 8         BCG                Brightcom Group Limited 2020-06-15    11.95
#> 9   BIRLATYRE                    Birla Tyres Limited 2020-06-15    28.45
#> 10    DHANUKA               Dhanuka Agritech Limited 2020-06-15   748.05
#> 11   DNAMEDIA     Diligent Media Corporation Limited 2020-06-12     0.70
#> 12 GAMMNINFRA Gammon Infrastructure Projects Limited 2020-05-15     0.65
#> 13 GMMPFAUDLR                   GMM Pfaudler Limited 2020-06-10  4629.55
#> 14     GOENKA      Goenka Diamond and Jewels Limited 2020-06-15     1.10
#> 15   GRANULES                 Granules India Limited 2020-06-12   224.45
#> 16 HEXATRADEX                    Hexa Tradex Limited 2020-06-15    16.85
#> 17 HOTELRUGBY                    Hotel Rugby Limited 2020-06-15     1.30
#> 18 JMTAUTOLTD                       JMT Auto Limited 2020-06-15     4.00
#> 19   JUBILANT         Jubilant Life Sciences Limited 2020-06-15   695.90
#> 20       KSCL            Kaveri Seed Company Limited 2019-09-25   620.00
#> 21 MANAKALUCO     Manaksia Aluminium Company Limited 2020-06-15    10.65
#> 22   MARKSANS                Marksans Pharma Limited 2020-06-09    33.75
#> 23    METKORE    Metkore Alloys & Industries Limited 2020-06-15     0.60
#> 24     MITTAL              Mittal Life Style Limited 2020-06-15   151.80
#> 25       MOIL                           MOIL Limited 2020-01-13   170.00
#> 26 MOREPENLAB           Morepen Laboratories Limited 2019-09-24    26.60
#> 27 MOTOGENFIN    The Motor & General Finance Limited 2020-06-11    53.65
#> 28    NECLIFE            Nectar Lifesciences Limited 2020-06-11    19.10
#> 29  NETWORK18  Network18 Media & Investments Limited 2020-06-15    38.15
#> 30 OPTOCIRCUI          Opto Circuits (India) Limited 2020-06-15    10.60
#> 31      PIIND                  PI Industries Limited 2020-05-29  1689.00
#> 32   PNBGILTS                      PNB Gilts Limited 2019-07-17    39.80
#> 33 PRAKASHSTL               Prakash Steelage Limited 2020-06-15     1.45
#> 34  PUNJLLOYD                     Punj Lloyd Limited 2019-07-01     1.60
#> 35   RAJRAYON           Raj Rayon Industries Limited 2020-06-15     0.30
#> 36     RALLIS                   Rallis India Limited 2020-02-20   272.00
#> 37   RAMSARUP            Ramsarup Industries Limited 2020-04-28     0.70
#> 38   RELIANCE            Reliance Industries Limited 2020-06-15  1648.55
#> 39      RUCHI          Ruchi Soya Industries Limited 2020-06-15  1028.70
#> 40  RUCHINFRA           Ruchi Infrastructure Limited 2020-06-15    14.60
#> 41  SAGARDEEP               Sagardeep Alloys Limited 2020-06-15    96.90
#> 42 SHREDIGCEM           Shree Digvijay Cement Co.Ltd 2020-06-15    46.90
#> 43   SUMICHEM        Sumitomo Chemical India Limited 2020-06-15   309.00
#> 44     SYNCOM              Syncom Healthcare Limited 2020-06-15     2.00
#> 45   TATACOMM            Tata Communications Limited 2020-06-15   587.15
#> 46 TV18BRDCST                 TV18 Broadcast Limited 2020-06-15    38.30
#> 47  ZENITHBIR           Zenith Birla (India) Limited 2020-06-15     1.05
#>       year last_traded_price prev_high prev_close change percent_change
#> 1   363.45            363.45    351.00     346.15  17.30           5.00
#> 2    89.40             79.30     77.45      77.25   2.05           2.65
#> 3    31.30             31.30     29.85      29.85   1.45           4.86
#> 4     6.40              6.40      6.10       6.10   0.30           4.92
#> 5   943.80            907.50    915.00     889.95  17.55           1.97
#> 6  3574.15           3490.00   3493.95    3431.90  58.10           1.69
#> 7  5723.00           5690.00   5600.00    5491.00 199.00           3.62
#> 8    11.95             11.95     11.40      11.40   0.55           4.82
#> 9    28.45             28.45     27.10      27.10   1.35           4.98
#> 10  748.05            735.00    698.00     690.90  44.10           6.38
#> 11    0.70              0.65      0.70       0.65   0.00           0.00
#> 12    0.65              0.65      0.65       0.60   0.05           8.33
#> 13 4629.55           4465.30   4619.85    4422.80  42.50           0.96
#> 14    1.10              1.10      1.05       1.05   0.05           4.76
#> 15  224.45            216.05    217.40     207.55   8.50           4.10
#> 16   16.85             15.45     16.05      16.05  -0.60          -3.74
#> 17    1.30              1.30      1.25       1.25   0.05           4.00
#> 18    4.00              4.00      3.85       3.85   0.15           3.90
#> 19  695.90            655.00    691.00     673.95 -18.95          -2.81
#> 20  620.00            620.00    575.00     547.90  72.10          13.16
#> 21   10.65             10.30     10.15      10.15   0.15           1.48
#> 22   33.75             33.75     33.45      32.15   1.60           4.98
#> 23    0.60              0.60      0.55       0.55   0.05           9.09
#> 24  151.80            151.75    150.45     150.05   1.70           1.13
#> 25  170.00            161.30    169.95     148.85  12.45           8.36
#> 26   26.60             26.60     23.95      22.20   4.40          19.82
#> 27   53.65             48.95     51.00      49.10  -0.15          -0.31
#> 28   19.10             19.10     18.05      15.95   3.15          19.75
#> 29   38.15             38.15     36.35      36.35   1.80           4.95
#> 30   10.60             10.60     10.10      10.10   0.50           4.95
#> 31 1689.00           1610.00   1650.00    1580.65  29.35           1.86
#> 32   39.80             36.55     39.60      37.00  -0.45          -1.22
#> 33    1.45              1.45      1.40       1.40   0.05           3.57
#> 34    1.60              1.60      1.60       1.55   0.05           3.23
#> 35    0.30              0.30      0.25       0.25   0.05          20.00
#> 36  272.00            266.50    256.00     251.50  15.00           5.96
#> 37    0.70              0.70      0.70       0.65   0.05           7.69
#> 38 1648.55           1614.05   1626.95    1614.55  -0.50          -0.03
#> 39 1028.70           1028.70    979.75     979.75  48.95           5.00
#> 40   14.60             14.60     13.95      13.95   0.65           4.66
#> 41   96.90             95.50     93.00      92.50   3.00           3.24
#> 42   46.90             42.20     46.90      44.95  -2.75          -6.12
#> 43  309.00            298.90    299.00     297.00   1.90           0.64
#> 44    2.00              2.00      1.95       1.95   0.05           2.56
#> 45  587.15            577.20    533.80     533.80  43.40           8.13
#> 46   38.30             36.65     33.75      33.20   3.45          10.39
#> 47    1.05              1.05      1.00       1.00   0.05           5.00

# retain original column names as returned by NSE
nse_stock_year_high(clean_names = FALSE)
#>        symbol                             symbolDesc         dt   value    year
#> 1  ADANIGREEN             Adani Green Energy Limited 2020-06-15  363.45  363.45
#> 2  ALEMBICLTD                        Alembic Limited 2020-06-15   89.40   89.40
#> 3    ALOKINDS                Alok Industries Limited 2020-06-15   31.30   31.30
#> 4  ANDHRACEMT                 Andhra Cements Limited 2020-06-15    6.40    6.40
#> 5      APLLTD        Alembic Pharmaceuticals Limited 2020-05-21  943.80  943.80
#> 6    ASTRAZEN       AstraZeneca Pharma India Limited 2020-06-08 3574.15 3574.15
#> 7   BAYERCROP              Bayer Cropscience Limited 2020-06-09 5723.00 5723.00
#> 8         BCG                Brightcom Group Limited 2020-06-15   11.95   11.95
#> 9   BIRLATYRE                    Birla Tyres Limited 2020-06-15   28.45   28.45
#> 10    DHANUKA               Dhanuka Agritech Limited 2020-06-15  748.05  748.05
#> 11   DNAMEDIA     Diligent Media Corporation Limited 2020-06-12    0.70    0.70
#> 12 GAMMNINFRA Gammon Infrastructure Projects Limited 2020-05-15    0.65    0.65
#> 13 GMMPFAUDLR                   GMM Pfaudler Limited 2020-06-10 4629.55 4629.55
#> 14     GOENKA      Goenka Diamond and Jewels Limited 2020-06-15    1.10    1.10
#> 15   GRANULES                 Granules India Limited 2020-06-12  224.45  224.45
#> 16 HEXATRADEX                    Hexa Tradex Limited 2020-06-15   16.85   16.85
#> 17 HOTELRUGBY                    Hotel Rugby Limited 2020-06-15    1.30    1.30
#> 18 JMTAUTOLTD                       JMT Auto Limited 2020-06-15    4.00    4.00
#> 19   JUBILANT         Jubilant Life Sciences Limited 2020-06-15  695.90  695.90
#> 20       KSCL            Kaveri Seed Company Limited 2019-09-25  620.00  620.00
#> 21 MANAKALUCO     Manaksia Aluminium Company Limited 2020-06-15   10.65   10.65
#> 22   MARKSANS                Marksans Pharma Limited 2020-06-09   33.75   33.75
#> 23    METKORE    Metkore Alloys & Industries Limited 2020-06-15    0.60    0.60
#> 24     MITTAL              Mittal Life Style Limited 2020-06-15  151.80  151.80
#> 25       MOIL                           MOIL Limited 2020-01-13  170.00  170.00
#> 26 MOREPENLAB           Morepen Laboratories Limited 2019-09-24   26.60   26.60
#> 27 MOTOGENFIN    The Motor & General Finance Limited 2020-06-11   53.65   53.65
#> 28    NECLIFE            Nectar Lifesciences Limited 2020-06-11   19.10   19.10
#> 29  NETWORK18  Network18 Media & Investments Limited 2020-06-15   38.15   38.15
#> 30 OPTOCIRCUI          Opto Circuits (India) Limited 2020-06-15   10.60   10.60
#> 31      PIIND                  PI Industries Limited 2020-05-29 1689.00 1689.00
#> 32   PNBGILTS                      PNB Gilts Limited 2019-07-17   39.80   39.80
#> 33 PRAKASHSTL               Prakash Steelage Limited 2020-06-15    1.45    1.45
#> 34  PUNJLLOYD                     Punj Lloyd Limited 2019-07-01    1.60    1.60
#> 35   RAJRAYON           Raj Rayon Industries Limited 2020-06-15    0.30    0.30
#> 36     RALLIS                   Rallis India Limited 2020-02-20  272.00  272.00
#> 37   RAMSARUP            Ramsarup Industries Limited 2020-04-28    0.70    0.70
#> 38   RELIANCE            Reliance Industries Limited 2020-06-15 1648.55 1648.55
#> 39      RUCHI          Ruchi Soya Industries Limited 2020-06-15 1028.70 1028.70
#> 40  RUCHINFRA           Ruchi Infrastructure Limited 2020-06-15   14.60   14.60
#> 41  SAGARDEEP               Sagardeep Alloys Limited 2020-06-15   96.90   96.90
#> 42 SHREDIGCEM           Shree Digvijay Cement Co.Ltd 2020-06-15   46.90   46.90
#> 43   SUMICHEM        Sumitomo Chemical India Limited 2020-06-15  309.00  309.00
#> 44     SYNCOM              Syncom Healthcare Limited 2020-06-15    2.00    2.00
#> 45   TATACOMM            Tata Communications Limited 2020-06-15  587.15  587.15
#> 46 TV18BRDCST                 TV18 Broadcast Limited 2020-06-15   38.30   38.30
#> 47  ZENITHBIR           Zenith Birla (India) Limited 2020-06-15    1.05    1.05
#>        ltp value_old    prev change pChange
#> 1   363.45    351.00  346.15  17.30    5.00
#> 2    79.30     77.45   77.25   2.05    2.65
#> 3    31.30     29.85   29.85   1.45    4.86
#> 4     6.40      6.10    6.10   0.30    4.92
#> 5   907.50    915.00  889.95  17.55    1.97
#> 6  3490.00   3493.95 3431.90  58.10    1.69
#> 7  5690.00   5600.00 5491.00 199.00    3.62
#> 8    11.95     11.40   11.40   0.55    4.82
#> 9    28.45     27.10   27.10   1.35    4.98
#> 10  735.00    698.00  690.90  44.10    6.38
#> 11    0.65      0.70    0.65   0.00    0.00
#> 12    0.65      0.65    0.60   0.05    8.33
#> 13 4465.30   4619.85 4422.80  42.50    0.96
#> 14    1.10      1.05    1.05   0.05    4.76
#> 15  216.05    217.40  207.55   8.50    4.10
#> 16   15.45     16.05   16.05  -0.60   -3.74
#> 17    1.30      1.25    1.25   0.05    4.00
#> 18    4.00      3.85    3.85   0.15    3.90
#> 19  655.00    691.00  673.95 -18.95   -2.81
#> 20  620.00    575.00  547.90  72.10   13.16
#> 21   10.30     10.15   10.15   0.15    1.48
#> 22   33.75     33.45   32.15   1.60    4.98
#> 23    0.60      0.55    0.55   0.05    9.09
#> 24  151.75    150.45  150.05   1.70    1.13
#> 25  161.30    169.95  148.85  12.45    8.36
#> 26   26.60     23.95   22.20   4.40   19.82
#> 27   48.95     51.00   49.10  -0.15   -0.31
#> 28   19.10     18.05   15.95   3.15   19.75
#> 29   38.15     36.35   36.35   1.80    4.95
#> 30   10.60     10.10   10.10   0.50    4.95
#> 31 1610.00   1650.00 1580.65  29.35    1.86
#> 32   36.55     39.60   37.00  -0.45   -1.22
#> 33    1.45      1.40    1.40   0.05    3.57
#> 34    1.60      1.60    1.55   0.05    3.23
#> 35    0.30      0.25    0.25   0.05   20.00
#> 36  266.50    256.00  251.50  15.00    5.96
#> 37    0.70      0.70    0.65   0.05    7.69
#> 38 1614.05   1626.95 1614.55  -0.50   -0.03
#> 39 1028.70    979.75  979.75  48.95    5.00
#> 40   14.60     13.95   13.95   0.65    4.66
#> 41   95.50     93.00   92.50   3.00    3.24
#> 42   42.20     46.90   44.95  -2.75   -6.12
#> 43  298.90    299.00  297.00   1.90    0.64
#> 44    2.00      1.95    1.95   0.05    2.56
#> 45  577.20    533.80  533.80  43.40    8.13
#> 46   36.65     33.75   33.20   3.45   10.39
#> 47    1.05      1.00    1.00   0.05    5.00
```

##### Most actively traded stocks in a month

``` r
nse_stock_most_traded()
#>                       security share_turnover traded_quantity no_of_trades
#> 1      Reliance Industries Ltd           6.82            4620      9245543
#> 2       Hindustan Unilever Ltd           6.25            3185      5752204
#> 3            Bajaj Finance Ltd           4.14            2057      8232909
#> 4                HDFC Bank Ltd           3.43            3832      7054716
#> 5               ICICI Bank Ltd           3.36           10513      9288909
#> 6                AXIS Bank Ltd           3.15            8265      8308649
#> 7            Bharti Airtel Ltd           3.00            5347      5774781
#> 8                     HDFC Ltd           2.46            1518      4924321
#> 9      Maruti Suzuki India Ltd           2.14             426      3320762
#> 10         State Bank Of India           2.03           12470      7371875
#> 11 TOTAL of Top Ten securities          36.78           52234     69274669
#> 12                       TOTAL         100.00          493359    341796702
#>    avg_daily_turnonver   turnover
#> 1              3591.40   68236.63
#> 2              3292.50   62557.46
#> 3              2179.74   41415.04
#> 4              1808.33   34358.27
#> 5              1767.89   33589.97
#> 6              1658.21   31506.01
#> 7              1577.88   29979.79
#> 8              1293.73   24580.89
#> 9              1125.83   21390.76
#> 10             1069.64   20323.16
#> 11            19365.16  367937.97
#> 12            52655.61 1000456.50

# retain original column names as returned by NSE
nse_stock_most_traded(clean_names = FALSE)
#>                        skipped sharetotal trdQty nooftrades avgdailyturn
#> 1      Reliance Industries Ltd       6.82   4620    9245543      3591.40
#> 2       Hindustan Unilever Ltd       6.25   3185    5752204      3292.50
#> 3            Bajaj Finance Ltd       4.14   2057    8232909      2179.74
#> 4                HDFC Bank Ltd       3.43   3832    7054716      1808.33
#> 5               ICICI Bank Ltd       3.36  10513    9288909      1767.89
#> 6                AXIS Bank Ltd       3.15   8265    8308649      1658.21
#> 7            Bharti Airtel Ltd       3.00   5347    5774781      1577.88
#> 8                     HDFC Ltd       2.46   1518    4924321      1293.73
#> 9      Maruti Suzuki India Ltd       2.14    426    3320762      1125.83
#> 10         State Bank Of India       2.03  12470    7371875      1069.64
#> 11 TOTAL of Top Ten securities      36.78  52234   69274669     19365.16
#> 12                       TOTAL     100.00 493359  341796702     52655.61
#>      turnover
#> 1    68236.63
#> 2    62557.46
#> 3    41415.04
#> 4    34358.27
#> 5    33589.97
#> 6    31506.01
#> 7    29979.79
#> 8    24580.89
#> 9    21390.76
#> 10   20323.16
#> 11  367937.97
#> 12 1000456.50
```

### Futures & Options

##### Top futures and options gainers for the last trading session.

``` r
nse_fo_top_gainers()
#>        symbol series last_corp_announcement_date
#> 1  BALKRISIND     EQ                  2020-02-24
#> 2   LICHSGFIN     EQ                  2019-08-16
#> 3  JINDALSTEL     EQ                  2019-09-19
#> 4    GODREJCP     EQ                  2020-02-05
#> 5    HDFCBANK     EQ                  2019-09-19
#> 6        HDFC     EQ                  2020-07-09
#> 7   ICICIBANK     EQ                  2019-07-22
#> 8     SBILIFE     EQ                  2019-04-03
#> 9  AMARAJABAT     EQ                  2020-03-19
#> 10   JSWSTEEL     EQ                  2020-07-06
#>                                                     last_corp_announcement
#> 1                                       Interim Dividend - Rs 16 Per Share
#> 2                     Annual General Meeting/ Dividend - Rs 7.60 Per Share
#> 3                                                   Annual General Meeting
#> 4                                        Interim Dividend - Rs 2 Per Share
#> 5  Face Value Split (Sub-Division) - From Rs 2 Per Share To Rs 1 Per Share
#> 6                        Annual General Meeting/Dividend - Rs 21 Per Share
#> 7                         Annual General Meeting/Dividend - Re 1 Per Share
#> 8                                        Interim Dividend - Rs 2 Per Share
#> 9                                        Interim Dividend - Rs 5 Per Share
#> 10                                               Dividend - Rs 2 Per Share
#>    open_price high_price low_price last_traded_price prev_close_price
#> 1     1159.00    1208.00   1148.05           1199.30          1140.00
#> 2      275.45     295.35    273.60            284.15           270.40
#> 3      139.50     146.75    138.15            142.30           135.90
#> 4      615.00     648.45    615.00            635.00           608.75
#> 5      975.00     993.95    952.00            989.15           949.85
#> 6     1785.00    1834.00   1768.05           1820.00          1751.65
#> 7      342.25     347.90    326.05            342.40           331.10
#> 8      751.00     770.70    742.40            769.90           745.30
#> 9      652.00     672.00    652.00            666.00           645.00
#> 10     189.00     195.95    185.75            189.00           183.75
#>    percent_change traded_quantity turnover_in_lakhs
#> 1            5.20         1337043          15825.64
#> 2            5.09        15494933          44203.94
#> 3            4.71        28554167          40906.70
#> 4            4.31         4980121          31845.88
#> 5            4.14        22700113         222131.96
#> 6            3.90         7453412         134946.26
#> 7            3.41        57511276         195590.10
#> 8            3.30         1883911          14249.15
#> 9            3.26         1886933          12540.75
#> 10           2.86        23464025          45001.65

# retain original column names as returned by NSE
nse_fo_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1  BALKRISIND     EQ               2020-02-24
#> 2   LICHSGFIN     EQ               2019-08-16
#> 3  JINDALSTEL     EQ               2019-09-19
#> 4    GODREJCP     EQ               2020-02-05
#> 5    HDFCBANK     EQ               2019-09-19
#> 6        HDFC     EQ               2020-07-09
#> 7   ICICIBANK     EQ               2019-07-22
#> 8     SBILIFE     EQ               2019-04-03
#> 9  AMARAJABAT     EQ               2020-03-19
#> 10   JSWSTEEL     EQ               2020-07-06
#>                                                       lastCorpAnnouncement
#> 1                                       Interim Dividend - Rs 16 Per Share
#> 2                     Annual General Meeting/ Dividend - Rs 7.60 Per Share
#> 3                                                   Annual General Meeting
#> 4                                        Interim Dividend - Rs 2 Per Share
#> 5  Face Value Split (Sub-Division) - From Rs 2 Per Share To Rs 1 Per Share
#> 6                        Annual General Meeting/Dividend - Rs 21 Per Share
#> 7                         Annual General Meeting/Dividend - Re 1 Per Share
#> 8                                        Interim Dividend - Rs 2 Per Share
#> 9                                        Interim Dividend - Rs 5 Per Share
#> 10                                               Dividend - Rs 2 Per Share
#>    openPrice highPrice lowPrice     ltp previousPrice netPrice tradedQuantity
#> 1    1159.00   1208.00  1148.05 1199.30       1140.00     5.20        1337043
#> 2     275.45    295.35   273.60  284.15        270.40     5.09       15494933
#> 3     139.50    146.75   138.15  142.30        135.90     4.71       28554167
#> 4     615.00    648.45   615.00  635.00        608.75     4.31        4980121
#> 5     975.00    993.95   952.00  989.15        949.85     4.14       22700113
#> 6    1785.00   1834.00  1768.05 1820.00       1751.65     3.90        7453412
#> 7     342.25    347.90   326.05  342.40        331.10     3.41       57511276
#> 8     751.00    770.70   742.40  769.90        745.30     3.30        1883911
#> 9     652.00    672.00   652.00  666.00        645.00     3.26        1886933
#> 10    189.00    195.95   185.75  189.00        183.75     2.86       23464025
#>    turnoverInLakhs
#> 1         15825.64
#> 2         44203.94
#> 3         40906.70
#> 4         31845.88
#> 5        222131.96
#> 6        134946.26
#> 7        195590.10
#> 8         14249.15
#> 9         12540.75
#> 10        45001.65
```

### Pre Open Market Data

##### Fetch data of pre open session of Nifty Bank.

``` r
nse_preopen_nifty_bank()
#>        symbol series corp_action_date                          corp_action
#> 1  INDUSINDBK     EQ             <NA>                                 <NA>
#> 2    AXISBANK     EQ             <NA>                                 <NA>
#> 3  BANDHANBNK     EQ             <NA>                                 <NA>
#> 4   ICICIBANK     EQ             <NA>                                 <NA>
#> 5     RBLBANK     EQ       2020-03-23 INTERIM DIVIDEND - RS 1.50 PER SHARE
#> 6  IDFCFIRSTB     EQ             <NA>                                 <NA>
#> 7  FEDERALBNK     EQ             <NA>                                 <NA>
#> 8    HDFCBANK     EQ             <NA>                                 <NA>
#> 9         PNB     EQ             <NA>                                 <NA>
#> 10       SBIN     EQ             <NA>                                 <NA>
#> 11 BANKBARODA     EQ             <NA>                                 <NA>
#> 12  KOTAKBANK     EQ             <NA>                                 <NA>
#>      price change percent_change prev_close quantity  value   mkt_cap year_high
#> 1   510.00  19.45           3.96     490.55    87145 444.44  29598.42   1596.55
#> 2   404.90  15.30           3.93     389.60    82484 333.98  87921.92    819.00
#> 3   279.00  10.35           3.85     268.65    33888  94.55  11247.21    650.00
#> 4   342.25  11.15           3.37     331.10   103305 353.56 214300.53    552.20
#> 5   166.75   5.40           3.35     161.35   113787 189.74   7629.80    663.00
#> 6    26.05   0.80           3.17      25.25   112162  29.22   5222.35     47.95
#> 7    47.90   1.35           2.90      46.55    88409  42.35   9280.29    110.40
#> 8   975.00  25.15           2.65     949.85    72578 707.64 411349.33   1305.50
#> 9    34.50   0.85           2.53      33.65   169551  58.50   3854.22     83.40
#> 10  178.00   4.30           2.48     173.70   146723 261.17  66658.82    373.80
#> 11   47.00   1.05           2.29      45.95   129537  60.88   5520.19    132.85
#> 12 1276.00  27.10           2.17    1248.90    17967 229.26 167193.56   1740.00
#>    year_low sum_val sum_quantity fin_quantity sum_fin_quantity
#> 1    235.55 2805.27      1156506        87145          1157536
#> 2    286.00 2805.27      1156506        82484          1157536
#> 3    152.20 2805.27      1156506        33888          1157536
#> 4    268.30 2805.27      1156506       103305          1157536
#> 5    101.55 2805.27      1156506       113787          1157536
#> 6     17.65 2805.27      1156506       112162          1157536
#> 7     35.70 2805.27      1156506        88409          1157536
#> 8    738.75 2805.27      1156506        72578          1157536
#> 9     26.30 2805.27      1156506       169551          1157536
#> 10   149.45 2805.27      1156506       146723          1157536
#> 11    36.00 2805.27      1156506       129537          1157536
#> 12  1001.00 2805.27      1156506        17967          1157536

# retain original column names as returned by NSE
nse_preopen_nifty(clean_names = FALSE)
#>        symbol series        xDt
#> 1  BAJFINANCE     EQ       <NA>
#> 2  INDUSINDBK     EQ       <NA>
#> 3    AXISBANK     EQ       <NA>
#> 4   ICICIBANK     EQ       <NA>
#> 5   EICHERMOT     EQ 2020-03-19
#> 6        ZEEL     EQ       <NA>
#> 7   TATASTEEL     EQ       <NA>
#> 8  BAJAJFINSV     EQ       <NA>
#> 9    JSWSTEEL     EQ       <NA>
#> 10   HINDALCO     EQ       <NA>
#> 11     GRASIM     EQ       <NA>
#> 12        UPL     EQ       <NA>
#> 13   HDFCBANK     EQ       <NA>
#> 14       VEDL     EQ       <NA>
#> 15       SBIN     EQ       <NA>
#> 16       BPCL     EQ 2020-03-23
#> 17   INFRATEL     EQ 2020-05-05
#> 18         LT     EQ 2020-03-24
#> 19  KOTAKBANK     EQ       <NA>
#> 20 ADANIPORTS     EQ       <NA>
#> 21       INFY     EQ 2020-05-29
#> 22     MARUTI     EQ       <NA>
#> 23        ITC     EQ       <NA>
#> 24       HDFC     EQ       <NA>
#> 25       NTPC     EQ 2020-03-26
#> 26  COALINDIA     EQ 2020-03-19
#> 27        M&M     EQ       <NA>
#> 28   RELIANCE     EQ 2020-05-13
#> 29      TITAN     EQ       <NA>
#> 30        TCS     EQ 2020-06-03
#> 31      WIPRO     EQ       <NA>
#> 32       ONGC     EQ 2020-03-23
#> 33  POWERGRID     EQ       <NA>
#> 34 TATAMOTORS     EQ       <NA>
#> 35      TECHM     EQ       <NA>
#> 36 HEROMOTOCO     EQ       <NA>
#> 37       GAIL     EQ       <NA>
#> 38 BHARTIARTL     EQ       <NA>
#> 39        IOC     EQ 2020-03-23
#> 40    DRREDDY     EQ       <NA>
#> 41 BAJAJ-AUTO     EQ       <NA>
#> 42 ASIANPAINT     EQ       <NA>
#> 43 HINDUNILVR     EQ       <NA>
#> 44  NESTLEIND     EQ 2020-06-11
#> 45 ULTRACEMCO     EQ       <NA>
#> 46    HCLTECH     EQ       <NA>
#> 47   SHREECEM     EQ       <NA>
#> 48  SUNPHARMA     EQ       <NA>
#> 49  BRITANNIA     EQ       <NA>
#> 50      CIPLA     EQ 2020-03-19
#>                                                                  caAct      iep
#> 1                                                                 <NA>  2452.00
#> 2                                                                 <NA>   510.00
#> 3                                                                 <NA>   404.90
#> 4                                                                 <NA>   342.25
#> 5                                  INTERIM DIVIDEND - RS 125 PER SHARE 17000.00
#> 6                                                                 <NA>   170.60
#> 7                                                                 <NA>   315.10
#> 8                                                                 <NA>  5250.00
#> 9                                                                 <NA>   189.00
#> 10                                                                <NA>   149.90
#> 11                                                                <NA>   598.00
#> 12                                                                <NA>   416.00
#> 13                                                                <NA>   975.00
#> 14                                                                <NA>   105.00
#> 15                                                                <NA>   178.00
#> 16                               INTERIM DIVIDEND - RS 16.50 PER SHARE   369.80
#> 17                                INTERIM DIVIDEND - RS 4.10 PER SHARE   228.30
#> 18                                  INTERIM DIVIDEND - RS 10 PER SHARE   920.00
#> 19                                                                <NA>  1276.00
#> 20                                                                <NA>   347.00
#> 21                                        DIVIDEND - RS 9.50 PER SHARE   702.00
#> 22                                                                <NA>  5590.00
#> 23                                                                <NA>   190.80
#> 24                                                                <NA>  1785.00
#> 25                                INTERIM DIVIDEND - RS 0.50 PER HSARE    94.95
#> 26                                  INTERIM DIVIDEND - RS 12 PER SHARE   134.50
#> 27                                                                <NA>   517.10
#> 28                                       RIGHTS 1:15 @ PREMIUM RS 1247  1643.00
#> 29                                                                <NA>   965.00
#> 30                                           DIVIDEND - RS 6 PER SHARE  2065.00
#> 31                                                                <NA>   217.45
#> 32                                   INTERIM DIVIDEND - RS 5 PER SHARE    85.50
#> 33                                                                <NA>   165.70
#> 34                                                                <NA>   102.00
#> 35                                                                <NA>   556.95
#> 36                                                                <NA>  2380.00
#> 37                                                                <NA>   101.00
#> 38                                                                <NA>   558.00
#> 39                                INTERIM DIVIDEND - RS 4.25 PER SHARE    87.35
#> 40                                                                <NA>  4065.00
#> 41                                                                <NA>  2764.00
#> 42                                                                <NA>  1639.00
#> 43                                                                <NA>  2109.80
#> 44                   ANNUAL GENERAL MEETING/DIVIDEND - RS 61 PER SHARE 16598.00
#> 45                                                                <NA>  3785.00
#> 46                                                                <NA>   585.00
#> 47                                                                <NA> 22291.70
#> 48                                                                <NA>   489.40
#> 49                                                                <NA>  3381.05
#> 50 INTERIM DIVIDEND - RS 3 PER SHARE SPECIAL DIVIDEND - RE 1 PER SHARE   644.50
#>       chn perChn     pCls trdQnty    iVal    mktCap    yHigh     yLow  sumVal
#> 1  100.60   4.28  2351.40   34645  849.50  62251.71  4923.40  1783.00 8579.77
#> 2   19.45   3.96   490.55   87145  444.44  29598.42  1596.55   235.55 8579.77
#> 3   15.30   3.93   389.60   82484  333.98  87921.92   819.00   286.00 8579.77
#> 4   11.15   3.37   331.10  103305  353.56 214300.53   552.20   268.30 8579.77
#> 5  518.05   3.14 16481.95    1334  226.78  22951.66 23450.00 12450.10 8579.77
#> 6    5.10   3.08   165.50   63744  108.75  15101.20   405.20   114.00 8579.77
#> 7    8.90   2.91   306.20   47662  150.18  23110.38   516.45   250.85 8579.77
#> 8  146.40   2.87  5103.60    1955  102.64  30862.58  9950.00  3985.30 8579.77
#> 9    5.25   2.86   183.75   21678   40.97  18654.90   296.75   132.50 8579.77
#> 10   4.10   2.81   145.80   53592   80.33  21285.94   221.20    84.90 8579.77
#> 11  16.10   2.77   581.90    4635   27.72  22966.39   949.50   385.05 8579.77
#> 12  11.00   2.72   405.00    9037   37.59  22279.57   709.05   240.15 8579.77
#> 13  25.15   2.65   949.85   72578  707.64 411349.33  1305.50   738.75 8579.77
#> 14   2.60   2.54   102.40   29821   31.31  18651.41   180.00    60.20 8579.77
#> 15   4.30   2.48   173.70  146723  261.17  66658.82   373.80   149.45 8579.77
#> 16   8.80   2.44   361.00    8342   30.85  28974.71   549.00   252.00 8579.77
#> 17   5.40   2.42   222.90   11176   25.51  18964.77   296.50   120.05 8579.77
#> 18  20.10   2.23   899.90    9943   91.48 111164.10  1591.65   661.00 8579.77
#> 19  27.10   2.17  1248.90   17967  229.26 167193.56  1740.00  1001.00 8579.77
#> 20   7.25   2.13   339.75    1929    6.69  26230.93   428.85   203.00 8579.77
#> 21  14.45   2.10   687.55   18801  131.98 251824.91   847.00   509.25 8579.77
#> 22 114.25   2.09  5475.75    1957  109.40  72781.06  7758.70  4001.10 8579.77
#> 23   3.60   1.92   187.20   69007  131.67 163378.50   282.90   134.60 8579.77
#> 24  33.35   1.90  1751.65   23492  419.33 302853.94  2499.90  1473.45 8579.77
#> 25   1.75   1.88    93.20   14568   13.83  45186.46   145.85    73.20 8579.77
#> 26   2.40   1.82   132.10   19565   26.31  27679.28   265.35   119.20 8579.77
#> 27   8.95   1.76   508.15    8247   42.65  48643.08   675.30   245.40 8579.77
#> 28  28.45   1.76  1614.55  104453 1716.16 521988.19  1626.95   866.98 8579.77
#> 29  16.60   1.75   948.40    6232   60.14  39572.89  1389.95   720.90 8579.77
#> 30  35.10   1.73  2029.90    7168  148.02 213275.04  2296.20  1506.05 8579.77
#> 31   3.65   1.71   213.80   16235   35.30  31758.82   300.75   159.40 8579.77
#> 32   1.40   1.66    84.10   18561   15.87  30682.04   173.45    50.00 8579.77
#> 33   2.45   1.50   163.25    5665    9.39  41848.79   216.25   122.15 8579.77
#> 34   1.50   1.49   100.50  748161  763.12  18005.63   201.70    63.50 8579.77
#> 35   8.15   1.49   548.80    3646   20.31  33920.28   845.90   471.40 8579.77
#> 36  31.85   1.36  2348.15    1464   34.84  30486.17  3022.90  1475.00 8579.77
#> 37   1.35   1.35    99.65   64490   65.13  18426.86   157.38    65.00 8579.77
#> 38   7.30   1.33   550.70   27889  155.62 123179.39   612.00   321.15 8579.77
#> 39   1.15   1.33    86.20   35055   30.62  21910.51   159.70    71.15 8579.77
#> 40  52.70   1.31  4012.30    1043   42.40  48668.84  4190.00  2351.20 8579.77
#> 41  35.45   1.30  2728.55     874   24.16  35529.86  3315.15  1788.65 8579.77
#> 42  20.80   1.29  1618.20    3330   54.58  72952.17  1916.70  1291.25 8579.77
#> 43  25.50   1.22  2084.30    6396  134.94 148900.51  2614.30  1659.05 8579.77
#> 44 197.70   1.21 16400.30     190   31.54  58506.13 18369.95 11265.00 8579.77
#> 45  40.20   1.07  3744.80     679   25.70  43233.49  4754.10  2910.00 8579.77
#> 46   6.05   1.04   578.95   10227   59.83  62843.06   623.50   375.25 8579.77
#> 47 174.45   0.79 22117.25      40    8.92  29526.26 25355.00 15410.00 8579.77
#> 48   3.60   0.74   485.80   12998   63.61  52451.86   512.70   312.00 8579.77
#> 49  23.85   0.71  3357.20     883   29.85  39557.71  3708.00  2100.00 8579.77
#> 50   0.85   0.13   643.65    5306   34.20  32692.80   669.75   355.30 8579.77
#>    sumQnty finQnty sumfinQnty
#> 1  1886681   34645    2046317
#> 2  1886681   87145    2046317
#> 3  1886681   82484    2046317
#> 4  1886681  103305    2046317
#> 5  1886681    1334    2046317
#> 6  1886681   63744    2046317
#> 7  1886681   47662    2046317
#> 8  1886681    1955    2046317
#> 9  1886681   21678    2046317
#> 10 1886681   53592    2046317
#> 11 1886681    4635    2046317
#> 12 1886681    9037    2046317
#> 13 1886681   72578    2046317
#> 14 1886681   29821    2046317
#> 15 1886681  146723    2046317
#> 16 1886681    8342    2046317
#> 17 1886681   11176    2046317
#> 18 1886681    9943    2046317
#> 19 1886681   17967    2046317
#> 20 1886681    1929    2046317
#> 21 1886681   18801    2046317
#> 22 1886681    1957    2046317
#> 23 1886681   69007    2046317
#> 24 1886681   23492    2046317
#> 25 1886681   14568    2046317
#> 26 1886681   19565    2046317
#> 27 1886681    8247    2046317
#> 28 1886681  104453    2046317
#> 29 1886681    6232    2046317
#> 30 1886681    7168    2046317
#> 31 1886681   16235    2046317
#> 32 1886681   18561    2046317
#> 33 1886681    5665    2046317
#> 34 1886681  748161    2046317
#> 35 1886681    3646    2046317
#> 36 1886681    1464    2046317
#> 37 1886681   64490    2046317
#> 38 1886681   27889    2046317
#> 39 1886681   35055    2046317
#> 40 1886681    1043    2046317
#> 41 1886681     874    2046317
#> 42 1886681    3330    2046317
#> 43 1886681    6396    2046317
#> 44 1886681     190    2046317
#> 45 1886681     679    2046317
#> 46 1886681   10227    2046317
#> 47 1886681      40    2046317
#> 48 1886681   12998    2046317
#> 49 1886681     883    2046317
#> 50 1886681    5306    2046317
```

### Advances & Declines

``` r
nse_advances_declines()
#>                                     index_name advances declines unchanged
#> 1                                     NIFTY 50       24       26         0
#> 2                                NIFTY NEXT 50       22       28         0
#> 3                                     NIFTY IT        4        6         0
#> 4                                   NIFTY BANK        5        7         0
#> 5                              NIFTY MIDCAP 50       25       25         0
#> 6                                  NIFTY INFRA       11       19         0
#> 7                                 NIFTY REALTY        2        8         0
#> 8                                 NIFTY ENERGY        2        8         0
#> 9                                   NIFTY FMCG        5       10         0
#> 10                                   NIFTY MNC        7       23         0
#> 11                                NIFTY PHARMA        2        8         0
#> 12                                   NIFTY PSE        8       12         0
#> 13                              NIFTY PSU BANK        3       10         0
#> 14                           NIFTY SERV SECTOR       16       14         0
#> 15                           NIFTY COMMODITIES       17       13         0
#> 16                           NIFTY CONSUMPTION       15       15         0
#> 17                           NIFTY FIN SERVICE       13        7         0
#> 18                                  NIFTY AUTO        8        7         0
#> 19                           NIFTY DIV OPPS 50       19       31         0
#> 20                                 NIFTY MEDIA        9        5         0
#> 21                                 NIFTY METAL        9        5         1
#> 22                             NIFTY100 LIQ 15        6        9         0
#> 23                                  NIFTY CPSE        5        6         1
#> 24                           NIFTY GROWSECT 15        9        6         0
#> 25                            NIFTY50 VALUE 20        7       13         0
#> 26                           NIFTY100 QUALTY30       16       14         0
#> 27                              NIFTY PVT BANK        5        5         0
#> 28                            NIFTY MID LIQ 15        9        6         0
#> 29                                   NIFTY 100       46       55         0
#> 30                                   NIFTY 200       92      109         0
#> 31                                   NIFTY 500      201      293         7
#> 32                            NIFTY MIDCAP 100       46       54         0
#> 33                            NIFTY SMLCAP 100       34       66         0
#> 34                    NIFTY ADITYA BIRLA GROUP        3        4         0
#> 35                              NIFTY ALPHA 50       24       25         1
#> 36                          NIFTY HIGH BETA 50       21       29         0
#> 37                     NIFTY LOW VOLATILITY 50       22       28         0
#> 38                        NIFTY MAHINDRA GROUP        5        3         0
#> 39                            NIFTY MIDCAP 150       69       77         4
#> 40                       NIFTY MIDSMALLCAP 400      155      238         7
#> 41                            NIFTY SHARIAH 25       13       12         0
#> 42                          NIFTY SMALLCAP 250       86      161         3
#> 43                           NIFTY SMALLCAP 50       12       38         0
#> 44                            NIFTY TATA GROUP        7       15         0
#> 45                    NIFTY TATA GROUP 25% CAP        4        6         0
#> 46                            NIFTY100 EQL WGT       46       55         0
#> 47                           NIFTY100 LOWVOL30       12       18         0
#> 48                             NIFTY50 SHARIAH       11        8         0
#> 49                            NIFTY500 SHARIAH       85      130         2
#> 50                             NIFTY50 EQL WGT       24       26         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       14       16         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       16       14         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30       16       14         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30       12       18         0
#> 55                       NIFTY LARGEMIDCAP 250      115      132         4
#> 56                           NIFTY500 VALUE 50       19       31         0
#> 57                          CNX NIFTY Pre Open       50        0         0

# retain original column names as returned by NSE
nse_advances_declines(clean_names = FALSE)
#>                                        skipped advances declines unchanged
#> 1                                     NIFTY 50       24       26         0
#> 2                                NIFTY NEXT 50       22       28         0
#> 3                                     NIFTY IT        4        6         0
#> 4                                   NIFTY BANK        5        7         0
#> 5                              NIFTY MIDCAP 50       25       25         0
#> 6                                  NIFTY INFRA       11       19         0
#> 7                                 NIFTY REALTY        2        8         0
#> 8                                 NIFTY ENERGY        2        8         0
#> 9                                   NIFTY FMCG        5       10         0
#> 10                                   NIFTY MNC        7       23         0
#> 11                                NIFTY PHARMA        2        8         0
#> 12                                   NIFTY PSE        8       12         0
#> 13                              NIFTY PSU BANK        3       10         0
#> 14                           NIFTY SERV SECTOR       16       14         0
#> 15                           NIFTY COMMODITIES       17       13         0
#> 16                           NIFTY CONSUMPTION       15       15         0
#> 17                           NIFTY FIN SERVICE       13        7         0
#> 18                                  NIFTY AUTO        8        7         0
#> 19                           NIFTY DIV OPPS 50       19       31         0
#> 20                                 NIFTY MEDIA        9        5         0
#> 21                                 NIFTY METAL        9        5         1
#> 22                             NIFTY100 LIQ 15        6        9         0
#> 23                                  NIFTY CPSE        5        6         1
#> 24                           NIFTY GROWSECT 15        9        6         0
#> 25                            NIFTY50 VALUE 20        7       13         0
#> 26                           NIFTY100 QUALTY30       16       14         0
#> 27                              NIFTY PVT BANK        5        5         0
#> 28                            NIFTY MID LIQ 15        9        6         0
#> 29                                   NIFTY 100       46       55         0
#> 30                                   NIFTY 200       92      109         0
#> 31                                   NIFTY 500      201      293         7
#> 32                            NIFTY MIDCAP 100       46       54         0
#> 33                            NIFTY SMLCAP 100       34       66         0
#> 34                    NIFTY ADITYA BIRLA GROUP        3        4         0
#> 35                              NIFTY ALPHA 50       24       25         1
#> 36                          NIFTY HIGH BETA 50       21       29         0
#> 37                     NIFTY LOW VOLATILITY 50       22       28         0
#> 38                        NIFTY MAHINDRA GROUP        5        3         0
#> 39                            NIFTY MIDCAP 150       69       77         4
#> 40                       NIFTY MIDSMALLCAP 400      155      238         7
#> 41                            NIFTY SHARIAH 25       13       12         0
#> 42                          NIFTY SMALLCAP 250       86      161         3
#> 43                           NIFTY SMALLCAP 50       12       38         0
#> 44                            NIFTY TATA GROUP        7       15         0
#> 45                    NIFTY TATA GROUP 25% CAP        4        6         0
#> 46                            NIFTY100 EQL WGT       46       55         0
#> 47                           NIFTY100 LOWVOL30       12       18         0
#> 48                             NIFTY50 SHARIAH       11        8         0
#> 49                            NIFTY500 SHARIAH       85      130         2
#> 50                             NIFTY50 EQL WGT       24       26         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       14       16         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       16       14         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30       16       14         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30       12       18         0
#> 55                       NIFTY LARGEMIDCAP 250      115      132         4
#> 56                           NIFTY500 VALUE 50       19       31         0
#> 57                          CNX NIFTY Pre Open       50        0         0
```
