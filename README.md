
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
#>           index_name last_traded_price change percent_change
#> 1  NIFTY 50 Pre Open          9863.250 -17.90          -0.18
#> 2           NIFTY 50         10091.650 210.50           2.13
#> 3      NIFTY NEXT 50         24953.650  69.85           0.28
#> 4    NIFTY100 LIQ 15          2536.350  42.25           1.69
#> 5         NIFTY BANK         20956.300 754.55           3.74
#> 6          INDIA VIX            31.455  -1.90          -5.70
#> 7          NIFTY 100         10258.150 188.40           1.87
#> 8          NIFTY 500          8283.650 143.20           1.76
#> 9   NIFTY MIDCAP 100         14427.550 180.75           1.27
#> 10   NIFTY MIDCAP 50          4035.600  51.05           1.28
#> 11       NIFTY INFRA          2957.600  38.35           1.31
#> 12      NIFTY REALTY           200.150   1.80           0.91
#> 13      NIFTY ENERGY         14023.450 280.50           2.04
#> 14        NIFTY FMCG         28648.700 216.95           0.76
#> 15         NIFTY MNC         12761.600  46.00           0.36
#> 16      NIFTY PHARMA          9975.300  -1.90          -0.02
#> 17         NIFTY PSE          2456.050  55.75           2.32
#> 18    NIFTY PSU BANK          1387.500  34.50           2.55
#> 19 NIFTY SERV SECTOR         13430.400 342.75           2.62
#> 20          NIFTY IT         14551.250  72.80           0.50
#> 21  NIFTY SMLCAP 100          4493.200  66.25           1.50
#> 22         NIFTY 200          5235.450  92.90           1.81
#> 23        NIFTY AUTO          6535.900  32.40           0.50
#> 24       NIFTY MEDIA          1360.650  23.20           1.73
#> 25       NIFTY METAL          1998.650  58.20           3.00
#> 26 NIFTY DIV OPPS 50          2178.650  30.40           1.42
#> 27 NIFTY COMMODITIES          2833.900  45.60           1.64
#> 28 NIFTY CONSUMPTION          4628.250  22.40           0.49
#> 29        NIFTY CPSE          1425.900  31.65           2.27
#> 30 NIFTY FIN SERVICE         10372.000 364.90           3.65
#> 31 NIFTY GROWSECT 15          5058.600 125.20           2.54
#> 32  NIFTY50 VALUE 20          4860.150  53.40           1.11
#> 33 NIFTY50 TR 2X LEV          4279.300 174.55           4.25
#> 34 NIFTY50 PR 2X LEV          3260.900 133.05           4.25
#> 35 NIFTY50 TR 1X INV           379.200  -8.20          -2.12
#> 36 NIFTY50 PR 1X INV           434.100  -9.40          -2.12
#> 37    NIFTY ALPHA 50         13321.650 245.50           1.88
#> 38   NIFTY50 EQL WGT         10447.400 165.75           1.61
#> 39  NIFTY100 EQL WGT         11519.200 109.00           0.96
#> 40 NIFTY100 LOWVOL30          8103.450  80.10           1.00
#> 41  NIFTY MID LIQ 15          3331.450  -7.05          -0.21
#> 42    NIFTY PVT BANK         11513.750 399.20           3.59
#> 43 NIFTY100 QUALTY30          2367.450  20.20           0.86
#> 44   NIFTY GS 8 13YR          2180.800   5.52           0.25
#> 45     NIFTY GS 10YR          1990.360   2.30           0.12
#> 46 NIFTY GS 10YR CLN           977.400   0.98           0.10
#> 47    NIFTY GS 4 8YR          2315.760   4.86           0.21
#> 48  NIFTY GS 11 15YR          2350.150   6.88           0.29
#> 49 NIFTY GS 15YRPLUS          2567.040   0.86           0.03
#> 50 NIFTY GS COMPSITE          2221.260   5.14           0.23
#> 51  NIFTY MIDCAP 150          5483.800  65.75           1.21
#> 52   NIFTY SMLCAP 50          2108.250  32.05           1.54
#> 53  NIFTY SMLCAP 250          3959.900  55.10           1.41
#> 54  NIFTY MIDSML 400          4935.150  61.95           1.27
#> 55 NIFTY200 QUALTY30          8949.450  31.25           0.35

# retain original column names as returned by NSE
nse_index_quote(clean_names = FALSE)
#>              skipped lastPrice change pChange
#> 1  NIFTY 50 Pre Open  9863.250 -17.90   -0.18
#> 2           NIFTY 50 10091.650 210.50    2.13
#> 3      NIFTY NEXT 50 24953.650  69.85    0.28
#> 4    NIFTY100 LIQ 15  2536.350  42.25    1.69
#> 5         NIFTY BANK 20956.300 754.55    3.74
#> 6          INDIA VIX    31.455  -1.90   -5.70
#> 7          NIFTY 100 10258.150 188.40    1.87
#> 8          NIFTY 500  8283.650 143.20    1.76
#> 9   NIFTY MIDCAP 100 14427.550 180.75    1.27
#> 10   NIFTY MIDCAP 50  4035.600  51.05    1.28
#> 11       NIFTY INFRA  2957.600  38.35    1.31
#> 12      NIFTY REALTY   200.150   1.80    0.91
#> 13      NIFTY ENERGY 14023.450 280.50    2.04
#> 14        NIFTY FMCG 28648.700 216.95    0.76
#> 15         NIFTY MNC 12761.600  46.00    0.36
#> 16      NIFTY PHARMA  9975.300  -1.90   -0.02
#> 17         NIFTY PSE  2456.050  55.75    2.32
#> 18    NIFTY PSU BANK  1387.500  34.50    2.55
#> 19 NIFTY SERV SECTOR 13430.400 342.75    2.62
#> 20          NIFTY IT 14551.250  72.80    0.50
#> 21  NIFTY SMLCAP 100  4493.200  66.25    1.50
#> 22         NIFTY 200  5235.450  92.90    1.81
#> 23        NIFTY AUTO  6535.900  32.40    0.50
#> 24       NIFTY MEDIA  1360.650  23.20    1.73
#> 25       NIFTY METAL  1998.650  58.20    3.00
#> 26 NIFTY DIV OPPS 50  2178.650  30.40    1.42
#> 27 NIFTY COMMODITIES  2833.900  45.60    1.64
#> 28 NIFTY CONSUMPTION  4628.250  22.40    0.49
#> 29        NIFTY CPSE  1425.900  31.65    2.27
#> 30 NIFTY FIN SERVICE 10372.000 364.90    3.65
#> 31 NIFTY GROWSECT 15  5058.600 125.20    2.54
#> 32  NIFTY50 VALUE 20  4860.150  53.40    1.11
#> 33 NIFTY50 TR 2X LEV  4279.300 174.55    4.25
#> 34 NIFTY50 PR 2X LEV  3260.900 133.05    4.25
#> 35 NIFTY50 TR 1X INV   379.200  -8.20   -2.12
#> 36 NIFTY50 PR 1X INV   434.100  -9.40   -2.12
#> 37    NIFTY ALPHA 50 13321.650 245.50    1.88
#> 38   NIFTY50 EQL WGT 10447.400 165.75    1.61
#> 39  NIFTY100 EQL WGT 11519.200 109.00    0.96
#> 40 NIFTY100 LOWVOL30  8103.450  80.10    1.00
#> 41  NIFTY MID LIQ 15  3331.450  -7.05   -0.21
#> 42    NIFTY PVT BANK 11513.750 399.20    3.59
#> 43 NIFTY100 QUALTY30  2367.450  20.20    0.86
#> 44   NIFTY GS 8 13YR  2180.800   5.52    0.25
#> 45     NIFTY GS 10YR  1990.360   2.30    0.12
#> 46 NIFTY GS 10YR CLN   977.400   0.98    0.10
#> 47    NIFTY GS 4 8YR  2315.760   4.86    0.21
#> 48  NIFTY GS 11 15YR  2350.150   6.88    0.29
#> 49 NIFTY GS 15YRPLUS  2567.040   0.86    0.03
#> 50 NIFTY GS COMPSITE  2221.260   5.14    0.23
#> 51  NIFTY MIDCAP 150  5483.800  65.75    1.21
#> 52   NIFTY SMLCAP 50  2108.250  32.05    1.54
#> 53  NIFTY SMLCAP 250  3959.900  55.10    1.41
#> 54  NIFTY MIDSML 400  4935.150  61.95    1.27
#> 55 NIFTY200 QUALTY30  8949.450  31.25    0.35
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#>        symbol series last_corp_announcement_date
#> 1  BAJAJFINSV     EQ                  2020-03-03
#> 2   COALINDIA     EQ                  2020-03-19
#> 3  BAJFINANCE     EQ                  2020-03-03
#> 4        ZEEL     EQ                  2019-07-15
#> 5        VEDL     EQ                  2020-03-05
#> 6   KOTAKBANK     EQ                  2019-07-12
#> 7        SBIN     EQ                  2018-06-15
#> 8    HDFCBANK     EQ                  2019-09-19
#> 9   POWERGRID     EQ                  2020-03-16
#> 10   AXISBANK     EQ                  2019-07-04
#>                                                     last_corp_announcement
#> 1                                        Interim Dividend - Rs 5 Per Share
#> 2                                       Interim Dividend - Rs 12 Per Share
#> 3                                       Interim Dividend - Rs 10 Per Share
#> 4                     Annual General Meeting/ Dividend - Rs 3.50 Per Share
#> 5                                      Interim Dividend - Rs 3.9 Per Share
#> 6                        Annual General Meeting/Dividend Rs 0.80 Per Share
#> 7           Annual General Meeting/ Change In Registrar And Transfer Agent
#> 8  Face Value Split (Sub-Division) - From Rs 2 Per Share To Rs 1 Per Share
#> 9                                     Interim Dividend - Rs 5.96 Per Share
#> 10                       Annual General Meeting/ Dividend - Re 1 Per Share
#>    open_price high_price low_price last_traded_price prev_close_price
#> 1     5036.95    5499.00   5021.55           5450.75          5036.95
#> 2      129.00     139.70    128.15            137.65           129.45
#> 3     2375.00    2541.70   2373.00           2527.20          2396.00
#> 4      166.50     175.45    165.50            173.95           165.00
#> 5      102.80     107.80    102.00            106.90           102.10
#> 6     1240.00    1309.90   1228.35           1299.95          1243.80
#> 7      172.40     180.65    171.10            180.00           172.95
#> 8      980.00    1024.90    972.00           1017.60           979.25
#> 9      160.70     166.30    159.50            165.70           159.50
#> 10     386.00     408.05    384.00            404.75           389.60
#>    percent_change traded_quantity turnover_in_lakhs
#> 1            8.22         1806208          95403.73
#> 2            6.33        34587382          47031.92
#> 3            5.48        12738830         315647.83
#> 4            5.42        37917230          65103.88
#> 5            4.70        27586795          29197.86
#> 6            4.51         6672822          84453.24
#> 7            4.08        58262367         102757.34
#> 8            3.92        20435469         204078.81
#> 9            3.89        11093113          18153.88
#> 10           3.89        43774453         173556.95

