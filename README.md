
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
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html)
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
#>           index_name last_traded_price  change percent_change
#> 1  NIFTY 50 Pre Open        15042.6000   12.45           0.08
#> 2           NIFTY 50        14906.0500 -124.10          -0.83
#> 3      NIFTY NEXT 50        36946.6000  -20.70          -0.06
#> 4    NIFTY100 LIQ 15         3785.5000  -38.15          -1.00
#> 5         NIFTY BANK        33334.5500 -350.65          -1.04
#> 6          INDIA VIX           19.6525    0.34           1.73
#> 7          NIFTY 100        15164.4500 -108.10          -0.71
#> 8          NIFTY 500        12736.4500  -72.55          -0.57
#> 9   NIFTY MIDCAP 100        25211.7000  -21.10          -0.08
#> 10   NIFTY MIDCAP 50         7026.5000  -20.10          -0.29
#> 11       NIFTY INFRA         4166.8500  -24.20          -0.58
#> 12      NIFTY REALTY          317.0000    3.20           1.02
#> 13      NIFTY ENERGY        19155.5000 -152.60          -0.79
#> 14        NIFTY FMCG        34475.6000 -254.10          -0.73
#> 15         NIFTY MNC        16573.4500  -86.30          -0.52
#> 16      NIFTY PHARMA        13970.2000  -31.15          -0.22
#> 17         NIFTY PSE         3446.5000  -54.20          -1.55
#> 18    NIFTY PSU BANK         2262.2000    8.20           0.36
#> 19 NIFTY SERV SECTOR        20689.2500 -161.40          -0.77
#> 20          NIFTY IT        25894.4500  -88.35          -0.34
#> 21  NIFTY SMLCAP 100         9036.9000  -15.45          -0.17
#> 22         NIFTY 200         7894.3000  -49.95          -0.63
#> 23        NIFTY AUTO        10226.4000  -22.70          -0.22
#> 24       NIFTY MEDIA         1651.3000   -3.90          -0.24
#> 25       NIFTY METAL         5077.3500 -168.60          -3.21
#> 26 NIFTY DIV OPPS 50         3144.1000  -24.15          -0.76
#> 27 NIFTY COMMODITIES         4980.9000  -60.05          -1.19
#> 28 NIFTY CONSUMPTION         6022.2500  -34.30          -0.57
#> 29        NIFTY CPSE         1969.0000  -34.20          -1.71
#> 30 NIFTY FIN SERVICE        15832.4000 -149.05          -0.93
#> 31 NIFTY GROWSECT 15         7375.9500   -7.15          -0.10
#> 32  NIFTY50 VALUE 20         7582.4000  -58.50          -0.77
#> 33 NIFTY50 TR 2X LEV         8963.1000 -151.35          -1.66
#> 34 NIFTY50 PR 2X LEV         6709.5500 -113.30          -1.66
#> 35 NIFTY50 TR 1X INV          254.6500    2.10           0.83
#> 36 NIFTY50 PR 1X INV          294.2000    2.45           0.84
#> 37    NIFTY ALPHA 50        25527.7500  -60.60          -0.24
#> 38   NIFTY50 EQL WGT        16892.8000 -166.85          -0.98
#> 39  NIFTY100 EQL WGT        18013.5500  -91.45          -0.51
#> 40 NIFTY100 LOWVOL30        11707.3000  -44.90          -0.38
#> 41  NIFTY MID LIQ 15         6079.5000    8.40           0.14
#> 42    NIFTY PVT BANK        17670.4500 -177.40          -0.99
#> 43 NIFTY100 QUALTY30         3410.3000  -19.75          -0.58
#> 44   NIFTY GS 8 13YR         2268.4000    2.68           0.11
#> 45     NIFTY GS 10YR         2062.0200    1.69           0.08
#> 46 NIFTY GS 10YR CLN          959.8500    0.65           0.06
#> 47    NIFTY GS 4 8YR         2422.3500    3.22           0.13
#> 48  NIFTY GS 11 15YR         2431.8400    3.55           0.14
#> 49 NIFTY GS 15YRPLUS         2652.9300    2.80           0.10
#> 50 NIFTY GS COMPSITE         2313.9200    2.77           0.12
#> 51  NIFTY MIDCAP 150         9482.0000  -13.00          -0.14
#> 52   NIFTY SMLCAP 50         4495.7000   -2.00          -0.04
#> 53  NIFTY SMLCAP 250         7775.3000   15.05           0.19
#> 54  NIFTY MIDSML 400         8868.5000   -3.15          -0.04
#> 55 NIFTY200 QUALTY30        12631.8000  -72.75          -0.57

# retain original column names as returned by NSE
nse_index_quote(clean_names = FALSE)
#>              skipped  lastPrice  change pChange
#> 1  NIFTY 50 Pre Open 15042.6000   12.45    0.08
#> 2           NIFTY 50 14906.0500 -124.10   -0.83
#> 3      NIFTY NEXT 50 36946.6000  -20.70   -0.06
#> 4    NIFTY100 LIQ 15  3785.5000  -38.15   -1.00
#> 5         NIFTY BANK 33334.5500 -350.65   -1.04
#> 6          INDIA VIX    19.6525    0.34    1.73
#> 7          NIFTY 100 15164.4500 -108.10   -0.71
#> 8          NIFTY 500 12736.4500  -72.55   -0.57
#> 9   NIFTY MIDCAP 100 25211.7000  -21.10   -0.08
#> 10   NIFTY MIDCAP 50  7026.5000  -20.10   -0.29
#> 11       NIFTY INFRA  4166.8500  -24.20   -0.58
#> 12      NIFTY REALTY   317.0000    3.20    1.02
#> 13      NIFTY ENERGY 19155.5000 -152.60   -0.79
#> 14        NIFTY FMCG 34475.6000 -254.10   -0.73
#> 15         NIFTY MNC 16573.4500  -86.30   -0.52
#> 16      NIFTY PHARMA 13970.2000  -31.15   -0.22
#> 17         NIFTY PSE  3446.5000  -54.20   -1.55
#> 18    NIFTY PSU BANK  2262.2000    8.20    0.36
#> 19 NIFTY SERV SECTOR 20689.2500 -161.40   -0.77
#> 20          NIFTY IT 25894.4500  -88.35   -0.34
#> 21  NIFTY SMLCAP 100  9036.9000  -15.45   -0.17
#> 22         NIFTY 200  7894.3000  -49.95   -0.63
#> 23        NIFTY AUTO 10226.4000  -22.70   -0.22
#> 24       NIFTY MEDIA  1651.3000   -3.90   -0.24
#> 25       NIFTY METAL  5077.3500 -168.60   -3.21
#> 26 NIFTY DIV OPPS 50  3144.1000  -24.15   -0.76
#> 27 NIFTY COMMODITIES  4980.9000  -60.05   -1.19
#> 28 NIFTY CONSUMPTION  6022.2500  -34.30   -0.57
#> 29        NIFTY CPSE  1969.0000  -34.20   -1.71
#> 30 NIFTY FIN SERVICE 15832.4000 -149.05   -0.93
#> 31 NIFTY GROWSECT 15  7375.9500   -7.15   -0.10
#> 32  NIFTY50 VALUE 20  7582.4000  -58.50   -0.77
#> 33 NIFTY50 TR 2X LEV  8963.1000 -151.35   -1.66
#> 34 NIFTY50 PR 2X LEV  6709.5500 -113.30   -1.66
#> 35 NIFTY50 TR 1X INV   254.6500    2.10    0.83
#> 36 NIFTY50 PR 1X INV   294.2000    2.45    0.84
#> 37    NIFTY ALPHA 50 25527.7500  -60.60   -0.24
#> 38   NIFTY50 EQL WGT 16892.8000 -166.85   -0.98
#> 39  NIFTY100 EQL WGT 18013.5500  -91.45   -0.51
#> 40 NIFTY100 LOWVOL30 11707.3000  -44.90   -0.38
#> 41  NIFTY MID LIQ 15  6079.5000    8.40    0.14
#> 42    NIFTY PVT BANK 17670.4500 -177.40   -0.99
#> 43 NIFTY100 QUALTY30  3410.3000  -19.75   -0.58
#> 44   NIFTY GS 8 13YR  2268.4000    2.68    0.11
#> 45     NIFTY GS 10YR  2062.0200    1.69    0.08
#> 46 NIFTY GS 10YR CLN   959.8500    0.65    0.06
#> 47    NIFTY GS 4 8YR  2422.3500    3.22    0.13
#> 48  NIFTY GS 11 15YR  2431.8400    3.55    0.14
#> 49 NIFTY GS 15YRPLUS  2652.9300    2.80    0.10
#> 50 NIFTY GS COMPSITE  2313.9200    2.77    0.12
#> 51  NIFTY MIDCAP 150  9482.0000  -13.00   -0.14
#> 52   NIFTY SMLCAP 50  4495.7000   -2.00   -0.04
#> 53  NIFTY SMLCAP 250  7775.3000   15.05    0.19
#> 54  NIFTY MIDSML 400  8868.5000   -3.15   -0.04
#> 55 NIFTY200 QUALTY30 12631.8000  -72.75   -0.57
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#>        symbol series last_corp_announcement_date
#> 1       CIPLA     EQ                  2020-08-11
#> 2         M&M     EQ                  2020-07-16
#> 3        BPCL     EQ                  2021-03-25
#> 4  INDUSINDBK     EQ                  2019-08-08
#> 5       TITAN     EQ                  2020-08-03
#> 6        SBIN     EQ                  2018-06-15
#> 7          LT     EQ                  2020-11-04
#> 8        INFY     EQ                  2021-05-31
#> 9  BAJAJFINSV     EQ                  2020-03-03
#> 10   HDFCLIFE     EQ                  2019-07-11
#>                                            last_corp_announcement open_price
#> 1                                          Annual General Meeting     906.00
#> 2             Annual General Meeting/Dividend - Rs 2.35 Per Share     784.05
#> 3                               Interim Dividend - Rs 5 Per Share     448.00
#> 4             Annual General Meeting/Dividend - Rs 7.50 Per Share     963.00
#> 5                Annual General Meeting/Dividend - Rs 4 Per Share    1523.00
#> 6  Annual General Meeting/ Change In Registrar And Transfer Agent     387.00
#> 7                              Special Dividend - Rs 18 Per Share    1410.80
#> 8               Annual General Meeting/Dividend - Rs 15 Per Share    1348.40
#> 9                               Interim Dividend - Rs 5 Per Share   11260.00
#> 10                                         Annual General Meeting     669.00
#>    high_price low_price last_traded_price prev_close_price percent_change
#> 1      927.90    905.00            925.50           903.95           2.38
#> 2      809.55    782.00            803.00           784.80           2.32
#> 3      457.85    441.50            455.80           446.45           2.09
#> 4      987.90    963.00            976.50           967.00           0.98
#> 5     1566.25   1522.50           1535.50          1521.15           0.94
#> 6      387.80    382.00            386.80           384.40           0.62
#> 7     1426.95   1401.65           1409.35          1403.45           0.42
#> 8     1349.10   1335.00           1341.95          1337.00           0.37
#> 9    11299.95  11130.70          11250.05         11215.15           0.31
#> 10     679.00    665.70            667.85           666.15           0.26
#>    traded_quantity turnover_in_lakhs
#> 1         12378690         113846.81
#> 2         10092542          80881.63
#> 3          9399907          42447.16
#> 4          5835440          57058.35
#> 5          3032029          46950.67
#> 6         42898608         164910.83
#> 7          1996254          28255.38
#> 8          4490092          60203.15
#> 9           177897          19964.56
#> 10         4316905          29073.92

