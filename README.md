
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

-   stocks
    -   quote for a given stock
    -   stock description
    -   validate stock symbol/ticker
    -   most actively traded stocks in a month
    -   52 week high/low
    -   top gainers/losers for the last trading session
-   index
    -   list of NSE indices
    -   validate index symbol/ticker
    -   quote for a given index
-   futures & options
    -   top gainers/losers for the last trading session
-   pre open market data
    -   nifty
    -   nifty bank
-   indices advances & declines

## Installation

You can install the development version of nse2r from
[GitHub](https://github.com/rsquaredacademy/nse2r/) with:

``` r
# install.packages("devtools")
devtools::install_github("rsquaredacademy/nse2r")
```

## Usage

nse2r uses consistent prefix `nse_` for easy tab completion.

-   `nse_index_` for index
-   `nse_stock_` for stocks
-   `nse_fo_` for futures and options
-   `nse_preopen_` for preopen data

## Preprocessing

nse2r does basic data preprocessing which are listed below:

-   modify column data types from `character` to `numeric` and `Date`
-   modify column names
    -   make them more descriptive
    -   to `snake_case` from `camelCase`

Users can retain the names and format as returned by NSE using the
`clean_names` argument and setting it to `FALSE`.

### Index

##### Fetch Indices Quote

``` r
nse_index_quote()
#>           index_name last_traded_price change percent_change
#> 1  NIFTY 50 Pre Open          15064.40 145.30           0.97
#> 2           NIFTY 50          15245.60 326.50           2.19
#> 3      NIFTY NEXT 50          35712.75 561.40           1.60
#> 4    NIFTY100 LIQ 15           3861.55  87.65           2.32
#> 5         NIFTY BANK          36368.05 948.35           2.68
#> 6          INDIA VIX             22.09  -1.52          -6.42
#> 7          NIFTY 100          15379.50 317.90           2.11
#> 8          NIFTY 500          12764.80 245.40           1.96
#> 9   NIFTY MIDCAP 100          24488.45 401.80           1.67
#> 10   NIFTY MIDCAP 50           7151.05 118.00           1.68
#> 11       NIFTY INFRA           4282.35  62.05           1.47
#> 12      NIFTY REALTY            362.45   5.35           1.50
#> 13      NIFTY ENERGY          19670.05 366.65           1.90
#> 14        NIFTY FMCG          33454.40 203.50           0.61
#> 15         NIFTY MNC          16295.45 105.00           0.65
#> 16      NIFTY PHARMA          12379.60 122.30           1.00
#> 17         NIFTY PSE           3352.15  24.35           0.73
#> 18    NIFTY PSU BANK           2454.95  75.15           3.16
#> 19 NIFTY SERV SECTOR          21555.25 514.60           2.45
#> 20          NIFTY IT          25772.65 470.80           1.86
#> 21  NIFTY SMLCAP 100           8400.75  82.50           0.99
#> 22         NIFTY 200           7963.30 160.35           2.05
#> 23        NIFTY AUTO          10673.10 -70.95          -0.66
#> 24       NIFTY MEDIA           1719.75  10.85           0.63
#> 25       NIFTY METAL           4058.60 131.00           3.34
#> 26 NIFTY DIV OPPS 50           3105.30  35.60           1.16
#> 27 NIFTY COMMODITIES           4536.55  88.75           2.00
#> 28 NIFTY CONSUMPTION           6001.95  23.50           0.39
#> 29        NIFTY CPSE           1937.90  11.65           0.60
#> 30 NIFTY FIN SERVICE          16854.40 455.80           2.78
#> 31 NIFTY GROWSECT 15           7293.85 144.35           2.02
#> 32  NIFTY50 VALUE 20           7437.55 101.35           1.38
#> 33 NIFTY50 TR 2X LEV           9485.60 397.05           4.37
#> 34 NIFTY50 PR 2X LEV           7115.30 297.85           4.37
#> 35 NIFTY50 TR 1X INV            249.05  -5.55          -2.18
#> 36 NIFTY50 PR 1X INV            287.45  -6.40          -2.18
#> 37    NIFTY ALPHA 50          22552.95 433.75           1.96
#> 38   NIFTY50 EQL WGT          16557.30 257.05           1.58
#> 39  NIFTY100 EQL WGT          17570.30 268.10           1.55
#> 40 NIFTY100 LOWVOL30          11444.25 116.70           1.03
#> 41  NIFTY MID LIQ 15           6070.50  69.20           1.15
#> 42    NIFTY PVT BANK          19425.55 519.45           2.75
#> 43 NIFTY100 QUALTY30           3395.75  32.10           0.95
#> 44   NIFTY GS 8 13YR           2207.53  -2.21          -0.10
#> 45     NIFTY GS 10YR           1997.19  -1.56          -0.08
#> 46 NIFTY GS 10YR CLN            940.94  -0.91          -0.10
#> 47    NIFTY GS 4 8YR           2361.29  -1.67          -0.07
#> 48  NIFTY GS 11 15YR           2362.94  -2.66          -0.11
#> 49 NIFTY GS 15YRPLUS           2608.85  -1.05          -0.04
#> 50 NIFTY GS COMPSITE           2253.75  -1.80          -0.08
#> 51  NIFTY MIDCAP 150           9235.70 144.70           1.59
#> 52   NIFTY SMLCAP 50           4240.40  41.90           1.00
#> 53  NIFTY SMLCAP 250           7169.15  66.30           0.93
#> 54  NIFTY MIDSML 400           8497.45 116.25           1.39
#> 55 NIFTY200 QUALTY30          12428.95  75.15           0.61

# retain original column names as returned by NSE
nse_index_quote(clean_names = FALSE)
#>              skipped lastPrice change pChange
#> 1  NIFTY 50 Pre Open  15064.40 145.30    0.97
#> 2           NIFTY 50  15245.60 326.50    2.19
#> 3      NIFTY NEXT 50  35712.75 561.40    1.60
#> 4    NIFTY100 LIQ 15   3861.55  87.65    2.32
#> 5         NIFTY BANK  36368.05 948.35    2.68
#> 6          INDIA VIX     22.09  -1.52   -6.42
#> 7          NIFTY 100  15379.50 317.90    2.11
#> 8          NIFTY 500  12764.80 245.40    1.96
#> 9   NIFTY MIDCAP 100  24488.45 401.80    1.67
#> 10   NIFTY MIDCAP 50   7151.05 118.00    1.68
#> 11       NIFTY INFRA   4282.35  62.05    1.47
#> 12      NIFTY REALTY    362.45   5.35    1.50
#> 13      NIFTY ENERGY  19670.05 366.65    1.90
#> 14        NIFTY FMCG  33454.40 203.50    0.61
#> 15         NIFTY MNC  16295.45 105.00    0.65
#> 16      NIFTY PHARMA  12379.60 122.30    1.00
#> 17         NIFTY PSE   3352.15  24.35    0.73
#> 18    NIFTY PSU BANK   2454.95  75.15    3.16
#> 19 NIFTY SERV SECTOR  21555.25 514.60    2.45
#> 20          NIFTY IT  25772.65 470.80    1.86
#> 21  NIFTY SMLCAP 100   8400.75  82.50    0.99
#> 22         NIFTY 200   7963.30 160.35    2.05
#> 23        NIFTY AUTO  10673.10 -70.95   -0.66
#> 24       NIFTY MEDIA   1719.75  10.85    0.63
#> 25       NIFTY METAL   4058.60 131.00    3.34
#> 26 NIFTY DIV OPPS 50   3105.30  35.60    1.16
#> 27 NIFTY COMMODITIES   4536.55  88.75    2.00
#> 28 NIFTY CONSUMPTION   6001.95  23.50    0.39
#> 29        NIFTY CPSE   1937.90  11.65    0.60
#> 30 NIFTY FIN SERVICE  16854.40 455.80    2.78
#> 31 NIFTY GROWSECT 15   7293.85 144.35    2.02
#> 32  NIFTY50 VALUE 20   7437.55 101.35    1.38
#> 33 NIFTY50 TR 2X LEV   9485.60 397.05    4.37
#> 34 NIFTY50 PR 2X LEV   7115.30 297.85    4.37
#> 35 NIFTY50 TR 1X INV    249.05  -5.55   -2.18
#> 36 NIFTY50 PR 1X INV    287.45  -6.40   -2.18
#> 37    NIFTY ALPHA 50  22552.95 433.75    1.96
#> 38   NIFTY50 EQL WGT  16557.30 257.05    1.58
#> 39  NIFTY100 EQL WGT  17570.30 268.10    1.55
#> 40 NIFTY100 LOWVOL30  11444.25 116.70    1.03
#> 41  NIFTY MID LIQ 15   6070.50  69.20    1.15
#> 42    NIFTY PVT BANK  19425.55 519.45    2.75
#> 43 NIFTY100 QUALTY30   3395.75  32.10    0.95
#> 44   NIFTY GS 8 13YR   2207.53  -2.21   -0.10
#> 45     NIFTY GS 10YR   1997.19  -1.56   -0.08
#> 46 NIFTY GS 10YR CLN    940.94  -0.91   -0.10
#> 47    NIFTY GS 4 8YR   2361.29  -1.67   -0.07
#> 48  NIFTY GS 11 15YR   2362.94  -2.66   -0.11
#> 49 NIFTY GS 15YRPLUS   2608.85  -1.05   -0.04
#> 50 NIFTY GS COMPSITE   2253.75  -1.80   -0.08
#> 51  NIFTY MIDCAP 150   9235.70 144.70    1.59
#> 52   NIFTY SMLCAP 50   4240.40  41.90    1.00
#> 53  NIFTY SMLCAP 250   7169.15  66.30    0.93
#> 54  NIFTY MIDSML 400   8497.45 116.25    1.39
#> 55 NIFTY200 QUALTY30  12428.95  75.15    0.61
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#>        symbol series last_corp_announcement_date
#> 1   TATASTEEL     EQ                  2020-08-06
#> 2  BAJAJFINSV     EQ                  2020-03-03
#> 3    RELIANCE     EQ                  2020-07-02
#> 4  BAJFINANCE     EQ                  2020-03-03
#> 5         UPL     EQ                  2020-08-19
#> 6    HINDALCO     EQ                  2020-09-03
#> 7        HDFC     EQ                  2020-07-09
#> 8   ICICIBANK     EQ                  2019-07-22
#> 9    JSWSTEEL     EQ                  2020-07-06
#> 10    SBILIFE     EQ                  2019-04-03
#>                               last_corp_announcement open_price high_price
#> 1                         Dividend - Rs 10 Per Share     741.00     782.50
#> 2                  Interim Dividend - Rs 5 Per Share    9926.40   10444.95
#> 3                      Dividend - Rs 6.50  Per Share    2121.05    2219.90
#> 4                 Interim Dividend - Rs 10 Per Share    5364.15    5573.35
#> 5                             Dividend - Rs 6 Per Sh     595.80     616.85
#> 6   Annual General Meeting/Dividend - Re 1 Per Share     350.70     361.30
#> 7  Annual General Meeting/Dividend - Rs 21 Per Share    2608.90    2664.15
#> 8   Annual General Meeting/Dividend - Re 1 Per Share     618.00     633.75
#> 9                          Dividend - Rs 2 Per Share     415.30     435.00
#> 10                 Interim Dividend - Rs 2 Per Share     888.00     910.00
#>    low_price last_traded_price prev_close_price percent_change traded_quantity
#> 1     741.00            774.80           735.50           5.34        28842835
#> 2    9890.40          10369.30          9877.00           4.98          504122
#> 3    2107.20           2207.10          2106.00           4.80        14733134
#> 4    5340.10           5544.00          5316.30           4.28         2252413
#> 5     589.20            613.95           589.45           4.16         8740632
#> 6     350.50            358.75           345.25           3.91        20104887
#> 7    2592.15           2654.85          2564.00           3.54         5640063
#> 8     613.85            632.00           610.50           3.52        21036174
#> 9     415.30            426.80           413.30           3.27        11903775
#> 10    883.50            906.95           879.15           3.16         2127137
#>    turnover_in_lakhs
#> 1          222929.16
#> 2           51502.72
#> 3          318461.11
#> 4          122799.75
#> 5           52585.39
#> 6           71782.49
#> 7          148149.23
#> 8          131461.36
#> 9           51157.66
#> 10          19123.17

# retain original column names as returned by NSE
nse_stock_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1   TATASTEEL     EQ               2020-08-06
#> 2  BAJAJFINSV     EQ               2020-03-03
#> 3    RELIANCE     EQ               2020-07-02
#> 4  BAJFINANCE     EQ               2020-03-03
#> 5         UPL     EQ               2020-08-19
#> 6    HINDALCO     EQ               2020-09-03
#> 7        HDFC     EQ               2020-07-09
#> 8   ICICIBANK     EQ               2019-07-22
#> 9    JSWSTEEL     EQ               2020-07-06
#> 10    SBILIFE     EQ               2019-04-03
#>                                 lastCorpAnnouncement openPrice highPrice
#> 1                         Dividend - Rs 10 Per Share    741.00    782.50
#> 2                  Interim Dividend - Rs 5 Per Share   9926.40  10444.95
#> 3                      Dividend - Rs 6.50  Per Share   2121.05   2219.90
#> 4                 Interim Dividend - Rs 10 Per Share   5364.15   5573.35
#> 5                             Dividend - Rs 6 Per Sh    595.80    616.85
#> 6   Annual General Meeting/Dividend - Re 1 Per Share    350.70    361.30
#> 7  Annual General Meeting/Dividend - Rs 21 Per Share   2608.90   2664.15
#> 8   Annual General Meeting/Dividend - Re 1 Per Share    618.00    633.75
#> 9                          Dividend - Rs 2 Per Share    415.30    435.00
#> 10                 Interim Dividend - Rs 2 Per Share    888.00    910.00
#>    lowPrice      ltp previousPrice netPrice tradedQuantity turnoverInLakhs
#> 1    741.00   774.80        735.50     5.34       28842835       222929.16
#> 2   9890.40 10369.30       9877.00     4.98         504122        51502.72
#> 3   2107.20  2207.10       2106.00     4.80       14733134       318461.11
#> 4   5340.10  5544.00       5316.30     4.28        2252413       122799.75
#> 5    589.20   613.95        589.45     4.16        8740632        52585.39
#> 6    350.50   358.75        345.25     3.91       20104887        71782.49
#> 7   2592.15  2654.85       2564.00     3.54        5640063       148149.23
#> 8    613.85   632.00        610.50     3.52       21036174       131461.36
#> 9    415.30   426.80        413.30     3.27       11903775        51157.66
#> 10   883.50   906.95        879.15     3.16        2127137        19123.17
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#>         symbol                                   symbol_desc       date
#> 1      3MINDIA                              3M India Limited 2021-03-02
#> 2       AAKASH           Aakash Exploration Services Limited 2021-03-02
#> 3        AAVAS                      Aavas Financiers Limited 2021-02-11
#> 4    ABCAPITAL                  Aditya Birla Capital Limited 2021-03-01
#> 5    ABMINTLTD                     ABM International Limited 2021-03-02
#> 6      ACRYSIL                               Acrysil Limited 2021-03-02
#> 7     ADANIENT                     Adani Enterprises Limited 2021-03-02
#> 8   ADANIPORTS Adani Ports and Special Economic Zone Limited 2021-03-02
#> 9   ADANIPOWER                           Adani Power Limited 2020-12-04
#> 10  ADANITRANS                    Adani Transmission Limited 2021-02-17
#> 11    ADFFOODS                             ADF Foods Limited 2021-03-02
#> 12   AEGISCHEM                       Aegis Logistics Limited 2021-03-02
#> 13       AFFLE                         Affle (India) Limited 2021-03-02
#> 14      AHLADA                      Ahlada Engineers Limited 2021-03-02
#> 15      ALICON                      Alicon Castalloy Limited 2021-03-02
#> 16       AMBER               Amber Enterprises India Limited 2021-02-12
#> 17    ANANTRAJ                             Anant Raj Limited 2021-03-02
#> 18   APLAPOLLO                      APL Apollo Tubes Limited 2021-03-02
#> 19     ARSHIYA                               Arshiya Limited 2021-03-02
#> 20  ASAHIINDIA                     Asahi India Glass Limited 2021-02-22
#> 21     ASHIANA                       Ashiana Housing Limited 2021-03-02
#> 22   ASHIMASYN                                Ashima Limited 2021-03-02
#> 23  ASTRAMICRO              Astra Microwave Products Limited 2020-08-28
#> 24        ATGL                       Adani Total Gas Limited 2021-03-02
#> 25      AUBANK                 AU Small Finance Bank Limited 2020-03-02
#> 26  BALRAMCHIN                 Balrampur Chini Mills Limited 2021-03-02
#> 27        BASF                            BASF India Limited 2021-03-02
#> 28         BEL                    Bharat Electronics Limited 2021-03-02
#> 29        BEML                                  BEML Limited 2021-03-02
#> 30   BHAGYANGR                     Bhagyanagar India Limited 2021-03-02
#> 31        BHEL              Bharat Heavy Electricals Limited 2021-03-02
#> 32   BODALCHEM                       Bodal Chemicals Limited 2021-03-02
#> 33   BOMDYEING           Bombay Dyeing & Mfg Company Limited 2021-01-07
#> 34  CENTURYPLY             Century Plyboards (India) Limited 2021-03-02
#> 35  CENTURYTEX         Century Textiles & Industries Limited 2020-03-02
#> 36     CGPOWER     CG Power and Industrial Solutions Limited 2021-02-24
#> 37  CNOVAPETRO               CIL Nova Petrochemicals Limited 2021-03-02
#> 38  COSMOFILMS                           Cosmo Films Limited 2021-03-02
#> 39     CPSEETF                                      CPSE ETF 2021-03-02
#> 40    CUBEXTUB                         Cubex Tubings Limited 2021-03-02
#> 41  CUMMINSIND                         Cummins India Limited 2021-03-02
#> 42  CYBERMEDIA                   Cyber Media (India) Limited 2021-03-02
#> 43   DALMIASUG    Dalmia Bharat Sugar and Industries Limited 2021-03-02
#> 44    DBREALTY                            D B Realty Limited 2021-03-02
#> 45  DCMSHRIRAM                           DCM Shriram Limited 2021-01-25
#> 46         DCW                                   DCW Limited 2021-03-02
#> 47    DECCANCE                        Deccan Cements Limited 2021-02-18
#> 48  DHAMPURSUG                   Dhampur Sugar Mills Limited 2021-03-02
#> 49   DIGISPICE                DiGiSPICE Technologies Limited 2021-03-02
#> 50         DLF                                   DLF Limited 2021-02-16
#> 51    DWARKESH            Dwarikesh Sugar Industries Limited 2020-12-16
#> 52      DYNPRO                      Dynemic Products Limited 2021-03-01
#> 53   ELECTCAST                 Electrosteel Castings Limited 2021-03-02
#> 54  ENGINERSIN                       Engineers India Limited 2021-03-02
#> 55   EROSMEDIA              Eros International Media Limited 2021-03-02
#> 56  FAIRCHEMOR                     Fairchem Organics Limited 2021-01-08
#> 57  FEDERALBNK                     The Federal Bank  Limited 2021-02-17
#> 58     FILATEX                         Filatex India Limited 2021-01-07
#> 59     GANECOS                     Ganesha Ecosphere Limited 2021-03-02
#> 60  GANESHHOUC            Ganesh Housing Corporation Limited 2021-03-02
#> 61     GENESYS     Genesys International Corporation Limited 2021-03-02
#> 62  GENUSPOWER           Genus Power Infrastructures Limited 2021-03-02
#> 63      GESHIP    The Great Eastern Shipping Company Limited 2021-03-02
#> 64        GHCL                                  GHCL Limited 2021-03-02
#> 65      GOENKA             Goenka Diamond and Jewels Limited 2021-03-02
#> 66        GPPL                  Gujarat Pipavav Port Limited 2021-03-02
#> 67      GRASIM                     Grasim Industries Limited 2021-03-02
#> 68   GRINDWELL                      Grindwell Norton Limited 2021-03-02
#> 69        GSPL                Gujarat State Petronet Limited 2021-02-18
#> 70        HBSL                      HB Stockholdings Limited 2021-03-02
#> 71         HEG                                   HEG Limited 2021-02-17
#> 72  HEXATRADEX                           Hexa Tradex Limited 2021-03-02
#> 73    HINDALCO                   Hindalco Industries Limited 2021-02-25
#> 74  HISARMETAL                Hisar Metal Industries Limited 2021-03-02
#> 75     HLEGLAS                          HLE Glascoat Limited 2021-03-02
#> 76   IBREALEST                Indiabulls Real Estate Limited 2021-03-02
#> 77    ICICIB22  ICICI Prudential Mutual Fund - BHARAT 22 ETF 2021-03-01
#> 78  IDFCFIRSTB                       IDFC First Bank Limited 2021-02-19
#> 79        IFCI                                  IFCI Limited 2020-12-11
#> 80        IIFL                          IIFL Finance Limited 2021-03-02
#> 81    IMAGICAA           Imagicaaworld Entertainment Limited 2021-03-02
#> 82  INDIAGLYCO                         India Glycols Limited 2021-03-02
#> 83      INDIGO                   InterGlobe Aviation Limited 2020-12-08
#> 84   INVENTURE         Inventure Growth & Securities Limited 2020-12-14
#> 85      ITDCEM                 ITD Cementation India Limited 2021-03-01
#> 86   JAIBALAJI                 Jai Balaji Industries Limited 2021-03-02
#> 87  JAYNECOIND              Jayaswal Neco Industries Limited 2021-03-02
#> 88  JINDALPOLY                     Jindal Poly Films Limited 2021-02-11
#> 89  JINDALSTEL                  Jindal Steel & Power Limited 2021-03-01
#> 90   JKLAKSHMI                     JK Lakshmi Cement Limited 2021-03-02
#> 91     JKPAPER                              JK Paper Limited 2021-03-02
#> 92  JPASSOCIAT                 Jaiprakash Associates Limited 2021-03-02
#> 93   JSWENERGY                            JSW Energy Limited 2021-03-02
#> 94    JSWSTEEL                             JSW Steel Limited 2021-02-24
#> 95    JUSTDIAL                             Just Dial Limited 2021-03-02
#> 96  KALPATPOWR          Kalpataru Power Transmission Limited 2021-02-25
#> 97  KALYANIFRG                         Kalyani Forge Limited 2021-03-02
#> 98  KANORICHEM        Kanoria Chemicals & Industries Limited 2021-02-23
#> 99         KCP                                   KCP Limited 2021-03-02
#> 100        KEC                     KEC International Limited 2021-03-02
#> 101     KHADIM                          Khadim India Limited 2021-03-02
#> 102      KIOCL                                 KIOCL Limited 2021-03-02
#> 103    KIRLFER              Kirloskar Ferrous Industries Ltd 2021-03-02
#> 104 KIRLOSBROS                    Kirloskar Brothers Limited 2021-02-08
#> 105  KIRLOSENG                 Kirloskar Oil Engines Limited 2021-02-16
#> 106      L&TFH                  L&T Finance Holdings Limited 2021-03-02
#> 107   LIKHITHA               Likhitha Infrastructure Limited 2021-02-16
#> 108 LINDEINDIA                           Linde India Limited 2021-03-02
#> 109       LTTS               L&T Technology Services Limited 2021-03-02
#> 110   LUMAXIND                      Lumax Industries Limited 2020-08-24
#> 111   MADHUCON                     Madhucon Projects Limited 2021-03-02
#> 112      MAGMA                         Magma Fincorp Limited 2021-03-02
#> 113    MENONBE                        Menon Bearings Limited 2021-03-02
#> 114 MIRCELECTR                      MIRC Electronics Limited 2021-02-15
#> 115 MODIRUBBER                           Modi Rubber Limited 2021-03-02
#> 116 MOTHERSUMI                Motherson Sumi Systems Limited 2021-03-02
#> 117     MPSLTD                                   MPS Limited 2021-03-02
#> 118       MTNL             Mahanagar Telephone Nigam Limited 2020-12-21
#> 119 NAHARSPING                  Nahar Spinning Mills Limited 2021-03-02
#> 120 NATIONALUM            National Aluminium Company Limited 2021-02-26
#> 121     NCLIND                        NCL Industries Limited 2021-03-02
#> 122     NEOGEN                      Neogen Chemicals Limited 2021-02-17
#> 123 NETFMID150             NIPPON INDIA ETF NIFTY MIDCAP 150 2021-03-02
#> 124       NMDC                                  NMDC Limited 2021-03-02
#> 125      NOCIL                                 NOCIL Limited 2021-02-19
#> 126      NRAIL                N R Agarwal Industries Limited 2021-03-02
#> 127       NTPC                                  NTPC Limited 2021-03-02
#> 128   OPTIEMUS                     Optiemus Infracom Limited 2021-03-02
#> 129 ORCHPHARMA                         Orchid Pharma Limited 2021-03-02
#> 130  ORIENTCEM                         Orient Cement Limited 2021-02-16
#> 131  ORIENTPPR             Orient Paper & Industries Limited 2021-03-02
#> 132       PAEL                                   PAE Limited 2021-03-02
#> 133  PALREDTEC                   Palred Technologies Limited 2021-03-02
#> 134  PARSVNATH                  Parsvnath Developers Limited 2021-03-02
#> 135 PDMJEPAPER               Pudumjee Paper Products Limited 2021-03-02
#> 136        PEL                   Piramal Enterprises Limited 2021-02-25
#> 137     PFOCUS                           Prime Focus Limited 2021-02-26
#> 138       PGEL                       PG Electroplast Limited 2021-03-02
#> 139    PRABHAT                         Prabhat Dairy Limited 2021-03-02
#> 140    PRAKASH                    Prakash Industries Limited 2021-01-05
#> 141     PRECOT                                Precot Limited 2021-02-10
#> 142        PTC                             PTC India Limited 2021-02-25
#> 143     RADICO                        Radico Khaitan Limited 2021-03-02
#> 144    RAILTEL          Railtel Corporation Of India Limited 2021-03-02
#> 145     RAJMET                      Rajnandini Metal Limited 2021-03-02
#> 146 RAJSREESUG           Rajshree Sugars & Chemicals Limited 2020-04-08
#> 147   RAMANEWS                  Shree Rama Newsprint Limited 2020-06-30
#> 148   RAMCOCEM                     The Ramco Cements Limited 2021-02-26
#> 149      RAMKY                  Ramky Infrastructure Limited 2021-03-02
#> 150    RANASUG                           Rana Sugars Limited 2020-08-13
#> 151  RATNAMANI              Ratnamani Metals & Tubes Limited 2021-03-02
#> 152   RPPINFRA                 R.P.P. Infra Projects Limited 2021-03-02
#> 153    RUCHIRA                        Ruchira Papers Limited 2020-12-08
#> 154     RUSHIL                          Rushil Decor Limited 2021-01-08
#> 155     SAFARI             Safari Industries (India) Limited 2021-03-02
#> 156   SAREGAMA                        Saregama India Limited 2021-03-02
#> 157        SCI         Shipping Corporation Of India Limited 2021-03-02
#> 158      SETCO                      Setco Automotive Limited 2021-03-02
#> 159      SEZAL                           Sezal Glass Limited 2021-01-12
#> 160 SHAREINDIA                Share India Securities Limited 2021-02-18
#> 161 SHIVAMILLS                           Shiva Mills Limited 2021-03-02
#> 162  SHREERAMA                 Shree Rama Multi-Tech Limited 2020-09-16
#> 163   SHYAMTEL                         Shyam Telecom Limited 2021-03-02
#> 164    SIEMENS                               Siemens Limited 2021-02-25
#> 165        SIL                   Standard Industries Limited 2021-03-02
#> 166      SILGO                          Silgo Retail Limited       <NA>
#> 167 SRHHYPOLTD     Sree Rayalaseema Hi-Strength Hypo Limited 2021-03-02
#> 168  STARPAPER                      Star Paper Mills Limited 2021-03-02
#> 169    STLTECH                 Sterlite Technologies Limited 2021-03-02
#> 170 STOVEKRAFT                           Stove Kraft Limited 2021-02-12
#> 171 SUDARSCHEM         Sudarshan Chemical Industries Limited 2021-03-01
#> 172 SUNDARMFIN                      Sundaram Finance Limited 2021-02-26
#> 173   SUPPETRO                     Supreme Petrochem Limited 2021-01-22
#> 174   SYMPHONY                              Symphony Limited 2021-03-02
#> 175      TANLA                       Tanla Platforms Limited 2021-02-24
#> 176   TATACHEM                        Tata Chemicals Limited 2021-02-26
#> 177   TATACOMM                   Tata Communications Limited 2021-03-02
#> 178 TATAINVEST           Tata Investment Corporation Limited 2021-03-02
#> 179 TATAMOTORS                           Tata Motors Limited 2021-03-02
#> 180 TATAMTRDVR                           Tata Motors Limited 2021-03-02
#> 181  TATAPOWER                    Tata Power Company Limited 2021-03-02
#> 182  TATASTEEL                            Tata Steel Limited 2021-02-25
#> 183 TATASTLBSL                        Tata Steel Bsl Limited 2021-02-25
#> 184    TECHNOE Techno Electric & Engineering Company Limited 2021-02-25
#> 185 THIRUSUGAR                  Thiru Arooran Sugars Limited 2021-03-02
#> 186    TIINDIA             Tube Investments of India Limited 2021-03-02
#> 187 TIMETECHNO                      Time Technoplast Limited 2021-03-02
#> 188 TORNTPOWER                         Torrent Power Limited 2021-02-25
#> 189      TRENT                                 Trent Limited 2021-03-02
#> 190    TRIVENI      Triveni Engineering & Industries Limited 2021-03-02
#> 191   UCALFUEL                     Ucal Fuel Systems Limited 2021-02-19
#> 192 UNICHEMLAB                  Unichem Laboratories Limited 2021-03-02
#> 193        UPL                                   UPL Limited 2021-03-02
#> 194     UTIAMC          UTI Asset Management Company Limited 2021-02-25
#> 195 VADILALIND                    Vadilal Industries Limited 2021-02-24
#> 196 VAIBHAVGBL                        Vaibhav Global Limited 2021-03-02
#> 197    VASWANI                    Vaswani Industries Limited 2021-03-02
#> 198       VEDL                               Vedanta Limited 2021-03-02
#> 199     VERTOZ                    Vertoz Advertising Limited 2021-03-02
#> 200        VHL                     Vardhman Holdings Limited 2021-03-02
#> 201   VIPULLTD                                 Vipul Limited 2021-03-02
#> 202    WANBURY                               Wanbury Limited 2021-03-02
#> 203     WELENT                   Welspun Enterprises Limited 2021-02-08
#> 204 WSTCSTPAPR                West Coast Paper Mills Limited 2021-03-02
#> 205  XPROINDIA                            Xpro India Limited 2021-03-02
#>     new_high     year last_traded_price prev_high prev_close change
#> 1   26000.00 26000.00          26000.00  25199.90   25068.65 931.35
#> 2     127.90   127.90            127.90    127.90     127.90   0.00
#> 3    2424.90  2424.90           2275.00   2380.40    2258.80  16.20
#> 4     130.90   130.90            129.20    130.70     126.75   2.45
#> 5      80.15    80.15             80.15     76.35      76.35   3.80
#> 6     350.00   350.00            331.95    338.55     338.55  -6.60
#> 7     944.90   944.90            916.00    876.50     872.55  43.45
#> 8     754.95   754.95            733.25    724.70     720.50  12.75
#> 9      66.65    66.65             64.85     63.95      61.30   3.55
#> 10    852.55   852.55            829.00    820.00     781.05  47.95
#> 11    894.70   894.70            875.00    880.65     874.80   0.20
#> 12    331.65   331.65            325.00    329.65     323.60   1.40
#> 13   5898.90  5898.90           5735.00   5618.00    5618.00 117.00
#> 14     96.30    96.30             96.30     91.75      91.75   4.55
#> 15    490.65   490.65            462.00    476.30     462.90  -0.90
#> 16   3391.40  3391.40           3295.00   3315.00    3207.35  87.65
#> 17     54.10    54.10             54.10     53.80      51.55   2.55
#> 18   1250.00  1250.00           1244.00   1167.00    1157.40  86.60
#> 19     39.70    39.70             39.70     37.85      37.85   1.85
#> 20    321.10   321.10            320.05    304.75     294.35  25.70
#> 21    121.90   121.90            116.50    121.00     119.90  -3.40
#> 22     17.65    17.65             15.45     16.60      16.05  -0.60
#> 23    142.30   142.30            136.05    134.90     121.55  14.50
#> 24    689.15   689.15            649.80    584.45     574.30  75.50
#> 25   1225.00  1225.00           1215.00   1218.00    1151.50  63.50
#> 26    198.15   198.15            193.00    193.30     189.10   3.90
#> 27   2244.95  2244.95           2220.00   2195.10    2105.05 114.95
#> 28    154.00   154.00            152.70    153.55     151.50   1.20
#> 29   1249.55  1249.55           1181.00   1245.00    1227.75 -46.75
#> 30     52.75    52.75             48.55     51.10      51.10  -2.55
#> 31     52.65    52.65             50.95     52.20      51.75  -0.80
#> 32     94.50    94.50             88.70     92.55      91.45  -2.75
#> 33     88.20    88.20             84.70     85.30      80.00   4.70
#> 34    328.00   328.00            319.80    324.00     314.90   4.90
#> 35    549.75   549.75            536.80    541.75     519.70  17.10
#> 36     60.35    60.35             59.95     58.40      57.50   2.45
#> 37     16.20    16.20             16.20     15.45      15.45   0.75
#> 38    624.00   624.00            620.10    594.00     585.65  34.45
#> 39     24.55    24.55             24.29     24.52      24.25   0.04
#> 40     25.05    25.05             22.75     23.90      23.90  -1.15
#> 41    882.95   882.95            869.80    826.85     818.45  51.35
#> 42     16.85    16.85             16.85     16.05      16.05   0.80
#> 43    178.00   178.00            173.80    173.70     171.35   2.45
#> 44     31.35    31.35             29.45     31.00      31.00  -1.55
#> 45    542.00   542.00            522.00    515.55     496.15  25.85
#> 46     30.75    30.75             29.65     30.75      29.35   0.30
#> 47    433.00   433.00            421.80    432.50     422.80  -1.00
#> 48    195.00   195.00            192.30    189.50     185.20   7.10
#> 49    114.70   114.70            103.80    109.25     109.25  -5.45
#> 50    328.60   328.60            324.20    328.20     313.60  10.60
#> 51     35.75    35.75             35.20     35.40      32.00   3.20
#> 52    498.00   498.00            484.70    470.00     451.15  33.55
#> 53     27.70    27.70             26.80     27.00      26.70   0.10
#> 54     93.30    93.30             89.00     91.30      87.10   1.90
#> 55     33.30    33.30             32.80     31.60      31.60   1.20
#> 56    725.00   725.00            690.00    694.00     650.70  39.30
#> 57     88.50    88.50             88.45     88.20      83.30   5.15
#> 58     73.50    73.50             72.00     72.00      67.95   4.05
#> 59    688.50   688.50            657.20    635.90     617.30  39.90
#> 60     62.00    62.00             57.55     61.70      60.55  -3.00
#> 61     91.95    91.95             91.95     88.10      87.70   4.25
#> 62     46.70    46.70             44.80     44.85      44.75   0.05
#> 63    339.95   339.95            326.90    339.50     334.25  -7.35
#> 64    254.70   254.70            245.10    235.95     232.70  12.40
#> 65      2.10     2.10              2.10      2.00       2.00   0.10
#> 66    117.90   117.90            108.00    114.40     109.00  -1.00
#> 67   1343.00  1343.00           1316.00   1298.50    1294.75  21.25
#> 68    972.00   972.00            957.00    933.75     912.95  44.05
#> 69    311.45   311.45            275.30    276.70     259.55  15.75
#> 70     16.35    16.35             16.35     15.60      15.60   0.75
#> 71   1644.00  1644.00           1558.00   1593.00    1427.50 130.50
#> 72     74.80    74.80             72.00     74.65      74.35  -2.35
#> 73    361.30   361.30            358.75    354.60     345.25  13.50
#> 74    143.65   143.65            129.50    124.30     124.05   5.45
#> 75   2430.75  2430.75           2390.05   2269.65    2209.80 180.25
#> 76    107.75   107.75            104.80    102.50      99.80   5.00
#> 77     38.85    38.85             38.55     38.50      38.09   0.46
#> 78     68.15    68.15             67.10     66.80      64.50   2.60
#> 79     12.80    12.80             12.80     11.50      10.70   2.10
#> 80    299.00   299.00            292.80    289.40     284.80   8.00
#> 81      7.95     7.95              7.95      7.45       7.25   0.70
#> 82    539.00   539.00            527.80    528.80     517.25  10.55
#> 83   1823.85  1823.85           1783.00   1787.00    1691.40  91.60
#> 84     26.95    26.95             23.15     25.45      24.75  -1.60
#> 85     88.80    88.80             85.30     83.00      79.85   5.45
#> 86     32.65    32.65             32.65     31.10      31.10   1.55
#> 87      9.25     9.25              9.25      8.85       8.85   0.40
#> 88    615.40   615.40            612.00    571.95     540.45  71.55
#> 89    354.80   354.80            349.20    348.70     338.30  10.90
#> 90    439.90   439.90            421.00    439.30     431.20 -10.20
#> 91    167.75   167.75            161.00    161.90     160.00   1.00
#> 92      9.70     9.70              8.80      9.25       9.25  -0.45
#> 93     92.40    92.40             83.80     88.50      86.20  -2.40
#> 94    435.00   435.00            426.80    426.60     413.30  13.50
#> 95   1047.70  1047.70            906.00    972.10     965.45 -59.45
#> 96    406.85   406.85            398.70    395.75     391.30   7.40
#> 97    202.50   202.50            201.25    199.55     192.90   8.35
#> 98     88.55    88.55             88.05     88.35      84.35   3.70
#> 99     85.10    85.10             83.10     83.55      78.90   4.20
#> 100   486.00   486.00            459.30    473.40     463.05  -3.75
#> 101   185.90   185.90            177.70    182.00     180.05  -2.35
#> 102   190.65   190.65            174.40    183.55     183.55  -9.15
#> 103   174.40   174.40            167.80    174.15     169.50  -1.70
#> 104   198.70   198.70            198.70    175.00     165.60  33.10
#> 105   175.90   175.90            173.05    173.90     162.30  10.75
#> 106   113.40   113.40            113.10    109.40     107.00   6.10
#> 107   306.60   306.60            303.00    298.00     279.80  23.20
#> 108  1835.65  1835.65           1785.00   1795.00    1721.65  63.35
#> 109  2807.60  2807.60           2695.00   2760.40    2729.80 -34.80
#> 110  1783.40  1783.40           1701.00   1674.90    1636.15  64.85
#> 111     7.60     7.60              6.90      7.25       7.25  -0.35
#> 112   129.75   129.75            127.60    127.65     123.60   4.00
#> 113    64.70    64.70             63.10     64.40      63.15  -0.05
#> 114    15.45    15.45             15.00     15.05      14.75   0.25
#> 115   177.85   177.85            177.85    169.40     169.40   8.45
#> 116   238.20   238.20            232.70    235.60     232.60   0.10
#> 117   524.80   524.80            517.95    498.95     492.60  25.35
#> 118    16.80    16.80             16.80     15.50      14.00   2.80
#> 119    99.60    99.60             91.30     95.25      95.25  -3.95
#> 120    64.00    64.00             62.00     61.25      59.15   2.85
#> 121   183.00   183.00            177.00    182.80     178.80  -1.80
#> 122   938.00   938.00            889.00    930.00     822.70  66.30
#> 123    93.50    93.50             92.86     92.06      91.81   1.05
#> 124   137.45   137.45            136.45    134.85     133.85   2.60
#> 125   193.70   193.70            190.70    183.70     180.70  10.00
#> 126   282.85   282.85            271.60    266.00     261.80   9.80
#> 127   114.70   114.70            112.80    113.70     112.55   0.25
#> 128   198.65   198.65            198.65    189.20     189.20   9.45
#> 129  1000.70  1000.70           1000.70    953.05     953.05  47.65
#> 130   100.50   100.50            100.00     99.50      96.30   3.70
#> 131    30.70    30.70             28.10     29.50      29.10  -1.00
#> 132     3.90     3.90              3.90      3.75       3.75   0.15
#> 133   123.20   123.20            111.50    117.35     117.35  -5.85
#> 134     8.65     8.65              8.50      8.25       8.25   0.25
#> 135    28.15    28.15             26.90     27.95      27.10  -0.20
#> 136  2007.70  2007.70           1989.80   1964.00    1918.70  71.10
#> 137    69.00    69.00             69.00     66.90      57.50  11.50
#> 138   349.70   349.70            349.70    333.05     333.05  16.65
#> 139    83.70    83.70             79.00     82.40      79.90  -0.90
#> 140    65.50    65.50             60.75     65.45      63.05  -2.30
#> 141    99.10    99.10             99.10     96.70      94.40   4.70
#> 142    80.70    80.70             78.65     78.25      76.05   2.60
#> 143   627.80   627.80            603.00    618.00     614.10 -11.10
#> 144   189.70   189.70            164.60    174.70     174.70 -10.10
#> 145    90.80    90.80             90.80     86.50      86.50   4.30
#> 146    20.25    20.25             20.25     19.65      16.90   3.35
#> 147    18.30    18.30             16.35     17.50      15.25   1.10
#> 148  1021.00  1021.00           1013.20   1013.60     994.05  19.15
#> 149    88.85    88.85             88.85     84.65      84.65   4.20
#> 150     9.05     9.05              9.05      8.50       7.55   1.50
#> 151  2020.00  2020.00           1969.95   2002.60    1981.55 -11.60
#> 152    83.20    83.20             77.70     77.25      74.05   3.65
#> 153    74.70    74.70             71.75     74.30      72.05  -0.30
#> 154   205.10   205.10            205.10    200.00     195.35   9.75
#> 155   685.00   685.00            682.00    684.00     668.70  13.30
#> 156  1271.95  1271.95           1203.80   1124.95    1107.15  96.65
#> 157   134.00   134.00            122.95    124.50     124.50  -1.55
#> 158    18.00    18.00             17.10     17.80      17.35  -0.25
#> 159     5.60     5.60              5.60      5.55       5.35   0.25
#> 160   261.70   261.70            255.00    240.30     230.95  24.05
#> 161    47.10    47.10             47.10     45.00      44.90   2.20
#> 162     9.95     9.95              9.95      9.95       8.30   1.65
#> 163    11.35    11.35             11.35     10.85      10.85   0.50
#> 164  1960.00  1960.00           1920.50   1949.00    1939.65 -19.15
#> 165    14.70    14.70             14.70     14.00      14.00   0.70
#> 166    53.80    53.80             53.80        NA      44.85   8.95
#> 167   303.00   303.00            294.00    286.35     275.75  18.25
#> 168   132.70   132.70            125.25    130.00     128.30  -3.05
#> 169   225.85   225.85            222.30    224.00     220.65   1.65
#> 170   547.85   547.85            513.25    545.45     504.15   9.10
#> 171   600.00   600.00            572.90    589.90     574.70  -1.80
#> 172  2825.00  2825.00           2748.50   2739.95    2618.20 130.30
#> 173   435.00   435.00            425.05    435.00     421.40   3.65
#> 174  1528.80  1528.80           1371.70   1446.40    1446.40 -74.70
#> 175  1030.00  1030.00            998.80    999.50     988.45  10.35
#> 176   782.00   782.00            774.00    757.50     733.65  40.35
#> 177  1342.15  1342.15           1236.00   1333.95    1202.95  33.05
#> 178  1163.85  1163.85           1149.00   1155.00    1146.70   2.30
#> 179   357.00   357.00            347.10    347.20     345.75   1.35
#> 180   145.00   145.00            141.55    140.60     139.90   1.65
#> 181   105.50   105.50            105.25    100.80     100.35   4.90
#> 182   782.50   782.50            774.80    753.00     735.50  39.30
#> 183    50.80    50.80             49.90     48.30      47.30   2.60
#> 184   327.85   327.85            319.85    326.40     312.00   7.85
#> 185     7.80     7.80              7.75      7.50       7.45   0.30
#> 186  1152.00  1152.00           1146.00   1098.00    1090.10  55.90
#> 187    62.20    62.20             59.35     61.50      59.15   0.20
#> 188   409.00   409.00            405.00    395.75     388.95  16.05
#> 189   923.00   923.00            912.00    921.55     905.90   6.10
#> 190    96.00    96.00             94.15     92.40      90.20   3.95
#> 191   173.75   173.75            167.15    164.00     156.25  10.90
#> 192   339.90   339.90            334.10    339.70     337.35  -3.25
#> 193   616.85   616.85            613.95    608.80     589.45  24.50
#> 194   610.00   610.00            605.30    602.65     581.55  23.75
#> 195   925.00   925.00            908.00    905.00     889.50  18.50
#> 196  3884.50  3884.50           3752.00   3745.50    3691.95  60.05
#> 197    12.40    12.40             11.35     11.90      11.90  -0.55
#> 198   221.70   221.70            219.00    217.95     214.75   4.25
#> 199   306.00   306.00            296.50    290.00     283.05  13.45
#> 200  2169.75  2169.75           1956.55   1976.40    1976.40 -19.85
#> 201    33.20    33.20             33.20     31.65      31.65   1.55
#> 202   113.90   113.90            103.10    108.50     108.50  -5.40
#> 203    97.05    97.05             96.95     95.95      87.65   9.30
#> 204   277.00   277.00            263.00    254.30     250.80  12.20
#> 205    61.90    61.90             56.95     60.60      59.90  -2.95
#>     percent_change
#> 1             3.72
#> 2             0.00
#> 3             0.72
#> 4             1.93
#> 5             4.98
#> 6            -1.95
#> 7             4.98
#> 8             1.77
#> 9             5.79
#> 10            6.14
#> 11            0.02
#> 12            0.43
#> 13            2.08
#> 14            4.96
#> 15           -0.19
#> 16            2.73
#> 17            4.95
#> 18            7.48
#> 19            4.89
#> 20            8.73
#> 21           -2.84
#> 22           -3.74
#> 23           11.93
#> 24           13.15
#> 25            5.51
#> 26            2.06
#> 27            5.46
#> 28            0.79
#> 29           -3.81
#> 30           -4.99
#> 31           -1.55
#> 32           -3.01
#> 33            5.88
#> 34            1.56
#> 35            3.29
#> 36            4.26
#> 37            4.85
#> 38            5.88
#> 39            0.16
#> 40           -4.81
#> 41            6.27
#> 42            4.98
#> 43            1.43
#> 44           -5.00
#> 45            5.21
#> 46            1.02
#> 47           -0.24
#> 48            3.83
#> 49           -4.99
#> 50            3.38
#> 51           10.00
#> 52            7.44
#> 53            0.37
#> 54            2.18
#> 55            3.80
#> 56            6.04
#> 57            6.18
#> 58            5.96
#> 59            6.46
#> 60           -4.95
#> 61            4.85
#> 62            0.11
#> 63           -2.20
#> 64            5.33
#> 65            5.00
#> 66           -0.92
#> 67            1.64
#> 68            4.83
#> 69            6.07
#> 70            4.81
#> 71            9.14
#> 72           -3.16
#> 73            3.91
#> 74            4.39
#> 75            8.16
#> 76            5.01
#> 77            1.21
#> 78            4.03
#> 79           19.63
#> 80            2.81
#> 81            9.66
#> 82            2.04
#> 83            5.42
#> 84           -6.46
#> 85            6.83
#> 86            4.98
#> 87            4.52
#> 88           13.24
#> 89            3.22
#> 90           -2.37
#> 91            0.63
#> 92           -4.86
#> 93           -2.78
#> 94            3.27
#> 95           -6.16
#> 96            1.89
#> 97            4.33
#> 98            4.39
#> 99            5.32
#> 100          -0.81
#> 101          -1.31
#> 102          -4.99
#> 103          -1.00
#> 104          19.99
#> 105           6.62
#> 106           5.70
#> 107           8.29
#> 108           3.68
#> 109          -1.27
#> 110           3.96
#> 111          -4.83
#> 112           3.24
#> 113          -0.08
#> 114           1.69
#> 115           4.99
#> 116           0.04
#> 117           5.15
#> 118          20.00
#> 119          -4.15
#> 120           4.82
#> 121          -1.01
#> 122           8.06
#> 123           1.14
#> 124           1.94
#> 125           5.53
#> 126           3.74
#> 127           0.22
#> 128           4.99
#> 129           5.00
#> 130           3.84
#> 131          -3.44
#> 132           4.00
#> 133          -4.99
#> 134           3.03
#> 135          -0.74
#> 136           3.71
#> 137          20.00
#> 138           5.00
#> 139          -1.13
#> 140          -3.65
#> 141           4.98
#> 142           3.42
#> 143          -1.81
#> 144          -5.78
#> 145           4.97
#> 146          19.82
#> 147           7.21
#> 148           1.93
#> 149           4.96
#> 150          19.87
#> 151          -0.59
#> 152           4.93
#> 153          -0.42
#> 154           4.99
#> 155           1.99
#> 156           8.73
#> 157          -1.24
#> 158          -1.44
#> 159           4.67
#> 160          10.41
#> 161           4.90
#> 162          19.88
#> 163           4.61
#> 164          -0.99
#> 165           5.00
#> 166          19.96
#> 167           6.62
#> 168          -2.38
#> 169           0.75
#> 170           1.81
#> 171          -0.31
#> 172           4.98
#> 173           0.87
#> 174          -5.16
#> 175           1.05
#> 176           5.50
#> 177           2.75
#> 178           0.20
#> 179           0.39
#> 180           1.18
#> 181           4.88
#> 182           5.34
#> 183           5.50
#> 184           2.52
#> 185           4.03
#> 186           5.13
#> 187           0.34
#> 188           4.13
#> 189           0.67
#> 190           4.38
#> 191           6.98
#> 192          -0.96
#> 193           4.16
#> 194           4.08
#> 195           2.08
#> 196           1.63
#> 197          -4.62
#> 198           1.98
#> 199           4.75
#> 200          -1.00
#> 201           4.90
#> 202          -4.98
#> 203          10.61
#> 204           4.86
#> 205          -4.92

# retain original column names as returned by NSE
nse_stock_year_high(clean_names = FALSE)
#>         symbol                                    symbolDesc         dt
#> 1      3MINDIA                              3M India Limited 2021-03-02
#> 2       AAKASH           Aakash Exploration Services Limited 2021-03-02
#> 3        AAVAS                      Aavas Financiers Limited 2021-02-11
#> 4    ABCAPITAL                  Aditya Birla Capital Limited 2021-03-01
#> 5    ABMINTLTD                     ABM International Limited 2021-03-02
#> 6      ACRYSIL                               Acrysil Limited 2021-03-02
#> 7     ADANIENT                     Adani Enterprises Limited 2021-03-02
#> 8   ADANIPORTS Adani Ports and Special Economic Zone Limited 2021-03-02
#> 9   ADANIPOWER                           Adani Power Limited 2020-12-04
#> 10  ADANITRANS                    Adani Transmission Limited 2021-02-17
#> 11    ADFFOODS                             ADF Foods Limited 2021-03-02
#> 12   AEGISCHEM                       Aegis Logistics Limited 2021-03-02
#> 13       AFFLE                         Affle (India) Limited 2021-03-02
#> 14      AHLADA                      Ahlada Engineers Limited 2021-03-02
#> 15      ALICON                      Alicon Castalloy Limited 2021-03-02
#> 16       AMBER               Amber Enterprises India Limited 2021-02-12
#> 17    ANANTRAJ                             Anant Raj Limited 2021-03-02
#> 18   APLAPOLLO                      APL Apollo Tubes Limited 2021-03-02
#> 19     ARSHIYA                               Arshiya Limited 2021-03-02
#> 20  ASAHIINDIA                     Asahi India Glass Limited 2021-02-22
#> 21     ASHIANA                       Ashiana Housing Limited 2021-03-02
#> 22   ASHIMASYN                                Ashima Limited 2021-03-02
#> 23  ASTRAMICRO              Astra Microwave Products Limited 2020-08-28
#> 24        ATGL                       Adani Total Gas Limited 2021-03-02
#> 25      AUBANK                 AU Small Finance Bank Limited 2020-03-02
#> 26  BALRAMCHIN                 Balrampur Chini Mills Limited 2021-03-02
#> 27        BASF                            BASF India Limited 2021-03-02
#> 28         BEL                    Bharat Electronics Limited 2021-03-02
#> 29        BEML                                  BEML Limited 2021-03-02
#> 30   BHAGYANGR                     Bhagyanagar India Limited 2021-03-02
#> 31        BHEL              Bharat Heavy Electricals Limited 2021-03-02
#> 32   BODALCHEM                       Bodal Chemicals Limited 2021-03-02
#> 33   BOMDYEING           Bombay Dyeing & Mfg Company Limited 2021-01-07
#> 34  CENTURYPLY             Century Plyboards (India) Limited 2021-03-02
#> 35  CENTURYTEX         Century Textiles & Industries Limited 2020-03-02
#> 36     CGPOWER     CG Power and Industrial Solutions Limited 2021-02-24
#> 37  CNOVAPETRO               CIL Nova Petrochemicals Limited 2021-03-02
#> 38  COSMOFILMS                           Cosmo Films Limited 2021-03-02
#> 39     CPSEETF                                      CPSE ETF 2021-03-02
#> 40    CUBEXTUB                         Cubex Tubings Limited 2021-03-02
#> 41  CUMMINSIND                         Cummins India Limited 2021-03-02
#> 42  CYBERMEDIA                   Cyber Media (India) Limited 2021-03-02
#> 43   DALMIASUG    Dalmia Bharat Sugar and Industries Limited 2021-03-02
#> 44    DBREALTY                            D B Realty Limited 2021-03-02
#> 45  DCMSHRIRAM                           DCM Shriram Limited 2021-01-25
#> 46         DCW                                   DCW Limited 2021-03-02
#> 47    DECCANCE                        Deccan Cements Limited 2021-02-18
#> 48  DHAMPURSUG                   Dhampur Sugar Mills Limited 2021-03-02
#> 49   DIGISPICE                DiGiSPICE Technologies Limited 2021-03-02
#> 50         DLF                                   DLF Limited 2021-02-16
#> 51    DWARKESH            Dwarikesh Sugar Industries Limited 2020-12-16
#> 52      DYNPRO                      Dynemic Products Limited 2021-03-01
#> 53   ELECTCAST                 Electrosteel Castings Limited 2021-03-02
#> 54  ENGINERSIN                       Engineers India Limited 2021-03-02
#> 55   EROSMEDIA              Eros International Media Limited 2021-03-02
#> 56  FAIRCHEMOR                     Fairchem Organics Limited 2021-01-08
#> 57  FEDERALBNK                     The Federal Bank  Limited 2021-02-17
#> 58     FILATEX                         Filatex India Limited 2021-01-07
#> 59     GANECOS                     Ganesha Ecosphere Limited 2021-03-02
#> 60  GANESHHOUC            Ganesh Housing Corporation Limited 2021-03-02
#> 61     GENESYS     Genesys International Corporation Limited 2021-03-02
#> 62  GENUSPOWER           Genus Power Infrastructures Limited 2021-03-02
#> 63      GESHIP    The Great Eastern Shipping Company Limited 2021-03-02
#> 64        GHCL                                  GHCL Limited 2021-03-02
#> 65      GOENKA             Goenka Diamond and Jewels Limited 2021-03-02
#> 66        GPPL                  Gujarat Pipavav Port Limited 2021-03-02
#> 67      GRASIM                     Grasim Industries Limited 2021-03-02
#> 68   GRINDWELL                      Grindwell Norton Limited 2021-03-02
#> 69        GSPL                Gujarat State Petronet Limited 2021-02-18
#> 70        HBSL                      HB Stockholdings Limited 2021-03-02
#> 71         HEG                                   HEG Limited 2021-02-17
#> 72  HEXATRADEX                           Hexa Tradex Limited 2021-03-02
#> 73    HINDALCO                   Hindalco Industries Limited 2021-02-25
#> 74  HISARMETAL                Hisar Metal Industries Limited 2021-03-02
#> 75     HLEGLAS                          HLE Glascoat Limited 2021-03-02
#> 76   IBREALEST                Indiabulls Real Estate Limited 2021-03-02
#> 77    ICICIB22  ICICI Prudential Mutual Fund - BHARAT 22 ETF 2021-03-01
#> 78  IDFCFIRSTB                       IDFC First Bank Limited 2021-02-19
#> 79        IFCI                                  IFCI Limited 2020-12-11
#> 80        IIFL                          IIFL Finance Limited 2021-03-02
#> 81    IMAGICAA           Imagicaaworld Entertainment Limited 2021-03-02
#> 82  INDIAGLYCO                         India Glycols Limited 2021-03-02
#> 83      INDIGO                   InterGlobe Aviation Limited 2020-12-08
#> 84   INVENTURE         Inventure Growth & Securities Limited 2020-12-14
#> 85      ITDCEM                 ITD Cementation India Limited 2021-03-01
#> 86   JAIBALAJI                 Jai Balaji Industries Limited 2021-03-02
#> 87  JAYNECOIND              Jayaswal Neco Industries Limited 2021-03-02
#> 88  JINDALPOLY                     Jindal Poly Films Limited 2021-02-11
#> 89  JINDALSTEL                  Jindal Steel & Power Limited 2021-03-01
#> 90   JKLAKSHMI                     JK Lakshmi Cement Limited 2021-03-02
#> 91     JKPAPER                              JK Paper Limited 2021-03-02
#> 92  JPASSOCIAT                 Jaiprakash Associates Limited 2021-03-02
#> 93   JSWENERGY                            JSW Energy Limited 2021-03-02
#> 94    JSWSTEEL                             JSW Steel Limited 2021-02-24
#> 95    JUSTDIAL                             Just Dial Limited 2021-03-02
#> 96  KALPATPOWR          Kalpataru Power Transmission Limited 2021-02-25
#> 97  KALYANIFRG                         Kalyani Forge Limited 2021-03-02
#> 98  KANORICHEM        Kanoria Chemicals & Industries Limited 2021-02-23
#> 99         KCP                                   KCP Limited 2021-03-02
#> 100        KEC                     KEC International Limited 2021-03-02
#> 101     KHADIM                          Khadim India Limited 2021-03-02
#> 102      KIOCL                                 KIOCL Limited 2021-03-02
#> 103    KIRLFER              Kirloskar Ferrous Industries Ltd 2021-03-02
#> 104 KIRLOSBROS                    Kirloskar Brothers Limited 2021-02-08
#> 105  KIRLOSENG                 Kirloskar Oil Engines Limited 2021-02-16
#> 106      L&TFH                  L&T Finance Holdings Limited 2021-03-02
#> 107   LIKHITHA               Likhitha Infrastructure Limited 2021-02-16
#> 108 LINDEINDIA                           Linde India Limited 2021-03-02
#> 109       LTTS               L&T Technology Services Limited 2021-03-02
#> 110   LUMAXIND                      Lumax Industries Limited 2020-08-24
#> 111   MADHUCON                     Madhucon Projects Limited 2021-03-02
#> 112      MAGMA                         Magma Fincorp Limited 2021-03-02
#> 113    MENONBE                        Menon Bearings Limited 2021-03-02
#> 114 MIRCELECTR                      MIRC Electronics Limited 2021-02-15
#> 115 MODIRUBBER                           Modi Rubber Limited 2021-03-02
#> 116 MOTHERSUMI                Motherson Sumi Systems Limited 2021-03-02
#> 117     MPSLTD                                   MPS Limited 2021-03-02
#> 118       MTNL             Mahanagar Telephone Nigam Limited 2020-12-21
#> 119 NAHARSPING                  Nahar Spinning Mills Limited 2021-03-02
#> 120 NATIONALUM            National Aluminium Company Limited 2021-02-26
#> 121     NCLIND                        NCL Industries Limited 2021-03-02
#> 122     NEOGEN                      Neogen Chemicals Limited 2021-02-17
#> 123 NETFMID150             NIPPON INDIA ETF NIFTY MIDCAP 150 2021-03-02
#> 124       NMDC                                  NMDC Limited 2021-03-02
#> 125      NOCIL                                 NOCIL Limited 2021-02-19
#> 126      NRAIL                N R Agarwal Industries Limited 2021-03-02
#> 127       NTPC                                  NTPC Limited 2021-03-02
#> 128   OPTIEMUS                     Optiemus Infracom Limited 2021-03-02
#> 129 ORCHPHARMA                         Orchid Pharma Limited 2021-03-02
#> 130  ORIENTCEM                         Orient Cement Limited 2021-02-16
#> 131  ORIENTPPR             Orient Paper & Industries Limited 2021-03-02
#> 132       PAEL                                   PAE Limited 2021-03-02
#> 133  PALREDTEC                   Palred Technologies Limited 2021-03-02
#> 134  PARSVNATH                  Parsvnath Developers Limited 2021-03-02
#> 135 PDMJEPAPER               Pudumjee Paper Products Limited 2021-03-02
#> 136        PEL                   Piramal Enterprises Limited 2021-02-25
#> 137     PFOCUS                           Prime Focus Limited 2021-02-26
#> 138       PGEL                       PG Electroplast Limited 2021-03-02
#> 139    PRABHAT                         Prabhat Dairy Limited 2021-03-02
#> 140    PRAKASH                    Prakash Industries Limited 2021-01-05
#> 141     PRECOT                                Precot Limited 2021-02-10
#> 142        PTC                             PTC India Limited 2021-02-25
#> 143     RADICO                        Radico Khaitan Limited 2021-03-02
#> 144    RAILTEL          Railtel Corporation Of India Limited 2021-03-02
#> 145     RAJMET                      Rajnandini Metal Limited 2021-03-02
#> 146 RAJSREESUG           Rajshree Sugars & Chemicals Limited 2020-04-08
#> 147   RAMANEWS                  Shree Rama Newsprint Limited 2020-06-30
#> 148   RAMCOCEM                     The Ramco Cements Limited 2021-02-26
#> 149      RAMKY                  Ramky Infrastructure Limited 2021-03-02
#> 150    RANASUG                           Rana Sugars Limited 2020-08-13
#> 151  RATNAMANI              Ratnamani Metals & Tubes Limited 2021-03-02
#> 152   RPPINFRA                 R.P.P. Infra Projects Limited 2021-03-02
#> 153    RUCHIRA                        Ruchira Papers Limited 2020-12-08
#> 154     RUSHIL                          Rushil Decor Limited 2021-01-08
#> 155     SAFARI             Safari Industries (India) Limited 2021-03-02
#> 156   SAREGAMA                        Saregama India Limited 2021-03-02
#> 157        SCI         Shipping Corporation Of India Limited 2021-03-02
#> 158      SETCO                      Setco Automotive Limited 2021-03-02
#> 159      SEZAL                           Sezal Glass Limited 2021-01-12
#> 160 SHAREINDIA                Share India Securities Limited 2021-02-18
#> 161 SHIVAMILLS                           Shiva Mills Limited 2021-03-02
#> 162  SHREERAMA                 Shree Rama Multi-Tech Limited 2020-09-16
#> 163   SHYAMTEL                         Shyam Telecom Limited 2021-03-02
#> 164    SIEMENS                               Siemens Limited 2021-02-25
#> 165        SIL                   Standard Industries Limited 2021-03-02
#> 166      SILGO                          Silgo Retail Limited       <NA>
#> 167 SRHHYPOLTD     Sree Rayalaseema Hi-Strength Hypo Limited 2021-03-02
#> 168  STARPAPER                      Star Paper Mills Limited 2021-03-02
#> 169    STLTECH                 Sterlite Technologies Limited 2021-03-02
#> 170 STOVEKRAFT                           Stove Kraft Limited 2021-02-12
#> 171 SUDARSCHEM         Sudarshan Chemical Industries Limited 2021-03-01
#> 172 SUNDARMFIN                      Sundaram Finance Limited 2021-02-26
#> 173   SUPPETRO                     Supreme Petrochem Limited 2021-01-22
#> 174   SYMPHONY                              Symphony Limited 2021-03-02
#> 175      TANLA                       Tanla Platforms Limited 2021-02-24
#> 176   TATACHEM                        Tata Chemicals Limited 2021-02-26
#> 177   TATACOMM                   Tata Communications Limited 2021-03-02
#> 178 TATAINVEST           Tata Investment Corporation Limited 2021-03-02
#> 179 TATAMOTORS                           Tata Motors Limited 2021-03-02
#> 180 TATAMTRDVR                           Tata Motors Limited 2021-03-02
#> 181  TATAPOWER                    Tata Power Company Limited 2021-03-02
#> 182  TATASTEEL                            Tata Steel Limited 2021-02-25
#> 183 TATASTLBSL                        Tata Steel Bsl Limited 2021-02-25
#> 184    TECHNOE Techno Electric & Engineering Company Limited 2021-02-25
#> 185 THIRUSUGAR                  Thiru Arooran Sugars Limited 2021-03-02
#> 186    TIINDIA             Tube Investments of India Limited 2021-03-02
#> 187 TIMETECHNO                      Time Technoplast Limited 2021-03-02
#> 188 TORNTPOWER                         Torrent Power Limited 2021-02-25
#> 189      TRENT                                 Trent Limited 2021-03-02
#> 190    TRIVENI      Triveni Engineering & Industries Limited 2021-03-02
#> 191   UCALFUEL                     Ucal Fuel Systems Limited 2021-02-19
#> 192 UNICHEMLAB                  Unichem Laboratories Limited 2021-03-02
#> 193        UPL                                   UPL Limited 2021-03-02
#> 194     UTIAMC          UTI Asset Management Company Limited 2021-02-25
#> 195 VADILALIND                    Vadilal Industries Limited 2021-02-24
#> 196 VAIBHAVGBL                        Vaibhav Global Limited 2021-03-02
#> 197    VASWANI                    Vaswani Industries Limited 2021-03-02
#> 198       VEDL                               Vedanta Limited 2021-03-02
#> 199     VERTOZ                    Vertoz Advertising Limited 2021-03-02
#> 200        VHL                     Vardhman Holdings Limited 2021-03-02
#> 201   VIPULLTD                                 Vipul Limited 2021-03-02
#> 202    WANBURY                               Wanbury Limited 2021-03-02
#> 203     WELENT                   Welspun Enterprises Limited 2021-02-08
#> 204 WSTCSTPAPR                West Coast Paper Mills Limited 2021-03-02
#> 205  XPROINDIA                            Xpro India Limited 2021-03-02
#>        value     year      ltp value_old     prev change pChange
#> 1   26000.00 26000.00 26000.00  25199.90 25068.65 931.35    3.72
#> 2     127.90   127.90   127.90    127.90   127.90   0.00    0.00
#> 3    2424.90  2424.90  2275.00   2380.40  2258.80  16.20    0.72
#> 4     130.90   130.90   129.20    130.70   126.75   2.45    1.93
#> 5      80.15    80.15    80.15     76.35    76.35   3.80    4.98
#> 6     350.00   350.00   331.95    338.55   338.55  -6.60   -1.95
#> 7     944.90   944.90   916.00    876.50   872.55  43.45    4.98
#> 8     754.95   754.95   733.25    724.70   720.50  12.75    1.77
#> 9      66.65    66.65    64.85     63.95    61.30   3.55    5.79
#> 10    852.55   852.55   829.00    820.00   781.05  47.95    6.14
#> 11    894.70   894.70   875.00    880.65   874.80   0.20    0.02
#> 12    331.65   331.65   325.00    329.65   323.60   1.40    0.43
#> 13   5898.90  5898.90  5735.00   5618.00  5618.00 117.00    2.08
#> 14     96.30    96.30    96.30     91.75    91.75   4.55    4.96
#> 15    490.65   490.65   462.00    476.30   462.90  -0.90   -0.19
#> 16   3391.40  3391.40  3295.00   3315.00  3207.35  87.65    2.73
#> 17     54.10    54.10    54.10     53.80    51.55   2.55    4.95
#> 18   1250.00  1250.00  1244.00   1167.00  1157.40  86.60    7.48
#> 19     39.70    39.70    39.70     37.85    37.85   1.85    4.89
#> 20    321.10   321.10   320.05    304.75   294.35  25.70    8.73
#> 21    121.90   121.90   116.50    121.00   119.90  -3.40   -2.84
#> 22     17.65    17.65    15.45     16.60    16.05  -0.60   -3.74
#> 23    142.30   142.30   136.05    134.90   121.55  14.50   11.93
#> 24    689.15   689.15   649.80    584.45   574.30  75.50   13.15
#> 25   1225.00  1225.00  1215.00   1218.00  1151.50  63.50    5.51
#> 26    198.15   198.15   193.00    193.30   189.10   3.90    2.06
#> 27   2244.95  2244.95  2220.00   2195.10  2105.05 114.95    5.46
#> 28    154.00   154.00   152.70    153.55   151.50   1.20    0.79
#> 29   1249.55  1249.55  1181.00   1245.00  1227.75 -46.75   -3.81
#> 30     52.75    52.75    48.55     51.10    51.10  -2.55   -4.99
#> 31     52.65    52.65    50.95     52.20    51.75  -0.80   -1.55
#> 32     94.50    94.50    88.70     92.55    91.45  -2.75   -3.01
#> 33     88.20    88.20    84.70     85.30    80.00   4.70    5.88
#> 34    328.00   328.00   319.80    324.00   314.90   4.90    1.56
#> 35    549.75   549.75   536.80    541.75   519.70  17.10    3.29
#> 36     60.35    60.35    59.95     58.40    57.50   2.45    4.26
#> 37     16.20    16.20    16.20     15.45    15.45   0.75    4.85
#> 38    624.00   624.00   620.10    594.00   585.65  34.45    5.88
#> 39     24.55    24.55    24.29     24.52    24.25   0.04    0.16
#> 40     25.05    25.05    22.75     23.90    23.90  -1.15   -4.81
#> 41    882.95   882.95   869.80    826.85   818.45  51.35    6.27
#> 42     16.85    16.85    16.85     16.05    16.05   0.80    4.98
#> 43    178.00   178.00   173.80    173.70   171.35   2.45    1.43
#> 44     31.35    31.35    29.45     31.00    31.00  -1.55   -5.00
#> 45    542.00   542.00   522.00    515.55   496.15  25.85    5.21
#> 46     30.75    30.75    29.65     30.75    29.35   0.30    1.02
#> 47    433.00   433.00   421.80    432.50   422.80  -1.00   -0.24
#> 48    195.00   195.00   192.30    189.50   185.20   7.10    3.83
#> 49    114.70   114.70   103.80    109.25   109.25  -5.45   -4.99
#> 50    328.60   328.60   324.20    328.20   313.60  10.60    3.38
#> 51     35.75    35.75    35.20     35.40    32.00   3.20   10.00
#> 52    498.00   498.00   484.70    470.00   451.15  33.55    7.44
#> 53     27.70    27.70    26.80     27.00    26.70   0.10    0.37
#> 54     93.30    93.30    89.00     91.30    87.10   1.90    2.18
#> 55     33.30    33.30    32.80     31.60    31.60   1.20    3.80
#> 56    725.00   725.00   690.00    694.00   650.70  39.30    6.04
#> 57     88.50    88.50    88.45     88.20    83.30   5.15    6.18
#> 58     73.50    73.50    72.00     72.00    67.95   4.05    5.96
#> 59    688.50   688.50   657.20    635.90   617.30  39.90    6.46
#> 60     62.00    62.00    57.55     61.70    60.55  -3.00   -4.95
#> 61     91.95    91.95    91.95     88.10    87.70   4.25    4.85
#> 62     46.70    46.70    44.80     44.85    44.75   0.05    0.11
#> 63    339.95   339.95   326.90    339.50   334.25  -7.35   -2.20
#> 64    254.70   254.70   245.10    235.95   232.70  12.40    5.33
#> 65      2.10     2.10     2.10      2.00     2.00   0.10    5.00
#> 66    117.90   117.90   108.00    114.40   109.00  -1.00   -0.92
#> 67   1343.00  1343.00  1316.00   1298.50  1294.75  21.25    1.64
#> 68    972.00   972.00   957.00    933.75   912.95  44.05    4.83
#> 69    311.45   311.45   275.30    276.70   259.55  15.75    6.07
#> 70     16.35    16.35    16.35     15.60    15.60   0.75    4.81
#> 71   1644.00  1644.00  1558.00   1593.00  1427.50 130.50    9.14
#> 72     74.80    74.80    72.00     74.65    74.35  -2.35   -3.16
#> 73    361.30   361.30   358.75    354.60   345.25  13.50    3.91
#> 74    143.65   143.65   129.50    124.30   124.05   5.45    4.39
#> 75   2430.75  2430.75  2390.05   2269.65  2209.80 180.25    8.16
#> 76    107.75   107.75   104.80    102.50    99.80   5.00    5.01
#> 77     38.85    38.85    38.55     38.50    38.09   0.46    1.21
#> 78     68.15    68.15    67.10     66.80    64.50   2.60    4.03
#> 79     12.80    12.80    12.80     11.50    10.70   2.10   19.63
#> 80    299.00   299.00   292.80    289.40   284.80   8.00    2.81
#> 81      7.95     7.95     7.95      7.45     7.25   0.70    9.66
#> 82    539.00   539.00   527.80    528.80   517.25  10.55    2.04
#> 83   1823.85  1823.85  1783.00   1787.00  1691.40  91.60    5.42
#> 84     26.95    26.95    23.15     25.45    24.75  -1.60   -6.46
#> 85     88.80    88.80    85.30     83.00    79.85   5.45    6.83
#> 86     32.65    32.65    32.65     31.10    31.10   1.55    4.98
#> 87      9.25     9.25     9.25      8.85     8.85   0.40    4.52
#> 88    615.40   615.40   612.00    571.95   540.45  71.55   13.24
#> 89    354.80   354.80   349.20    348.70   338.30  10.90    3.22
#> 90    439.90   439.90   421.00    439.30   431.20 -10.20   -2.37
#> 91    167.75   167.75   161.00    161.90   160.00   1.00    0.63
#> 92      9.70     9.70     8.80      9.25     9.25  -0.45   -4.86
#> 93     92.40    92.40    83.80     88.50    86.20  -2.40   -2.78
#> 94    435.00   435.00   426.80    426.60   413.30  13.50    3.27
#> 95   1047.70  1047.70   906.00    972.10   965.45 -59.45   -6.16
#> 96    406.85   406.85   398.70    395.75   391.30   7.40    1.89
#> 97    202.50   202.50   201.25    199.55   192.90   8.35    4.33
#> 98     88.55    88.55    88.05     88.35    84.35   3.70    4.39
#> 99     85.10    85.10    83.10     83.55    78.90   4.20    5.32
#> 100   486.00   486.00   459.30    473.40   463.05  -3.75   -0.81
#> 101   185.90   185.90   177.70    182.00   180.05  -2.35   -1.31
#> 102   190.65   190.65   174.40    183.55   183.55  -9.15   -4.99
#> 103   174.40   174.40   167.80    174.15   169.50  -1.70   -1.00
#> 104   198.70   198.70   198.70    175.00   165.60  33.10   19.99
#> 105   175.90   175.90   173.05    173.90   162.30  10.75    6.62
#> 106   113.40   113.40   113.10    109.40   107.00   6.10    5.70
#> 107   306.60   306.60   303.00    298.00   279.80  23.20    8.29
#> 108  1835.65  1835.65  1785.00   1795.00  1721.65  63.35    3.68
#> 109  2807.60  2807.60  2695.00   2760.40  2729.80 -34.80   -1.27
#> 110  1783.40  1783.40  1701.00   1674.90  1636.15  64.85    3.96
#> 111     7.60     7.60     6.90      7.25     7.25  -0.35   -4.83
#> 112   129.75   129.75   127.60    127.65   123.60   4.00    3.24
#> 113    64.70    64.70    63.10     64.40    63.15  -0.05   -0.08
#> 114    15.45    15.45    15.00     15.05    14.75   0.25    1.69
#> 115   177.85   177.85   177.85    169.40   169.40   8.45    4.99
#> 116   238.20   238.20   232.70    235.60   232.60   0.10    0.04
#> 117   524.80   524.80   517.95    498.95   492.60  25.35    5.15
#> 118    16.80    16.80    16.80     15.50    14.00   2.80   20.00
#> 119    99.60    99.60    91.30     95.25    95.25  -3.95   -4.15
#> 120    64.00    64.00    62.00     61.25    59.15   2.85    4.82
#> 121   183.00   183.00   177.00    182.80   178.80  -1.80   -1.01
#> 122   938.00   938.00   889.00    930.00   822.70  66.30    8.06
#> 123    93.50    93.50    92.86     92.06    91.81   1.05    1.14
#> 124   137.45   137.45   136.45    134.85   133.85   2.60    1.94
#> 125   193.70   193.70   190.70    183.70   180.70  10.00    5.53
#> 126   282.85   282.85   271.60    266.00   261.80   9.80    3.74
#> 127   114.70   114.70   112.80    113.70   112.55   0.25    0.22
#> 128   198.65   198.65   198.65    189.20   189.20   9.45    4.99
#> 129  1000.70  1000.70  1000.70    953.05   953.05  47.65    5.00
#> 130   100.50   100.50   100.00     99.50    96.30   3.70    3.84
#> 131    30.70    30.70    28.10     29.50    29.10  -1.00   -3.44
#> 132     3.90     3.90     3.90      3.75     3.75   0.15    4.00
#> 133   123.20   123.20   111.50    117.35   117.35  -5.85   -4.99
#> 134     8.65     8.65     8.50      8.25     8.25   0.25    3.03
#> 135    28.15    28.15    26.90     27.95    27.10  -0.20   -0.74
#> 136  2007.70  2007.70  1989.80   1964.00  1918.70  71.10    3.71
#> 137    69.00    69.00    69.00     66.90    57.50  11.50   20.00
#> 138   349.70   349.70   349.70    333.05   333.05  16.65    5.00
#> 139    83.70    83.70    79.00     82.40    79.90  -0.90   -1.13
#> 140    65.50    65.50    60.75     65.45    63.05  -2.30   -3.65
#> 141    99.10    99.10    99.10     96.70    94.40   4.70    4.98
#> 142    80.70    80.70    78.65     78.25    76.05   2.60    3.42
#> 143   627.80   627.80   603.00    618.00   614.10 -11.10   -1.81
#> 144   189.70   189.70   164.60    174.70   174.70 -10.10   -5.78
#> 145    90.80    90.80    90.80     86.50    86.50   4.30    4.97
#> 146    20.25    20.25    20.25     19.65    16.90   3.35   19.82
#> 147    18.30    18.30    16.35     17.50    15.25   1.10    7.21
#> 148  1021.00  1021.00  1013.20   1013.60   994.05  19.15    1.93
#> 149    88.85    88.85    88.85     84.65    84.65   4.20    4.96
#> 150     9.05     9.05     9.05      8.50     7.55   1.50   19.87
#> 151  2020.00  2020.00  1969.95   2002.60  1981.55 -11.60   -0.59
#> 152    83.20    83.20    77.70     77.25    74.05   3.65    4.93
#> 153    74.70    74.70    71.75     74.30    72.05  -0.30   -0.42
#> 154   205.10   205.10   205.10    200.00   195.35   9.75    4.99
#> 155   685.00   685.00   682.00    684.00   668.70  13.30    1.99
#> 156  1271.95  1271.95  1203.80   1124.95  1107.15  96.65    8.73
#> 157   134.00   134.00   122.95    124.50   124.50  -1.55   -1.24
#> 158    18.00    18.00    17.10     17.80    17.35  -0.25   -1.44
#> 159     5.60     5.60     5.60      5.55     5.35   0.25    4.67
#> 160   261.70   261.70   255.00    240.30   230.95  24.05   10.41
#> 161    47.10    47.10    47.10     45.00    44.90   2.20    4.90
#> 162     9.95     9.95     9.95      9.95     8.30   1.65   19.88
#> 163    11.35    11.35    11.35     10.85    10.85   0.50    4.61
#> 164  1960.00  1960.00  1920.50   1949.00  1939.65 -19.15   -0.99
#> 165    14.70    14.70    14.70     14.00    14.00   0.70    5.00
#> 166    53.80    53.80    53.80        NA    44.85   8.95   19.96
#> 167   303.00   303.00   294.00    286.35   275.75  18.25    6.62
#> 168   132.70   132.70   125.25    130.00   128.30  -3.05   -2.38
#> 169   225.85   225.85   222.30    224.00   220.65   1.65    0.75
#> 170   547.85   547.85   513.25    545.45   504.15   9.10    1.81
#> 171   600.00   600.00   572.90    589.90   574.70  -1.80   -0.31
#> 172  2825.00  2825.00  2748.50   2739.95  2618.20 130.30    4.98
#> 173   435.00   435.00   425.05    435.00   421.40   3.65    0.87
#> 174  1528.80  1528.80  1371.70   1446.40  1446.40 -74.70   -5.16
#> 175  1030.00  1030.00   998.80    999.50   988.45  10.35    1.05
#> 176   782.00   782.00   774.00    757.50   733.65  40.35    5.50
#> 177  1342.15  1342.15  1236.00   1333.95  1202.95  33.05    2.75
#> 178  1163.85  1163.85  1149.00   1155.00  1146.70   2.30    0.20
#> 179   357.00   357.00   347.10    347.20   345.75   1.35    0.39
#> 180   145.00   145.00   141.55    140.60   139.90   1.65    1.18
#> 181   105.50   105.50   105.25    100.80   100.35   4.90    4.88
#> 182   782.50   782.50   774.80    753.00   735.50  39.30    5.34
#> 183    50.80    50.80    49.90     48.30    47.30   2.60    5.50
#> 184   327.85   327.85   319.85    326.40   312.00   7.85    2.52
#> 185     7.80     7.80     7.75      7.50     7.45   0.30    4.03
#> 186  1152.00  1152.00  1146.00   1098.00  1090.10  55.90    5.13
#> 187    62.20    62.20    59.35     61.50    59.15   0.20    0.34
#> 188   409.00   409.00   405.00    395.75   388.95  16.05    4.13
#> 189   923.00   923.00   912.00    921.55   905.90   6.10    0.67
#> 190    96.00    96.00    94.15     92.40    90.20   3.95    4.38
#> 191   173.75   173.75   167.15    164.00   156.25  10.90    6.98
#> 192   339.90   339.90   334.10    339.70   337.35  -3.25   -0.96
#> 193   616.85   616.85   613.95    608.80   589.45  24.50    4.16
#> 194   610.00   610.00   605.30    602.65   581.55  23.75    4.08
#> 195   925.00   925.00   908.00    905.00   889.50  18.50    2.08
#> 196  3884.50  3884.50  3752.00   3745.50  3691.95  60.05    1.63
#> 197    12.40    12.40    11.35     11.90    11.90  -0.55   -4.62
#> 198   221.70   221.70   219.00    217.95   214.75   4.25    1.98
#> 199   306.00   306.00   296.50    290.00   283.05  13.45    4.75
#> 200  2169.75  2169.75  1956.55   1976.40  1976.40 -19.85   -1.00
#> 201    33.20    33.20    33.20     31.65    31.65   1.55    4.90
#> 202   113.90   113.90   103.10    108.50   108.50  -5.40   -4.98
#> 203    97.05    97.05    96.95     95.95    87.65   9.30   10.61
#> 204   277.00   277.00   263.00    254.30   250.80  12.20    4.86
#> 205    61.90    61.90    56.95     60.60    59.90  -2.95   -4.92
```

##### Most actively traded stocks in a month

``` r
nse_stock_most_traded()
#>                       security share_turnover traded_quantity no_of_trades
#> 1          Tata Motors Limited           3.95           20118     10750273
#> 2          State Bank of India           3.58           15323     10397758
#> 3  Reliance Industries Limited           2.97            2411      6543286
#> 4           ICICI Bank Limited           2.28            5954      6508391
#> 5       Bharati Airtel Limited           2.18            6107      4987691
#> 6           Tata Steel Limited           2.00            4713      5165939
#> 7            HDFC Bank Limited           1.92            1994      4925517
#> 8            Axis Bank Limited           1.90            4162      5820333
#> 9        Bajaj Finance Limited           1.89             565      3138564
#> 10       Indusind Bank Limited           1.76            2782      4933750
#> 11 TOTAL of Top Ten securities          24.43           64129     63171502
#> 12                       TOTAL         100.00          716614    455786495
#>    avg_daily_turnonver   turnover
#> 1              3211.22   64224.31
#> 2              2910.30   58205.98
#> 3              2419.53   48390.54
#> 4              1854.63   37092.52
#> 5              1776.81   35536.11
#> 6              1630.03   32600.54
#> 7              1562.98   31259.67
#> 8              1545.32   30906.37
#> 9              1536.38   30727.60
#> 10             1430.42   28608.42
#> 11            19877.60  397552.06
#> 12            81373.18 1627463.62

# retain original column names as returned by NSE
nse_stock_most_traded(clean_names = FALSE)
#>                        skipped sharetotal trdQty nooftrades avgdailyturn
#> 1          Tata Motors Limited       3.95  20118   10750273      3211.22
#> 2          State Bank of India       3.58  15323   10397758      2910.30
#> 3  Reliance Industries Limited       2.97   2411    6543286      2419.53
#> 4           ICICI Bank Limited       2.28   5954    6508391      1854.63
#> 5       Bharati Airtel Limited       2.18   6107    4987691      1776.81
#> 6           Tata Steel Limited       2.00   4713    5165939      1630.03
#> 7            HDFC Bank Limited       1.92   1994    4925517      1562.98
#> 8            Axis Bank Limited       1.90   4162    5820333      1545.32
#> 9        Bajaj Finance Limited       1.89    565    3138564      1536.38
#> 10       Indusind Bank Limited       1.76   2782    4933750      1430.42
#> 11 TOTAL of Top Ten securities      24.43  64129   63171502     19877.60
#> 12                       TOTAL     100.00 716614  455786495     81373.18
#>      turnover
#> 1    64224.31
#> 2    58205.98
#> 3    48390.54
#> 4    37092.52
#> 5    35536.11
#> 6    32600.54
#> 7    31259.67
#> 8    30906.37
#> 9    30727.60
#> 10   28608.42
#> 11  397552.06
#> 12 1627463.62
```

### Futures & Options

##### Top futures and options gainers for the last trading session.

``` r
nse_fo_top_gainers()
#>        symbol series last_corp_announcement_date
#> 1    GRANULES     EQ                  2021-02-08
#> 2  IBULHSGFIN     EQ                  2020-09-03
#> 3     HDFCAMC     EQ                  2020-07-09
#> 4  CUMMINSIND     EQ                  2021-02-09
#> 5         PNB     EQ                  2020-07-27
#> 6  FEDERALBNK     EQ                  2020-07-09
#> 7       L&TFH     EQ                  2021-01-21
#> 8      AUBANK     EQ                  2019-07-18
#> 9    TATACHEM     EQ                  2020-06-22
#> 10     INDIGO     EQ                  2020-08-27
#>                                 last_corp_announcement open_price high_price
#> 1                Interim Dividend - Rs 0.25  Per Share     338.25     369.00
#> 2                               Annual General Meeting     231.10     251.00
#> 3       Annual General Meeting/Dividend - Rs 28 Per Sh    2950.00    3220.00
#> 4                    Interim Dividend - Rs 7 Per Share     822.50     882.95
#> 5                               Annual General Meeting      41.40      43.90
#> 6                               Annual General Meeting      83.70      88.50
#> 7                Rights 17:74@ Premium Rs 55 Per Share     107.50     113.40
#> 8  Annual General Meeting/Dividend - Rs 0.75 Per Share    1162.40    1225.00
#> 9    Annual General Meeting/Dividend - Rs 11 Per Share     738.00     782.00
#> 10                              Annual General Meeting    1704.00    1823.85
#>    low_price last_traded_price prev_close_price percent_change traded_quantity
#> 1     338.25            367.50           336.25           9.29        10446684
#> 2     229.50            249.50           229.00           8.95        45419012
#> 3    2934.00           3189.50          2934.10           8.70         1461732
#> 4     822.50            869.80           818.45           6.27         5093443
#> 5      41.25             43.55            41.00           6.22       238140740
#> 6      83.50             88.45            83.30           6.18        38195349
#> 7     107.05            113.10           107.00           5.70        26327611
#> 8    1136.55           1215.00          1151.50           5.51         2078700
#> 9     735.45            774.00           733.65           5.50        12732034
#> 10   1700.25           1783.00          1691.40           5.42         2461629
#>    turnover_in_lakhs
#> 1           37719.84
#> 2          109291.77
#> 3           45834.95
#> 4           44003.78
#> 5          102090.94
#> 6           32974.04
#> 7           29039.35
#> 8           24143.27
#> 9           97734.91
#> 10          43531.45

# retain original column names as returned by NSE
nse_fo_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1    GRANULES     EQ               2021-02-08
#> 2  IBULHSGFIN     EQ               2020-09-03
#> 3     HDFCAMC     EQ               2020-07-09
#> 4  CUMMINSIND     EQ               2021-02-09
#> 5         PNB     EQ               2020-07-27
#> 6  FEDERALBNK     EQ               2020-07-09
#> 7       L&TFH     EQ               2021-01-21
#> 8      AUBANK     EQ               2019-07-18
#> 9    TATACHEM     EQ               2020-06-22
#> 10     INDIGO     EQ               2020-08-27
#>                                   lastCorpAnnouncement openPrice highPrice
#> 1                Interim Dividend - Rs 0.25  Per Share    338.25    369.00
#> 2                               Annual General Meeting    231.10    251.00
#> 3       Annual General Meeting/Dividend - Rs 28 Per Sh   2950.00   3220.00
#> 4                    Interim Dividend - Rs 7 Per Share    822.50    882.95
#> 5                               Annual General Meeting     41.40     43.90
#> 6                               Annual General Meeting     83.70     88.50
#> 7                Rights 17:74@ Premium Rs 55 Per Share    107.50    113.40
#> 8  Annual General Meeting/Dividend - Rs 0.75 Per Share   1162.40   1225.00
#> 9    Annual General Meeting/Dividend - Rs 11 Per Share    738.00    782.00
#> 10                              Annual General Meeting   1704.00   1823.85
#>    lowPrice     ltp previousPrice netPrice tradedQuantity turnoverInLakhs
#> 1    338.25  367.50        336.25     9.29       10446684        37719.84
#> 2    229.50  249.50        229.00     8.95       45419012       109291.77
#> 3   2934.00 3189.50       2934.10     8.70        1461732        45834.95
#> 4    822.50  869.80        818.45     6.27        5093443        44003.78
#> 5     41.25   43.55         41.00     6.22      238140740       102090.94
#> 6     83.50   88.45         83.30     6.18       38195349        32974.04
#> 7    107.05  113.10        107.00     5.70       26327611        29039.35
#> 8   1136.55 1215.00       1151.50     5.51        2078700        24143.27
#> 9    735.45  774.00        733.65     5.50       12732034        97734.91
#> 10  1700.25 1783.00       1691.40     5.42        2461629        43531.45
```

### Pre Open Market Data

##### Fetch data of pre open session of Nifty Bank.

``` r
nse_preopen_nifty_bank()
#>        symbol series corp_action_date corp_action  price change percent_change
#> 1    AXISBANK     EQ             <NA>        <NA>  740.5   9.25           1.26
#> 2   ICICIBANK     EQ             <NA>        <NA>  618.0   7.50           1.23
#> 3  BANDHANBNK     EQ             <NA>        <NA>  349.0   3.80           1.10
#> 4    HDFCBANK     EQ             <NA>        <NA> 1584.0  15.80           1.01
#> 5         PNB     EQ             <NA>        <NA>   41.4   0.40           0.98
#> 6  BANKBARODA     EQ             <NA>        <NA>   84.1   0.80           0.96
#> 7     RBLBANK     EQ             <NA>        <NA>  238.9   2.15           0.91
#> 8  INDUSINDBK     EQ             <NA>        <NA> 1080.0   6.65           0.62
#> 9        SBIN     EQ             <NA>        <NA>  396.5   2.30           0.58
#> 10  KOTAKBANK     EQ             <NA>        <NA> 1855.0  10.35           0.56
#> 11 FEDERALBNK     EQ             <NA>        <NA>   83.7   0.40           0.48
#> 12 IDFCFIRSTB     EQ             <NA>        <NA>   64.8   0.30           0.47
#>    prev_close quantity  value   mkt_cap year_high year_low sum_val sum_quantity
#> 1      731.25    43619 323.00 181316.88    799.00   286.00 2326.69       609386
#> 2      610.50    77500 478.95 421448.96    679.40   268.30 2326.69       609386
#> 3      345.20    16205  56.56  23347.82    430.70   152.20 2326.69       609386
#> 4     1568.20    32200 510.05 682331.50   1641.00   738.75 2326.69       609386
#> 5       41.00   208449  86.30   9880.45     46.60    26.30 2326.69       609386
#> 6       83.30   158345 133.17  10007.22     99.85    36.00 2326.69       609386
#> 7      236.75     6920  16.53  10613.87    308.10   101.55 2326.69       609386
#> 8     1073.35     7236  78.15  60939.75   1136.95   235.55 2326.69       609386
#> 9      394.20    72853 288.86 151277.52    427.70   149.45 2326.69       609386
#> 10    1844.65    16583 307.61 270248.78   2049.00  1001.00 2326.69       609386
#> 11      83.30    33114  27.72  16632.33     88.20    35.70 2326.69       609386
#> 12      64.50    30545  19.79  13537.21     66.80    17.65 2326.69       609386
#>    fin_quantity sum_fin_quantity
#> 1         43619           703569
#> 2         77500           703569
#> 3         16205           703569
#> 4         32200           703569
#> 5        208449           703569
#> 6        158345           703569
#> 7          6920           703569
#> 8          7236           703569
#> 9         72853           703569
#> 10        16583           703569
#> 11        33114           703569
#> 12        30545           703569

# retain original column names as returned by NSE
nse_preopen_nifty(clean_names = FALSE)
#>        symbol series        xDt
#> 1        BPCL     EQ 2021-02-17
#> 2   POWERGRID     EQ       <NA>
#> 3        HDFC     EQ       <NA>
#> 4        NTPC     EQ 2021-02-11
#> 5  ADANIPORTS     EQ       <NA>
#> 6    HINDALCO     EQ       <NA>
#> 7  BHARTIARTL     EQ       <NA>
#> 8     DRREDDY     EQ       <NA>
#> 9    AXISBANK     EQ       <NA>
#> 10 HINDUNILVR     EQ       <NA>
#> 11  ICICIBANK     EQ       <NA>
#> 12   DIVISLAB     EQ       <NA>
#> 13    HCLTECH     EQ 2021-01-21
#> 14       INFY     EQ       <NA>
#> 15        UPL     EQ       <NA>
#> 16 BAJAJ-AUTO     EQ       <NA>
#> 17  COALINDIA     EQ       <NA>
#> 18   HDFCBANK     EQ       <NA>
#> 19    SBILIFE     EQ       <NA>
#> 20        ITC     EQ 2021-02-22
#> 21 HEROMOTOCO     EQ 2021-02-15
#> 22        TCS     EQ 2021-01-14
#> 23 BAJFINANCE     EQ       <NA>
#> 24 TATAMOTORS     EQ       <NA>
#> 25        M&M     EQ       <NA>
#> 26       GAIL     EQ 2021-01-27
#> 27  NESTLEIND     EQ       <NA>
#> 28        IOC     EQ 2021-02-09
#> 29      CIPLA     EQ       <NA>
#> 30  TATASTEEL     EQ       <NA>
#> 31   RELIANCE     EQ       <NA>
#> 32 ASIANPAINT     EQ       <NA>
#> 33 INDUSINDBK     EQ       <NA>
#> 34      WIPRO     EQ 2021-01-22
#> 35       SBIN     EQ       <NA>
#> 36  KOTAKBANK     EQ       <NA>
#> 37      TECHM     EQ       <NA>
#> 38         LT     EQ       <NA>
#> 39 BAJAJFINSV     EQ       <NA>
#> 40       ONGC     EQ 2021-02-17
#> 41   JSWSTEEL     EQ       <NA>
#> 42   HDFCLIFE     EQ       <NA>
#> 43     MARUTI     EQ       <NA>
#> 44 ULTRACEMCO     EQ       <NA>
#> 45  SUNPHARMA     EQ 2021-02-09
#> 46   SHREECEM     EQ       <NA>
#> 47  BRITANNIA     EQ       <NA>
#> 48     GRASIM     EQ       <NA>
#> 49  EICHERMOT     EQ       <NA>
#> 50      TITAN     EQ       <NA>
#>                                                                   caAct
#> 1                                    INTERIM DIVIDEND - RS 16 PER SHARE
#> 2                                                                  <NA>
#> 3                                                                  <NA>
#> 4                                     INTERIM DIVIDEND - RS 3 PER SHARE
#> 5                                                                  <NA>
#> 6                                                                  <NA>
#> 7                                                                  <NA>
#> 8                                                                  <NA>
#> 9                                                                  <NA>
#> 10                                                                 <NA>
#> 11                                                                 <NA>
#> 12                                                                 <NA>
#> 13                                    INTERIM DIVIDEND - RS 4 PER SHARE
#> 14                                                                 <NA>
#> 15                                                                 <NA>
#> 16                                                                 <NA>
#> 17                                                                 <NA>
#> 18                                                                 <NA>
#> 19                                                                 <NA>
#> 20                                    INTERIM DIVIDEND - RS 5 PER SHARE
#> 21 INTERIM DIVIDEND - RS 65 PER SHARE SPECIAL DIVIDEND - RS 5 PER SHARE
#> 22                                    INTERIM DIVIDEND - RS 6 PER SHARE
#> 23                                                                 <NA>
#> 24                                                                 <NA>
#> 25                                                                 <NA>
#> 26                                 INTERIM DIVIDEND - RS 2.50 PER SHARE
#> 27                                                                 <NA>
#> 28                                INTERIM DIVIDEND - RS 7.50  PER SHARE
#> 29                                                                 <NA>
#> 30                                                                 <NA>
#> 31                                                                 <NA>
#> 32                                                                 <NA>
#> 33                                                                 <NA>
#> 34                                    INTERIM DIVIDEND - RE 1 PER SHARE
#> 35                                                                 <NA>
#> 36                                                                 <NA>
#> 37                                                                 <NA>
#> 38                                                                 <NA>
#> 39                                                                 <NA>
#> 40                                 INTERIM DIVIDEND - RS 1.75 PER SHARE
#> 41                                                                 <NA>
#> 42                                                                 <NA>
#> 43                                                                 <NA>
#> 44                                                                 <NA>
#> 45                                 INTERIM DIVIDEND - RS 5.50 PER SHARE
#> 46                                                                 <NA>
#> 47                                                                 <NA>
#> 48                                                                 <NA>
#> 49                                                                 <NA>
#> 50                                                                 <NA>
#>         iep    chn perChn     pCls trdQnty    iVal    mktCap    yHigh     yLow
#> 1    480.00  11.00   2.35   469.00   53538  256.98  37643.04   482.40   252.00
#> 2    230.00   4.95   2.20   225.05   57869  133.10  57691.09   238.30   122.15
#> 3   2608.90  44.90   1.75  2564.00   64336 1678.46 460781.28  2896.00  1473.45
#> 4    114.45   1.90   1.69   112.55  237834  272.20  54567.99   113.70    73.20
#> 5    732.00  11.50   1.60   720.50   58291  426.69  52699.58   724.70   203.00
#> 6    350.70   5.45   1.58   345.25   57270  200.85  50416.13   354.60    84.90
#> 7    548.75   7.55   1.40   541.20  127095  697.43 129912.10   623.00   361.75
#> 8   4465.00  60.30   1.37  4404.70    4737  211.51  53472.01  5512.65  2495.05
#> 9    740.50   9.25   1.26   731.25   43619  323.00 181316.88   799.00   286.00
#> 10  2205.00  27.05   1.24  2177.95   26354  581.11 194454.21  2614.30  1757.30
#> 11   618.00   7.50   1.23   610.50   77500  478.95 421448.96   679.40   268.30
#> 12  3560.00  43.10   1.23  3516.90    4682  166.68  44814.07  3914.95  1626.00
#> 13   965.00  11.25   1.18   953.75   49159  474.38 103526.32  1067.00   375.25
#> 14  1319.20  14.70   1.13  1304.50   86168 1136.73 483420.52  1392.80   509.25
#> 15   595.80   6.35   1.08   589.45    8830   52.61  32426.39   608.80   240.15
#> 16  3985.00  40.95   1.04  3944.05    3001  119.59  51357.51  4361.40  1788.65
#> 17   155.00   1.60   1.04   153.40   34066   52.80  32142.33   180.20   109.55
#> 18  1584.00  15.80   1.01  1568.20   32200  510.05 682331.50  1641.00   738.75
#> 19   888.00   8.85   1.01   879.15    3040   27.00  34288.53   954.50   519.40
#> 20   212.00   2.10   1.00   209.90   93839  198.94 183380.73   239.20   134.60
#> 21  3510.00  33.60   0.97  3476.40    7881  276.62  45140.69  3629.05  1475.00
#> 22  3035.00  28.65   0.95  3006.35   21758  660.36 315867.49  3339.80  1506.05
#> 23  5364.15  47.85   0.90  5316.30    3388  181.74 140955.54  5822.20  1783.00
#> 24   348.65   2.90   0.84   345.75  223924  780.71  61944.74   347.20    63.50
#> 25   866.95   6.90   0.80   860.05   11930  103.43  82329.00   952.05   245.40
#> 26   145.95   1.15   0.79   144.80   34910   50.95  26775.81   152.80    65.00
#> 27 16705.00 128.85   0.78 16576.15     647  108.08  59133.45 18844.00 12200.00
#> 28   103.00   0.80   0.78   102.20  176423  181.72  25977.43   112.90    71.15
#> 29   817.95   6.15   0.76   811.80   11728   95.93  41244.40   878.90   355.30
#> 30   741.00   5.50   0.75   735.50   25496  188.93  55511.71   753.00   250.85
#> 31  2121.05  15.05   0.71  2106.00   52276 1108.80 680893.97  2369.35   866.98
#> 32  2406.00  15.60   0.65  2390.40    4600  110.68 107764.72  2873.45  1431.20
#> 33  1080.00   6.65   0.62  1073.35    7236   78.15  60939.75  1136.95   235.55
#> 34   433.00   2.60   0.60   430.40   40004  173.22  63956.92   467.45   159.40
#> 35   396.50   2.30   0.58   394.20   72853  288.86 151277.52   427.70   149.45
#> 36  1855.00  10.35   0.56  1844.65   16583  307.61 270248.78  2049.00  1001.00
#> 37   972.20   5.10   0.53   967.10    7931   77.11  59869.87  1081.55   471.40
#> 38  1493.50   7.85   0.53  1485.65    3370   50.33 179416.12  1593.00   661.00
#> 39  9926.40  49.40   0.50  9877.00     256   25.41  59728.42 10579.00  3985.30
#> 40   114.05   0.55   0.48   113.50  127686  145.63  41407.99   120.50    50.00
#> 41   415.30   2.00   0.48   413.30    7395   30.71  39961.49   426.60   132.50
#> 42   724.00   3.20   0.44   720.80    4139   29.97  56782.67   744.00   340.00
#> 43  7245.60  31.50   0.44  7214.10    1513  109.63  95886.37  8329.00  4001.10
#> 44  6450.00  26.90   0.42  6423.10     845   54.50  74157.75  6589.00  2910.00
#> 45   616.50   2.30   0.37   614.20    9749   60.10  66315.22   654.40   312.00
#> 46 27755.50  96.75   0.35 27658.75     141   39.14  36924.09 29090.00 15410.00
#> 47  3460.00  12.05   0.35  3447.95     866   29.96  40694.59  4010.00  2100.00
#> 48  1299.00   4.25   0.33  1294.75    3212   41.72  50260.14  1298.50   385.05
#> 49  2605.80   3.50   0.13  2602.30    2632   68.58  36264.71  3037.00  1245.01
#> 50  1472.00   0.85   0.06  1471.15    5260   77.43  61385.13  1621.35   720.90
#>      sumVal sumQnty finQnty sumfinQnty
#> 1  13535.04 1342962   53538    2010060
#> 2  13535.04 1342962   57869    2010060
#> 3  13535.04 1342962   64336    2010060
#> 4  13535.04 1342962  237834    2010060
#> 5  13535.04 1342962   58291    2010060
#> 6  13535.04 1342962   57270    2010060
#> 7  13535.04 1342962  127095    2010060
#> 8  13535.04 1342962    4737    2010060
#> 9  13535.04 1342962   43619    2010060
#> 10 13535.04 1342962   26354    2010060
#> 11 13535.04 1342962   77500    2010060
#> 12 13535.04 1342962    4682    2010060
#> 13 13535.04 1342962   49159    2010060
#> 14 13535.04 1342962   86168    2010060
#> 15 13535.04 1342962    8830    2010060
#> 16 13535.04 1342962    3001    2010060
#> 17 13535.04 1342962   34066    2010060
#> 18 13535.04 1342962   32200    2010060
#> 19 13535.04 1342962    3040    2010060
#> 20 13535.04 1342962   93839    2010060
#> 21 13535.04 1342962    7881    2010060
#> 22 13535.04 1342962   21758    2010060
#> 23 13535.04 1342962    3388    2010060
#> 24 13535.04 1342962  223924    2010060
#> 25 13535.04 1342962   11930    2010060
#> 26 13535.04 1342962   34910    2010060
#> 27 13535.04 1342962     647    2010060
#> 28 13535.04 1342962  176423    2010060
#> 29 13535.04 1342962   11728    2010060
#> 30 13535.04 1342962   25496    2010060
#> 31 13535.04 1342962   52276    2010060
#> 32 13535.04 1342962    4600    2010060
#> 33 13535.04 1342962    7236    2010060
#> 34 13535.04 1342962   40004    2010060
#> 35 13535.04 1342962   72853    2010060
#> 36 13535.04 1342962   16583    2010060
#> 37 13535.04 1342962    7931    2010060
#> 38 13535.04 1342962    3370    2010060
#> 39 13535.04 1342962     256    2010060
#> 40 13535.04 1342962  127686    2010060
#> 41 13535.04 1342962    7395    2010060
#> 42 13535.04 1342962    4139    2010060
#> 43 13535.04 1342962    1513    2010060
#> 44 13535.04 1342962     845    2010060
#> 45 13535.04 1342962    9749    2010060
#> 46 13535.04 1342962     141    2010060
#> 47 13535.04 1342962     866    2010060
#> 48 13535.04 1342962    3212    2010060
#> 49 13535.04 1342962    2632    2010060
#> 50 13535.04 1342962    5260    2010060
```

### Advances & Declines

``` r
nse_advances_declines()
#>                                     index_name advances declines unchanged
#> 1                                     NIFTY 50       43        7         0
#> 2                                NIFTY NEXT 50       40       10         0
#> 3                                     NIFTY IT        9        1         0
#> 4                                   NIFTY BANK       12        0         0
#> 5                              NIFTY MIDCAP 50       37       13         0
#> 6                                  NIFTY INFRA       21        9         0
#> 7                                 NIFTY REALTY        7        3         0
#> 8                                 NIFTY ENERGY        8        2         0
#> 9                                   NIFTY FMCG       13        2         0
#> 10                                   NIFTY MNC       20       10         0
#> 11                                NIFTY PHARMA        8        2         0
#> 12                                   NIFTY PSE       13        7         0
#> 13                              NIFTY PSU BANK       10        1         1
#> 14                           NIFTY SERV SECTOR       29        1         0
#> 15                           NIFTY COMMODITIES       26        4         0
#> 16                           NIFTY CONSUMPTION       22        8         0
#> 17                           NIFTY FIN SERVICE       19        1         0
#> 18                                  NIFTY AUTO        4       11         0
#> 19                           NIFTY DIV OPPS 50       37       13         0
#> 20                                 NIFTY MEDIA        6        4         0
#> 21                                 NIFTY METAL        9        6         0
#> 22                             NIFTY100 LIQ 15       14        1         0
#> 23                                  NIFTY CPSE        8        4         0
#> 24                           NIFTY GROWSECT 15       10        5         0
#> 25                            NIFTY50 VALUE 20       18        2         0
#> 26                           NIFTY100 QUALTY30       23        7         0
#> 27                              NIFTY PVT BANK       10        0         0
#> 28                            NIFTY MID LIQ 15       10        5         0
#> 29                                   NIFTY 100       83       17         0
#> 30                                   NIFTY 200      147       53         0
#> 31                                   NIFTY 500      330      167         4
#> 32                            NIFTY MIDCAP 100       64       36         0
#> 33                            NIFTY SMLCAP 100       58       40         2
#> 34                    NIFTY ADITYA BIRLA GROUP        5        2         0
#> 35                              NIFTY ALPHA 50       39       11         0
#> 36                          NIFTY HIGH BETA 50       43        7         0
#> 37                     NIFTY LOW VOLATILITY 50       39       11         0
#> 38                        NIFTY MAHINDRA GROUP        6        3         0
#> 39                            NIFTY MIDCAP 150       99       51         0
#> 40                       NIFTY MIDSMALLCAP 400      246      150         4
#> 41                            NIFTY SHARIAH 25       20        5         0
#> 42                          NIFTY SMALLCAP 250      147       99         4
#> 43                           NIFTY SMALLCAP 50       26       23         1
#> 44                            NIFTY TATA GROUP       21        4         0
#> 45                    NIFTY TATA GROUP 25% CAP        9        1         0
#> 46                            NIFTY100 EQL WGT       83       17         0
#> 47                           NIFTY100 LOWVOL30       27        3         0
#> 48                             NIFTY50 SHARIAH       16        2         0
#> 49                            NIFTY500 SHARIAH      135       74         0
#> 50                             NIFTY50 EQL WGT       43        7         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       29        1         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       22        8         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30       25        5         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30       26        4         0
#> 55                            NIFTY SME EMERGE       24       18        42
#> 56                       NIFTY LARGEMIDCAP 250      182       68         0
#> 57                           NIFTY500 VALUE 50       36       13         1
#> 58                            NIFTY MIDCAP 150       99       51         0
#> 59                             NIFTY SMLCAP 50       26       23         1
#> 60                            NIFTY SMLCAP 250      147       99         4
#> 61                            NIFTY MIDSML 400      246      150         4
#> 62                           NIFTY200 QUALTY30       21        9         0
#> 63                           NIFTY FINSRV25 50       19        1         0
#> 64                          CNX NIFTY Pre Open       50        0         0

# retain original column names as returned by NSE
nse_advances_declines(clean_names = FALSE)
#>                                        skipped advances declines unchanged
#> 1                                     NIFTY 50       43        7         0
#> 2                                NIFTY NEXT 50       40       10         0
#> 3                                     NIFTY IT        9        1         0
#> 4                                   NIFTY BANK       12        0         0
#> 5                              NIFTY MIDCAP 50       37       13         0
#> 6                                  NIFTY INFRA       21        9         0
#> 7                                 NIFTY REALTY        7        3         0
#> 8                                 NIFTY ENERGY        8        2         0
#> 9                                   NIFTY FMCG       13        2         0
#> 10                                   NIFTY MNC       20       10         0
#> 11                                NIFTY PHARMA        8        2         0
#> 12                                   NIFTY PSE       13        7         0
#> 13                              NIFTY PSU BANK       10        1         1
#> 14                           NIFTY SERV SECTOR       29        1         0
#> 15                           NIFTY COMMODITIES       26        4         0
#> 16                           NIFTY CONSUMPTION       22        8         0
#> 17                           NIFTY FIN SERVICE       19        1         0
#> 18                                  NIFTY AUTO        4       11         0
#> 19                           NIFTY DIV OPPS 50       37       13         0
#> 20                                 NIFTY MEDIA        6        4         0
#> 21                                 NIFTY METAL        9        6         0
#> 22                             NIFTY100 LIQ 15       14        1         0
#> 23                                  NIFTY CPSE        8        4         0
#> 24                           NIFTY GROWSECT 15       10        5         0
#> 25                            NIFTY50 VALUE 20       18        2         0
#> 26                           NIFTY100 QUALTY30       23        7         0
#> 27                              NIFTY PVT BANK       10        0         0
#> 28                            NIFTY MID LIQ 15       10        5         0
#> 29                                   NIFTY 100       83       17         0
#> 30                                   NIFTY 200      147       53         0
#> 31                                   NIFTY 500      330      167         4
#> 32                            NIFTY MIDCAP 100       64       36         0
#> 33                            NIFTY SMLCAP 100       58       40         2
#> 34                    NIFTY ADITYA BIRLA GROUP        5        2         0
#> 35                              NIFTY ALPHA 50       39       11         0
#> 36                          NIFTY HIGH BETA 50       43        7         0
#> 37                     NIFTY LOW VOLATILITY 50       39       11         0
#> 38                        NIFTY MAHINDRA GROUP        6        3         0
#> 39                            NIFTY MIDCAP 150       99       51         0
#> 40                       NIFTY MIDSMALLCAP 400      246      150         4
#> 41                            NIFTY SHARIAH 25       20        5         0
#> 42                          NIFTY SMALLCAP 250      147       99         4
#> 43                           NIFTY SMALLCAP 50       26       23         1
#> 44                            NIFTY TATA GROUP       21        4         0
#> 45                    NIFTY TATA GROUP 25% CAP        9        1         0
#> 46                            NIFTY100 EQL WGT       83       17         0
#> 47                           NIFTY100 LOWVOL30       27        3         0
#> 48                             NIFTY50 SHARIAH       16        2         0
#> 49                            NIFTY500 SHARIAH      135       74         0
#> 50                             NIFTY50 EQL WGT       43        7         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       29        1         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       22        8         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30       25        5         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30       26        4         0
#> 55                            NIFTY SME EMERGE       24       18        42
#> 56                       NIFTY LARGEMIDCAP 250      182       68         0
#> 57                           NIFTY500 VALUE 50       36       13         1
#> 58                            NIFTY MIDCAP 150       99       51         0
#> 59                             NIFTY SMLCAP 50       26       23         1
#> 60                            NIFTY SMLCAP 250      147       99         4
#> 61                            NIFTY MIDSML 400      246      150         4
#> 62                           NIFTY200 QUALTY30       21        9         0
#> 63                           NIFTY FINSRV25 50       19        1         0
#> 64                          CNX NIFTY Pre Open       50        0         0
```