# retain original column names as returned by NSE
nse_stock_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1  BAJAJFINSV     EQ               2020-03-03
#> 2   COALINDIA     EQ               2020-03-19
#> 3  BAJFINANCE     EQ               2020-03-03
#> 4        ZEEL     EQ               2019-07-15
#> 5        VEDL     EQ               2020-03-05
#> 6   KOTAKBANK     EQ               2019-07-12
#> 7        SBIN     EQ               2018-06-15
#> 8    HDFCBANK     EQ               2019-09-19
#> 9   POWERGRID     EQ               2020-03-16
#> 10   AXISBANK     EQ               2019-07-04
#>                                                       lastCorpAnnouncement
#> 1                                        Interim Dividend - Rs 5 Per Share
#> 2                                       Interim Dividend - Rs 12 Per Share
#> 3                                       Interim Dividend - Rs 10 Per Share
#> 4                     Annual General Meeting/ Dividend - Rs 3.50 Per Share
#> 5                                      Interim Dividend - Rs 3.9 Per Share
#> 6                        Annual General Meeting/Dividend Rs 0.80 Per Share
#> 7           Annual General Meeting/ Change In Registrar And Transfer Agent
#> 8  Face Value Split (Sub-Division) - From Rs 2 Per Share To Rs 1 Per Share
#> 9                                     Interim Dividend - Rs 5.96 Per Share
#> 10                       Annual General Meeting/ Dividend - Re 1 Per Share
#>    openPrice highPrice lowPrice     ltp previousPrice netPrice tradedQuantity
#> 1    5036.95   5499.00  5021.55 5450.75       5036.95     8.22        1806208
#> 2     129.00    139.70   128.15  137.65        129.45     6.33       34587382
#> 3    2375.00   2541.70  2373.00 2527.20       2396.00     5.48       12738830
#> 4     166.50    175.45   165.50  173.95        165.00     5.42       37917230
#> 5     102.80    107.80   102.00  106.90        102.10     4.70       27586795
#> 6    1240.00   1309.90  1228.35 1299.95       1243.80     4.51        6672822
#> 7     172.40    180.65   171.10  180.00        172.95     4.08       58262367
#> 8     980.00   1024.90   972.00 1017.60        979.25     3.92       20435469
#> 9     160.70    166.30   159.50  165.70        159.50     3.89       11093113
#> 10    386.00    408.05   384.00  404.75        389.60     3.89       43774453
#>    turnoverInLakhs
#> 1         95403.73
#> 2         47031.92
#> 3        315647.83
#> 4         65103.88
#> 5         29197.86
#> 6         84453.24
#> 7        102757.34
#> 8        204078.81
#> 9         18153.88
#> 10       173556.95
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#>        symbol
#> 1  ADANIGREEN
#> 2    ALOKINDS
#> 3  ANDHRACEMT
#> 4       ASTEC
#> 5  BALAJITELE
#> 6      BIOCON
#> 7   BIRLATYRE
#> 8     CENTEXT
#> 9  CORALFINAC
#> 10 COROMANDEL
#> 11     DAAWAT
#> 12    DHANUKA
#> 13      DIXON
#> 14   DNAMEDIA
#> 15    ESCORTS
#> 16 GAMMNINFRA
#> 17     GOENKA
#> 18 GSCLCEMENT
#> 19   GTLINFRA
#> 20   GUFICBIO
#> 21 HARRMALAYA
#> 22 HOTELRUGBY
#> 23  INDOSOLAR
#> 24    ISMTLTD
#> 25        ITI
#> 26 JAGSNPHARM
#> 27 JAIHINDPRO
#> 28     JIKIND
#> 29 JMTAUTOLTD
#> 30      KARDA
#> 31     KOPRAN
#> 32       KSCL
#> 33  KSERASERA
#> 34   LOTUSEYE
#> 35       LSIL
#> 36 MANAKALUCO
#> 37   MARKSANS
#> 38    METKORE
#> 39        MIC
#> 40     MITTAL
#> 41 MOREPENLAB
#> 42 MUTHOOTFIN
#> 43       N100
#> 44    NECLIFE
#> 45  NETWORK18
#> 46      OMAXE
#> 47 OPTOCIRCUI
#> 48 PRAKASHSTL
#> 49  PUNJLLOYD
#> 50   RAJRAYON
#> 51   RELIANCE
#> 52 ROHITFERRO
#> 53      RUCHI
#> 54  RUCHINFRA
#> 55  SAGARDEEP
#> 56    SCAPDVR
#> 57 SHREDIGCEM
#> 58  SUVENPHAR
#> 59  SWARAJENG
#> 60     SYNCOM
#> 61   TATACOMM
#> 62      UNITY
#> 63 VAIBHAVGBL
#> 64 VARDMNPOLY
#> 65    VIJIFIN
#>                                                               symbol_desc
#> 1                                              Adani Green Energy Limited
#> 2                                                 Alok Industries Limited
#> 3                                                  Andhra Cements Limited
#> 4                                              Astec LifeSciences Limited
#> 5                                                Balaji Telefilms Limited
#> 6                                                          Biocon Limited
#> 7                                                     Birla Tyres Limited
#> 8                                              Century Extrusions Limited
#> 9                                   Coral India Finance & Housing Limited
#> 10                                       Coromandel International Limited
#> 11                                                       LT Foods Limited
#> 12                                               Dhanuka Agritech Limited
#> 13                                     Dixon Technologies (India) Limited
#> 14                                     Diligent Media Corporation Limited
#> 15                                                        Escorts Limited
#> 16                                 Gammon Infrastructure Projects Limited
#> 17                                      Goenka Diamond and Jewels Limited
#> 18                                          Gujarat Sidhee Cement Limited
#> 19                                             GTL Infrastructure Limited
#> 20                                              Gufic Biosciences Limited
#> 21                                           Harrisons  Malayalam Limited
#> 22                                                    Hotel Rugby Limited
#> 23                                                      Indosolar Limited
#> 24                                                           ISMT Limited
#> 25                                                            ITI Limited
#> 26                                      Jagsonpal Pharmaceuticals Limited
#> 27                                               Jaihind Projects Limited
#> 28                                                 JIK Industries Limited
#> 29                                                       JMT Auto Limited
#> 30                                            Karda Constructions Limited
#> 31                                                         Kopran Limited
#> 32                                            Kaveri Seed Company Limited
#> 33                                                            KSS Limited
#> 34                               Lotus Eye Hospital and Institute Limited
#> 35                                       Lloyds Steels Industries Limited
#> 36                                     Manaksia Aluminium Company Limited
#> 37                                                Marksans Pharma Limited
#> 38                                    Metkore Alloys & Industries Limited
#> 39                                                MIC Electronics Limited
#> 40                                              Mittal Life Style Limited
#> 41                                           Morepen Laboratories Limited
#> 42                                                Muthoot Finance Limited
#> 43 Motilal Oswal Mutual Fund-Motilal Oswal MOSt Shares NASDAQ 100 ETF -GO
#> 44                                            Nectar Lifesciences Limited
#> 45                                  Network18 Media & Investments Limited
#> 46                                                          Omaxe Limited
#> 47                                          Opto Circuits (India) Limited
#> 48                                               Prakash Steelage Limited
#> 49                                                     Punj Lloyd Limited
#> 50                                           Raj Rayon Industries Limited
#> 51                                            Reliance Industries Limited
#> 52                                               Rohit Ferro-Tech Limited
#> 53                                          Ruchi Soya Industries Limited
#> 54                                           Ruchi Infrastructure Limited
#> 55                                               Sagardeep Alloys Limited
#> 56                                               Stampede Capital Limited
#> 57                                           Shree Digvijay Cement Co.Ltd
#> 58                                          Suven Pharmaceuticals Limited
#> 59                                                 Swaraj Engines Limited
#> 60                                              Syncom Healthcare Limited
#> 61                                            Tata Communications Limited
#> 62                                            Unity Infraprojects Limited
#> 63                                                 Vaibhav Global Limited
#> 64                                               Vardhman Polytex Limited
#> 65                                                   Viji Finance Limited
#>          date new_high    year last_traded_price prev_high prev_close change
#> 1  2020-06-17   400.65  400.65            400.65    381.60     381.60  19.05
#> 2  2020-06-17    34.45   34.45             34.45     32.85      32.85   1.60
#> 3  2020-06-17     7.00    7.00              7.00      6.70       6.70   0.30
#> 4  2020-05-29   773.95  773.95            765.00    768.00     693.30  71.70
#> 5  2020-06-17    81.00   81.00             76.50     78.25      78.10  -1.60
#> 6  2020-06-05   404.60  404.60            393.20    400.50     396.10  -2.90
#> 7  2020-06-17    31.30   31.30             31.30     29.85      29.85   1.45
#> 8  2020-06-17     4.80    4.80              4.80      4.40       4.40   0.40
#> 9  2020-06-10    16.50   16.50             16.50     15.80      13.75   2.75
#> 10 2020-06-17   747.00  747.00            738.00    726.45     721.60  16.40
#> 11 2020-06-17    44.90   44.90             44.00     40.80      40.10   3.90
#> 12 2020-06-17   799.00  799.00            779.00    793.85     771.65   7.35
#> 13 2020-06-03  5600.00 5600.00           5580.00   5575.00    5338.35 241.65
#> 14 2020-06-17     0.80    0.80              0.80      0.75       0.75   0.05
#> 15 2020-06-17  1014.90 1014.90            983.45   1009.25     999.85 -16.40
#> 16 2020-06-17     0.65    0.65              0.65      0.65       0.60   0.05
#> 17 2020-06-17     1.20    1.20              1.20      1.15       1.15   0.05
#> 18 2020-06-17    33.80   33.80             30.40     32.15      32.15  -1.75
#> 19 2020-06-17     0.85    0.85              0.85      0.80       0.80   0.05
#> 20 2019-10-09    84.70   84.70             75.25     81.00      79.20  -3.95
#> 21 2019-06-28    81.60   81.60             76.30     75.70      71.30   5.00
#> 22 2020-06-17     1.40    1.40              1.40      1.35       1.35   0.05
#> 23 2020-06-17     1.35    1.35              1.35      1.30       1.30   0.05
#> 24 2020-06-17     7.05    7.05              6.45      6.75       6.75  -0.30
#> 25 2020-01-07   108.65  108.65            108.65    107.40      90.55  18.10
#> 26 2020-06-17    34.65   34.65             34.60     31.50      31.50   3.10
#> 27 2020-04-07     0.80    0.80              0.80      0.80       0.75   0.05
#> 28 2020-06-17     0.70    0.70              0.70      0.65       0.65   0.05
#> 29 2020-06-17     4.40    4.40              4.40      4.20       4.20   0.20
#> 30 2020-06-15   243.75  243.75            243.75    237.50     232.15  11.60
#> 31 2020-01-22    40.80   40.80             39.95     38.75      37.15   2.80
#> 32 2020-06-17   634.00  634.00            624.00    629.80     601.80  22.20
#> 33 2020-06-17     0.35    0.35              0.35      0.30       0.30   0.05
#> 34 2020-06-17    33.85   33.85             32.80     33.50      31.90   0.90
#> 35 2020-06-10     1.00    1.00              1.00      1.00       0.95   0.05
#> 36 2020-06-17    11.20   11.20             10.80     10.85      10.70   0.10
#> 37 2020-06-17    37.15   37.15             34.00     35.40      35.40  -1.40
#> 38 2020-06-17     0.70    0.70              0.70      0.65       0.65   0.05
#> 39 2019-08-20     1.05    1.05              1.00      1.05       1.00   0.00
#> 40 2020-06-17   154.75  154.75            154.65    153.50     153.10   1.55
#> 41 2020-06-17    34.95   34.95             31.20     31.90      31.90  -0.70
#> 42 2020-06-17  1199.55 1199.55           1160.30   1011.85     999.65 160.65
#> 43 2020-05-12   770.00  770.00            748.35    766.10     743.33   5.02
#> 44 2020-06-17    27.35   27.35             27.35     22.85      22.80   4.55
#> 45 2020-06-17    41.90   41.90             41.30     40.05      40.05   1.25
#> 46 2020-06-17   208.40  208.40            208.10    207.20     206.55   1.55
#> 47 2020-06-17    11.65   11.65             11.65     11.10      11.10   0.55
#> 48 2020-06-17     1.55    1.55              1.55      1.50       1.50   0.05
#> 49 2020-06-17     1.70    1.70              1.70      1.65       1.65   0.05
#> 50 2020-06-17     0.40    0.40              0.40      0.35       0.35   0.05
#> 51 2020-06-16  1665.00 1665.00           1662.90   1648.55    1615.35  47.55
#> 52 2020-06-17     1.15    1.15              1.15      1.10       1.10   0.05
#> 53 2020-06-17  1134.10 1134.10           1134.10   1080.10    1080.10  54.00
#> 54 2020-06-17    16.05   16.05             16.05     15.30      15.30   0.75
#> 55 2020-06-17    99.10   99.10             98.80     97.00      96.85   1.95
#> 56 2020-06-17     0.75    0.75              0.75      0.70       0.70   0.05
#> 57 2020-06-17    51.90   51.90             47.25     49.00      48.40  -1.15
#> 58 2020-03-11   367.50  367.50            345.00    353.90     333.65  11.35
#> 59 2019-06-21  1445.00 1445.00           1429.00   1429.50    1305.00 124.00
#> 60 2020-06-17     2.20    2.20              2.20      2.10       2.10   0.10
#> 61 2020-06-17   610.00  610.00            593.00    610.00     596.40  -3.40
#> 62 2020-06-17     0.65    0.65              0.65      0.60       0.60   0.05
#> 63 2020-06-15  1270.00 1270.00           1269.00   1249.70    1187.65  81.35
#> 64 2020-06-17     5.25    5.25              5.25      5.00       5.00   0.25
#> 65 2020-06-17     0.65    0.65              0.65      0.60       0.60   0.05
#>    percent_change
#> 1            4.99
#> 2            4.87
#> 3            4.48
#> 4           10.34
#> 5           -2.05
#> 6           -0.73
#> 7            4.86
#> 8            9.09
#> 9           20.00
#> 10           2.27
#> 11           9.73
#> 12           0.95
#> 13           4.53
#> 14           6.67
#> 15          -1.64
#> 16           8.33
#> 17           4.35
#> 18          -5.44
#> 19           6.25
#> 20          -4.99
#> 21           7.01
#> 22           3.70
#> 23           3.85
#> 24          -4.44
#> 25          19.99
#> 26           9.84
#> 27           6.67
#> 28           7.69
#> 29           4.76
#> 30           5.00
#> 31           7.54
#> 32           3.69
#> 33          16.67
#> 34           2.82
#> 35           5.26
#> 36           0.93
#> 37          -3.95
#> 38           7.69
#> 39           0.00
#> 40           1.01
#> 41          -2.19
#> 42          16.07
#> 43           0.68
#> 44          19.96
#> 45           3.12
#> 46           0.75
#> 47           4.95
#> 48           3.33
#> 49           3.03
#> 50          14.29
#> 51           2.94
#> 52           4.55
#> 53           5.00
#> 54           4.90
#> 55           2.01
#> 56           7.14
#> 57          -2.38
#> 58           3.40
#> 59           9.50
#> 60           4.76
#> 61          -0.57
#> 62           8.33
#> 63           6.85
#> 64           5.00
#> 65           8.33