# retain original column names as returned by NSE
nse_stock_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1       CIPLA     EQ               2020-08-11
#> 2         M&M     EQ               2020-07-16
#> 3        BPCL     EQ               2021-03-25
#> 4  INDUSINDBK     EQ               2019-08-08
#> 5       TITAN     EQ               2020-08-03
#> 6        SBIN     EQ               2018-06-15
#> 7          LT     EQ               2020-11-04
#> 8        INFY     EQ               2021-05-31
#> 9  BAJAJFINSV     EQ               2020-03-03
#> 10   HDFCLIFE     EQ               2019-07-11
#>                                              lastCorpAnnouncement openPrice
#> 1                                          Annual General Meeting    906.00
#> 2             Annual General Meeting/Dividend - Rs 2.35 Per Share    784.05
#> 3                               Interim Dividend - Rs 5 Per Share    448.00
#> 4             Annual General Meeting/Dividend - Rs 7.50 Per Share    963.00
#> 5                Annual General Meeting/Dividend - Rs 4 Per Share   1523.00
#> 6  Annual General Meeting/ Change In Registrar And Transfer Agent    387.00
#> 7                              Special Dividend - Rs 18 Per Share   1410.80
#> 8               Annual General Meeting/Dividend - Rs 15 Per Share   1348.40
#> 9                               Interim Dividend - Rs 5 Per Share  11260.00
#> 10                                         Annual General Meeting    669.00
#>    highPrice lowPrice      ltp previousPrice netPrice tradedQuantity
#> 1     927.90   905.00   925.50        903.95     2.38       12378690
#> 2     809.55   782.00   803.00        784.80     2.32       10092542
#> 3     457.85   441.50   455.80        446.45     2.09        9399907
#> 4     987.90   963.00   976.50        967.00     0.98        5835440
#> 5    1566.25  1522.50  1535.50       1521.15     0.94        3032029
#> 6     387.80   382.00   386.80        384.40     0.62       42898608
#> 7    1426.95  1401.65  1409.35       1403.45     0.42        1996254
#> 8    1349.10  1335.00  1341.95       1337.00     0.37        4490092
#> 9   11299.95 11130.70 11250.05      11215.15     0.31         177897
#> 10    679.00   665.70   667.85        666.15     0.26        4316905
#>    turnoverInLakhs
#> 1        113846.81
#> 2         80881.63
#> 3         42447.16
#> 4         57058.35
#> 5         46950.67
#> 6        164910.83
#> 7         28255.38
#> 8         60203.15
#> 9         19964.56
#> 10        29073.92
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#>         symbol
#> 1    20MICRONS
#> 2   ADANITRANS
#> 3      AGARIND
#> 4       AJOONI
#> 5   AMRUTANJAN
#> 6    ANGELBRKG
#> 7   APCOTEXIND
#> 8   APOLSINHOT
#> 9   ARROWGREEN
#> 10   AUTOAXLES
#> 11      AVTNPL
#> 12  AXISBPSETF
#> 13   AYMSYNTEX
#> 14   BALAMINES
#> 15         BEL
#> 16  BHARATGEAR
#> 17        BHEL
#> 18  BIRLACORPN
#> 19      BROOKS
#> 20       BSHSL
#> 21     BURNPUR
#> 22        BVCL
#> 23  CASTEXTECH
#> 24  CENTURYPLY
#> 25  CHAMBLFERT
#> 26   CONTROLPR
#> 27  COSMOFILMS
#> 28     CSBBANK
#> 29      CYIENT
#> 30      DCMNVL
#> 31         DCW
#> 32    DECCANCE
#> 33  DEEPAKFERT
#> 34   DHARSUGAR
#> 35    DNAMEDIA
#> 36  DYNAMATECH
#> 37       EMMBI
#> 38  EVERESTIND
#> 39  FAIRCHEMOR
#> 40     FINEORG
#> 41         FSL
#> 42        GAEL
#> 43    GBGLOBAL
#> 44         GDL
#> 45  GENUSPAPER
#> 46   GINNIFILA
#> 47  GREENPANEL
#> 48        GSFC
#> 49        HFCL
#> 50     HGINFRA
#> 51         HIL
#> 52   HINDPETRO
#> 53  HITECHCORP
#> 54     HLEGLAS
#> 55    ICICILIQ
#> 56    INDIACEM
#> 57  INEOSSTYRO
#> 58    INFOBEAN
#> 59         IOC
#> 60        ISEC
#> 61   JKLAKSHMI
#> 62  KALPATPOWR
#> 63       KARDA
#> 64    KENNAMET
#> 65    KHAICHEM
#> 66      KINGFA
#> 67    KPITTECH
#> 68         KSB
#> 69     LAOPALA
#> 70  LICNETFN50
#> 71    LYKALABS
#> 72  MANAKALUCO
#> 73   MANGLMCEM
#> 74      MARINE
#> 75   MOLDTKPAC
#> 76   MUKANDLTD
#> 77    NAGAFERT
#> 78  NAHARINDUS
#> 79  NAHARSPING
#> 80      NBIFIN
#> 81      NCLIND
#> 82        NDTV
#> 83        NETF
#> 84   NITINSPIN
#> 85     NITIRAJ
#> 86   ORIENTCEM
#> 87   ORIENTHOT
#> 88   PATINTLOG
#> 89        PGIL
#> 90  PHILIPCARB
#> 91  PIDILITIND
#> 92     POKARNA
#> 93     POLYMED
#> 94      PRECAM
#> 95      PRECOT
#> 96  PRINCEPIPE
#> 97    PROINDIA
#> 98    RAMCOIND
#> 99      RELAXO
#> 100       RSWM
#> 101   RTNINDIA
#> 102     SAGCEM
#> 103     SALONA
#> 104  SANGAMIND
#> 105  SANGHIIND
#> 106  SARLAPOLY
#> 107       SDBL
#> 108    SEPOWER
#> 109 SHAKTIPUMP
#> 110 SHAREINDIA
#> 111 SHIVAMILLS
#> 112  SHREERAMA
#> 113 SHRIRAMCIT
#> 114   SIMBHALS
#> 115       SPIC
#> 116 SURYALAXMI
#> 117 SURYAROSNI
#> 118      SUULD
#> 119       TAKE
#> 120 TANTIACONS
#> 121    TARAPUR
#> 122 TATACOFFEE
#> 123        TCI
#> 124     TCIEXP
#> 125 TCNSBRANDS
#> 126     TECHIN
#> 127 TEXMOPIPES
#> 128  TIDEWATER
#> 129 TIPSINDLTD
#> 130 TIRUMALCHM
#> 131 TV18BRDCST
#> 132    TVTODAY
#> 133 UNICHEMLAB
#> 134 UNIVCABLES
#> 135        VHL
#> 136 VINDHYATEL
#> 137  VISAKAIND
#> 138     VISHNU
#> 139 VLSFINANCE
#> 140 WALCHANNAG
#> 141 WOCKPHARMA
#> 142   ZEEMEDIA
#>                                                            symbol_desc
#> 1                                                   20 Microns Limited
#> 2                                           Adani Transmission Limited
#> 3                               Agarwal Industrial Corporation Limited
#> 4                                               Ajooni Biotech Limited
#> 5                                       Amrutanjan Health Care Limited
#> 6                                                Angel Broking Limited
#> 7                                           Apcotex Industries Limited
#> 8                                       Apollo Sindoori Hotels Limited
#> 9                                              Arrow Greentech Limited
#> 10                                            Automotive Axles Limited
#> 11                                        AVT Natural Products Limited
#> 12       Axis Mutual Fund - Axis AAA Bond Plus SDL ETF - 2026 Maturity
#> 13                                                  AYM Syntex Limited
#> 14                                               Balaji Amines Limited
#> 15                                          Bharat Electronics Limited
#> 16                                                Bharat Gears Limited
#> 17                                    Bharat Heavy Electricals Limited
#> 18                                           Birla Corporation Limited
#> 19                                         Brooks Laboratories Limited
#> 20                                   Bombay Super Hybrid Seeds Limited
#> 21                                              Burnpur Cement Limited
#> 22                                        Barak Valley Cements Limited
#> 23                                         Castex Technologies Limited
#> 24                                   Century Plyboards (India) Limited
#> 25                             Chambal Fertilizers & Chemicals Limited
#> 26                                               Control Print Limited
#> 27                                                 Cosmo Films Limited
#> 28                                                    CSB Bank Limited
#> 29                                                      Cyient Limited
#> 30                                                DCM Nouvelle Limited
#> 31                                                         DCW Limited
#> 32                                              Deccan Cements Limited
#> 33           Deepak Fertilizers and Petrochemicals Corporation Limited
#> 34                                  Dharani Sugars & Chemicals Limited
#> 35                                  Diligent Media Corporation Limited
#> 36                                      Dynamatic Technologies Limited
#> 37                                            Emmbi Industries Limited
#> 38                                          Everest Industries Limited
#> 39                                           Fairchem Organics Limited
#> 40                                     Fine Organic Industries Limited
#> 41                                       Firstsource Solutions Limited
#> 42                                      Gujarat Ambuja Exports Limited
#> 43                                                   GB Global Limited
#> 44                                         Gateway Distriparks Limited
#> 45                                        Genus Paper & Boards Limited
#> 46                                             Ginni Filaments Limited
#> 47                                       Greenpanel Industries Limited
#> 48                       Gujarat State Fertilizers & Chemicals Limited
#> 49                                                        HFCL Limited
#> 50                                      H.G. Infra Engineering Limited
#> 51                                                         HIL Limited
#> 52                             Hindustan Petroleum Corporation Limited
#> 53                                          Hitech Corporation Limited
#> 54                                                HLE Glascoat Limited
#> 55  ICICI Prudential Mutual Fund - ICICI Prudential Liquid ETF - NO NA
#> 56                                           The India Cements Limited
#> 57                                     INEOS Styrolution India Limited
#> 58                                      InfoBeans Technologies Limited
#> 59                                      Indian Oil Corporation Limited
#> 60                                            ICICI Securities Limited
#> 61                                           JK Lakshmi Cement Limited
#> 62                                Kalpataru Power Transmission Limited
#> 63                                         Karda Constructions Limited
#> 64                                            Kennametal India Limited
#> 65                             Khaitan Chemicals & Fertilizers Limited
#> 66                         Kingfa Science & Technology (India) Limited
#> 67                                           KPIT Technologies Limited
#> 68                                                         Ksb Limited
#> 69                                                 La Opala RG Limited
#> 70                     LIC MF - LIC MF EXCHANGE TRADED FUND - NIFTY 50
#> 71                                                   Lyka Labs Limited
#> 72                                  Manaksia Aluminium Company Limited
#> 73                                             Mangalam Cement Limited
#> 74                                  Marine Electricals (India) Limited
#> 75                                          Mold-Tek Packaging Limited
#> 76                                                      Mukand Limited
#> 77                         Nagarjuna Fertilizers and Chemicals Limited
#> 78                                Nahar Industrial Enterprises Limited
#> 79                                        Nahar Spinning Mills Limited
#> 80                         N. B. I. Industrial Finance Company Limited
#> 81                                              NCL Industries Limited
#> 82                                        New Delhi Television Limited
#> 83                                     Tata Nifty Exchange Traded Fund
#> 84                                              Nitin Spinners Limited
#> 85                                           Nitiraj Engineers Limited
#> 86                                               Orient Cement Limited
#> 87                                             Oriental Hotels Limited
#> 88                                  Patel Integrated Logistics Limited
#> 89                                     Pearl Global Industries Limited
#> 90                                       Phillips Carbon Black Limited
#> 91                                         Pidilite Industries Limited
#> 92                                                     Pokarna Limited
#> 93                                               Poly Medicure Limited
#> 94                                         Precision Camshafts Limited
#> 95                                                      Precot Limited
#> 96                                   Prince Pipes And Fittings Limited
#> 97                                               Proseed India Limited
#> 98                                            Ramco Industries Limited
#> 99                                            Relaxo Footwears Limited
#> 100                                                       RSWM Limited
#> 101                                    RattanIndia Enterprises Limited
#> 102                                              Sagar Cements Limited
#> 103                                             Salona Cotspin Limited
#> 104                                             Sangam (India) Limited
#> 105                                          Sanghi Industries Limited
#> 106                                   Sarla Performance Fibers Limited
#> 107                               Som Distilleries & Breweries Limited
#> 108                                                 S.E. Power Limited
#> 109                                       Shakti Pumps (India) Limited
#> 110                                     Share India Securities Limited
#> 111                                                Shiva Mills Limited
#> 112                                      Shree Rama Multi-Tech Limited
#> 113                                 Shriram City Union Finance Limited
#> 114                                           Simbhaoli Sugars Limited
#> 115            Southern Petrochemicals Industries Corporation  Limited
#> 116                                  Suryalakshmi Cotton Mills Limited
#> 117                                               Surya Roshni Limited
#> 118                                         Suumaya Industries Limited
#> 119                                             Take Solutions Limited
#> 120                                       Tantia Constructions Limited
#> 121                                       Tarapur Transformers Limited
#> 122                                                Tata Coffee Limited
#> 123                             Transport Corporation of India Limited
#> 124                                                TCI Express Limited
#> 125                                          TCNS Clothing Co. Limited
#> 126                                           Techindia Nirman Limited
#> 127                                   Texmo Pipes and Products Limited
#> 128                             Tide Water Oil Company (India) Limited
#> 129                                            TIPS Industries Limited
#> 130                                       Thirumalai Chemicals Limited
#> 131                                             TV18 Broadcast Limited
#> 132                                           TV Today Network Limited
#> 133                                       Unichem Laboratories Limited
#> 134                                           Universal Cables Limited
#> 135                                          Vardhman Holdings Limited
#> 136                                          Vindhya Telelinks Limited
#> 137                                          Visaka Industries Limited
#> 138                                           Vishnu Chemicals Limited
#> 139                                                VLS Finance Limited
#> 140                                   Walchandnagar Industries Limited
#> 141                                                  Wockhardt Limited
#> 142                                      Zee Media Corporation Limited
#>           date new_high    year last_traded_price prev_high prev_close change
#> 1   2021-05-18    65.50   65.50             65.50     58.65      54.60  10.90
#> 2   2021-05-19  1389.50 1389.50           1389.50   1323.35    1323.35  66.15
#> 3   2021-05-19   219.50  219.50            218.85    215.25     213.95   4.90
#> 4   2021-05-19    56.05   56.05             56.00     53.75      53.75   2.25
#> 5   2021-05-19   762.00  762.00            743.00    760.00     747.70  -4.70
#> 6   2021-05-12   719.30  719.30            719.30    690.00     685.05  34.25
#> 7   2021-05-19   385.00  385.00            369.90    369.95     359.00  10.90
#> 8   2020-08-19   800.00  800.00            749.00    704.65     670.70  78.30
#> 9   2021-05-19   116.90  116.90            116.90    111.35     111.35   5.55
#> 10  2021-02-24  1400.20 1400.20           1400.20   1250.00    1166.85 233.35
#> 11  2021-05-12    60.40   60.40             58.70     57.75      55.00   3.70
#> 12  2021-05-19    10.41   10.41             10.12     10.12      10.11   0.02
#> 13  2021-05-19    64.95   64.95             61.50     62.80      61.90  -0.40
#> 14  2021-05-19  2764.95 2764.95           2680.00   2739.90    2713.70 -33.70
#> 15  2021-05-19   158.70  158.70            157.40    157.90     155.15   2.25
#> 16  2021-05-19   119.00  119.00            112.75    104.95     102.00  10.75
#> 17  2021-05-12    77.70   77.70             72.40     76.60      73.75  -1.35
#> 18  2021-05-19  1384.80 1384.80           1258.00   1373.95    1318.20 -60.20
#> 19  2021-05-12    93.80   93.80             93.00     91.50      89.35   3.65
#> 20  2021-05-19   186.65  186.65            186.65    177.80     177.80   8.85
#> 21  2021-01-11     3.20    3.20              3.20      3.20       3.05   0.15
#> 22  2021-05-19    22.35   22.35             22.35     21.40      21.30   1.05
#> 23  2021-05-19     0.90    0.90              0.80      0.85       0.85  -0.05
#> 24  2021-05-19   400.00  400.00            383.15    395.90     391.35  -8.20
#> 25  2021-05-19   310.45  310.45            292.00    289.50     284.55   7.45
#> 26  2021-05-10   380.15  380.15            380.15    340.00     316.80  63.35
#> 27  2021-05-19   801.80  801.80            800.00    786.00     762.85  37.15
#> 28  2021-05-19   346.20  346.20            305.50    325.00     320.00 -14.50
#> 29  2021-05-19   830.00  830.00            828.00    819.90     794.00  34.00
#> 30  2021-05-19   120.45  120.45            120.45    114.75     114.75   5.70
#> 31  2021-05-19    40.90   40.90             39.00     40.75      40.05  -1.05
#> 32  2021-05-19   504.95  504.95            492.00    485.00     482.80   9.20
#> 33  2021-05-12   308.95  308.95            295.20    297.65     288.25   6.95
#> 34  2021-05-19    11.90   11.90             11.90     11.35      11.35   0.55
#> 35  2021-05-19     1.65    1.65              1.65      1.60       1.60   0.05
#> 36  2021-04-01  1241.80 1241.80           1241.80   1111.00    1034.85 206.95
#> 37  2021-05-07   108.50  108.50            104.00    105.20      98.35   5.65
#> 38  2021-05-19   376.90  376.90            366.50    372.00     359.55   6.95
#> 39  2021-05-11   899.00  899.00            862.00    874.70     827.40  34.60
#> 40  2021-05-19  3548.00 3548.00           3520.90   3424.00    3371.35 149.55
#> 41  2021-05-19   142.00  142.00            140.10    138.50     137.40   2.70
#> 42  2021-05-19   185.00  185.00            179.75    184.00     179.60   0.15
#> 43  2021-05-19     9.90    9.90              9.90      9.45       9.45   0.45
#> 44  2021-05-18   296.20  296.20            286.00    291.60     277.10   8.90
#> 45  2020-12-22     8.90    8.90              8.75      8.90       8.40   0.35
#> 46  2021-05-19    33.50   33.50             32.00     32.65      31.70   0.30
#> 47  2021-05-19   268.00  268.00            262.25    256.30     256.25   6.00
#> 48  2021-05-18   125.00  125.00            121.60    122.40     117.90   3.70
#> 49  2021-05-17    45.40   45.40             44.40     43.75      41.80   2.60
#> 50  2021-05-17   378.40  378.40            359.95    367.00     339.75  20.20
#> 51  2021-05-19  4873.70 4873.70           4749.90   4550.00    4521.40 228.50
#> 52  2021-05-19   274.80  274.80            267.00    273.65     272.75  -5.75
#> 53  2021-05-07   178.45  178.45            178.00    177.30     169.55   8.45
#> 54  2021-05-19  3260.00 3260.00           3250.00   3186.30    3134.55 115.45
#> 55  2020-12-18  1040.00 1040.00           1000.00   1014.30     999.99   0.01
#> 56  2021-04-09   200.00  200.00            199.80    195.00     178.35  21.45
#> 57  2021-05-19  1475.00 1475.00           1385.05   1324.00    1305.25  79.80
#> 58  2021-04-27   230.00  230.00            230.00    223.30     208.80  21.20
#> 59  2021-05-19   109.70  109.70            104.75    108.95     107.20  -2.45
#> 60  2020-07-16   583.00  583.00            581.40    568.90     551.95  29.45
#> 61  2021-04-09   470.00  470.00            466.00    467.00     444.70  21.30
#> 62  2021-04-08   408.95  408.95            401.95    407.00     389.65  12.30
#> 63  2021-05-19   183.20  183.20            183.20    174.50     174.50   8.70
#> 64  2021-02-26  1333.75 1333.75           1292.00   1240.00    1193.85  98.15
#> 65  2021-05-12    37.55   37.55             35.25     36.90      34.85   0.40
#> 66  2021-05-19  1079.80 1079.80            990.00   1037.65    1037.65 -47.65
#> 67  2021-05-18   250.60  250.60            243.00    244.25     240.00   3.00
#> 68  2021-05-07   999.80  999.80            939.00    963.70     915.25  23.75
#> 69  2020-08-26   278.15  278.15            278.15    251.85     231.80  46.35
#> 70  2021-05-12   191.66  191.66            191.66    189.55     189.32   2.34
#> 71  2021-05-19    57.55   57.55             57.55     54.85      54.85   2.70
#> 72  2021-05-19    18.10   18.10             18.10     17.25      17.25   0.85
#> 73  2021-05-19   327.50  327.50            324.60    325.00     318.15   6.45
#> 74  2021-05-19    87.70   87.70             84.50     86.35      84.25   0.25
#> 75  2021-05-04   490.35  490.35            470.30    490.00     477.05  -6.75
#> 76  2021-05-19   131.90  131.90            131.90    125.65     125.65   6.25
#> 77  2021-05-19    10.15   10.15             10.15      9.70       9.70   0.45
#> 78  2021-05-19    62.95   62.95             58.65     61.40      61.15  -2.50
#> 79  2021-05-19   145.95  145.95            135.25    139.00     139.00  -3.75
#> 80  2021-05-19  2405.55 2405.55           2405.55   2040.00    2004.65 400.90
#> 81  2021-05-19   205.95  205.95            200.00    205.55     202.10  -2.10
#> 82  2021-05-06    74.60   74.60             74.20     72.75      71.05   3.15
#> 83  2021-02-10   186.00  186.00            186.00    185.65     183.38   2.62
#> 84  2021-05-18   124.00  124.00            120.55    123.60     119.65   0.90
#> 85  2021-05-19    47.80   47.80             47.80     45.55      45.55   2.25
#> 86  2021-05-18   137.30  137.30            135.00    132.40     126.80   8.20
#> 87  2021-05-19    30.45   30.45             29.50     29.55      28.95   0.55
#> 88  2021-05-19    32.00   32.00             30.05     29.35      29.35   0.70
#> 89  2020-12-18   237.45  237.45            229.05    204.85     197.90  31.15
#> 90  2021-05-19   237.40  237.40            231.65    235.90     225.85   5.80
#> 91  2021-05-19  1950.00 1950.00           1938.30   1947.25    1920.95  17.35
#> 92  2021-05-18   328.65  328.65            328.65    285.95     273.90  54.75
#> 93  2021-04-23  1089.80 1089.80           1070.00   1085.15    1015.55  54.45
#> 94  2021-05-19    58.70   58.70             57.00     55.00      54.70   2.30
#> 95  2021-05-19   164.50  164.50            159.85    156.70     156.70   3.15
#> 96  2021-05-19   702.95  702.95            688.65    702.00     696.25  -7.60
#> 97        <NA>     1.45    1.45              1.45        NA       0.40   0.05
#> 98  2021-05-19   305.00  305.00            300.40    302.90     293.90   6.50
#> 99  2021-05-19  1085.00 1085.00           1015.00   1035.00    1011.95   3.05
#> 100 2021-05-19   251.00  251.00            242.15    246.25     237.85   4.30
#> 101 2021-05-19    17.10   17.10             17.10     16.30      16.30   0.80
#> 102 2021-05-19   923.55  923.55            905.30    910.00     888.60  16.70
#> 103 2021-05-19   115.05  115.05            105.00    115.00     114.10  -9.10
#> 104 2021-05-19   109.70  109.70            106.00    104.50     104.50   1.50
#> 105 2021-05-19    51.20   51.20             49.40     50.45      48.70   0.70
#> 106 2021-05-19    38.50   38.50             37.40     37.45      36.75   0.65
#> 107 2021-05-19    46.35   46.35             43.90     45.30      44.15  -0.25
#> 108 2021-05-19     5.90    5.90              5.90      5.65       5.65   0.25
#> 109 2021-05-19   744.80  744.80            703.00    651.90     620.70  82.30
#> 110 2021-05-19   491.15  491.15            460.50    483.00     471.35 -10.85
#> 111 2021-05-19    63.00   63.00             61.50     61.95      60.25   1.25
#> 112 2021-05-06    14.95   14.95             14.75     13.95      13.00   1.75
#> 113 2021-05-19  1791.70 1791.70           1732.45   1778.85    1726.25   6.20
#> 114 2021-05-19    15.50   15.50             15.50     14.80      14.80   0.70
#> 115 2021-05-19    48.40   48.40             45.60     47.50      46.45  -0.85
#> 116 2021-05-19    50.20   50.20             47.65     47.90      47.85  -0.20
#> 117 2021-05-07   476.50  476.50            467.60    468.80     454.35  13.25
#> 118 2021-05-10   323.85  323.85            321.00    322.65     315.40   5.60
#> 119 2021-05-19    72.90   72.90             69.10     71.70      68.45   0.65
#> 120 2021-05-19    10.50   10.50             10.00     10.00      10.00   0.00
#> 121 2021-05-19     5.00    5.00              5.00      4.80       4.80   0.20
#> 122 2021-05-11   185.85  185.85            182.00    180.90     177.80   4.20
#> 123 2021-05-19   310.00  310.00            303.00    310.00     295.45   7.55
#> 124 2021-05-18  1299.00 1299.00           1265.00   1140.00    1083.60 181.40
#> 125 2021-05-14   583.80  583.80            579.00    579.00     526.45  52.55
#> 126 2021-05-19     5.10    5.10              5.10      4.90       4.90   0.20
#> 127 2021-05-19    43.30   43.30             42.80     36.50      36.30   6.50
#> 128 2020-08-18  5540.40 5540.40           5445.00   5335.00    5176.00 269.00
#> 129 2021-05-19   980.10  980.10            980.10    933.45     933.45  46.65
#> 130 2021-05-19   130.00  130.00            125.50    125.40     121.85   3.65
#> 131 2020-07-22    44.40   44.40             39.40     41.70      40.20  -0.80
#> 132 2021-04-07   334.40  334.40            323.20    305.95     288.40  34.80
#> 133 2021-03-05   365.00  365.00            359.90    360.60     332.20  27.70
#> 134 2021-05-19   183.80  183.80            175.50    179.30     175.95  -0.45
#> 135 2021-03-03  2409.75 2409.75           2409.75   2169.75    2008.15 401.60
#> 136 2021-05-19  1140.00 1140.00           1080.35   1109.00    1087.40  -7.05
#> 137 2021-05-19   689.45  689.45            689.45    666.00     660.35  29.10
#> 138 2021-04-27   369.95  369.95            369.95    369.50     352.35  17.60
#> 139 2021-05-19   137.00  137.00            131.80    117.20     117.20  14.60
#> 140 2021-03-02    82.45   82.45             80.10     75.60      71.20   8.90
#> 141 2021-05-19   715.00  715.00            689.00    691.25     678.00  11.00
#> 142 2021-05-19    10.25   10.25             10.25      9.80       9.80   0.45
#>     percent_change
#> 1            19.96
#> 2             5.00
#> 3             2.29
#> 4             4.19
#> 5            -0.63
#> 6             5.00
#> 7             3.04
#> 8            11.67
#> 9             4.98
#> 10           20.00
#> 11            6.73
#> 12            0.20
#> 13           -0.65
#> 14           -1.24
#> 15            1.45
#> 16           10.54
#> 17           -1.83
#> 18           -4.57
#> 19            4.09
#> 20            4.98
#> 21            4.92
#> 22            4.93
#> 23           -5.88
#> 24           -2.10
#> 25            2.62
#> 26           20.00
#> 27            4.87
#> 28           -4.53
#> 29            4.28
#> 30            4.97
#> 31           -2.62
#> 32            1.91
#> 33            2.41
#> 34            4.85
#> 35            3.13
#> 36           20.00
#> 37            5.74
#> 38            1.93
#> 39            4.18
#> 40            4.44
#> 41            1.97
#> 42            0.08
#> 43            4.76
#> 44            3.21
#> 45            4.17
#> 46            0.95
#> 47            2.34
#> 48            3.14
#> 49            6.22
#> 50            5.95
#> 51            5.05
#> 52           -2.11
#> 53            4.98
#> 54            3.68
#> 55            0.00
#> 56           12.03
#> 57            6.11
#> 58           10.15
#> 59           -2.29
#> 60            5.34
#> 61            4.79
#> 62            3.16
#> 63            4.99
#> 64            8.22
#> 65            1.15
#> 66           -4.59
#> 67            1.25
#> 68            2.59
#> 69           20.00
#> 70            1.24
#> 71            4.92
#> 72            4.93
#> 73            2.03
#> 74            0.30
#> 75           -1.41
#> 76            4.97
#> 77            4.64
#> 78           -4.09
#> 79           -2.70
#> 80           20.00
#> 81           -1.04
#> 82            4.43
#> 83            1.43
#> 84            0.75
#> 85            4.94
#> 86            6.47
#> 87            1.90
#> 88            2.39
#> 89           15.74
#> 90            2.57
#> 91            0.90
#> 92           19.99
#> 93            5.36
#> 94            4.20
#> 95            2.01
#> 96           -1.09
#> 97            3.57
#> 98            2.21
#> 99            0.30
#> 100           1.81
#> 101           4.91
#> 102           1.88
#> 103          -7.98
#> 104           1.44
#> 105           1.44
#> 106           1.77
#> 107          -0.57
#> 108           4.42
#> 109          13.26
#> 110          -2.30
#> 111           2.07
#> 112          13.46
#> 113           0.36
#> 114           4.73
#> 115          -1.83
#> 116          -0.42
#> 117           2.92
#> 118           1.78
#> 119           0.95
#> 120           0.00
#> 121           4.17
#> 122           2.36
#> 123           2.56
#> 124          16.74
#> 125           9.98
#> 126           4.08
#> 127          17.91
#> 128           5.20
#> 129           5.00
#> 130           3.00
#> 131          -1.99
#> 132          12.07
#> 133           8.34
#> 134          -0.26
#> 135          20.00
#> 136          -0.65
#> 137           4.41
#> 138           5.00
#> 139          12.46
#> 140          12.50
#> 141           1.62
#> 142           4.59

# retain original column names as returned by NSE
nse_stock_year_high(clean_names = FALSE)
#>         symbol
#> 1    20MICRONS
#> 2   ADANITRANS
#> 3      AGARIND
#> 4       AJOONI
#> 5   AMRUTANJAN
#> 6    ANGELBRKG
#> 7   APCOTEXIND
#> 8   APOLSINHOT
#> 9   ARROWGREEN
#> 10   AUTOAXLES
#> 11      AVTNPL
#> 12  AXISBPSETF
#> 13   AYMSYNTEX
#> 14   BALAMINES
#> 15         BEL
#> 16  BHARATGEAR
#> 17        BHEL
#> 18  BIRLACORPN
#> 19      BROOKS
#> 20       BSHSL
#> 21     BURNPUR
#> 22        BVCL
#> 23  CASTEXTECH
#> 24  CENTURYPLY
#> 25  CHAMBLFERT
#> 26   CONTROLPR
#> 27  COSMOFILMS
#> 28     CSBBANK
#> 29      CYIENT
#> 30      DCMNVL
#> 31         DCW
#> 32    DECCANCE
#> 33  DEEPAKFERT
#> 34   DHARSUGAR
#> 35    DNAMEDIA
#> 36  DYNAMATECH
#> 37       EMMBI
#> 38  EVERESTIND
#> 39  FAIRCHEMOR
#> 40     FINEORG
#> 41         FSL
#> 42        GAEL
#> 43    GBGLOBAL
#> 44         GDL
#> 45  GENUSPAPER
#> 46   GINNIFILA
#> 47  GREENPANEL
#> 48        GSFC
#> 49        HFCL
#> 50     HGINFRA
#> 51         HIL
#> 52   HINDPETRO
#> 53  HITECHCORP
#> 54     HLEGLAS
#> 55    ICICILIQ
#> 56    INDIACEM
#> 57  INEOSSTYRO
#> 58    INFOBEAN
#> 59         IOC
#> 60        ISEC
#> 61   JKLAKSHMI
#> 62  KALPATPOWR
#> 63       KARDA
#> 64    KENNAMET
#> 65    KHAICHEM
#> 66      KINGFA
#> 67    KPITTECH
#> 68         KSB
#> 69     LAOPALA
#> 70  LICNETFN50
#> 71    LYKALABS
#> 72  MANAKALUCO
#> 73   MANGLMCEM
#> 74      MARINE
#> 75   MOLDTKPAC
#> 76   MUKANDLTD
#> 77    NAGAFERT
#> 78  NAHARINDUS
#> 79  NAHARSPING
#> 80      NBIFIN
#> 81      NCLIND
#> 82        NDTV
#> 83        NETF
#> 84   NITINSPIN
#> 85     NITIRAJ
#> 86   ORIENTCEM
#> 87   ORIENTHOT
#> 88   PATINTLOG
#> 89        PGIL
#> 90  PHILIPCARB
#> 91  PIDILITIND
#> 92     POKARNA
#> 93     POLYMED
#> 94      PRECAM
#> 95      PRECOT
#> 96  PRINCEPIPE
#> 97    PROINDIA
#> 98    RAMCOIND
#> 99      RELAXO
#> 100       RSWM
#> 101   RTNINDIA
#> 102     SAGCEM
#> 103     SALONA
#> 104  SANGAMIND
#> 105  SANGHIIND
#> 106  SARLAPOLY
#> 107       SDBL
#> 108    SEPOWER
#> 109 SHAKTIPUMP
#> 110 SHAREINDIA
#> 111 SHIVAMILLS
#> 112  SHREERAMA
#> 113 SHRIRAMCIT
#> 114   SIMBHALS
#> 115       SPIC
#> 116 SURYALAXMI
#> 117 SURYAROSNI
#> 118      SUULD
#> 119       TAKE
#> 120 TANTIACONS
#> 121    TARAPUR
#> 122 TATACOFFEE
#> 123        TCI
#> 124     TCIEXP
#> 125 TCNSBRANDS
#> 126     TECHIN
#> 127 TEXMOPIPES
#> 128  TIDEWATER
#> 129 TIPSINDLTD
#> 130 TIRUMALCHM
#> 131 TV18BRDCST
#> 132    TVTODAY
#> 133 UNICHEMLAB
#> 134 UNIVCABLES
#> 135        VHL
#> 136 VINDHYATEL
#> 137  VISAKAIND
#> 138     VISHNU
#> 139 VLSFINANCE
#> 140 WALCHANNAG
#> 141 WOCKPHARMA
#> 142   ZEEMEDIA
#>                                                             symbolDesc
#> 1                                                   20 Microns Limited
#> 2                                           Adani Transmission Limited
#> 3                               Agarwal Industrial Corporation Limited
#> 4                                               Ajooni Biotech Limited
#> 5                                       Amrutanjan Health Care Limited
#> 6                                                Angel Broking Limited
#> 7                                           Apcotex Industries Limited
#> 8                                       Apollo Sindoori Hotels Limited
#> 9                                              Arrow Greentech Limited
#> 10                                            Automotive Axles Limited
#> 11                                        AVT Natural Products Limited
#> 12       Axis Mutual Fund - Axis AAA Bond Plus SDL ETF - 2026 Maturity
#> 13                                                  AYM Syntex Limited
#> 14                                               Balaji Amines Limited
#> 15                                          Bharat Electronics Limited
#> 16                                                Bharat Gears Limited
#> 17                                    Bharat Heavy Electricals Limited
#> 18                                           Birla Corporation Limited
#> 19                                         Brooks Laboratories Limited
#> 20                                   Bombay Super Hybrid Seeds Limited
#> 21                                              Burnpur Cement Limited
#> 22                                        Barak Valley Cements Limited
#> 23                                         Castex Technologies Limited
#> 24                                   Century Plyboards (India) Limited
#> 25                             Chambal Fertilizers & Chemicals Limited
#> 26                                               Control Print Limited
#> 27                                                 Cosmo Films Limited
#> 28                                                    CSB Bank Limited
#> 29                                                      Cyient Limited
#> 30                                                DCM Nouvelle Limited
#> 31                                                         DCW Limited
#> 32                                              Deccan Cements Limited
#> 33           Deepak Fertilizers and Petrochemicals Corporation Limited
#> 34                                  Dharani Sugars & Chemicals Limited
#> 35                                  Diligent Media Corporation Limited
#> 36                                      Dynamatic Technologies Limited
#> 37                                            Emmbi Industries Limited
#> 38                                          Everest Industries Limited
#> 39                                           Fairchem Organics Limited
#> 40                                     Fine Organic Industries Limited
#> 41                                       Firstsource Solutions Limited
#> 42                                      Gujarat Ambuja Exports Limited
#> 43                                                   GB Global Limited
#> 44                                         Gateway Distriparks Limited
#> 45                                        Genus Paper & Boards Limited
#> 46                                             Ginni Filaments Limited
#> 47                                       Greenpanel Industries Limited
#> 48                       Gujarat State Fertilizers & Chemicals Limited
#> 49                                                        HFCL Limited
#> 50                                      H.G. Infra Engineering Limited
#> 51                                                         HIL Limited
#> 52                             Hindustan Petroleum Corporation Limited
#> 53                                          Hitech Corporation Limited
#> 54                                                HLE Glascoat Limited
#> 55  ICICI Prudential Mutual Fund - ICICI Prudential Liquid ETF - NO NA
#> 56                                           The India Cements Limited
#> 57                                     INEOS Styrolution India Limited
#> 58                                      InfoBeans Technologies Limited
#> 59                                      Indian Oil Corporation Limited
#> 60                                            ICICI Securities Limited
#> 61                                           JK Lakshmi Cement Limited
#> 62                                Kalpataru Power Transmission Limited
#> 63                                         Karda Constructions Limited
#> 64                                            Kennametal India Limited
#> 65                             Khaitan Chemicals & Fertilizers Limited
#> 66                         Kingfa Science & Technology (India) Limited
#> 67                                           KPIT Technologies Limited
#> 68                                                         Ksb Limited
#> 69                                                 La Opala RG Limited
#> 70                     LIC MF - LIC MF EXCHANGE TRADED FUND - NIFTY 50
#> 71                                                   Lyka Labs Limited
#> 72                                  Manaksia Aluminium Company Limited
#> 73                                             Mangalam Cement Limited
#> 74                                  Marine Electricals (India) Limited
#> 75                                          Mold-Tek Packaging Limited
#> 76                                                      Mukand Limited
#> 77                         Nagarjuna Fertilizers and Chemicals Limited
#> 78                                Nahar Industrial Enterprises Limited
#> 79                                        Nahar Spinning Mills Limited
#> 80                         N. B. I. Industrial Finance Company Limited
#> 81                                              NCL Industries Limited
#> 82                                        New Delhi Television Limited
#> 83                                     Tata Nifty Exchange Traded Fund
#> 84                                              Nitin Spinners Limited
#> 85                                           Nitiraj Engineers Limited
#> 86                                               Orient Cement Limited
#> 87                                             Oriental Hotels Limited
#> 88                                  Patel Integrated Logistics Limited
#> 89                                     Pearl Global Industries Limited
#> 90                                       Phillips Carbon Black Limited
#> 91                                         Pidilite Industries Limited
#> 92                                                     Pokarna Limited
#> 93                                               Poly Medicure Limited
#> 94                                         Precision Camshafts Limited
#> 95                                                      Precot Limited
#> 96                                   Prince Pipes And Fittings Limited
#> 97                                               Proseed India Limited
#> 98                                            Ramco Industries Limited
#> 99                                            Relaxo Footwears Limited
#> 100                                                       RSWM Limited
#> 101                                    RattanIndia Enterprises Limited
#> 102                                              Sagar Cements Limited
#> 103                                             Salona Cotspin Limited
#> 104                                             Sangam (India) Limited
#> 105                                          Sanghi Industries Limited
#> 106                                   Sarla Performance Fibers Limited
#> 107                               Som Distilleries & Breweries Limited
#> 108                                                 S.E. Power Limited
#> 109                                       Shakti Pumps (India) Limited
#> 110                                     Share India Securities Limited
#> 111                                                Shiva Mills Limited
#> 112                                      Shree Rama Multi-Tech Limited
#> 113                                 Shriram City Union Finance Limited
#> 114                                           Simbhaoli Sugars Limited
#> 115            Southern Petrochemicals Industries Corporation  Limited
#> 116                                  Suryalakshmi Cotton Mills Limited
#> 117                                               Surya Roshni Limited
#> 118                                         Suumaya Industries Limited
#> 119                                             Take Solutions Limited
#> 120                                       Tantia Constructions Limited
#> 121                                       Tarapur Transformers Limited
#> 122                                                Tata Coffee Limited
#> 123                             Transport Corporation of India Limited
#> 124                                                TCI Express Limited
#> 125                                          TCNS Clothing Co. Limited
#> 126                                           Techindia Nirman Limited
#> 127                                   Texmo Pipes and Products Limited
#> 128                             Tide Water Oil Company (India) Limited
#> 129                                            TIPS Industries Limited
#> 130                                       Thirumalai Chemicals Limited
#> 131                                             TV18 Broadcast Limited
#> 132                                           TV Today Network Limited
#> 133                                       Unichem Laboratories Limited
#> 134                                           Universal Cables Limited
#> 135                                          Vardhman Holdings Limited
#> 136                                          Vindhya Telelinks Limited
#> 137                                          Visaka Industries Limited
#> 138                                           Vishnu Chemicals Limited
#> 139                                                VLS Finance Limited
#> 140                                   Walchandnagar Industries Limited
#> 141                                                  Wockhardt Limited
#> 142                                      Zee Media Corporation Limited
#>             dt   value    year     ltp value_old    prev change pChange
#> 1   2021-05-18   65.50   65.50   65.50     58.65   54.60  10.90   19.96
#> 2   2021-05-19 1389.50 1389.50 1389.50   1323.35 1323.35  66.15    5.00
#> 3   2021-05-19  219.50  219.50  218.85    215.25  213.95   4.90    2.29
#> 4   2021-05-19   56.05   56.05   56.00     53.75   53.75   2.25    4.19
#> 5   2021-05-19  762.00  762.00  743.00    760.00  747.70  -4.70   -0.63
#> 6   2021-05-12  719.30  719.30  719.30    690.00  685.05  34.25    5.00
#> 7   2021-05-19  385.00  385.00  369.90    369.95  359.00  10.90    3.04
#> 8   2020-08-19  800.00  800.00  749.00    704.65  670.70  78.30   11.67
#> 9   2021-05-19  116.90  116.90  116.90    111.35  111.35   5.55    4.98
#> 10  2021-02-24 1400.20 1400.20 1400.20   1250.00 1166.85 233.35   20.00
#> 11  2021-05-12   60.40   60.40   58.70     57.75   55.00   3.70    6.73
#> 12  2021-05-19   10.41   10.41   10.12     10.12   10.11   0.02    0.20
#> 13  2021-05-19   64.95   64.95   61.50     62.80   61.90  -0.40   -0.65
#> 14  2021-05-19 2764.95 2764.95 2680.00   2739.90 2713.70 -33.70   -1.24
#> 15  2021-05-19  158.70  158.70  157.40    157.90  155.15   2.25    1.45
#> 16  2021-05-19  119.00  119.00  112.75    104.95  102.00  10.75   10.54
#> 17  2021-05-12   77.70   77.70   72.40     76.60   73.75  -1.35   -1.83
#> 18  2021-05-19 1384.80 1384.80 1258.00   1373.95 1318.20 -60.20   -4.57
#> 19  2021-05-12   93.80   93.80   93.00     91.50   89.35   3.65    4.09
#> 20  2021-05-19  186.65  186.65  186.65    177.80  177.80   8.85    4.98
#> 21  2021-01-11    3.20    3.20    3.20      3.20    3.05   0.15    4.92
#> 22  2021-05-19   22.35   22.35   22.35     21.40   21.30   1.05    4.93
#> 23  2021-05-19    0.90    0.90    0.80      0.85    0.85  -0.05   -5.88
#> 24  2021-05-19  400.00  400.00  383.15    395.90  391.35  -8.20   -2.10
#> 25  2021-05-19  310.45  310.45  292.00    289.50  284.55   7.45    2.62
#> 26  2021-05-10  380.15  380.15  380.15    340.00  316.80  63.35   20.00
#> 27  2021-05-19  801.80  801.80  800.00    786.00  762.85  37.15    4.87
#> 28  2021-05-19  346.20  346.20  305.50    325.00  320.00 -14.50   -4.53
#> 29  2021-05-19  830.00  830.00  828.00    819.90  794.00  34.00    4.28
#> 30  2021-05-19  120.45  120.45  120.45    114.75  114.75   5.70    4.97
#> 31  2021-05-19   40.90   40.90   39.00     40.75   40.05  -1.05   -2.62
#> 32  2021-05-19  504.95  504.95  492.00    485.00  482.80   9.20    1.91
#> 33  2021-05-12  308.95  308.95  295.20    297.65  288.25   6.95    2.41
#> 34  2021-05-19   11.90   11.90   11.90     11.35   11.35   0.55    4.85
#> 35  2021-05-19    1.65    1.65    1.65      1.60    1.60   0.05    3.13
#> 36  2021-04-01 1241.80 1241.80 1241.80   1111.00 1034.85 206.95   20.00
#> 37  2021-05-07  108.50  108.50  104.00    105.20   98.35   5.65    5.74
#> 38  2021-05-19  376.90  376.90  366.50    372.00  359.55   6.95    1.93
#> 39  2021-05-11  899.00  899.00  862.00    874.70  827.40  34.60    4.18
#> 40  2021-05-19 3548.00 3548.00 3520.90   3424.00 3371.35 149.55    4.44
#> 41  2021-05-19  142.00  142.00  140.10    138.50  137.40   2.70    1.97
#> 42  2021-05-19  185.00  185.00  179.75    184.00  179.60   0.15    0.08
#> 43  2021-05-19    9.90    9.90    9.90      9.45    9.45   0.45    4.76
#> 44  2021-05-18  296.20  296.20  286.00    291.60  277.10   8.90    3.21
#> 45  2020-12-22    8.90    8.90    8.75      8.90    8.40   0.35    4.17
#> 46  2021-05-19   33.50   33.50   32.00     32.65   31.70   0.30    0.95
#> 47  2021-05-19  268.00  268.00  262.25    256.30  256.25   6.00    2.34
#> 48  2021-05-18  125.00  125.00  121.60    122.40  117.90   3.70    3.14
#> 49  2021-05-17   45.40   45.40   44.40     43.75   41.80   2.60    6.22
#> 50  2021-05-17  378.40  378.40  359.95    367.00  339.75  20.20    5.95
#> 51  2021-05-19 4873.70 4873.70 4749.90   4550.00 4521.40 228.50    5.05
#> 52  2021-05-19  274.80  274.80  267.00    273.65  272.75  -5.75   -2.11
#> 53  2021-05-07  178.45  178.45  178.00    177.30  169.55   8.45    4.98
#> 54  2021-05-19 3260.00 3260.00 3250.00   3186.30 3134.55 115.45    3.68
#> 55  2020-12-18 1040.00 1040.00 1000.00   1014.30  999.99   0.01    0.00
#> 56  2021-04-09  200.00  200.00  199.80    195.00  178.35  21.45   12.03
#> 57  2021-05-19 1475.00 1475.00 1385.05   1324.00 1305.25  79.80    6.11
#> 58  2021-04-27  230.00  230.00  230.00    223.30  208.80  21.20   10.15
#> 59  2021-05-19  109.70  109.70  104.75    108.95  107.20  -2.45   -2.29
#> 60  2020-07-16  583.00  583.00  581.40    568.90  551.95  29.45    5.34
#> 61  2021-04-09  470.00  470.00  466.00    467.00  444.70  21.30    4.79
#> 62  2021-04-08  408.95  408.95  401.95    407.00  389.65  12.30    3.16
#> 63  2021-05-19  183.20  183.20  183.20    174.50  174.50   8.70    4.99
#> 64  2021-02-26 1333.75 1333.75 1292.00   1240.00 1193.85  98.15    8.22
#> 65  2021-05-12   37.55   37.55   35.25     36.90   34.85   0.40    1.15
#> 66  2021-05-19 1079.80 1079.80  990.00   1037.65 1037.65 -47.65   -4.59
#> 67  2021-05-18  250.60  250.60  243.00    244.25  240.00   3.00    1.25
#> 68  2021-05-07  999.80  999.80  939.00    963.70  915.25  23.75    2.59
#> 69  2020-08-26  278.15  278.15  278.15    251.85  231.80  46.35   20.00
#> 70  2021-05-12  191.66  191.66  191.66    189.55  189.32   2.34    1.24
#> 71  2021-05-19   57.55   57.55   57.55     54.85   54.85   2.70    4.92
#> 72  2021-05-19   18.10   18.10   18.10     17.25   17.25   0.85    4.93
#> 73  2021-05-19  327.50  327.50  324.60    325.00  318.15   6.45    2.03
#> 74  2021-05-19   87.70   87.70   84.50     86.35   84.25   0.25    0.30
#> 75  2021-05-04  490.35  490.35  470.30    490.00  477.05  -6.75   -1.41
#> 76  2021-05-19  131.90  131.90  131.90    125.65  125.65   6.25    4.97
#> 77  2021-05-19   10.15   10.15   10.15      9.70    9.70   0.45    4.64
#> 78  2021-05-19   62.95   62.95   58.65     61.40   61.15  -2.50   -4.09
#> 79  2021-05-19  145.95  145.95  135.25    139.00  139.00  -3.75   -2.70
#> 80  2021-05-19 2405.55 2405.55 2405.55   2040.00 2004.65 400.90   20.00
#> 81  2021-05-19  205.95  205.95  200.00    205.55  202.10  -2.10   -1.04
#> 82  2021-05-06   74.60   74.60   74.20     72.75   71.05   3.15    4.43
#> 83  2021-02-10  186.00  186.00  186.00    185.65  183.38   2.62    1.43
#> 84  2021-05-18  124.00  124.00  120.55    123.60  119.65   0.90    0.75
#> 85  2021-05-19   47.80   47.80   47.80     45.55   45.55   2.25    4.94
#> 86  2021-05-18  137.30  137.30  135.00    132.40  126.80   8.20    6.47
#> 87  2021-05-19   30.45   30.45   29.50     29.55   28.95   0.55    1.90
#> 88  2021-05-19   32.00   32.00   30.05     29.35   29.35   0.70    2.39
#> 89  2020-12-18  237.45  237.45  229.05    204.85  197.90  31.15   15.74
#> 90  2021-05-19  237.40  237.40  231.65    235.90  225.85   5.80    2.57
#> 91  2021-05-19 1950.00 1950.00 1938.30   1947.25 1920.95  17.35    0.90
#> 92  2021-05-18  328.65  328.65  328.65    285.95  273.90  54.75   19.99
#> 93  2021-04-23 1089.80 1089.80 1070.00   1085.15 1015.55  54.45    5.36
#> 94  2021-05-19   58.70   58.70   57.00     55.00   54.70   2.30    4.20
#> 95  2021-05-19  164.50  164.50  159.85    156.70  156.70   3.15    2.01
#> 96  2021-05-19  702.95  702.95  688.65    702.00  696.25  -7.60   -1.09
#> 97        <NA>    1.45    1.45    1.45        NA    0.40   0.05    3.57
#> 98  2021-05-19  305.00  305.00  300.40    302.90  293.90   6.50    2.21
#> 99  2021-05-19 1085.00 1085.00 1015.00   1035.00 1011.95   3.05    0.30
#> 100 2021-05-19  251.00  251.00  242.15    246.25  237.85   4.30    1.81
#> 101 2021-05-19   17.10   17.10   17.10     16.30   16.30   0.80    4.91
#> 102 2021-05-19  923.55  923.55  905.30    910.00  888.60  16.70    1.88
#> 103 2021-05-19  115.05  115.05  105.00    115.00  114.10  -9.10   -7.98
#> 104 2021-05-19  109.70  109.70  106.00    104.50  104.50   1.50    1.44
#> 105 2021-05-19   51.20   51.20   49.40     50.45   48.70   0.70    1.44
#> 106 2021-05-19   38.50   38.50   37.40     37.45   36.75   0.65    1.77
#> 107 2021-05-19   46.35   46.35   43.90     45.30   44.15  -0.25   -0.57
#> 108 2021-05-19    5.90    5.90    5.90      5.65    5.65   0.25    4.42
#> 109 2021-05-19  744.80  744.80  703.00    651.90  620.70  82.30   13.26
#> 110 2021-05-19  491.15  491.15  460.50    483.00  471.35 -10.85   -2.30
#> 111 2021-05-19   63.00   63.00   61.50     61.95   60.25   1.25    2.07
#> 112 2021-05-06   14.95   14.95   14.75     13.95   13.00   1.75   13.46
#> 113 2021-05-19 1791.70 1791.70 1732.45   1778.85 1726.25   6.20    0.36
#> 114 2021-05-19   15.50   15.50   15.50     14.80   14.80   0.70    4.73
#> 115 2021-05-19   48.40   48.40   45.60     47.50   46.45  -0.85   -1.83
#> 116 2021-05-19   50.20   50.20   47.65     47.90   47.85  -0.20   -0.42
#> 117 2021-05-07  476.50  476.50  467.60    468.80  454.35  13.25    2.92
#> 118 2021-05-10  323.85  323.85  321.00    322.65  315.40   5.60    1.78
#> 119 2021-05-19   72.90   72.90   69.10     71.70   68.45   0.65    0.95
#> 120 2021-05-19   10.50   10.50   10.00     10.00   10.00   0.00    0.00
#> 121 2021-05-19    5.00    5.00    5.00      4.80    4.80   0.20    4.17
#> 122 2021-05-11  185.85  185.85  182.00    180.90  177.80   4.20    2.36
#> 123 2021-05-19  310.00  310.00  303.00    310.00  295.45   7.55    2.56
#> 124 2021-05-18 1299.00 1299.00 1265.00   1140.00 1083.60 181.40   16.74
#> 125 2021-05-14  583.80  583.80  579.00    579.00  526.45  52.55    9.98
#> 126 2021-05-19    5.10    5.10    5.10      4.90    4.90   0.20    4.08
#> 127 2021-05-19   43.30   43.30   42.80     36.50   36.30   6.50   17.91
#> 128 2020-08-18 5540.40 5540.40 5445.00   5335.00 5176.00 269.00    5.20
#> 129 2021-05-19  980.10  980.10  980.10    933.45  933.45  46.65    5.00
#> 130 2021-05-19  130.00  130.00  125.50    125.40  121.85   3.65    3.00
#> 131 2020-07-22   44.40   44.40   39.40     41.70   40.20  -0.80   -1.99
#> 132 2021-04-07  334.40  334.40  323.20    305.95  288.40  34.80   12.07
#> 133 2021-03-05  365.00  365.00  359.90    360.60  332.20  27.70    8.34
#> 134 2021-05-19  183.80  183.80  175.50    179.30  175.95  -0.45   -0.26
#> 135 2021-03-03 2409.75 2409.75 2409.75   2169.75 2008.15 401.60   20.00
#> 136 2021-05-19 1140.00 1140.00 1080.35   1109.00 1087.40  -7.05   -0.65
#> 137 2021-05-19  689.45  689.45  689.45    666.00  660.35  29.10    4.41
#> 138 2021-04-27  369.95  369.95  369.95    369.50  352.35  17.60    5.00
#> 139 2021-05-19  137.00  137.00  131.80    117.20  117.20  14.60   12.46
#> 140 2021-03-02   82.45   82.45   80.10     75.60   71.20   8.90   12.50
#> 141 2021-05-19  715.00  715.00  689.00    691.25  678.00  11.00    1.62
#> 142 2021-05-19   10.25   10.25   10.25      9.80    9.80   0.45    4.59
```

##### Most actively traded stocks in a month

``` r
nse_stock_most_traded()
#>                                         security share_turnover traded_quantity
#> 1                             Tata Steel Limited           3.48            5045
#> 2  Adani Ports and Special Economic Zone Limited           3.22            5547
#> 3                            Tata Motors Limited           2.61           11479
#> 4                              HDFC Bank Limited           2.53            2359
#> 5                              JSW Steel Limited           2.50            5392
#> 6                            State Bank of India           2.42            9291
#> 7                          Bajaj Finance Limited           2.42             651
#> 8                             ICICI Bank Limited           2.36            5423
#> 9                    Reliance Industries Limited           2.23            1510
#> 10                             Axis Bank Limited           1.91            3726
#> 11                   TOTAL of Top Ten securities          25.68           50423
#> 12                                         TOTAL         100.00          500847
#>    no_of_trades avg_daily_turnonver   turnover
#> 1       6297239             2439.37   46347.95
#> 2       6740117             2254.63   42838.03
#> 3       6261597             1829.61   34762.50
#> 4       5137713             1770.64   33642.10
#> 5       5326300             1751.55   33279.37
#> 6       5946848             1696.45   32232.60
#> 7       4065851             1691.77   32143.68
#> 8       5594907             1652.91   31405.21
#> 9       4398258             1560.00   29640.06
#> 10      4429981             1340.99   25478.72
#> 11     54198811            17987.91  341770.24
#> 12    385038115            70036.15 1330686.78