# retain original column names as returned by NSE
nse_stock_year_high(clean_names = FALSE)
#>        symbol
#> 1  ADANIGREEN
#> 2    ALOKINDS
#> 3  ANDHRACEMT
#> 4       ASTEC
#> 5  BALAJITELE
#> 6      BIOCON
#> 7   BIRLATYRE
#> 8     CENTEXT
#> 9  CORALFINAC
#> 10 COROMANDEL
#> 11     DAAWAT
#> 12    DHANUKA
#> 13      DIXON
#> 14   DNAMEDIA
#> 15    ESCORTS
#> 16 GAMMNINFRA
#> 17     GOENKA
#> 18 GSCLCEMENT
#> 19   GTLINFRA
#> 20   GUFICBIO
#> 21 HARRMALAYA
#> 22 HOTELRUGBY
#> 23  INDOSOLAR
#> 24    ISMTLTD
#> 25        ITI
#> 26 JAGSNPHARM
#> 27 JAIHINDPRO
#> 28     JIKIND
#> 29 JMTAUTOLTD
#> 30      KARDA
#> 31     KOPRAN
#> 32       KSCL
#> 33  KSERASERA
#> 34   LOTUSEYE
#> 35       LSIL
#> 36 MANAKALUCO
#> 37   MARKSANS
#> 38    METKORE
#> 39        MIC
#> 40     MITTAL
#> 41 MOREPENLAB
#> 42 MUTHOOTFIN
#> 43       N100
#> 44    NECLIFE
#> 45  NETWORK18
#> 46      OMAXE
#> 47 OPTOCIRCUI
#> 48 PRAKASHSTL
#> 49  PUNJLLOYD
#> 50   RAJRAYON
#> 51   RELIANCE
#> 52 ROHITFERRO
#> 53      RUCHI
#> 54  RUCHINFRA
#> 55  SAGARDEEP
#> 56    SCAPDVR
#> 57 SHREDIGCEM
#> 58  SUVENPHAR
#> 59  SWARAJENG
#> 60     SYNCOM
#> 61   TATACOMM
#> 62      UNITY
#> 63 VAIBHAVGBL
#> 64 VARDMNPOLY
#> 65    VIJIFIN
#>                                                                symbolDesc
#> 1                                              Adani Green Energy Limited
#> 2                                                 Alok Industries Limited
#> 3                                                  Andhra Cements Limited
#> 4                                              Astec LifeSciences Limited
#> 5                                                Balaji Telefilms Limited
#> 6                                                          Biocon Limited
#> 7                                                     Birla Tyres Limited
#> 8                                              Century Extrusions Limited
#> 9                                   Coral India Finance & Housing Limited
#> 10                                       Coromandel International Limited
#> 11                                                       LT Foods Limited
#> 12                                               Dhanuka Agritech Limited
#> 13                                     Dixon Technologies (India) Limited
#> 14                                     Diligent Media Corporation Limited
#> 15                                                        Escorts Limited
#> 16                                 Gammon Infrastructure Projects Limited
#> 17                                      Goenka Diamond and Jewels Limited
#> 18                                          Gujarat Sidhee Cement Limited
#> 19                                             GTL Infrastructure Limited
#> 20                                              Gufic Biosciences Limited
#> 21                                           Harrisons  Malayalam Limited
#> 22                                                    Hotel Rugby Limited
#> 23                                                      Indosolar Limited
#> 24                                                           ISMT Limited
#> 25                                                            ITI Limited
#> 26                                      Jagsonpal Pharmaceuticals Limited
#> 27                                               Jaihind Projects Limited
#> 28                                                 JIK Industries Limited
#> 29                                                       JMT Auto Limited
#> 30                                            Karda Constructions Limited
#> 31                                                         Kopran Limited
#> 32                                            Kaveri Seed Company Limited
#> 33                                                            KSS Limited
#> 34                               Lotus Eye Hospital and Institute Limited
#> 35                                       Lloyds Steels Industries Limited
#> 36                                     Manaksia Aluminium Company Limited
#> 37                                                Marksans Pharma Limited
#> 38                                    Metkore Alloys & Industries Limited
#> 39                                                MIC Electronics Limited
#> 40                                              Mittal Life Style Limited
#> 41                                           Morepen Laboratories Limited
#> 42                                                Muthoot Finance Limited
#> 43 Motilal Oswal Mutual Fund-Motilal Oswal MOSt Shares NASDAQ 100 ETF -GO
#> 44                                            Nectar Lifesciences Limited
#> 45                                  Network18 Media & Investments Limited
#> 46                                                          Omaxe Limited
#> 47                                          Opto Circuits (India) Limited
#> 48                                               Prakash Steelage Limited
#> 49                                                     Punj Lloyd Limited
#> 50                                           Raj Rayon Industries Limited
#> 51                                            Reliance Industries Limited
#> 52                                               Rohit Ferro-Tech Limited
#> 53                                          Ruchi Soya Industries Limited
#> 54                                           Ruchi Infrastructure Limited
#> 55                                               Sagardeep Alloys Limited
#> 56                                               Stampede Capital Limited
#> 57                                           Shree Digvijay Cement Co.Ltd
#> 58                                          Suven Pharmaceuticals Limited
#> 59                                                 Swaraj Engines Limited
#> 60                                              Syncom Healthcare Limited
#> 61                                            Tata Communications Limited
#> 62                                            Unity Infraprojects Limited
#> 63                                                 Vaibhav Global Limited
#> 64                                               Vardhman Polytex Limited
#> 65                                                   Viji Finance Limited
#>            dt   value    year     ltp value_old    prev change pChange
#> 1  2020-06-17  400.65  400.65  400.65    381.60  381.60  19.05    4.99
#> 2  2020-06-17   34.45   34.45   34.45     32.85   32.85   1.60    4.87
#> 3  2020-06-17    7.00    7.00    7.00      6.70    6.70   0.30    4.48
#> 4  2020-05-29  773.95  773.95  765.00    768.00  693.30  71.70   10.34
#> 5  2020-06-17   81.00   81.00   76.50     78.25   78.10  -1.60   -2.05
#> 6  2020-06-05  404.60  404.60  393.20    400.50  396.10  -2.90   -0.73
#> 7  2020-06-17   31.30   31.30   31.30     29.85   29.85   1.45    4.86
#> 8  2020-06-17    4.80    4.80    4.80      4.40    4.40   0.40    9.09
#> 9  2020-06-10   16.50   16.50   16.50     15.80   13.75   2.75   20.00
#> 10 2020-06-17  747.00  747.00  738.00    726.45  721.60  16.40    2.27
#> 11 2020-06-17   44.90   44.90   44.00     40.80   40.10   3.90    9.73
#> 12 2020-06-17  799.00  799.00  779.00    793.85  771.65   7.35    0.95
#> 13 2020-06-03 5600.00 5600.00 5580.00   5575.00 5338.35 241.65    4.53
#> 14 2020-06-17    0.80    0.80    0.80      0.75    0.75   0.05    6.67
#> 15 2020-06-17 1014.90 1014.90  983.45   1009.25  999.85 -16.40   -1.64
#> 16 2020-06-17    0.65    0.65    0.65      0.65    0.60   0.05    8.33
#> 17 2020-06-17    1.20    1.20    1.20      1.15    1.15   0.05    4.35
#> 18 2020-06-17   33.80   33.80   30.40     32.15   32.15  -1.75   -5.44
#> 19 2020-06-17    0.85    0.85    0.85      0.80    0.80   0.05    6.25
#> 20 2019-10-09   84.70   84.70   75.25     81.00   79.20  -3.95   -4.99
#> 21 2019-06-28   81.60   81.60   76.30     75.70   71.30   5.00    7.01
#> 22 2020-06-17    1.40    1.40    1.40      1.35    1.35   0.05    3.70
#> 23 2020-06-17    1.35    1.35    1.35      1.30    1.30   0.05    3.85
#> 24 2020-06-17    7.05    7.05    6.45      6.75    6.75  -0.30   -4.44
#> 25 2020-01-07  108.65  108.65  108.65    107.40   90.55  18.10   19.99
#> 26 2020-06-17   34.65   34.65   34.60     31.50   31.50   3.10    9.84
#> 27 2020-04-07    0.80    0.80    0.80      0.80    0.75   0.05    6.67
#> 28 2020-06-17    0.70    0.70    0.70      0.65    0.65   0.05    7.69
#> 29 2020-06-17    4.40    4.40    4.40      4.20    4.20   0.20    4.76
#> 30 2020-06-15  243.75  243.75  243.75    237.50  232.15  11.60    5.00
#> 31 2020-01-22   40.80   40.80   39.95     38.75   37.15   2.80    7.54
#> 32 2020-06-17  634.00  634.00  624.00    629.80  601.80  22.20    3.69
#> 33 2020-06-17    0.35    0.35    0.35      0.30    0.30   0.05   16.67
#> 34 2020-06-17   33.85   33.85   32.80     33.50   31.90   0.90    2.82
#> 35 2020-06-10    1.00    1.00    1.00      1.00    0.95   0.05    5.26
#> 36 2020-06-17   11.20   11.20   10.80     10.85   10.70   0.10    0.93
#> 37 2020-06-17   37.15   37.15   34.00     35.40   35.40  -1.40   -3.95
#> 38 2020-06-17    0.70    0.70    0.70      0.65    0.65   0.05    7.69
#> 39 2019-08-20    1.05    1.05    1.00      1.05    1.00   0.00    0.00
#> 40 2020-06-17  154.75  154.75  154.65    153.50  153.10   1.55    1.01
#> 41 2020-06-17   34.95   34.95   31.20     31.90   31.90  -0.70   -2.19
#> 42 2020-06-17 1199.55 1199.55 1160.30   1011.85  999.65 160.65   16.07
#> 43 2020-05-12  770.00  770.00  748.35    766.10  743.33   5.02    0.68
#> 44 2020-06-17   27.35   27.35   27.35     22.85   22.80   4.55   19.96
#> 45 2020-06-17   41.90   41.90   41.30     40.05   40.05   1.25    3.12
#> 46 2020-06-17  208.40  208.40  208.10    207.20  206.55   1.55    0.75
#> 47 2020-06-17   11.65   11.65   11.65     11.10   11.10   0.55    4.95
#> 48 2020-06-17    1.55    1.55    1.55      1.50    1.50   0.05    3.33
#> 49 2020-06-17    1.70    1.70    1.70      1.65    1.65   0.05    3.03
#> 50 2020-06-17    0.40    0.40    0.40      0.35    0.35   0.05   14.29
#> 51 2020-06-16 1665.00 1665.00 1662.90   1648.55 1615.35  47.55    2.94
#> 52 2020-06-17    1.15    1.15    1.15      1.10    1.10   0.05    4.55
#> 53 2020-06-17 1134.10 1134.10 1134.10   1080.10 1080.10  54.00    5.00
#> 54 2020-06-17   16.05   16.05   16.05     15.30   15.30   0.75    4.90
#> 55 2020-06-17   99.10   99.10   98.80     97.00   96.85   1.95    2.01
#> 56 2020-06-17    0.75    0.75    0.75      0.70    0.70   0.05    7.14
#> 57 2020-06-17   51.90   51.90   47.25     49.00   48.40  -1.15   -2.38
#> 58 2020-03-11  367.50  367.50  345.00    353.90  333.65  11.35    3.40
#> 59 2019-06-21 1445.00 1445.00 1429.00   1429.50 1305.00 124.00    9.50
#> 60 2020-06-17    2.20    2.20    2.20      2.10    2.10   0.10    4.76
#> 61 2020-06-17  610.00  610.00  593.00    610.00  596.40  -3.40   -0.57
#> 62 2020-06-17    0.65    0.65    0.65      0.60    0.60   0.05    8.33
#> 63 2020-06-15 1270.00 1270.00 1269.00   1249.70 1187.65  81.35    6.85
#> 64 2020-06-17    5.25    5.25    5.25      5.00    5.00   0.25    5.00
#> 65 2020-06-17    0.65    0.65    0.65      0.60    0.60   0.05    8.33
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
#> 1        BHEL     EQ                  2019-09-11
#> 2  MUTHOOTFIN     EQ                  2020-03-23
#> 3  BAJAJFINSV     EQ                  2020-03-03
#> 4         BEL     EQ                  2020-02-11
#> 5   COALINDIA     EQ                  2020-03-19
#> 6    CHOLAFIN     EQ                  2020-03-04
#> 7  BAJFINANCE     EQ                  2020-03-03
#> 8        ZEEL     EQ                  2019-07-15
#> 9         NCC     EQ                  2019-08-08
#> 10       VEDL     EQ                  2020-03-05
#>                                  last_corp_announcement open_price high_price
#> 1   Annual General Meeting/Dividend - Rs 1.20 Per Share      28.65      32.15
#> 2                    Interim Dividend - Rs 15 Per Share    1036.90    1199.55
#> 3                     Interim Dividend - Rs 5 Per Share    5036.95    5499.00
#> 4                  Interim Dividend - Rs 1.40 Per Share      71.95      77.25
#> 5                    Interim Dividend - Rs 12 Per Share     129.00     139.70
#> 6                    Interim Dividend-Re 0.70 Per Share     168.20     178.80
#> 7                    Interim Dividend - Rs 10 Per Share    2375.00    2541.70
#> 8  Annual General Meeting/ Dividend - Rs 3.50 Per Share     166.50     175.45
#> 9                          Dividend - Rs 1.50 Per Share      27.80      29.70
#> 10                  Interim Dividend - Rs 3.9 Per Share     102.80     107.80
#>    low_price last_traded_price prev_close_price percent_change traded_quantity
#> 1      28.50             32.00            27.45          16.58       250949789
#> 2    1036.90           1160.30           999.65          16.07        18024858
#> 3    5021.55           5450.75          5036.95           8.22         1806208
#> 4      71.65             76.95            71.65           7.40        33392838
#> 5     128.15            137.65           129.45           6.33        34587382
#> 6     168.20            177.95           168.20           5.80        26257427
#> 7    2373.00           2527.20          2396.00           5.48        12738830
#> 8     165.50            173.95           165.00           5.42        37917230
#> 9      27.55             29.30            27.85           5.21        26610887
#> 10    102.00            106.90           102.10           4.70        27586795
#>    turnover_in_lakhs
#> 1           77443.10
#> 2          203545.71
#> 3           95403.73
#> 4           25204.91
#> 5           47031.92
#> 6           45821.84
#> 7          315647.83
#> 8           65103.88
#> 9            7743.77
#> 10          29197.86

# retain original column names as returned by NSE
nse_fo_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1        BHEL     EQ               2019-09-11
#> 2  MUTHOOTFIN     EQ               2020-03-23
#> 3  BAJAJFINSV     EQ               2020-03-03
#> 4         BEL     EQ               2020-02-11
#> 5   COALINDIA     EQ               2020-03-19
#> 6    CHOLAFIN     EQ               2020-03-04
#> 7  BAJFINANCE     EQ               2020-03-03
#> 8        ZEEL     EQ               2019-07-15
#> 9         NCC     EQ               2019-08-08
#> 10       VEDL     EQ               2020-03-05
#>                                    lastCorpAnnouncement openPrice highPrice
#> 1   Annual General Meeting/Dividend - Rs 1.20 Per Share     28.65     32.15
#> 2                    Interim Dividend - Rs 15 Per Share   1036.90   1199.55
#> 3                     Interim Dividend - Rs 5 Per Share   5036.95   5499.00
#> 4                  Interim Dividend - Rs 1.40 Per Share     71.95     77.25
#> 5                    Interim Dividend - Rs 12 Per Share    129.00    139.70
#> 6                    Interim Dividend-Re 0.70 Per Share    168.20    178.80
#> 7                    Interim Dividend - Rs 10 Per Share   2375.00   2541.70
#> 8  Annual General Meeting/ Dividend - Rs 3.50 Per Share    166.50    175.45
#> 9                          Dividend - Rs 1.50 Per Share     27.80     29.70
#> 10                  Interim Dividend - Rs 3.9 Per Share    102.80    107.80
#>    lowPrice     ltp previousPrice netPrice tradedQuantity turnoverInLakhs
#> 1     28.50   32.00         27.45    16.58      250949789        77443.10
#> 2   1036.90 1160.30        999.65    16.07       18024858       203545.71
#> 3   5021.55 5450.75       5036.95     8.22        1806208        95403.73
#> 4     71.65   76.95         71.65     7.40       33392838        25204.91
#> 5    128.15  137.65        129.45     6.33       34587382        47031.92
#> 6    168.20  177.95        168.20     5.80       26257427        45821.84
#> 7   2373.00 2527.20       2396.00     5.48       12738830       315647.83
#> 8    165.50  173.95        165.00     5.42       37917230        65103.88
#> 9     27.55   29.30         27.85     5.21       26610887         7743.77
#> 10   102.00  106.90        102.10     4.70       27586795        29197.86
```

### Pre Open Market Data

##### Fetch data of pre open session of Nifty Bank.

``` r
nse_preopen_nifty_bank()
#>        symbol series corp_action_date                          corp_action
#> 1  FEDERALBNK     EQ             <NA>                                 <NA>
#> 2    AXISBANK     EQ             <NA>                                 <NA>
#> 3     RBLBANK     EQ       2020-03-23 INTERIM DIVIDEND - RS 1.50 PER SHARE
#> 4   ICICIBANK     EQ             <NA>                                 <NA>
#> 5  INDUSINDBK     EQ             <NA>                                 <NA>
#> 6        SBIN     EQ             <NA>                                 <NA>
#> 7   KOTAKBANK     EQ             <NA>                                 <NA>
#> 8  BANKBARODA     EQ             <NA>                                 <NA>
#> 9         PNB     EQ             <NA>                                 <NA>
#> 10 BANDHANBNK     EQ             <NA>                                 <NA>
#> 11 IDFCFIRSTB     EQ             <NA>                                 <NA>
#> 12   HDFCBANK     EQ             <NA>                                 <NA>
#>      price change percent_change prev_close quantity  value   mkt_cap year_high
#> 1    46.25  -0.45          -0.96      46.70    34005  15.73   9310.19    110.40
#> 2   386.00  -3.60          -0.92     389.60    38462 148.46  87921.92    819.00
#> 3   161.00  -1.35          -0.83     162.35    25355  40.82   7677.08    663.00
#> 4   340.00  -1.95          -0.57     341.95    36447 123.92 221323.07    552.20
#> 5   489.50  -1.65          -0.34     491.15    24913 121.95  29634.63   1596.55
#> 6   172.40  -0.55          -0.32     172.95    77741 134.03  66371.00    373.80
#> 7  1240.00  -3.80          -0.31    1243.80     6537  81.06 166510.81   1740.00
#> 8    44.80  -0.10          -0.22      44.90    17855   8.00   5394.05    132.85
#> 9    33.10  -0.05          -0.15      33.15    28628   9.48   3796.96     83.40
#> 10  263.00  -0.20          -0.08     263.20     9118  23.98  11019.05    650.00
#> 11   25.55   0.10           0.39      25.45    73524  18.79   5263.72     47.95
#> 12  980.00   0.75           0.08     979.25    44801 439.05 424081.52   1305.50
#>    year_low sum_val sum_quantity fin_quantity sum_fin_quantity
#> 1     35.70 1165.26       205313        34005           417386
#> 2    286.00 1165.26       205313        38462           417386
#> 3    101.55 1165.26       205313        25355           417386
#> 4    268.30 1165.26       205313        36447           417386
#> 5    235.55 1165.26       205313        24913           417386
#> 6    149.45 1165.26       205313        77741           417386
#> 7   1001.00 1165.26       205313         6537           417386
#> 8     36.00 1165.26       205313        17855           417386
#> 9     26.30 1165.26       205313        28628           417386
#> 10   152.20 1165.26       205313         9118           417386
#> 11    17.65 1165.26       205313        73524           417386
#> 12   738.75 1165.26       205313        44801           417386