# retain original column names as returned by NSE
nse_stock_most_traded(clean_names = FALSE)
#>                                          skipped sharetotal trdQty nooftrades
#> 1                             Tata Steel Limited       3.48   5045    6297239
#> 2  Adani Ports and Special Economic Zone Limited       3.22   5547    6740117
#> 3                            Tata Motors Limited       2.61  11479    6261597
#> 4                              HDFC Bank Limited       2.53   2359    5137713
#> 5                              JSW Steel Limited       2.50   5392    5326300
#> 6                            State Bank of India       2.42   9291    5946848
#> 7                          Bajaj Finance Limited       2.42    651    4065851
#> 8                             ICICI Bank Limited       2.36   5423    5594907
#> 9                    Reliance Industries Limited       2.23   1510    4398258
#> 10                             Axis Bank Limited       1.91   3726    4429981
#> 11                   TOTAL of Top Ten securities      25.68  50423   54198811
#> 12                                         TOTAL     100.00 500847  385038115
#>    avgdailyturn   turnover
#> 1       2439.37   46347.95
#> 2       2254.63   42838.03
#> 3       1829.61   34762.50
#> 4       1770.64   33642.10
#> 5       1751.55   33279.37
#> 6       1696.45   32232.60
#> 7       1691.77   32143.68
#> 8       1652.91   31405.21
#> 9       1560.00   29640.06
#> 10      1340.99   25478.72
#> 11     17987.91  341770.24
#> 12     70036.15 1330686.78
```

### Futures & Options

##### Top futures and options gainers for the last trading session.

``` r
nse_fo_top_gainers()
#>        symbol series last_corp_announcement_date
#> 1  IBULHSGFIN     EQ                  2020-09-03
#> 2    BOSCHLTD     EQ                  2020-08-03
#> 3    CHOLAFIN     EQ                  2021-02-09
#> 4         PNB     EQ                  2020-07-27
#> 5      M&MFIN     EQ                  2020-07-22
#> 6     RBLBANK     EQ                  2020-07-09
#> 7       CIPLA     EQ                  2020-08-11
#> 8         M&M     EQ                  2020-07-16
#> 9    RAMCOCEM     EQ                  2021-03-22
#> 10       BPCL     EQ                  2021-03-25
#>                                 last_corp_announcement open_price high_price
#> 1                               Annual General Meeting     197.45     216.45
#> 2   Annual General Meeting/Dividend - Rs 105 Per Share   14770.00   16250.00
#> 3                 Interimdividend - Rs 1.30  Per Share     547.95     573.70
#> 4                               Annual General Meeting      36.50      37.90
#> 5                         Rights 1:1 @ Premium Rs 48/-     154.25     161.00
#> 6                               Annual General Meeting     201.00     207.85
#> 7                               Annual General Meeting     906.00     927.90
#> 8  Annual General Meeting/Dividend - Rs 2.35 Per Share     784.05     809.55
#> 9                   Interim Dividend - Rs  3 Per Share     985.00    1005.00
#> 10                   Interim Dividend - Rs 5 Per Share     448.00     457.85
#>    low_price last_traded_price prev_close_price percent_change traded_quantity
#> 1     192.50            210.90           193.25           9.13        78804626
#> 2   14550.20          15845.00         14780.55           7.20          534380
#> 3     545.00            570.70           544.05           4.90         9211100
#> 4      35.95             37.90            36.20           4.70       339156585
#> 5     152.60            159.95           154.20           3.73        21575696
#> 6     200.35            204.95           199.95           2.50        19971105
#> 7     905.00            925.50           903.95           2.38        12378690
#> 8     782.00            803.00           784.80           2.32        10092542
#> 9     970.10            999.00           977.95           2.15          647692
#> 10    441.50            455.80           446.45           2.09         9399907
#>    turnover_in_lakhs
#> 1          162353.29
#> 2           84012.34
#> 3           51728.62
#> 4          126098.42
#> 5           34206.11
#> 6           40808.96
#> 7          113846.81
#> 8           80881.63
#> 9            6410.34
#> 10          42447.16

# retain original column names as returned by NSE
nse_fo_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1  IBULHSGFIN     EQ               2020-09-03
#> 2    BOSCHLTD     EQ               2020-08-03
#> 3    CHOLAFIN     EQ               2021-02-09
#> 4         PNB     EQ               2020-07-27
#> 5      M&MFIN     EQ               2020-07-22
#> 6     RBLBANK     EQ               2020-07-09
#> 7       CIPLA     EQ               2020-08-11
#> 8         M&M     EQ               2020-07-16
#> 9    RAMCOCEM     EQ               2021-03-22
#> 10       BPCL     EQ               2021-03-25
#>                                   lastCorpAnnouncement openPrice highPrice
#> 1                               Annual General Meeting    197.45    216.45
#> 2   Annual General Meeting/Dividend - Rs 105 Per Share  14770.00  16250.00
#> 3                 Interimdividend - Rs 1.30  Per Share    547.95    573.70
#> 4                               Annual General Meeting     36.50     37.90
#> 5                         Rights 1:1 @ Premium Rs 48/-    154.25    161.00
#> 6                               Annual General Meeting    201.00    207.85
#> 7                               Annual General Meeting    906.00    927.90
#> 8  Annual General Meeting/Dividend - Rs 2.35 Per Share    784.05    809.55
#> 9                   Interim Dividend - Rs  3 Per Share    985.00   1005.00
#> 10                   Interim Dividend - Rs 5 Per Share    448.00    457.85
#>    lowPrice      ltp previousPrice netPrice tradedQuantity turnoverInLakhs
#> 1    192.50   210.90        193.25     9.13       78804626       162353.29
#> 2  14550.20 15845.00      14780.55     7.20         534380        84012.34
#> 3    545.00   570.70        544.05     4.90        9211100        51728.62
#> 4     35.95    37.90         36.20     4.70      339156585       126098.42
#> 5    152.60   159.95        154.20     3.73       21575696        34206.11
#> 6    200.35   204.95        199.95     2.50       19971105        40808.96
#> 7    905.00   925.50        903.95     2.38       12378690       113846.81
#> 8    782.00   803.00        784.80     2.32       10092542        80881.63
#> 9    970.10   999.00        977.95     2.15         647692         6410.34
#> 10   441.50   455.80        446.45     2.09        9399907        42447.16
```

### Pre Open Market Data

##### Fetch data of pre open session of Nifty Bank.

``` r
nse_preopen_nifty_bank()
#>        symbol series corp_action_date corp_action   price change percent_change
#> 1    AXISBANK     EQ             <NA>        <NA>  708.60  -8.20          -1.14
#> 2  INDUSINDBK     EQ             <NA>        <NA>  963.00  -4.00          -0.41
#> 3      AUBANK     EQ             <NA>        <NA>  980.00  -3.45          -0.35
#> 4         PNB     EQ             <NA>        <NA>   36.50   0.30           0.83
#> 5        SBIN     EQ             <NA>        <NA>  387.00   2.60           0.68
#> 6     RBLBANK     EQ             <NA>        <NA>  201.00   1.05           0.53
#> 7   ICICIBANK     EQ             <NA>        <NA>  628.05   2.60           0.42
#> 8  FEDERALBNK     EQ             <NA>        <NA>   84.70   0.30           0.36
#> 9  BANDHANBNK     EQ             <NA>        <NA>  290.10   0.55           0.19
#> 10 IDFCFIRSTB     EQ             <NA>        <NA>   55.65   0.10           0.18
#> 11  KOTAKBANK     EQ             <NA>        <NA> 1732.00   1.45           0.08
#> 12   HDFCBANK     EQ             <NA>        <NA> 1458.35   0.15           0.01
#>    prev_close quantity   value   mkt_cap year_high year_low sum_val
#> 1      716.80   263562 1867.60 180058.24    799.00   332.85 3251.22
#> 2      967.00     6893   66.38  54577.80   1119.50   330.00 3251.22
#> 3      983.45      354    3.47  20870.89   1354.40   366.00 3251.22
#> 4       36.20   400652  146.24   8723.72     46.35    26.30 3251.22
#> 5      384.40   136445  528.04 147516.69    427.70   149.45 3251.22
#> 6      199.95    20728   41.66   8967.89    274.30   105.50 3251.22
#> 7      625.45    38689  242.99 432527.09    679.40   285.55 3251.22
#> 8       84.40    23537   19.94  16854.80     92.50    36.80 3251.22
#> 9      289.55     8492   24.64  19586.47    430.70   195.40 3251.22
#> 10      55.55    30199   16.81  14807.13     69.30    18.45 3251.22
#> 11    1730.55     5421   93.89 253767.87   2049.00  1115.00 3251.22
#> 12    1458.20    13685  199.58 635059.72   1641.00   826.10 3251.22
#>    sum_quantity fin_quantity sum_fin_quantity
#> 1        664332       263562           948657
#> 2        664332         6893           948657
#> 3        664332          354           948657
#> 4        664332       400652           948657
#> 5        664332       136445           948657
#> 6        664332        20728           948657
#> 7        664332        38689           948657
#> 8        664332        23537           948657
#> 9        664332         8492           948657
#> 10       664332        30199           948657
#> 11       664332         5421           948657
#> 12       664332        13685           948657