# retain original column names as returned by NSE
nse_preopen_nifty(clean_names = FALSE)
#>        symbol series        xDt
#> 1    JSWSTEEL     EQ       <NA>
#> 2        ONGC     EQ 2020-03-23
#> 3    INFRATEL     EQ 2020-05-05
#> 4          LT     EQ 2020-03-24
#> 5    AXISBANK     EQ       <NA>
#> 6  BAJFINANCE     EQ       <NA>
#> 7     HCLTECH     EQ       <NA>
#> 8   ICICIBANK     EQ       <NA>
#> 9      MARUTI     EQ       <NA>
#> 10   RELIANCE     EQ 2020-05-13
#> 11      TITAN     EQ       <NA>
#> 12      WIPRO     EQ       <NA>
#> 13 TATAMOTORS     EQ       <NA>
#> 14 HINDUNILVR     EQ       <NA>
#> 15  COALINDIA     EQ       <NA>
#> 16 INDUSINDBK     EQ       <NA>
#> 17       SBIN     EQ       <NA>
#> 18  KOTAKBANK     EQ       <NA>
#> 19 ADANIPORTS     EQ 2020-06-17
#> 20       HDFC     EQ       <NA>
#> 21 ULTRACEMCO     EQ       <NA>
#> 22     GRASIM     EQ       <NA>
#> 23        TCS     EQ 2020-06-03
#> 24        M&M     EQ       <NA>
#> 25       BPCL     EQ 2020-03-23
#> 26 HEROMOTOCO     EQ       <NA>
#> 27      TECHM     EQ       <NA>
#> 28        IOC     EQ 2020-03-23
#> 29  EICHERMOT     EQ       <NA>
#> 30       ZEEL     EQ       <NA>
#> 31  POWERGRID     EQ       <NA>
#> 32       VEDL     EQ       <NA>
#> 33       INFY     EQ 2020-05-29
#> 34    DRREDDY     EQ       <NA>
#> 35        UPL     EQ       <NA>
#> 36  BRITANNIA     EQ       <NA>
#> 37   SHREECEM     EQ       <NA>
#> 38       NTPC     EQ 2020-03-26
#> 39   HINDALCO     EQ       <NA>
#> 40       GAIL     EQ       <NA>
#> 41      CIPLA     EQ       <NA>
#> 42 BHARTIARTL     EQ       <NA>
#> 43  NESTLEIND     EQ 2020-06-11
#> 44   HDFCBANK     EQ       <NA>
#> 45  TATASTEEL     EQ       <NA>
#> 46 BAJAJFINSV     EQ       <NA>
#> 47        ITC     EQ       <NA>
#> 48  SUNPHARMA     EQ       <NA>
#> 49 ASIANPAINT     EQ       <NA>
#> 50 BAJAJ-AUTO     EQ       <NA>
#>                                                caAct      iep    chn perChn
#> 1                                               <NA>   189.00  -2.85  -1.49
#> 2                  INTERIM DIVIDEND - RS 5 PER SHARE    83.00  -1.20  -1.43
#> 3               INTERIM DIVIDEND - RS 4.10 PER SHARE   208.95   2.70   1.31
#> 4                 INTERIM DIVIDEND - RS 10 PER SHARE   876.00  -8.80  -0.99
#> 5                                               <NA>   386.00  -3.60  -0.92
#> 6                                               <NA>  2375.00 -21.00  -0.88
#> 7                                               <NA>   571.20  -4.65  -0.81
#> 8                                               <NA>   340.00  -1.95  -0.57
#> 9                                               <NA>  5695.00 -31.20  -0.54
#> 10                     RIGHTS 1:15 @ PREMIUM RS 1247  1607.00  -8.35  -0.52
#> 11                                              <NA>   958.10  -4.90  -0.51
#> 12                                              <NA>   216.80  -1.00  -0.46
#> 13                                              <NA>    95.00  -0.40  -0.42
#> 14                                              <NA>  2070.25  -8.00  -0.38
#> 15                                              <NA>   129.00  -0.45  -0.35
#> 16                                              <NA>   489.50  -1.65  -0.34
#> 17                                              <NA>   172.40  -0.55  -0.32
#> 18                                              <NA>  1240.00  -3.80  -0.31
#> 19                            ANNUAL GENERAL MEETING   340.35  -0.95  -0.28
#> 20                                              <NA>  1790.00  -4.65  -0.26
#> 21                                              <NA>  3799.70  -9.50  -0.25
#> 22                                              <NA>   583.00  -0.85  -0.15
#> 23                         DIVIDEND - RS 6 PER SHARE  2045.00  -2.80  -0.14
#> 24                                              <NA>   496.90  -0.70  -0.14
#> 25             INTERIM DIVIDEND - RS 16.50 PER SHARE   364.10  -0.50  -0.14
#> 26                                              <NA>  2360.25  -3.05  -0.13
#> 27                                              <NA>   535.05  -0.50  -0.09
#> 28              INTERIM DIVIDEND - RS 4.25 PER SHARE    84.30  -0.05  -0.06
#> 29                                              <NA> 16788.50  -8.35  -0.05
#> 30                                              <NA>   166.50   1.50   0.91
#> 31                                              <NA>   160.70   1.20   0.75
#> 32                                              <NA>   102.80   0.70   0.69
#> 33                      DIVIDEND - RS 9.50 PER SHARE   708.20   4.55   0.65
#> 34                                              <NA>  4010.00  24.80   0.62
#> 35                                              <NA>   422.85   2.05   0.49
#> 36                                              <NA>  3415.00  13.55   0.40
#> 37                                              <NA> 21718.00  82.60   0.38
#> 38              INTERIM DIVIDEND - RS 0.50 PER HSARE    91.80   0.30   0.33
#> 39                                              <NA>   148.45   0.45   0.30
#> 40                                              <NA>    96.50   0.25   0.26
#> 41                                              <NA>   641.65   1.30   0.20
#> 42                                              <NA>   564.25   0.80   0.14
#> 43 ANNUAL GENERAL MEETING/DIVIDEND - RS 61 PER SHARE 16218.50  20.35   0.13
#> 44                                              <NA>   980.00   0.75   0.08
#> 45                                              <NA>   308.20   0.00   0.00
#> 46                                              <NA>  5036.95   0.00   0.00
#> 47                                              <NA>   181.20   0.00   0.00
#> 48                                              <NA>   485.65   0.00   0.00
#> 49                                              <NA>  1595.40   0.00   0.00
#> 50                                              <NA>  2689.45   0.00   0.00
#>        pCls trdQnty   iVal    mktCap    yHigh     yLow  sumVal sumQnty finQnty
#> 1    191.85   10577  19.99  19477.24   296.75   132.50 3632.29  413159   10577
#> 2     84.20   32140  26.68  30718.53   173.45    50.00 3632.29  413159   32140
#> 3    206.25   28951  60.49  17548.16   296.50   120.05 3632.29  413159   28951
#> 4    884.80   16578 145.22 109298.80  1591.65   661.00 3632.29  413159   16578
#> 5    389.60   38462 148.46  87921.92   819.00   286.00 3632.29  413159   38462
#> 6   2396.00    6468 153.62  63432.47  4923.40  1783.00 3632.29  413159    6468
#> 7    575.85    2417  13.81  62506.56   623.50   375.25 3632.29  413159    2417
#> 8    341.95   36447 123.92 221323.07   552.20   268.30 3632.29  413159   36447
#> 9   5726.20    1902 108.32  76109.92  7758.70  4001.10 3632.29  413159    1902
#> 10  1615.35   28200 453.17 522246.83  1648.55   866.98 3632.29  413159   28200
#> 11   963.00    1245  11.93  40182.09  1389.95   720.90 3632.29  413159    1245
#> 12   217.80    5193  11.26  32353.00   300.50   159.40 3632.29  413159    5193
#> 13    95.40  111472 105.90  17091.91   201.70    63.50 3632.29  413159  111472
#> 14  2078.25    4694  97.18 148468.30  2614.30  1659.05 3632.29  413159    4694
#> 15   129.45   39277  50.67  27124.02   265.35   119.20 3632.29  413159   39277
#> 16   491.15   24913 121.95  29634.63  1596.55   235.55 3632.29  413159   24913
#> 17   172.95   77741 134.03  66371.00   373.80   149.45 3632.29  413159   77741
#> 18  1243.80    6537  81.06 166510.81  1740.00  1001.00 3632.29  413159    6537
#> 19   341.30    2285   7.78  26350.60   428.85   203.00 3632.29  413159    2285
#> 20  1794.65    8593 153.81 310288.49  2499.90  1473.45 3632.29  413159    8593
#> 21  3809.20     215   8.17  43976.98  4754.10  2910.00 3632.29  413159     215
#> 22   583.85    1561   9.10  23043.35   949.50   385.05 3632.29  413159    1561
#> 23  2047.80    1647  33.68 215155.74  2296.20  1506.05 3632.29  413159    1647
#> 24   497.60    4533  22.52  47633.17   675.30   245.40 3632.29  413159    4533
#> 25   364.60    3226  11.75  29263.65   549.00   252.00 3632.29  413159    3226
#> 26  2363.30    1617  38.17  30682.86  3022.90  1475.00 3632.29  413159    1617
#> 27   535.55    2960  15.84  33101.32   845.90   471.40 3632.29  413159    2960
#> 28    84.35   18850  15.89  21440.28   158.00    71.15 3632.29  413159   18850
#> 29 16796.85     360  60.44  23390.17 23450.00 12450.10 3632.29  413159     360
#> 30   165.00   28857  48.05  15055.57   405.20   114.00 3632.29  413159   28857
#> 31   159.50   13314  21.40  40887.49   216.25   122.15 3632.29  413159   13314
#> 32   102.10   14546  14.95  18596.76   180.00    60.20 3632.29  413159   14546
#> 33   703.65   22552 159.71 257721.77   847.00   509.25 3632.29  413159   22552
#> 34  3985.20    1530  61.35  48340.12  4190.00  2351.20 3632.29  413159    1530
#> 35   420.80   14166  59.90  23148.74   709.05   240.15 3632.29  413159   14166
#> 36  3401.45    1461  49.89  40079.10  3708.00  2100.00 3632.29  413159    1461
#> 37 21635.40     113  24.54  28882.99 25355.00 15410.00 3632.29  413159     113
#> 38    91.50   14327  13.15  44362.25   145.85    73.20 3632.29  413159   14327
#> 39   148.00   21655  32.15  21607.12   221.20    84.90 3632.29  413159   21655
#> 40    96.25   12682  12.24  17798.15   157.38    65.00 3632.29  413159   12682
#> 41   640.35    1873  12.02  32525.19   669.75   355.30 3632.29  413159    1873
#> 42   563.45   29784 168.06 126031.29   612.00   321.15 3632.29  413159   29784
#> 43 16198.15     145  23.52  57784.98 18369.95 11265.00 3632.29  413159     145
#> 44   979.25   44801 439.05 424081.52  1305.50   738.75 3632.29  413159   44801
#> 45   308.20   17080  52.64  23261.33   516.45   250.85 3632.29  413159   17080
#> 46  5036.95    1113  56.06  30459.53  9950.00  3985.30 3632.29  413159    1113
#> 47   181.20   41650  75.47 158142.01   282.90   134.60 3632.29  413159   41650
#> 48   485.65    4026  19.55  52435.67   512.70   312.00 3632.29  413159    4026
#> 49  1595.40    1744  27.82  71924.30  1916.70  1291.25 3632.29  413159    1744
#> 50  2689.45     594  15.98  35020.72  3315.15  1788.65 3632.29  413159     594
#>    sumfinQnty
#> 1      807074
#> 2      807074
#> 3      807074
#> 4      807074
#> 5      807074
#> 6      807074
#> 7      807074
#> 8      807074
#> 9      807074
#> 10     807074
#> 11     807074
#> 12     807074
#> 13     807074
#> 14     807074
#> 15     807074
#> 16     807074
#> 17     807074
#> 18     807074
#> 19     807074
#> 20     807074
#> 21     807074
#> 22     807074
#> 23     807074
#> 24     807074
#> 25     807074
#> 26     807074
#> 27     807074
#> 28     807074
#> 29     807074
#> 30     807074
#> 31     807074
#> 32     807074
#> 33     807074
#> 34     807074
#> 35     807074
#> 36     807074
#> 37     807074
#> 38     807074
#> 39     807074
#> 40     807074
#> 41     807074
#> 42     807074
#> 43     807074
#> 44     807074
#> 45     807074
#> 46     807074
#> 47     807074
#> 48     807074
#> 49     807074
#> 50     807074
```

### Advances & Declines

``` r
nse_advances_declines()
#>                                     index_name advances declines unchanged
#> 1                                     NIFTY 50       40       10         0
#> 2                                NIFTY NEXT 50       33       16         1
#> 3                                     NIFTY IT        8        2         0
#> 4                                   NIFTY BANK       12        0         0
#> 5                              NIFTY MIDCAP 50       37       13         0
#> 6                                  NIFTY INFRA       22        8         0
#> 7                                 NIFTY REALTY        8        2         0
#> 8                                 NIFTY ENERGY        9        1         0
#> 9                                   NIFTY FMCG       12        3         0
#> 10                                   NIFTY MNC       18       12         0
#> 11                                NIFTY PHARMA        5        5         0
#> 12                                   NIFTY PSE       17        2         1
#> 13                              NIFTY PSU BANK       12        1         0
#> 14                           NIFTY SERV SECTOR       26        4         0
#> 15                           NIFTY COMMODITIES       24        5         1
#> 16                           NIFTY CONSUMPTION       16       14         0
#> 17                           NIFTY FIN SERVICE       18        2         0
#> 18                                  NIFTY AUTO       10        5         0
#> 19                           NIFTY DIV OPPS 50       35       14         1
#> 20                                 NIFTY MEDIA       10        4         0
#> 21                                 NIFTY METAL       11        4         0
#> 22                             NIFTY100 LIQ 15       11        4         0
#> 23                                  NIFTY CPSE        9        2         1
#> 24                           NIFTY GROWSECT 15       12        3         0
#> 25                            NIFTY50 VALUE 20       15        5         0
#> 26                           NIFTY100 QUALTY30       19       11         0
#> 27                              NIFTY PVT BANK       10        0         0
#> 28                            NIFTY MID LIQ 15       11        4         0
#> 29                                   NIFTY 100       74       26         1
#> 30                                   NIFTY 200      149       50         2
#> 31                                   NIFTY 500      377      119         5
#> 32                            NIFTY MIDCAP 100       75       24         1
#> 33                            NIFTY SMLCAP 100       78       20         2
#> 34                    NIFTY ADITYA BIRLA GROUP        6        1         0
#> 35                              NIFTY ALPHA 50       36       14         0
#> 36                          NIFTY HIGH BETA 50       43        7         0
#> 37                     NIFTY LOW VOLATILITY 50       36       14         0
#> 38                        NIFTY MAHINDRA GROUP        8        0         0
#> 39                            NIFTY MIDCAP 150      109       39         2
#> 40                       NIFTY MIDSMALLCAP 400      303       93         4
#> 41                            NIFTY SHARIAH 25       13       12         0
#> 42                          NIFTY SMALLCAP 250      194       54         2
#> 43                           NIFTY SMALLCAP 50       38       11         1
#> 44                            NIFTY TATA GROUP       17        5         0
#> 45                    NIFTY TATA GROUP 25% CAP        7        3         0
#> 46                            NIFTY100 EQL WGT       74       26         1
#> 47                           NIFTY100 LOWVOL30       22        8         0
#> 48                             NIFTY50 SHARIAH       13        6         0
#> 49                            NIFTY500 SHARIAH      147       68         2
#> 50                             NIFTY50 EQL WGT       40       10         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       20       10         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       19       11         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30       19       11         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30       18       12         0
#> 55                            NIFTY SME EMERGE       30       17        72
#> 56                       NIFTY LARGEMIDCAP 250      183       65         3
#> 57                           NIFTY500 VALUE 50       42        7         1
#> 58                            NIFTY MIDCAP 150      109       39         2
#> 59                          CNX NIFTY Pre Open       16       28         6

# retain original column names as returned by NSE
nse_advances_declines(clean_names = FALSE)
#>                                        skipped advances declines unchanged
#> 1                                     NIFTY 50       40       10         0
#> 2                                NIFTY NEXT 50       33       16         1
#> 3                                     NIFTY IT        8        2         0
#> 4                                   NIFTY BANK       12        0         0
#> 5                              NIFTY MIDCAP 50       37       13         0
#> 6                                  NIFTY INFRA       22        8         0
#> 7                                 NIFTY REALTY        8        2         0
#> 8                                 NIFTY ENERGY        9        1         0
#> 9                                   NIFTY FMCG       12        3         0
#> 10                                   NIFTY MNC       18       12         0
#> 11                                NIFTY PHARMA        5        5         0
#> 12                                   NIFTY PSE       17        2         1
#> 13                              NIFTY PSU BANK       12        1         0
#> 14                           NIFTY SERV SECTOR       26        4         0
#> 15                           NIFTY COMMODITIES       24        5         1
#> 16                           NIFTY CONSUMPTION       16       14         0
#> 17                           NIFTY FIN SERVICE       18        2         0
#> 18                                  NIFTY AUTO       10        5         0
#> 19                           NIFTY DIV OPPS 50       35       14         1
#> 20                                 NIFTY MEDIA       10        4         0
#> 21                                 NIFTY METAL       11        4         0
#> 22                             NIFTY100 LIQ 15       11        4         0
#> 23                                  NIFTY CPSE        9        2         1
#> 24                           NIFTY GROWSECT 15       12        3         0
#> 25                            NIFTY50 VALUE 20       15        5         0
#> 26                           NIFTY100 QUALTY30       19       11         0
#> 27                              NIFTY PVT BANK       10        0         0
#> 28                            NIFTY MID LIQ 15       11        4         0
#> 29                                   NIFTY 100       74       26         1
#> 30                                   NIFTY 200      149       50         2
#> 31                                   NIFTY 500      377      119         5
#> 32                            NIFTY MIDCAP 100       75       24         1
#> 33                            NIFTY SMLCAP 100       78       20         2
#> 34                    NIFTY ADITYA BIRLA GROUP        6        1         0
#> 35                              NIFTY ALPHA 50       36       14         0
#> 36                          NIFTY HIGH BETA 50       43        7         0
#> 37                     NIFTY LOW VOLATILITY 50       36       14         0
#> 38                        NIFTY MAHINDRA GROUP        8        0         0
#> 39                            NIFTY MIDCAP 150      109       39         2
#> 40                       NIFTY MIDSMALLCAP 400      303       93         4
#> 41                            NIFTY SHARIAH 25       13       12         0
#> 42                          NIFTY SMALLCAP 250      194       54         2
#> 43                           NIFTY SMALLCAP 50       38       11         1
#> 44                            NIFTY TATA GROUP       17        5         0
#> 45                    NIFTY TATA GROUP 25% CAP        7        3         0
#> 46                            NIFTY100 EQL WGT       74       26         1
#> 47                           NIFTY100 LOWVOL30       22        8         0
#> 48                             NIFTY50 SHARIAH       13        6         0
#> 49                            NIFTY500 SHARIAH      147       68         2
#> 50                             NIFTY50 EQL WGT       40       10         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       20       10         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       19       11         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30       19       11         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30       18       12         0
#> 55                            NIFTY SME EMERGE       30       17        72
#> 56                       NIFTY LARGEMIDCAP 250      183       65         3
#> 57                           NIFTY500 VALUE 50       42        7         1
#> 58                            NIFTY MIDCAP 150      109       39         2
#> 59                          CNX NIFTY Pre Open       16       28         6
```

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