# retain original column names as returned by NSE
nse_preopen_nifty(clean_names = FALSE)
#>        symbol series        xDt
#> 1    HINDALCO     EQ       <NA>
#> 2   TATASTEEL     EQ       <NA>
#> 3        ONGC     EQ       <NA>
#> 4    AXISBANK     EQ       <NA>
#> 5    JSWSTEEL     EQ       <NA>
#> 6         IOC     EQ 2021-03-23
#> 7   BRITANNIA     EQ       <NA>
#> 8         TCS     EQ       <NA>
#> 9   SUNPHARMA     EQ       <NA>
#> 10 INDUSINDBK     EQ       <NA>
#> 11 HEROMOTOCO     EQ       <NA>
#> 12        M&M     EQ       <NA>
#> 13 ASIANPAINT     EQ       <NA>
#> 14 BAJFINANCE     EQ       <NA>
#> 15     GRASIM     EQ       <NA>
#> 16      WIPRO     EQ       <NA>
#> 17       INFY     EQ       <NA>
#> 18      TECHM     EQ       <NA>
#> 19       SBIN     EQ       <NA>
#> 20   SHREECEM     EQ       <NA>
#> 21 ULTRACEMCO     EQ       <NA>
#> 22        UPL     EQ       <NA>
#> 23 ADANIPORTS     EQ       <NA>
#> 24 BHARTIARTL     EQ       <NA>
#> 25         LT     EQ       <NA>
#> 26 TATAMOTORS     EQ       <NA>
#> 27 TATACONSUM     EQ       <NA>
#> 28   HDFCLIFE     EQ       <NA>
#> 29  ICICIBANK     EQ       <NA>
#> 30 BAJAJFINSV     EQ       <NA>
#> 31  COALINDIA     EQ 2021-03-15
#> 32       BPCL     EQ 2021-03-25
#> 33    SBILIFE     EQ 2021-04-05
#> 34        ITC     EQ 2021-02-22
#> 35    DRREDDY     EQ       <NA>
#> 36       HDFC     EQ       <NA>
#> 37   DIVISLAB     EQ       <NA>
#> 38      CIPLA     EQ       <NA>
#> 39      TITAN     EQ       <NA>
#> 40  POWERGRID     EQ 2021-03-08
#> 41  KOTAKBANK     EQ       <NA>
#> 42     MARUTI     EQ       <NA>
#> 43    HCLTECH     EQ 2021-04-29
#> 44  NESTLEIND     EQ 2021-04-29
#> 45   RELIANCE     EQ       <NA>
#> 46       NTPC     EQ       <NA>
#> 47  EICHERMOT     EQ       <NA>
#> 48   HDFCBANK     EQ       <NA>
#> 49 HINDUNILVR     EQ       <NA>
#> 50 BAJAJ-AUTO     EQ       <NA>
#>                                                                           caAct
#> 1                                                                          <NA>
#> 2                                                                          <NA>
#> 3                                                                          <NA>
#> 4                                                                          <NA>
#> 5                                                                          <NA>
#> 6                                             INTERIM DIVIDEND - RS 3 PER SHARE
#> 7                                                                          <NA>
#> 8                                                                          <NA>
#> 9                                                                          <NA>
#> 10                                                                         <NA>
#> 11                                                                         <NA>
#> 12                                                                         <NA>
#> 13                                                                         <NA>
#> 14                                                                         <NA>
#> 15                                                                         <NA>
#> 16                                                                         <NA>
#> 17                                                                         <NA>
#> 18                                                                         <NA>
#> 19                                                                         <NA>
#> 20                                                                         <NA>
#> 21                                                                         <NA>
#> 22                                                                         <NA>
#> 23                                                                         <NA>
#> 24                                                                         <NA>
#> 25                                                                         <NA>
#> 26                                                                         <NA>
#> 27                                                                         <NA>
#> 28                                                                         <NA>
#> 29                                                                         <NA>
#> 30                                                                         <NA>
#> 31                                            INTERIM DIVIDEND - RS 5 PER SHARE
#> 32                                            INTERIM DIVIDEND - RS 5 PER SHARE
#> 33                                          INTERIM DIVIDEND - RS 2.5 PER SHARE
#> 34                                            INTERIM DIVIDEND - RS 5 PER SHARE
#> 35                                                                         <NA>
#> 36                                                                         <NA>
#> 37                                                                         <NA>
#> 38                                                                         <NA>
#> 39                                                                         <NA>
#> 40                                            INTERIM DIVIDEND - RS 4 PER SHARE
#> 41                                                                         <NA>
#> 42                                                                         <NA>
#> 43 INTERIM DIVIDEND - RS 6 PER SHARE SPECIAL INTERIM DIVIDEND - RS 10 PER SHARE
#> 44                            ANNUAL GENERAL MEETING/DIVIDEND - RS 65 PER SHARE
#> 45                                                                         <NA>
#> 46                                                                         <NA>
#> 47                                                                         <NA>
#> 48                                                                         <NA>
#> 49                                                                         <NA>
#> 50                                                                         <NA>
#>         iep    chn perChn     pCls trdQnty    iVal    mktCap    yHigh     yLow
#> 1    390.00 -13.30  -3.30   403.30   96605  376.76  58895.70   427.50   116.25
#> 2   1131.10 -33.15  -2.85  1164.25   90968 1028.94  90553.27  1246.85   267.50
#> 3    113.45  -1.45  -1.26   114.90   72462   82.21  41918.75   122.35    64.10
#> 4    708.60  -8.20  -1.14   716.80  263562 1867.60 180058.24   799.00   332.85
#> 5    698.00  -7.85  -1.11   705.85   30902  215.70  68247.80   773.00   163.50
#> 6    109.70   2.50   2.33   107.20  450551  494.25  27248.34   108.95    71.65
#> 7   3500.00 -34.40  -0.97  3534.40    3141  109.94  41714.92  4010.00  3080.00
#> 8   3067.10 -14.90  -0.48  3082.00   56110 1720.95 319213.34  3354.35  1903.00
#> 9    700.00  -3.40  -0.48   703.40   21292  149.04  75946.15   721.85   437.25
#> 10   963.00  -4.00  -0.41   967.00    6893   66.38  54577.80  1119.50   330.00
#> 11  2911.35  -3.65  -0.13  2915.00    1166   33.95  37853.36  3629.05  1991.35
#> 12   784.05  -0.75  -0.10   784.80    3828   30.01  75125.63   952.05   371.20
#> 13  2814.00  -1.85  -0.07  2815.85    2478   69.73 126944.98  2873.45  1482.95
#> 14  5628.00  -3.20  -0.06  5631.20    3990  224.56 149304.75  5822.20  1783.00
#> 15  1389.00  -0.70  -0.05  1389.70    1232   17.11  53032.56  1475.00   495.05
#> 16   516.00   4.35   0.85   511.65   18484   95.38  75691.45   528.50   178.00
#> 17  1348.40  11.40   0.85  1337.00   31039  418.53 495505.91  1477.55   655.00
#> 18   984.80   7.15   0.73   977.65    6011   59.20  60583.65  1081.55   503.30
#> 19   387.00   2.60   0.68   384.40  136445  528.04 147516.69   427.70   149.45
#> 20 27700.00 167.30   0.61 27532.70     106   29.36  36755.82 32048.00 18075.00
#> 21  6600.00  38.80   0.59  6561.20     687   45.34  75753.37  7055.95  3335.25
#> 22   786.40   4.25   0.54   782.15   17419  136.98  43027.07   805.30   336.00
#> 23   776.50   4.10   0.53   772.40    9489   73.68  56495.70   885.00   297.35
#> 24   531.00   2.80   0.53   528.20   23795  126.35 127639.11   623.00   394.00
#> 25  1410.80   7.35   0.52  1403.45    1816   25.62 169510.69  1593.00   791.70
#> 26   316.00   1.55   0.49   314.45  132679  419.27  56379.82   357.00    80.70
#> 27   656.00   2.80   0.43   653.20    3895   25.55  39127.24   698.00   349.25
#> 28   669.00   2.85   0.43   666.15    2177   14.56  55196.32   746.00   465.25
#> 29   628.05   2.60   0.42   625.45   38689  242.99 432527.09   679.40   285.55
#> 30 11260.00  44.85   0.40 11215.15     226   25.45  67820.51 11589.00  3985.30
#> 31   152.40   0.55   0.36   151.85   46137   70.31  31817.55   163.00   109.55
#> 32   448.00   1.55   0.35   446.45    9260   41.48  41643.90   482.40   291.80
#> 33   981.45   3.40   0.35   978.05    2530   24.83  38146.61  1044.70   698.00
#> 34   208.45   0.70   0.34   207.75   40535   84.50 181544.16   239.20   163.35
#> 35  5255.00  17.20   0.33  5237.80    2345  123.23  63586.51  5512.65  3660.10
#> 36  2467.00   7.15   0.29  2459.85   14921  368.10 443070.83  2896.00  1486.00
#> 37  4049.65  10.00   0.25  4039.65     433   17.53  51475.21  4205.00  2090.05
#> 38   906.00   2.05   0.23   903.95   16921  153.30  45926.99   966.35   590.20
#> 39  1523.00   1.85   0.12  1521.15    1778   27.08  63471.43  1621.35   818.15
#> 40   234.00   0.25   0.11   233.75   16059   37.58  59921.32   239.85   154.00
#> 41  1732.00   1.45   0.08  1730.55    5421   93.89 253767.87  2049.00  1115.00
#> 42  6780.80   4.90   0.07  6775.90     571   38.72  90062.03  8329.00  4745.50
#> 43   932.00   0.60   0.06   931.40   10617   98.95 101100.31  1067.00   506.20
#> 44 17460.00  10.65   0.06 17449.35     141   24.62  62248.49 18844.00 15100.00
#> 45  1997.90   0.85   0.04  1997.05   12886  257.45 645669.31  2369.35  1393.00
#> 46   112.00   0.05   0.04   111.95   18792   21.05  53191.55   116.75    78.10
#> 47  2565.00   0.30   0.01  2564.70    1255   32.19  35752.26  3037.00  1286.80
#> 48  1458.35   0.15   0.01  1458.20   13685  199.58 635059.72  1641.00   826.10
#> 49  2360.00   0.25   0.01  2359.75     881   20.79 210686.64  2505.90  1955.20
#> 50  4095.95   0.00   0.00  4095.95    2480  101.58  53335.48  4361.40  2450.00
#>      sumVal sumQnty finQnty sumfinQnty
#> 1  10590.19 1090006   96605    1745785
#> 2  10590.19 1090006   90968    1745785
#> 3  10590.19 1090006   72462    1745785
#> 4  10590.19 1090006  263562    1745785
#> 5  10590.19 1090006   30902    1745785
#> 6  10590.19 1090006  450551    1745785
#> 7  10590.19 1090006    3141    1745785
#> 8  10590.19 1090006   56110    1745785
#> 9  10590.19 1090006   21292    1745785
#> 10 10590.19 1090006    6893    1745785
#> 11 10590.19 1090006    1166    1745785
#> 12 10590.19 1090006    3828    1745785
#> 13 10590.19 1090006    2478    1745785
#> 14 10590.19 1090006    3990    1745785
#> 15 10590.19 1090006    1232    1745785
#> 16 10590.19 1090006   18484    1745785
#> 17 10590.19 1090006   31039    1745785
#> 18 10590.19 1090006    6011    1745785
#> 19 10590.19 1090006  136445    1745785
#> 20 10590.19 1090006     106    1745785
#> 21 10590.19 1090006     687    1745785
#> 22 10590.19 1090006   17419    1745785
#> 23 10590.19 1090006    9489    1745785
#> 24 10590.19 1090006   23795    1745785
#> 25 10590.19 1090006    1816    1745785
#> 26 10590.19 1090006  132679    1745785
#> 27 10590.19 1090006    3895    1745785
#> 28 10590.19 1090006    2177    1745785
#> 29 10590.19 1090006   38689    1745785
#> 30 10590.19 1090006     226    1745785
#> 31 10590.19 1090006   46137    1745785
#> 32 10590.19 1090006    9260    1745785
#> 33 10590.19 1090006    2530    1745785
#> 34 10590.19 1090006   40535    1745785
#> 35 10590.19 1090006    2345    1745785
#> 36 10590.19 1090006   14921    1745785
#> 37 10590.19 1090006     433    1745785
#> 38 10590.19 1090006   16921    1745785
#> 39 10590.19 1090006    1778    1745785
#> 40 10590.19 1090006   16059    1745785
#> 41 10590.19 1090006    5421    1745785
#> 42 10590.19 1090006     571    1745785
#> 43 10590.19 1090006   10617    1745785
#> 44 10590.19 1090006     141    1745785
#> 45 10590.19 1090006   12886    1745785
#> 46 10590.19 1090006   18792    1745785
#> 47 10590.19 1090006    1255    1745785
#> 48 10590.19 1090006   13685    1745785
#> 49 10590.19 1090006     881    1745785
#> 50 10590.19 1090006    2480    1745785
```

### Advances & Declines

``` r
nse_advances_declines()
#>                                     index_name advances declines unchanged
#> 1                                     NIFTY 50       14       36         0
#> 2                                NIFTY NEXT 50       24       25         1
#> 3                                     NIFTY IT        4        6         0
#> 4                                   NIFTY BANK        5        7         0
#> 5                              NIFTY MIDCAP 50       23       26         1
#> 6                                  NIFTY INFRA       11       19         0
#> 7                                 NIFTY REALTY        7        3         0
#> 8                                 NIFTY ENERGY        2        8         0
#> 9                                   NIFTY FMCG        4       11         0
#> 10                                   NIFTY MNC       11       18         1
#> 11                                NIFTY PHARMA        6        4         0
#> 12                                   NIFTY PSE        3       17         0
#> 13                              NIFTY PSU BANK        7        5         1
#> 14                           NIFTY SERV SECTOR       11       19         0
#> 15                           NIFTY COMMODITIES       12       18         0
#> 16                           NIFTY CONSUMPTION        7       22         1
#> 17                           NIFTY FIN SERVICE        9       11         0
#> 18                                  NIFTY AUTO        5       10         0
#> 19                           NIFTY DIV OPPS 50       17       33         0
#> 20                                 NIFTY MEDIA        5        5         0
#> 21                                 NIFTY METAL        1       14         0
#> 22                             NIFTY100 LIQ 15        4       11         0
#> 23                                  NIFTY CPSE        2       10         0
#> 24                           NIFTY GROWSECT 15        5       10         0
#> 25                            NIFTY50 VALUE 20        3       17         0
#> 26                           NIFTY100 QUALTY30        9       21         0
#> 27                              NIFTY PVT BANK        3        6         1
#> 28                            NIFTY MID LIQ 15        8        7         0
#> 29                                   NIFTY 100       38       61         1
#> 30                                   NIFTY 200       82      115         3
#> 31                                   NIFTY 500      220      273         8
#> 32                            NIFTY MIDCAP 100       44       54         2
#> 33                            NIFTY SMLCAP 100       43       56         1
#> 34                    NIFTY ADITYA BIRLA GROUP        3        3         1
#> 35                              NIFTY ALPHA 50       19       30         1
#> 36                          NIFTY HIGH BETA 50       22       27         1
#> 37                     NIFTY LOW VOLATILITY 50       19       30         1
#> 38                        NIFTY MAHINDRA GROUP        5        4         0
#> 39                            NIFTY MIDCAP 150       62       86         2
#> 40                       NIFTY MIDSMALLCAP 400      182      211         7
#> 41                            NIFTY SHARIAH 25        8       17         0
#> 42                          NIFTY SMALLCAP 250      120      125         5
#> 43                           NIFTY SMALLCAP 50       21       28         1
#> 44                            NIFTY TATA GROUP        6       18         0
#> 45                    NIFTY TATA GROUP 25% CAP        1        9         0
#> 46                            NIFTY100 EQL WGT       38       61         1
#> 47                           NIFTY100 LOWVOL30       10       20         0
#> 48                             NIFTY50 SHARIAH        5       13         0
#> 49                            NIFTY500 SHARIAH       93      122         3
#> 50                             NIFTY50 EQL WGT       14       36         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       12       18         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30        9       21         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30        9       21         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30        7       23         0
#> 55                       NIFTY LARGEMIDCAP 250      100      147         3
#> 56                           NIFTY500 VALUE 50       18       32         0
#> 57                            NIFTY MIDCAP 150       62       86         2
#> 58                             NIFTY SMLCAP 50       21       28         1
#> 59                            NIFTY SMLCAP 250      120      125         5
#> 60                            NIFTY MIDSML 400      182      211         7
#> 61                           NIFTY200 QUALTY30        9       21         0
#> 62                          CNX NIFTY Pre Open       35       14         1

# retain original column names as returned by NSE
nse_advances_declines(clean_names = FALSE)
#>                                        skipped advances declines unchanged
#> 1                                     NIFTY 50       14       36         0
#> 2                                NIFTY NEXT 50       24       25         1
#> 3                                     NIFTY IT        4        6         0
#> 4                                   NIFTY BANK        5        7         0
#> 5                              NIFTY MIDCAP 50       23       26         1
#> 6                                  NIFTY INFRA       11       19         0
#> 7                                 NIFTY REALTY        7        3         0
#> 8                                 NIFTY ENERGY        2        8         0
#> 9                                   NIFTY FMCG        4       11         0
#> 10                                   NIFTY MNC       11       18         1
#> 11                                NIFTY PHARMA        6        4         0
#> 12                                   NIFTY PSE        3       17         0
#> 13                              NIFTY PSU BANK        7        5         1
#> 14                           NIFTY SERV SECTOR       11       19         0
#> 15                           NIFTY COMMODITIES       12       18         0
#> 16                           NIFTY CONSUMPTION        7       22         1
#> 17                           NIFTY FIN SERVICE        9       11         0
#> 18                                  NIFTY AUTO        5       10         0
#> 19                           NIFTY DIV OPPS 50       17       33         0
#> 20                                 NIFTY MEDIA        5        5         0
#> 21                                 NIFTY METAL        1       14         0
#> 22                             NIFTY100 LIQ 15        4       11         0
#> 23                                  NIFTY CPSE        2       10         0
#> 24                           NIFTY GROWSECT 15        5       10         0
#> 25                            NIFTY50 VALUE 20        3       17         0
#> 26                           NIFTY100 QUALTY30        9       21         0
#> 27                              NIFTY PVT BANK        3        6         1
#> 28                            NIFTY MID LIQ 15        8        7         0
#> 29                                   NIFTY 100       38       61         1
#> 30                                   NIFTY 200       82      115         3
#> 31                                   NIFTY 500      220      273         8
#> 32                            NIFTY MIDCAP 100       44       54         2
#> 33                            NIFTY SMLCAP 100       43       56         1
#> 34                    NIFTY ADITYA BIRLA GROUP        3        3         1
#> 35                              NIFTY ALPHA 50       19       30         1
#> 36                          NIFTY HIGH BETA 50       22       27         1
#> 37                     NIFTY LOW VOLATILITY 50       19       30         1
#> 38                        NIFTY MAHINDRA GROUP        5        4         0
#> 39                            NIFTY MIDCAP 150       62       86         2
#> 40                       NIFTY MIDSMALLCAP 400      182      211         7
#> 41                            NIFTY SHARIAH 25        8       17         0
#> 42                          NIFTY SMALLCAP 250      120      125         5
#> 43                           NIFTY SMALLCAP 50       21       28         1
#> 44                            NIFTY TATA GROUP        6       18         0
#> 45                    NIFTY TATA GROUP 25% CAP        1        9         0
#> 46                            NIFTY100 EQL WGT       38       61         1
#> 47                           NIFTY100 LOWVOL30       10       20         0
#> 48                             NIFTY50 SHARIAH        5       13         0
#> 49                            NIFTY500 SHARIAH       93      122         3
#> 50                             NIFTY50 EQL WGT       14       36         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       12       18         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30        9       21         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30        9       21         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30        7       23         0
#> 55                       NIFTY LARGEMIDCAP 250      100      147         3
#> 56                           NIFTY500 VALUE 50       18       32         0
#> 57                            NIFTY MIDCAP 150       62       86         2
#> 58                             NIFTY SMLCAP 50       21       28         1
#> 59                            NIFTY SMLCAP 250      120      125         5
#> 60                            NIFTY MIDSML 400      182      211         7
#> 61                           NIFTY200 QUALTY30        9       21         0
#> 62                          CNX NIFTY Pre Open       35       14         1
```
