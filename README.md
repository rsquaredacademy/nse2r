
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
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://lifecycle.r-lib.org/articles/stages.html#maturing)
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
#> 1  NIFTY 50 Pre Open         15026.750 -218.85          -1.44
#> 2           NIFTY 50         15117.000 -128.60          -0.84
#> 3      NIFTY NEXT 50         35897.450  184.70           0.52
#> 4    NIFTY100 LIQ 15          3829.400  -32.15          -0.83
#> 5         NIFTY BANK         35892.550 -475.50          -1.31
#> 6          INDIA VIX            23.695    1.60           7.26
#> 7          NIFTY 100         15277.300 -102.20          -0.66
#> 8          NIFTY 500         12719.900  -44.90          -0.35
#> 9   NIFTY MIDCAP 100         24685.500  197.05           0.80
#> 10   NIFTY MIDCAP 50          7195.850   44.80           0.63
#> 11       NIFTY INFRA          4291.750    9.40           0.22
#> 12      NIFTY REALTY           364.100    1.65           0.46
#> 13      NIFTY ENERGY         19537.850 -132.20          -0.67
#> 14        NIFTY FMCG         33464.100    9.70           0.03
#> 15         NIFTY MNC         16387.250   91.80           0.56
#> 16      NIFTY PHARMA         12382.000    2.40           0.02
#> 17         NIFTY PSE          3345.300   -6.85          -0.20
#> 18    NIFTY PSU BANK          2441.800  -13.15          -0.54
#> 19 NIFTY SERV SECTOR         21324.500 -230.75          -1.07
#> 20          NIFTY IT         25731.200  -41.45          -0.16
#> 21  NIFTY SMLCAP 100          8515.600  114.85           1.37
#> 22         NIFTY 200          7924.950  -38.35          -0.48
#> 23        NIFTY AUTO         10694.400   21.30           0.20
#> 24       NIFTY MEDIA          1756.550   36.80           2.14
#> 25       NIFTY METAL          4002.100  -56.50          -1.39
#> 26 NIFTY DIV OPPS 50          3101.900   -3.40          -0.11
#> 27 NIFTY COMMODITIES          4554.300   17.75           0.39
#> 28 NIFTY CONSUMPTION          6014.150   12.20           0.20
#> 29        NIFTY CPSE          1927.950   -9.95          -0.51
#> 30 NIFTY FIN SERVICE         16583.050 -271.35          -1.61
#> 31 NIFTY GROWSECT 15          7221.400  -72.45          -0.99
#> 32  NIFTY50 VALUE 20          7409.600  -27.95          -0.38
#> 33 NIFTY50 TR 2X LEV          9324.750 -160.85          -1.70
#> 34 NIFTY50 PR 2X LEV          6994.600 -120.70          -1.70
#> 35 NIFTY50 TR 1X INV           251.200    2.15           0.86
#> 36 NIFTY50 PR 1X INV           289.900    2.45           0.85
#> 37    NIFTY ALPHA 50         22709.650  156.70           0.69
#> 38   NIFTY50 EQL WGT         16512.300  -45.00          -0.27
#> 39  NIFTY100 EQL WGT         17609.850   39.55           0.23
#> 40 NIFTY100 LOWVOL30         11449.600    5.35           0.05
#> 41  NIFTY MID LIQ 15          6109.400   38.90           0.64
#> 42    NIFTY PVT BANK         19232.850 -192.70          -0.99
#> 43 NIFTY100 QUALTY30          3396.500    0.75           0.02
#> 44   NIFTY GS 8 13YR          2210.320    2.65           0.12
#> 45     NIFTY GS 10YR          2000.710    3.30           0.16
#> 46 NIFTY GS 10YR CLN           942.470    1.42           0.15
#> 47    NIFTY GS 4 8YR          2361.960    0.24           0.01
#> 48  NIFTY GS 11 15YR          2365.270    2.25           0.09
#> 49 NIFTY GS 15YRPLUS          2613.590    4.12           0.15
#> 50 NIFTY GS COMPSITE          2256.120    2.11           0.09
#> 51  NIFTY MIDCAP 150          9300.900   65.20           0.71
#> 52   NIFTY SMLCAP 50          4267.050   26.65           0.63
#> 53  NIFTY SMLCAP 250          7254.300   85.15           1.19
#> 54  NIFTY MIDSML 400          8570.100   72.65           0.85
#> 55 NIFTY200 QUALTY30         12449.950   21.00           0.17

# retain original column names as returned by NSE
nse_index_quote(clean_names = FALSE)
#>              skipped lastPrice  change pChange
#> 1  NIFTY 50 Pre Open 15026.750 -218.85   -1.44
#> 2           NIFTY 50 15117.000 -128.60   -0.84
#> 3      NIFTY NEXT 50 35897.450  184.70    0.52
#> 4    NIFTY100 LIQ 15  3829.400  -32.15   -0.83
#> 5         NIFTY BANK 35892.550 -475.50   -1.31
#> 6          INDIA VIX    23.695    1.60    7.26
#> 7          NIFTY 100 15277.300 -102.20   -0.66
#> 8          NIFTY 500 12719.900  -44.90   -0.35
#> 9   NIFTY MIDCAP 100 24685.500  197.05    0.80
#> 10   NIFTY MIDCAP 50  7195.850   44.80    0.63
#> 11       NIFTY INFRA  4291.750    9.40    0.22
#> 12      NIFTY REALTY   364.100    1.65    0.46
#> 13      NIFTY ENERGY 19537.850 -132.20   -0.67
#> 14        NIFTY FMCG 33464.100    9.70    0.03
#> 15         NIFTY MNC 16387.250   91.80    0.56
#> 16      NIFTY PHARMA 12382.000    2.40    0.02
#> 17         NIFTY PSE  3345.300   -6.85   -0.20
#> 18    NIFTY PSU BANK  2441.800  -13.15   -0.54
#> 19 NIFTY SERV SECTOR 21324.500 -230.75   -1.07
#> 20          NIFTY IT 25731.200  -41.45   -0.16
#> 21  NIFTY SMLCAP 100  8515.600  114.85    1.37
#> 22         NIFTY 200  7924.950  -38.35   -0.48
#> 23        NIFTY AUTO 10694.400   21.30    0.20
#> 24       NIFTY MEDIA  1756.550   36.80    2.14
#> 25       NIFTY METAL  4002.100  -56.50   -1.39
#> 26 NIFTY DIV OPPS 50  3101.900   -3.40   -0.11
#> 27 NIFTY COMMODITIES  4554.300   17.75    0.39
#> 28 NIFTY CONSUMPTION  6014.150   12.20    0.20
#> 29        NIFTY CPSE  1927.950   -9.95   -0.51
#> 30 NIFTY FIN SERVICE 16583.050 -271.35   -1.61
#> 31 NIFTY GROWSECT 15  7221.400  -72.45   -0.99
#> 32  NIFTY50 VALUE 20  7409.600  -27.95   -0.38
#> 33 NIFTY50 TR 2X LEV  9324.750 -160.85   -1.70
#> 34 NIFTY50 PR 2X LEV  6994.600 -120.70   -1.70
#> 35 NIFTY50 TR 1X INV   251.200    2.15    0.86
#> 36 NIFTY50 PR 1X INV   289.900    2.45    0.85
#> 37    NIFTY ALPHA 50 22709.650  156.70    0.69
#> 38   NIFTY50 EQL WGT 16512.300  -45.00   -0.27
#> 39  NIFTY100 EQL WGT 17609.850   39.55    0.23
#> 40 NIFTY100 LOWVOL30 11449.600    5.35    0.05
#> 41  NIFTY MID LIQ 15  6109.400   38.90    0.64
#> 42    NIFTY PVT BANK 19232.850 -192.70   -0.99
#> 43 NIFTY100 QUALTY30  3396.500    0.75    0.02
#> 44   NIFTY GS 8 13YR  2210.320    2.65    0.12
#> 45     NIFTY GS 10YR  2000.710    3.30    0.16
#> 46 NIFTY GS 10YR CLN   942.470    1.42    0.15
#> 47    NIFTY GS 4 8YR  2361.960    0.24    0.01
#> 48  NIFTY GS 11 15YR  2365.270    2.25    0.09
#> 49 NIFTY GS 15YRPLUS  2613.590    4.12    0.15
#> 50 NIFTY GS COMPSITE  2256.120    2.11    0.09
#> 51  NIFTY MIDCAP 150  9300.900   65.20    0.71
#> 52   NIFTY SMLCAP 50  4267.050   26.65    0.63
#> 53  NIFTY SMLCAP 250  7254.300   85.15    1.19
#> 54  NIFTY MIDSML 400  8570.100   72.65    0.85
#> 55 NIFTY200 QUALTY30 12449.950   21.00    0.17
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#>        symbol series last_corp_announcement_date
#> 1  ULTRACEMCO     EQ                  2020-07-29
#> 2    SHREECEM     EQ                  2020-02-24
#> 3  ADANIPORTS     EQ                  2020-06-17
#> 4      GRASIM     EQ                  2020-08-26
#> 5     DRREDDY     EQ                  2020-07-13
#> 6     SBILIFE     EQ                  2019-04-03
#> 7         UPL     EQ                  2020-08-19
#> 8       WIPRO     EQ                  2021-01-22
#> 9   BRITANNIA     EQ                  2020-08-26
#> 10 HEROMOTOCO     EQ                  2021-02-15
#>                                                  last_corp_announcement
#> 1                     Annual General Meeting/Dividend - Rs 13 Per Share
#> 2                                   Interim Dividend - Rs 110 Per Share
#> 3                                                Annual General Meeting
#> 4                                             Dividend - Rs 4 Per Share
#> 5                     Annual General Meeting/Dividend - Rs 25 Per Share
#> 6                                     Interim Dividend - Rs 2 Per Share
#> 7                                                Dividend - Rs 6 Per Sh
#> 8                                     Interim Dividend - Re 1 Per Share
#> 9                                    Interim Dividend - Rs 83 Per Share
#> 10 Interim Dividend - Rs 65 Per Share Special Dividend - Rs 5 Per Share
#>    open_price high_price low_price last_traded_price prev_close_price
#> 1     6429.00    6830.00   6394.45           6817.00          6500.50
#> 2    27450.00   28850.00  27335.05          28750.00         27695.25
#> 3      733.25     765.70    715.85            755.25           729.85
#> 4     1306.00    1358.75   1300.50           1356.25          1318.10
#> 5     4482.00    4579.55   4444.00           4569.80          4502.55
#> 6      899.70     924.80    892.40            918.30           906.45
#> 7      602.00     631.45    599.10            620.70           613.60
#> 8      428.90     444.30    427.50            439.80           435.50
#> 9     3450.00    3514.80   3450.00           3509.15          3481.15
#> 10    3398.00    3460.00   3368.25           3450.95          3424.35
#>    percent_change traded_quantity turnover_in_lakhs
#> 1            4.87         1049028          69537.44
#> 2            3.81           55843          15683.09
#> 3            3.48        27627815         206976.54
#> 4            2.89         1566811          20879.01
#> 5            1.49         1228647          55601.56
#> 6            1.31         2816737          25825.82
#> 7            1.16        12688899          78568.39
#> 8            0.99        10840637          47595.82
#> 9            0.80          447687          15639.81
#> 10           0.78          750872          25740.57

# retain original column names as returned by NSE
nse_stock_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1  ULTRACEMCO     EQ               2020-07-29
#> 2    SHREECEM     EQ               2020-02-24
#> 3  ADANIPORTS     EQ               2020-06-17
#> 4      GRASIM     EQ               2020-08-26
#> 5     DRREDDY     EQ               2020-07-13
#> 6     SBILIFE     EQ               2019-04-03
#> 7         UPL     EQ               2020-08-19
#> 8       WIPRO     EQ               2021-01-22
#> 9   BRITANNIA     EQ               2020-08-26
#> 10 HEROMOTOCO     EQ               2021-02-15
#>                                                    lastCorpAnnouncement
#> 1                     Annual General Meeting/Dividend - Rs 13 Per Share
#> 2                                   Interim Dividend - Rs 110 Per Share
#> 3                                                Annual General Meeting
#> 4                                             Dividend - Rs 4 Per Share
#> 5                     Annual General Meeting/Dividend - Rs 25 Per Share
#> 6                                     Interim Dividend - Rs 2 Per Share
#> 7                                                Dividend - Rs 6 Per Sh
#> 8                                     Interim Dividend - Re 1 Per Share
#> 9                                    Interim Dividend - Rs 83 Per Share
#> 10 Interim Dividend - Rs 65 Per Share Special Dividend - Rs 5 Per Share
#>    openPrice highPrice lowPrice      ltp previousPrice netPrice tradedQuantity
#> 1    6429.00   6830.00  6394.45  6817.00       6500.50     4.87        1049028
#> 2   27450.00  28850.00 27335.05 28750.00      27695.25     3.81          55843
#> 3     733.25    765.70   715.85   755.25        729.85     3.48       27627815
#> 4    1306.00   1358.75  1300.50  1356.25       1318.10     2.89        1566811
#> 5    4482.00   4579.55  4444.00  4569.80       4502.55     1.49        1228647
#> 6     899.70    924.80   892.40   918.30        906.45     1.31        2816737
#> 7     602.00    631.45   599.10   620.70        613.60     1.16       12688899
#> 8     428.90    444.30   427.50   439.80        435.50     0.99       10840637
#> 9    3450.00   3514.80  3450.00  3509.15       3481.15     0.80         447687
#> 10   3398.00   3460.00  3368.25  3450.95       3424.35     0.78         750872
#>    turnoverInLakhs
#> 1         69537.44
#> 2         15683.09
#> 3        206976.54
#> 4         20879.01
#> 5         55601.56
#> 6         25825.82
#> 7         78568.39
#> 8         47595.82
#> 9         15639.81
#> 10        25740.57
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#>         symbol
#> 1       AAKASH
#> 2        AARVI
#> 3    ABCAPITAL
#> 4    ABMINTLTD
#> 5          ACC
#> 6   ADANIPORTS
#> 7   ADANIPOWER
#> 8   ADANITRANS
#> 9     ADFFOODS
#> 10   AEGISCHEM
#> 11       AFFLE
#> 12      AFL-RE
#> 13      AHLADA
#> 14     ALMONDZ
#> 15       AMBER
#> 16   AMBUJACEM
#> 17    ANANTRAJ
#> 18        APCL
#> 19   APLAPOLLO
#> 20  APOLLOTYRE
#> 21     ARSHIYA
#> 22  ASAHIINDIA
#> 23      ASTRAL
#> 24  ASTRAMICRO
#> 25        ATGL
#> 26      AUBANK
#> 27  BALMLAWRIE
#> 28  BALRAMCHIN
#> 29        BASF
#> 30      BCLIND
#> 31         BEL
#> 32        BHEL
#> 33   BOMDYEING
#> 34         BPL
#> 35  CAMLINFINE
#> 36     CGPOWER
#> 37  CNOVAPETRO
#> 38      CONCOR
#> 39    CONFIPET
#> 40  CONSOFINVT
#> 41  COSMOFILMS
#> 42  CUMMINSIND
#> 43  CYBERMEDIA
#> 44      DAAWAT
#> 45   DALMIASUG
#> 46      DCMNVL
#> 47  DCMSHRIRAM
#> 48    DECCANCE
#> 49   DEEPAKNTR
#> 50  DELTAMAGNT
#> 51  DHAMPURSUG
#> 52      DICIND
#> 53         DLF
#> 54    DWARKESH
#> 55   ELECTCAST
#> 56  EQUITASBNK
#> 57   EROSMEDIA
#> 58  FEDERALBNK
#> 59      FORTIS
#> 60     GABRIEL
#> 61        GAEL
#> 62        GATI
#> 63         GDL
#> 64      GENCON
#> 65     GENESYS
#> 66       GET&D
#> 67        GHCL
#> 68       GLAND
#> 69    GMRINFRA
#> 70      GOENKA
#> 71      GRASIM
#> 72        HBSL
#> 73  HEXATRADEX
#> 74    HINDZINC
#> 75  HITECHCORP
#> 76     HLEGLAS
#> 77         HMT
#> 78      HONAUT
#> 79   IBREALEST
#> 80    ICICIB22
#> 81        IDFC
#> 82  IDFCFIRSTB
#> 83        IFCI
#> 84        IGPL
#> 85        IIFL
#> 86    IMAGICAA
#> 87    INDIACEM
#> 88  INDIAGLYCO
#> 89  INSPIRISYS
#> 90   INVENTURE
#> 91       IRCTC
#> 92      ITDCEM
#> 93   JAIBALAJI
#> 94   JAMNAAUTO
#> 95  JAYNECOIND
#> 96        JBMA
#> 97  JINDALPOLY
#> 98  JISLJALEQS
#> 99  KALYANIFRG
#> 100 KANORICHEM
#> 101   KANPRPLA
#> 102        KCP
#> 103 KESORAMIND
#> 104       KICL
#> 105 KIRLOSBROS
#> 106  KIRLOSENG
#> 107        KSB
#> 108    KTKBANK
#> 109   LIKHITHA
#> 110  LUMAXTECH
#> 111       M100
#> 112      MAGMA
#> 113     MAHLOG
#> 114  MANGLMCEM
#> 115   MANINFRA
#> 116       MEGH
#> 117 MODIRUBBER
#> 118     MPSLTD
#> 119       MTNL
#> 120 NAVINFLUOR
#> 121 NETFMID150
#> 122       NHPC
#> 123       NMDC
#> 124      NOCIL
#> 125 NRBBEARING
#> 126  ONWARDTEC
#> 127   OPTIEMUS
#> 128 ORCHPHARMA
#> 129  ORIENTCEM
#> 130       PAEL
#> 131  PARSVNATH
#> 132        PFC
#> 133     PFOCUS
#> 134       PGEL
#> 135 PHILIPCARB
#> 136    PRABHAT
#> 137    PRAJIND
#> 138     PRECOT
#> 139  PRICOLLTD
#> 140        PTC
#> 141 PUNJABCHEM
#> 142     RAJMET
#> 143   RAJRATAN
#> 144 RAJSREESUG
#> 145   RAMCOCEM
#> 146      RAMKY
#> 147    RANASUG
#> 148 RANEHOLDIN
#> 149        RBL
#> 150        RML
#> 151     RUSHIL
#> 152     SAFARI
#> 153     SALONA
#> 154  SANGHIIND
#> 155        SCI
#> 156      SETCO
#> 157      SEZAL
#> 158 SHAREINDIA
#> 159 SHIVAMILLS
#> 160 SHREDIGCEM
#> 161  SHREERAMA
#> 162   SHYAMTEL
#> 163    SIEMENS
#> 164        SIL
#> 165      SILGO
#> 166 SRHHYPOLTD
#> 167 STARCEMENT
#> 168   SUPPETRO
#> 169 SUPREMEIND
#> 170   TATACHEM
#> 171 TATACOFFEE
#> 172  TATAPOWER
#> 173    TFCILTD
#> 174 THIRUSUGAR
#> 175    TIINDIA
#> 176 TIMETECHNO
#> 177 TORNTPOWER
#> 178      TRENT
#> 179    TRIVENI
#> 180      UFLEX
#> 181  UGARSUGAR
#> 182 ULTRACEMCO
#> 183 UNICHEMLAB
#> 184        UPL
#> 185 VADILALIND
#> 186 VAIBHAVGBL
#> 187     VERTOZ
#> 188     VIPIND
#> 189   VIPULLTD
#> 190     WELENT
#> 191 WELSPUNIND
#> 192 ZENSARTECH
#>                                                           symbol_desc
#> 1                                 Aakash Exploration Services Limited
#> 2                                                 Aarvi Encon Limited
#> 3                                        Aditya Birla Capital Limited
#> 4                                           ABM International Limited
#> 5                                                         ACC Limited
#> 6                       Adani Ports and Special Economic Zone Limited
#> 7                                                 Adani Power Limited
#> 8                                          Adani Transmission Limited
#> 9                                                   ADF Foods Limited
#> 10                                            Aegis Logistics Limited
#> 11                                              Affle (India) Limited
#> 12                                            Arvind Fashions Limited
#> 13                                           Ahlada Engineers Limited
#> 14                                  Almondz Global Securities Limited
#> 15                                    Amber Enterprises India Limited
#> 16                                             Ambuja Cements Limited
#> 17                                                  Anant Raj Limited
#> 18                                     Anjani Portland Cement Limited
#> 19                                           APL Apollo Tubes Limited
#> 20                                               Apollo Tyres Limited
#> 21                                                    Arshiya Limited
#> 22                                          Asahi India Glass Limited
#> 23                                        Astral Poly Technik Limited
#> 24                                   Astra Microwave Products Limited
#> 25                                            Adani Total Gas Limited
#> 26                                      AU Small Finance Bank Limited
#> 27                                    Balmer Lawrie & Company Limited
#> 28                                      Balrampur Chini Mills Limited
#> 29                                                 BASF India Limited
#> 30                                             Bcl Industries Limited
#> 31                                         Bharat Electronics Limited
#> 32                                   Bharat Heavy Electricals Limited
#> 33                                Bombay Dyeing & Mfg Company Limited
#> 34                                                        BPL Limited
#> 35                                       Camlin Fine Sciences Limited
#> 36                          CG Power and Industrial Solutions Limited
#> 37                                    CIL Nova Petrochemicals Limited
#> 38                             Container Corporation of India Limited
#> 39                                 Confidence Petroleum India Limited
#> 40                            Consolidated Finvest & Holdings Limited
#> 41                                                Cosmo Films Limited
#> 42                                              Cummins India Limited
#> 43                                        Cyber Media (India) Limited
#> 44                                                   LT Foods Limited
#> 45                         Dalmia Bharat Sugar and Industries Limited
#> 46                                               DCM Nouvelle Limited
#> 47                                                DCM Shriram Limited
#> 48                                             Deccan Cements Limited
#> 49                                             Deepak Nitrite Limited
#> 50                                        Delta Manufacturing Limited
#> 51                                        Dhampur Sugar Mills Limited
#> 52                                                  DIC India Limited
#> 53                                                        DLF Limited
#> 54                                 Dwarikesh Sugar Industries Limited
#> 55                                      Electrosteel Castings Limited
#> 56                                 Equitas Small Finance Bank Limited
#> 57                                   Eros International Media Limited
#> 58                                          The Federal Bank  Limited
#> 59                                          Fortis Healthcare Limited
#> 60                                              Gabriel India Limited
#> 61                                     Gujarat Ambuja Exports Limited
#> 62                                                       GATI Limited
#> 63                                        Gateway Distriparks Limited
#> 64              Generic Engineering Construction and Projects Limited
#> 65                          Genesys International Corporation Limited
#> 66                                               GE T&D India Limited
#> 67                                                       GHCL Limited
#> 68                                               Gland Pharma Limited
#> 69                                         GMR Infrastructure Limited
#> 70                                  Goenka Diamond and Jewels Limited
#> 71                                          Grasim Industries Limited
#> 72                                           HB Stockholdings Limited
#> 73                                                Hexa Tradex Limited
#> 74                                             Hindustan Zinc Limited
#> 75                                         Hitech Corporation Limited
#> 76                                               HLE Glascoat Limited
#> 77                                                        HMT Limited
#> 78                                 Honeywell Automation India Limited
#> 79                                     Indiabulls Real Estate Limited
#> 80                       ICICI Prudential Mutual Fund - BHARAT 22 ETF
#> 81                                                       IDFC Limited
#> 82                                            IDFC First Bank Limited
#> 83                                                       IFCI Limited
#> 84                                          IG Petrochemicals Limited
#> 85                                               IIFL Finance Limited
#> 86                                Imagicaaworld Entertainment Limited
#> 87                                          The India Cements Limited
#> 88                                              India Glycols Limited
#> 89                                       Inspirisys Solutions Limited
#> 90                              Inventure Growth & Securities Limited
#> 91            Indian Railway Catering And Tourism Corporation Limited
#> 92                                      ITD Cementation India Limited
#> 93                                      Jai Balaji Industries Limited
#> 94                                      Jamna Auto Industries Limited
#> 95                                   Jayaswal Neco Industries Limited
#> 96                                                   JBM Auto Limited
#> 97                                          Jindal Poly Films Limited
#> 98                                    Jain Irrigation Systems Limited
#> 99                                              Kalyani Forge Limited
#> 100                            Kanoria Chemicals & Industries Limited
#> 101                                         Kanpur Plastipack Limited
#> 102                                                       KCP Limited
#> 103                                        Kesoram Industries Limited
#> 104                                Kalyani Investment Company Limited
#> 105                                        Kirloskar Brothers Limited
#> 106                                     Kirloskar Oil Engines Limited
#> 107                                                       Ksb Limited
#> 108                                        The Karnataka Bank Limited
#> 109                                   Likhitha Infrastructure Limited
#> 110                                   Lumax Auto Technologies Limited
#> 111 Motilal Oswal Mutual Fund - Motilal Oswal MOSt Shares M100 ETF GO
#> 112                                             Magma Fincorp Limited
#> 113                                        Mahindra Logistics Limited
#> 114                                           Mangalam Cement Limited
#> 115                                     Man Infraconstruction Limited
#> 116                                         Meghmani Organics Limited
#> 117                                               Modi Rubber Limited
#> 118                                                       MPS Limited
#> 119                                 Mahanagar Telephone Nigam Limited
#> 120                              Navin Fluorine International Limited
#> 121                                 NIPPON INDIA ETF NIFTY MIDCAP 150
#> 122                                                      NHPC Limited
#> 123                                                      NMDC Limited
#> 124                                                     NOCIL Limited
#> 125                                               NRB Bearing Limited
#> 126                                       Onward Technologies Limited
#> 127                                         Optiemus Infracom Limited
#> 128                                             Orchid Pharma Limited
#> 129                                             Orient Cement Limited
#> 130                                                       PAE Limited
#> 131                                      Parsvnath Developers Limited
#> 132                                 Power Finance Corporation Limited
#> 133                                               Prime Focus Limited
#> 134                                           PG Electroplast Limited
#> 135                                     Phillips Carbon Black Limited
#> 136                                             Prabhat Dairy Limited
#> 137                                           Praj Industries Limited
#> 138                                                    Precot Limited
#> 139                                                    Pricol Limited
#> 140                                                 PTC India Limited
#> 141                        Punjab Chemicals & Crop Protection Limited
#> 142                                          Rajnandini Metal Limited
#> 143                                      Rajratan Global Wire Limited
#> 144                               Rajshree Sugars & Chemicals Limited
#> 145                                         The Ramco Cements Limited
#> 146                                      Ramky Infrastructure Limited
#> 147                                               Rana Sugars Limited
#> 148                                             Rane Holdings Limited
#> 149                                         Rane Brake Lining Limited
#> 150                                             Rane (Madras) Limited
#> 151                                              Rushil Decor Limited
#> 152                                 Safari Industries (India) Limited
#> 153                                            Salona Cotspin Limited
#> 154                                         Sanghi Industries Limited
#> 155                             Shipping Corporation Of India Limited
#> 156                                          Setco Automotive Limited
#> 157                                               Sezal Glass Limited
#> 158                                    Share India Securities Limited
#> 159                                               Shiva Mills Limited
#> 160                                      Shree Digvijay Cement Co.Ltd
#> 161                                     Shree Rama Multi-Tech Limited
#> 162                                             Shyam Telecom Limited
#> 163                                                   Siemens Limited
#> 164                                       Standard Industries Limited
#> 165                                              Silgo Retail Limited
#> 166                         Sree Rayalaseema Hi-Strength Hypo Limited
#> 167                                               Star Cement Limited
#> 168                                         Supreme Petrochem Limited
#> 169                                        Supreme Industries Limited
#> 170                                            Tata Chemicals Limited
#> 171                                               Tata Coffee Limited
#> 172                                        Tata Power Company Limited
#> 173                      Tourism Finance Corporation of India Limited
#> 174                                      Thiru Arooran Sugars Limited
#> 175                                 Tube Investments of India Limited
#> 176                                          Time Technoplast Limited
#> 177                                             Torrent Power Limited
#> 178                                                     Trent Limited
#> 179                          Triveni Engineering & Industries Limited
#> 180                                                     UFLEX Limited
#> 181                                      The Ugar Sugar Works Limited
#> 182                                          UltraTech Cement Limited
#> 183                                      Unichem Laboratories Limited
#> 184                                                       UPL Limited
#> 185                                        Vadilal Industries Limited
#> 186                                            Vaibhav Global Limited
#> 187                                        Vertoz Advertising Limited
#> 188                                            VIP Industries Limited
#> 189                                                     Vipul Limited
#> 190                                       Welspun Enterprises Limited
#> 191                                             Welspun India Limited
#> 192                                       Zensar Technologies Limited
#>           date new_high     year last_traded_price prev_high prev_close  change
#> 1   2021-03-03   127.90   127.90            126.00    127.90     127.50   -1.50
#> 2   2021-02-26    62.50    62.50             57.00     54.70      52.10    4.90
#> 3   2021-03-03   134.90   134.90            132.70    130.90     129.65    3.05
#> 4   2021-03-03    84.10    84.10             76.10     80.15      80.10   -4.00
#> 5   2021-02-26  1863.00  1863.00           1858.30   1847.00    1796.40   61.90
#> 6   2021-03-03   765.70   765.70            753.05    754.95     729.85   23.20
#> 7   2021-03-03    71.35    71.35             71.35     66.65      64.90    6.45
#> 8   2021-03-03   854.95   854.95            835.00    852.55     828.00    7.00
#> 9   2021-03-03   906.95   906.95            884.40    894.70     879.80    4.60
#> 10  2021-03-03   341.00   341.00            335.40    331.65     325.95    9.45
#> 11  2021-03-03  6004.05  6004.05           6004.05   5898.90    5718.15  285.90
#> 12        <NA>    41.05    41.05             39.40        NA      29.35   10.05
#> 13  2021-03-03   101.10   101.10            101.10     96.30      96.30    4.80
#> 14  2021-03-01    29.65    29.65             29.65     29.40      28.25    1.40
#> 15  2021-03-03  3494.95  3494.95           3465.00   3391.40    3310.90  154.10
#> 16  2021-02-18   293.75   293.75            292.90    290.50     282.10   10.80
#> 17  2021-03-03    56.80    56.80             56.80     54.10      54.10    2.70
#> 18  2021-02-09   238.70   238.70            234.25    237.00     223.15   11.10
#> 19  2021-03-03  1312.95  1312.95           1312.35   1250.00    1243.15   69.20
#> 20  2021-02-08   259.20   259.20            258.20    256.50     250.00    8.20
#> 21  2021-03-03    41.65    41.65             40.50     39.70      39.70    0.80
#> 22  2021-03-03   328.00   328.00            320.40    321.10     314.75    5.65
#> 23  2021-03-02  2224.90  2224.90           2215.00   2220.45    2205.30    9.70
#> 24  2021-03-03   145.00   145.00            140.65    142.30     135.35    5.30
#> 25  2021-03-03   701.70   701.70            685.45    689.15     662.75   22.70
#> 26  2021-03-03  1290.00  1290.00           1260.70   1225.00    1200.90   59.80
#> 27  2020-12-29   152.40   152.40            146.40    146.70     128.15   18.25
#> 28  2021-03-03   213.35   213.35            210.45    198.15     192.80   17.65
#> 29  2021-03-03  2318.80  2318.80           2276.75   2244.95    2198.95   77.80
#> 30        <NA>   148.00   148.00            130.50        NA     125.90    4.60
#> 31  2021-03-03   154.95   154.95            153.45    154.00     152.90    0.55
#> 32  2021-03-03    56.10    56.10             54.60     52.65      51.00    3.60
#> 33  2021-03-03    89.75    89.75             86.90     88.20      84.25    2.65
#> 34  2020-12-02    26.45    26.45             25.60     26.00      25.35    0.25
#> 35  2021-03-02   151.30   151.30            150.50    148.50     143.60    6.90
#> 36  2021-03-03    63.30    63.30             63.30     60.35      60.30    3.00
#> 37  2021-03-03    17.00    17.00             17.00     16.20      16.20    0.80
#> 38  2021-02-25   643.95   643.95            618.60    597.00     578.35   40.25
#> 39  2021-02-11    49.00    49.00             48.15     48.50      44.60    3.55
#> 40  2021-01-04    52.05    52.05             50.45     50.40      45.85    4.60
#> 41  2021-03-03   655.50   655.50            641.00    624.00     620.35   20.65
#> 42  2021-03-03   896.00   896.00            893.90    882.95     864.45   29.45
#> 43  2021-03-03    17.65    17.65             17.65     16.85      16.85    0.80
#> 44  2020-08-11    64.00    64.00             61.90     63.30      58.75    3.15
#> 45  2021-03-03   178.45   178.45            177.00    178.00     173.60    3.40
#> 46  2021-02-10    79.45    79.45             79.00     77.45      75.70    3.30
#> 47  2021-03-03   562.95   562.95            547.60    542.00     531.35   16.25
#> 48  2021-03-03   457.90   457.90            452.00    433.00     420.45   31.55
#> 49  2021-03-02  1690.00  1690.00           1635.85   1663.15    1602.15   33.70
#> 50  2021-02-17    35.00    35.00             35.00     34.00      33.35    1.65
#> 51  2021-03-03   201.35   201.35            196.85    195.00     192.75    4.10
#> 52  2020-12-31   455.95   455.95            442.00    424.90     415.25   26.75
#> 53  2021-03-03   332.70   332.70            328.40    328.60     324.20    4.20
#> 54  2021-03-03    36.95    36.95             36.75     35.75      35.35    1.40
#> 55  2021-03-03    28.00    28.00             27.40     27.70      27.05    0.35
#> 56  2021-02-18    59.60    59.60             59.60     51.60      49.70    9.90
#> 57  2021-03-03    34.15    34.15             32.65     33.30      32.80   -0.15
#> 58  2021-03-03    92.50    92.50             91.20     88.50      88.10    3.10
#> 59  2021-01-11   184.70   184.70            179.75    182.10     173.90    5.85
#> 60  2021-01-07   134.50   134.50            133.25    131.40     127.55    5.70
#> 61  2021-01-25   155.00   155.00            149.35    151.00     139.45    9.90
#> 62  2020-12-31   116.20   116.20            111.60    106.60     101.35   10.25
#> 63  2021-01-25   184.00   184.00            180.30    182.60     175.45    4.85
#> 64  2021-02-18    68.00    68.00             64.50     64.70      56.70    7.80
#> 65  2021-03-03    96.00    96.00             95.80     91.95      91.55    4.25
#> 66  2021-02-19   146.40   146.40            144.40    138.85     136.30    8.10
#> 67  2021-03-03   258.00   258.00            254.80    254.70     246.55    8.25
#> 68  2020-12-28  2680.00  2680.00           2655.00   2508.55    2436.75  218.25
#> 69  2020-12-16    29.95    29.95             29.10     29.35      27.75    1.35
#> 70  2021-03-03     2.20     2.20              2.00      2.10       2.10   -0.10
#> 71  2021-03-03  1360.00  1360.00           1358.90   1343.00    1318.10   40.80
#> 72  2021-03-03    17.15    17.15             17.15     16.35      16.35    0.80
#> 73  2021-03-03    75.05    75.05             74.00     74.80      71.50    2.50
#> 74  2021-01-07   334.40   334.40            329.80    328.40     318.05   11.75
#> 75  2021-02-26   145.55   145.55            142.80    145.00     140.35    2.45
#> 76  2021-03-03  2520.00  2520.00           2450.00   2430.75    2403.30   46.70
#> 77  2021-02-10    28.65    28.65             28.65     28.40      27.30    1.35
#> 78  2021-02-22 49600.00 49600.00          48060.00  48644.00   46682.65 1377.35
#> 79  2021-03-03   119.50   119.50            117.40    107.75     105.25   12.15
#> 80  2021-03-03    39.80    39.80             38.11     38.85      38.58   -0.47
#> 81  2021-02-25    57.40    57.40             55.95     57.00      55.55    0.40
#> 82  2021-03-03    69.30    69.30             68.65     68.15      67.10    1.55
#> 83  2021-03-03    13.20    13.20             11.95     12.80      12.80   -0.85
#> 84  2020-12-04   536.00   536.00            518.10    503.95     483.65   34.45
#> 85  2021-03-03   302.30   302.30            297.70    299.00     294.00    3.70
#> 86  2021-03-03     8.30     8.30              8.30      7.95       7.95    0.35
#> 87  2021-01-01   187.00   187.00            184.80    185.80     174.15   10.65
#> 88  2021-03-03   566.00   566.00            556.05    539.00     530.75   25.30
#> 89  2021-02-15    41.80    41.80             39.85     41.10      38.00    1.85
#> 90  2021-03-03    27.70    27.70             25.40     26.95      23.10    2.30
#> 91  2021-03-02  2015.80  2015.80           1974.30   1988.00    1886.10   88.20
#> 92  2021-03-03    93.60    93.60             92.30     88.80      85.60    6.70
#> 93  2021-03-03    34.00    34.00             33.00     32.65      32.65    0.35
#> 94  2021-02-05    75.60    75.60             74.45     73.90      70.45    4.00
#> 95  2021-03-03     9.70     9.70              9.70      9.25       9.25    0.45
#> 96  2021-02-24   459.00   459.00            448.20    450.00     436.75   11.45
#> 97  2021-03-03   699.00   699.00            678.10    615.40     603.00   75.10
#> 98  2021-01-12    24.30    24.30             23.40     24.30      22.10    1.30
#> 99  2021-03-03   211.30   211.30            211.30    202.50     201.25   10.05
#> 100 2021-03-03    92.50    92.50             92.00     88.55      88.15    3.85
#> 101 2021-02-12   165.75   165.75            165.65    152.00     140.25   25.40
#> 102 2021-03-03    86.45    86.45             84.75     85.10      83.25    1.50
#> 103 2021-03-02    87.85    87.85             85.40     82.30      78.90    6.50
#> 104 2020-08-27  1799.00  1799.00           1617.65   1680.00    1619.40   -1.75
#> 105 2021-03-03   215.20   215.20            203.75    198.70     198.70    5.05
#> 106 2021-03-03   177.50   177.50            173.40    175.90     173.40    0.00
#> 107 2021-02-26   800.00   800.00            789.00    787.25     752.30   36.70
#> 108 2021-02-18    73.50    73.50             72.20     72.80      68.90    3.30
#> 109 2021-03-03   326.00   326.00            310.80    306.60     301.20    9.60
#> 110 2021-02-26   168.40   168.40            164.85    158.60     155.10    9.75
#> 111 2021-02-17    26.49    26.49             25.94     26.00      25.86    0.08
#> 112 2021-03-03   132.50   132.50            127.65    129.75     126.65    1.00
#> 113 2021-01-22   552.30   552.30            509.90    543.85     480.25   29.65
#> 114 2021-02-25   287.00   287.00            286.00    286.00     280.85    5.15
#> 115 2021-01-14    42.40    42.40             41.65     40.80      37.95    3.70
#> 116 2021-02-08    89.95    89.95             88.05     89.85      83.55    4.50
#> 117 2021-03-03   186.70   186.70            186.70    177.85     177.85    8.85
#> 118 2021-03-03   547.10   547.10            533.50    524.80     516.00   17.50
#> 119 2021-03-03    17.70    17.70             16.40     16.80      16.80   -0.40
#> 120 2021-03-02  2932.20  2932.20           2849.10   2875.00    2791.10   58.00
#> 121 2021-03-03    94.20    94.20             94.00     93.50      93.00    1.00
#> 122 2021-02-19    26.65    26.65             25.90     26.20      24.80    1.10
#> 123 2021-03-03   139.60   139.60            138.10    137.45     136.50    1.60
#> 124 2021-03-03   198.00   198.00            194.50    193.70     191.65    2.85
#> 125 2021-02-09   125.50   125.50            121.65    123.90     120.50    1.15
#> 126 2020-12-31   120.50   120.50            111.50    113.55     104.05    7.45
#> 127 2021-03-03   208.55   208.55            188.75    198.65     198.65   -9.90
#> 128 2021-03-03  1050.70  1050.70           1050.70   1000.70    1000.70   50.00
#> 129 2021-03-03   113.50   113.50            111.20    100.50      99.85   11.35
#> 130 2021-03-03     4.05     4.05              4.05      3.90       3.90    0.15
#> 131 2021-03-03     9.05     9.05              9.05      8.65       8.65    0.40
#> 132 2021-02-16   138.70   138.70            134.75    135.90     133.55    1.20
#> 133 2021-03-03    73.75    73.75             70.05     69.00      69.00    1.05
#> 134 2021-03-03   367.10   367.10            367.10    349.70     349.65   17.45
#> 135 2021-02-09   214.20   214.20            207.80    212.50     203.15    4.65
#> 136 2021-03-03    84.45    84.45             82.05     83.70      79.25    2.80
#> 137 2021-03-02   183.90   183.90            176.80    182.00     172.25    4.55
#> 138 2021-03-03   104.05   104.05             97.10     99.10      99.10   -2.00
#> 139 2021-03-01    75.80    75.80             74.20     73.25      68.40    5.80
#> 140 2021-03-03    82.40    82.40             79.40     80.70      78.70    0.70
#> 141 2021-02-25  1028.50  1028.50            979.45   1000.00     972.45    7.00
#> 142 2021-03-03    95.30    95.30             94.95     90.80      90.80    4.15
#> 143 2021-03-02   678.00   678.00            654.30    676.40     631.90   22.40
#> 144 2021-03-03    20.85    20.85             20.05     20.25      20.15   -0.10
#> 145 2021-03-03  1038.55  1038.55           1031.35   1021.00    1013.75   17.60
#> 146 2021-03-03    93.25    93.25             93.25     88.85      88.85    4.40
#> 147 2021-03-03    10.25    10.25             10.00      9.05       9.05    0.95
#> 148 2021-01-01   701.70   701.70            680.05    698.95     647.00   33.05
#> 149 2021-02-25   954.80   954.80            893.15    909.00     841.45   51.70
#> 150 2021-03-01   459.05   459.05            459.05    399.05     382.55   76.50
#> 151 2021-03-03   215.35   215.35            215.35    205.10     205.10   10.25
#> 152 2021-03-03   699.85   699.85            682.05    685.00     681.00    1.05
#> 153 2021-03-01    97.00    97.00             97.00     93.85      92.40    4.60
#> 154 2021-02-25    49.30    49.30             48.00     46.00      43.70    4.30
#> 155 2021-03-03   134.65   134.65            129.60    134.00     123.60    6.00
#> 156 2021-03-03    18.70    18.70             18.10     18.00      17.00    1.10
#> 157 2021-03-03     5.85     5.85              5.85      5.60       5.60    0.25
#> 158 2021-03-03   262.00   262.00            260.00    261.70     254.15    5.85
#> 159 2021-03-03    49.20    49.20             47.10     47.10      47.10    0.00
#> 160 2020-10-27    70.00    70.00             68.75     66.90      63.60    5.15
#> 161 2021-03-03    11.90    11.90             11.90      9.95       9.95    1.95
#> 162 2021-03-03    11.90    11.90             11.90     11.35      11.35    0.55
#> 163 2021-03-03  1962.00  1962.00           1948.90   1960.00    1916.50   32.40
#> 164 2021-03-03    15.40    15.40             15.40     14.70      14.70    0.70
#> 165 2021-03-03    64.55    64.55             64.50     53.80      53.80   10.70
#> 166 2021-03-03   313.15   313.15            303.95    303.00     294.15    9.80
#> 167 2021-01-11   112.00   112.00            109.00    108.00      99.30    9.70
#> 168 2021-03-03   437.55   437.55            424.00    435.00     428.15   -4.15
#> 169 2021-03-01  2133.00  2133.00           2085.00   2125.05    2109.60  -24.60
#> 170 2021-03-03   792.05   792.05            773.50    782.00     776.45   -2.95
#> 171 2021-03-01   138.80   138.80            135.20    136.95     132.05    3.15
#> 172 2021-03-03   114.00   114.00            110.00    105.50     105.25    4.75
#> 173 2020-03-03    66.20    66.20             63.50     65.55      59.15    4.35
#> 174 2021-03-03     8.10     8.10              7.85      7.80       7.75    0.10
#> 175 2021-03-03  1186.25  1186.25           1147.00   1152.00    1135.90   11.10
#> 176 2021-03-03    64.20    64.20             62.95     62.20      59.75    3.20
#> 177 2021-03-03   426.50   426.50            419.60    409.00     404.75   14.85
#> 178 2021-03-03   944.70   944.70            927.85    923.00     910.90   16.95
#> 179 2021-03-03    97.80    97.80             97.20     96.00      94.35    2.85
#> 180 2020-12-08   421.95   421.95            419.00    403.00     389.80   29.20
#> 181 2020-12-16    20.20    20.20             19.70     19.80      19.15    0.55
#> 182 2021-02-10  6830.00  6830.00           6800.50   6589.00    6500.50  300.00
#> 183 2021-03-03   345.95   345.95            345.00    339.90     334.40   10.60
#> 184 2021-03-03   631.45   631.45            622.35    616.85     613.60    8.75
#> 185 2021-03-03   925.00   925.00            908.75    925.00     908.10    0.65
#> 186 2021-03-03  3957.30  3957.30           3925.05   3884.50    3754.70  170.35
#> 187 2021-03-03   317.50   317.50            308.15    306.00     294.85   13.30
#> 188 2021-03-03   422.00   422.00            412.60    418.00     408.55    4.05
#> 189 2021-03-03    34.85    34.85             34.85     33.20      33.20    1.65
#> 190 2021-03-03   115.20   115.20            114.20     97.05      96.00   18.20
#> 191 2020-10-26    78.85    78.85             75.90     78.00      70.65    5.25
#> 192 2021-02-26   311.95   311.95            306.10    309.00     301.55    4.55
#>     percent_change
#> 1            -1.18
#> 2             9.40
#> 3             2.35
#> 4            -4.99
#> 5             3.45
#> 6             3.18
#> 7             9.94
#> 8             0.85
#> 9             0.52
#> 10            2.90
#> 11            5.00
#> 12           34.24
#> 13            4.98
#> 14            4.96
#> 15            4.65
#> 16            3.83
#> 17            4.99
#> 18            4.97
#> 19            5.57
#> 20            3.28
#> 21            2.02
#> 22            1.80
#> 23            0.44
#> 24            3.92
#> 25            3.43
#> 26            4.98
#> 27           14.24
#> 28            9.15
#> 29            3.54
#> 30            3.65
#> 31            0.36
#> 32            7.06
#> 33            3.15
#> 34            0.99
#> 35            4.81
#> 36            4.98
#> 37            4.94
#> 38            6.96
#> 39            7.96
#> 40           10.03
#> 41            3.33
#> 42            3.41
#> 43            4.75
#> 44            5.36
#> 45            1.96
#> 46            4.36
#> 47            3.06
#> 48            7.50
#> 49            2.10
#> 50            4.95
#> 51            2.13
#> 52            6.44
#> 53            1.30
#> 54            3.96
#> 55            1.29
#> 56           19.92
#> 57           -0.46
#> 58            3.52
#> 59            3.36
#> 60            4.47
#> 61            7.10
#> 62           10.11
#> 63            2.76
#> 64           13.76
#> 65            4.64
#> 66            5.94
#> 67            3.35
#> 68            8.96
#> 69            4.86
#> 70           -4.76
#> 71            3.10
#> 72            4.89
#> 73            3.50
#> 74            3.69
#> 75            1.75
#> 76            1.94
#> 77            4.95
#> 78            2.95
#> 79           11.54
#> 80           -1.22
#> 81            0.72
#> 82            2.31
#> 83           -6.64
#> 84            7.12
#> 85            1.26
#> 86            4.40
#> 87            6.12
#> 88            4.77
#> 89            4.87
#> 90            9.96
#> 91            4.68
#> 92            7.83
#> 93            1.07
#> 94            5.68
#> 95            4.86
#> 96            2.62
#> 97           12.45
#> 98            5.88
#> 99            4.99
#> 100           4.37
#> 101          18.11
#> 102           1.80
#> 103           8.24
#> 104          -0.11
#> 105           2.54
#> 106           0.00
#> 107           4.88
#> 108           4.79
#> 109           3.19
#> 110           6.29
#> 111           0.31
#> 112           0.79
#> 113           6.17
#> 114           1.83
#> 115           9.75
#> 116           5.39
#> 117           4.98
#> 118           3.39
#> 119          -2.38
#> 120           2.08
#> 121           1.08
#> 122           4.44
#> 123           1.17
#> 124           1.49
#> 125           0.95
#> 126           7.16
#> 127          -4.98
#> 128           5.00
#> 129          11.37
#> 130           3.85
#> 131           4.62
#> 132           0.90
#> 133           1.52
#> 134           4.99
#> 135           2.29
#> 136           3.53
#> 137           2.64
#> 138          -2.02
#> 139           8.48
#> 140           0.89
#> 141           0.72
#> 142           4.57
#> 143           3.54
#> 144          -0.50
#> 145           1.74
#> 146           4.95
#> 147          10.50
#> 148           5.11
#> 149           6.14
#> 150          20.00
#> 151           5.00
#> 152           0.15
#> 153           4.98
#> 154           9.84
#> 155           4.85
#> 156           6.47
#> 157           4.46
#> 158           2.30
#> 159           0.00
#> 160           8.10
#> 161          19.60
#> 162           4.85
#> 163           1.69
#> 164           4.76
#> 165          19.89
#> 166           3.33
#> 167           9.77
#> 168          -0.97
#> 169          -1.17
#> 170          -0.38
#> 171           2.39
#> 172           4.51
#> 173           7.35
#> 174           1.29
#> 175           0.98
#> 176           5.36
#> 177           3.67
#> 178           1.86
#> 179           3.02
#> 180           7.49
#> 181           2.87
#> 182           4.62
#> 183           3.17
#> 184           1.43
#> 185           0.07
#> 186           4.54
#> 187           4.51
#> 188           0.99
#> 189           4.97
#> 190          18.96
#> 191           7.43
#> 192           1.51

# retain original column names as returned by NSE
nse_stock_year_high(clean_names = FALSE)
#>         symbol
#> 1       AAKASH
#> 2        AARVI
#> 3    ABCAPITAL
#> 4    ABMINTLTD
#> 5          ACC
#> 6   ADANIPORTS
#> 7   ADANIPOWER
#> 8   ADANITRANS
#> 9     ADFFOODS
#> 10   AEGISCHEM
#> 11       AFFLE
#> 12      AFL-RE
#> 13      AHLADA
#> 14     ALMONDZ
#> 15       AMBER
#> 16   AMBUJACEM
#> 17    ANANTRAJ
#> 18        APCL
#> 19   APLAPOLLO
#> 20  APOLLOTYRE
#> 21     ARSHIYA
#> 22  ASAHIINDIA
#> 23      ASTRAL
#> 24  ASTRAMICRO
#> 25        ATGL
#> 26      AUBANK
#> 27  BALMLAWRIE
#> 28  BALRAMCHIN
#> 29        BASF
#> 30      BCLIND
#> 31         BEL
#> 32        BHEL
#> 33   BOMDYEING
#> 34         BPL
#> 35  CAMLINFINE
#> 36     CGPOWER
#> 37  CNOVAPETRO
#> 38      CONCOR
#> 39    CONFIPET
#> 40  CONSOFINVT
#> 41  COSMOFILMS
#> 42  CUMMINSIND
#> 43  CYBERMEDIA
#> 44      DAAWAT
#> 45   DALMIASUG
#> 46      DCMNVL
#> 47  DCMSHRIRAM
#> 48    DECCANCE
#> 49   DEEPAKNTR
#> 50  DELTAMAGNT
#> 51  DHAMPURSUG
#> 52      DICIND
#> 53         DLF
#> 54    DWARKESH
#> 55   ELECTCAST
#> 56  EQUITASBNK
#> 57   EROSMEDIA
#> 58  FEDERALBNK
#> 59      FORTIS
#> 60     GABRIEL
#> 61        GAEL
#> 62        GATI
#> 63         GDL
#> 64      GENCON
#> 65     GENESYS
#> 66       GET&D
#> 67        GHCL
#> 68       GLAND
#> 69    GMRINFRA
#> 70      GOENKA
#> 71      GRASIM
#> 72        HBSL
#> 73  HEXATRADEX
#> 74    HINDZINC
#> 75  HITECHCORP
#> 76     HLEGLAS
#> 77         HMT
#> 78      HONAUT
#> 79   IBREALEST
#> 80    ICICIB22
#> 81        IDFC
#> 82  IDFCFIRSTB
#> 83        IFCI
#> 84        IGPL
#> 85        IIFL
#> 86    IMAGICAA
#> 87    INDIACEM
#> 88  INDIAGLYCO
#> 89  INSPIRISYS
#> 90   INVENTURE
#> 91       IRCTC
#> 92      ITDCEM
#> 93   JAIBALAJI
#> 94   JAMNAAUTO
#> 95  JAYNECOIND
#> 96        JBMA
#> 97  JINDALPOLY
#> 98  JISLJALEQS
#> 99  KALYANIFRG
#> 100 KANORICHEM
#> 101   KANPRPLA
#> 102        KCP
#> 103 KESORAMIND
#> 104       KICL
#> 105 KIRLOSBROS
#> 106  KIRLOSENG
#> 107        KSB
#> 108    KTKBANK
#> 109   LIKHITHA
#> 110  LUMAXTECH
#> 111       M100
#> 112      MAGMA
#> 113     MAHLOG
#> 114  MANGLMCEM
#> 115   MANINFRA
#> 116       MEGH
#> 117 MODIRUBBER
#> 118     MPSLTD
#> 119       MTNL
#> 120 NAVINFLUOR
#> 121 NETFMID150
#> 122       NHPC
#> 123       NMDC
#> 124      NOCIL
#> 125 NRBBEARING
#> 126  ONWARDTEC
#> 127   OPTIEMUS
#> 128 ORCHPHARMA
#> 129  ORIENTCEM
#> 130       PAEL
#> 131  PARSVNATH
#> 132        PFC
#> 133     PFOCUS
#> 134       PGEL
#> 135 PHILIPCARB
#> 136    PRABHAT
#> 137    PRAJIND
#> 138     PRECOT
#> 139  PRICOLLTD
#> 140        PTC
#> 141 PUNJABCHEM
#> 142     RAJMET
#> 143   RAJRATAN
#> 144 RAJSREESUG
#> 145   RAMCOCEM
#> 146      RAMKY
#> 147    RANASUG
#> 148 RANEHOLDIN
#> 149        RBL
#> 150        RML
#> 151     RUSHIL
#> 152     SAFARI
#> 153     SALONA
#> 154  SANGHIIND
#> 155        SCI
#> 156      SETCO
#> 157      SEZAL
#> 158 SHAREINDIA
#> 159 SHIVAMILLS
#> 160 SHREDIGCEM
#> 161  SHREERAMA
#> 162   SHYAMTEL
#> 163    SIEMENS
#> 164        SIL
#> 165      SILGO
#> 166 SRHHYPOLTD
#> 167 STARCEMENT
#> 168   SUPPETRO
#> 169 SUPREMEIND
#> 170   TATACHEM
#> 171 TATACOFFEE
#> 172  TATAPOWER
#> 173    TFCILTD
#> 174 THIRUSUGAR
#> 175    TIINDIA
#> 176 TIMETECHNO
#> 177 TORNTPOWER
#> 178      TRENT
#> 179    TRIVENI
#> 180      UFLEX
#> 181  UGARSUGAR
#> 182 ULTRACEMCO
#> 183 UNICHEMLAB
#> 184        UPL
#> 185 VADILALIND
#> 186 VAIBHAVGBL
#> 187     VERTOZ
#> 188     VIPIND
#> 189   VIPULLTD
#> 190     WELENT
#> 191 WELSPUNIND
#> 192 ZENSARTECH
#>                                                            symbolDesc
#> 1                                 Aakash Exploration Services Limited
#> 2                                                 Aarvi Encon Limited
#> 3                                        Aditya Birla Capital Limited
#> 4                                           ABM International Limited
#> 5                                                         ACC Limited
#> 6                       Adani Ports and Special Economic Zone Limited
#> 7                                                 Adani Power Limited
#> 8                                          Adani Transmission Limited
#> 9                                                   ADF Foods Limited
#> 10                                            Aegis Logistics Limited
#> 11                                              Affle (India) Limited
#> 12                                            Arvind Fashions Limited
#> 13                                           Ahlada Engineers Limited
#> 14                                  Almondz Global Securities Limited
#> 15                                    Amber Enterprises India Limited
#> 16                                             Ambuja Cements Limited
#> 17                                                  Anant Raj Limited
#> 18                                     Anjani Portland Cement Limited
#> 19                                           APL Apollo Tubes Limited
#> 20                                               Apollo Tyres Limited
#> 21                                                    Arshiya Limited
#> 22                                          Asahi India Glass Limited
#> 23                                        Astral Poly Technik Limited
#> 24                                   Astra Microwave Products Limited
#> 25                                            Adani Total Gas Limited
#> 26                                      AU Small Finance Bank Limited
#> 27                                    Balmer Lawrie & Company Limited
#> 28                                      Balrampur Chini Mills Limited
#> 29                                                 BASF India Limited
#> 30                                             Bcl Industries Limited
#> 31                                         Bharat Electronics Limited
#> 32                                   Bharat Heavy Electricals Limited
#> 33                                Bombay Dyeing & Mfg Company Limited
#> 34                                                        BPL Limited
#> 35                                       Camlin Fine Sciences Limited
#> 36                          CG Power and Industrial Solutions Limited
#> 37                                    CIL Nova Petrochemicals Limited
#> 38                             Container Corporation of India Limited
#> 39                                 Confidence Petroleum India Limited
#> 40                            Consolidated Finvest & Holdings Limited
#> 41                                                Cosmo Films Limited
#> 42                                              Cummins India Limited
#> 43                                        Cyber Media (India) Limited
#> 44                                                   LT Foods Limited
#> 45                         Dalmia Bharat Sugar and Industries Limited
#> 46                                               DCM Nouvelle Limited
#> 47                                                DCM Shriram Limited
#> 48                                             Deccan Cements Limited
#> 49                                             Deepak Nitrite Limited
#> 50                                        Delta Manufacturing Limited
#> 51                                        Dhampur Sugar Mills Limited
#> 52                                                  DIC India Limited
#> 53                                                        DLF Limited
#> 54                                 Dwarikesh Sugar Industries Limited
#> 55                                      Electrosteel Castings Limited
#> 56                                 Equitas Small Finance Bank Limited
#> 57                                   Eros International Media Limited
#> 58                                          The Federal Bank  Limited
#> 59                                          Fortis Healthcare Limited
#> 60                                              Gabriel India Limited
#> 61                                     Gujarat Ambuja Exports Limited
#> 62                                                       GATI Limited
#> 63                                        Gateway Distriparks Limited
#> 64              Generic Engineering Construction and Projects Limited
#> 65                          Genesys International Corporation Limited
#> 66                                               GE T&D India Limited
#> 67                                                       GHCL Limited
#> 68                                               Gland Pharma Limited
#> 69                                         GMR Infrastructure Limited
#> 70                                  Goenka Diamond and Jewels Limited
#> 71                                          Grasim Industries Limited
#> 72                                           HB Stockholdings Limited
#> 73                                                Hexa Tradex Limited
#> 74                                             Hindustan Zinc Limited
#> 75                                         Hitech Corporation Limited
#> 76                                               HLE Glascoat Limited
#> 77                                                        HMT Limited
#> 78                                 Honeywell Automation India Limited
#> 79                                     Indiabulls Real Estate Limited
#> 80                       ICICI Prudential Mutual Fund - BHARAT 22 ETF
#> 81                                                       IDFC Limited
#> 82                                            IDFC First Bank Limited
#> 83                                                       IFCI Limited
#> 84                                          IG Petrochemicals Limited
#> 85                                               IIFL Finance Limited
#> 86                                Imagicaaworld Entertainment Limited
#> 87                                          The India Cements Limited
#> 88                                              India Glycols Limited
#> 89                                       Inspirisys Solutions Limited
#> 90                              Inventure Growth & Securities Limited
#> 91            Indian Railway Catering And Tourism Corporation Limited
#> 92                                      ITD Cementation India Limited
#> 93                                      Jai Balaji Industries Limited
#> 94                                      Jamna Auto Industries Limited
#> 95                                   Jayaswal Neco Industries Limited
#> 96                                                   JBM Auto Limited
#> 97                                          Jindal Poly Films Limited
#> 98                                    Jain Irrigation Systems Limited
#> 99                                              Kalyani Forge Limited
#> 100                            Kanoria Chemicals & Industries Limited
#> 101                                         Kanpur Plastipack Limited
#> 102                                                       KCP Limited
#> 103                                        Kesoram Industries Limited
#> 104                                Kalyani Investment Company Limited
#> 105                                        Kirloskar Brothers Limited
#> 106                                     Kirloskar Oil Engines Limited
#> 107                                                       Ksb Limited
#> 108                                        The Karnataka Bank Limited
#> 109                                   Likhitha Infrastructure Limited
#> 110                                   Lumax Auto Technologies Limited
#> 111 Motilal Oswal Mutual Fund - Motilal Oswal MOSt Shares M100 ETF GO
#> 112                                             Magma Fincorp Limited
#> 113                                        Mahindra Logistics Limited
#> 114                                           Mangalam Cement Limited
#> 115                                     Man Infraconstruction Limited
#> 116                                         Meghmani Organics Limited
#> 117                                               Modi Rubber Limited
#> 118                                                       MPS Limited
#> 119                                 Mahanagar Telephone Nigam Limited
#> 120                              Navin Fluorine International Limited
#> 121                                 NIPPON INDIA ETF NIFTY MIDCAP 150
#> 122                                                      NHPC Limited
#> 123                                                      NMDC Limited
#> 124                                                     NOCIL Limited
#> 125                                               NRB Bearing Limited
#> 126                                       Onward Technologies Limited
#> 127                                         Optiemus Infracom Limited
#> 128                                             Orchid Pharma Limited
#> 129                                             Orient Cement Limited
#> 130                                                       PAE Limited
#> 131                                      Parsvnath Developers Limited
#> 132                                 Power Finance Corporation Limited
#> 133                                               Prime Focus Limited
#> 134                                           PG Electroplast Limited
#> 135                                     Phillips Carbon Black Limited
#> 136                                             Prabhat Dairy Limited
#> 137                                           Praj Industries Limited
#> 138                                                    Precot Limited
#> 139                                                    Pricol Limited
#> 140                                                 PTC India Limited
#> 141                        Punjab Chemicals & Crop Protection Limited
#> 142                                          Rajnandini Metal Limited
#> 143                                      Rajratan Global Wire Limited
#> 144                               Rajshree Sugars & Chemicals Limited
#> 145                                         The Ramco Cements Limited
#> 146                                      Ramky Infrastructure Limited
#> 147                                               Rana Sugars Limited
#> 148                                             Rane Holdings Limited
#> 149                                         Rane Brake Lining Limited
#> 150                                             Rane (Madras) Limited
#> 151                                              Rushil Decor Limited
#> 152                                 Safari Industries (India) Limited
#> 153                                            Salona Cotspin Limited
#> 154                                         Sanghi Industries Limited
#> 155                             Shipping Corporation Of India Limited
#> 156                                          Setco Automotive Limited
#> 157                                               Sezal Glass Limited
#> 158                                    Share India Securities Limited
#> 159                                               Shiva Mills Limited
#> 160                                      Shree Digvijay Cement Co.Ltd
#> 161                                     Shree Rama Multi-Tech Limited
#> 162                                             Shyam Telecom Limited
#> 163                                                   Siemens Limited
#> 164                                       Standard Industries Limited
#> 165                                              Silgo Retail Limited
#> 166                         Sree Rayalaseema Hi-Strength Hypo Limited
#> 167                                               Star Cement Limited
#> 168                                         Supreme Petrochem Limited
#> 169                                        Supreme Industries Limited
#> 170                                            Tata Chemicals Limited
#> 171                                               Tata Coffee Limited
#> 172                                        Tata Power Company Limited
#> 173                      Tourism Finance Corporation of India Limited
#> 174                                      Thiru Arooran Sugars Limited
#> 175                                 Tube Investments of India Limited
#> 176                                          Time Technoplast Limited
#> 177                                             Torrent Power Limited
#> 178                                                     Trent Limited
#> 179                          Triveni Engineering & Industries Limited
#> 180                                                     UFLEX Limited
#> 181                                      The Ugar Sugar Works Limited
#> 182                                          UltraTech Cement Limited
#> 183                                      Unichem Laboratories Limited
#> 184                                                       UPL Limited
#> 185                                        Vadilal Industries Limited
#> 186                                            Vaibhav Global Limited
#> 187                                        Vertoz Advertising Limited
#> 188                                            VIP Industries Limited
#> 189                                                     Vipul Limited
#> 190                                       Welspun Enterprises Limited
#> 191                                             Welspun India Limited
#> 192                                       Zensar Technologies Limited
#>             dt    value     year      ltp value_old     prev  change pChange
#> 1   2021-03-03   127.90   127.90   126.00    127.90   127.50   -1.50   -1.18
#> 2   2021-02-26    62.50    62.50    57.00     54.70    52.10    4.90    9.40
#> 3   2021-03-03   134.90   134.90   132.70    130.90   129.65    3.05    2.35
#> 4   2021-03-03    84.10    84.10    76.10     80.15    80.10   -4.00   -4.99
#> 5   2021-02-26  1863.00  1863.00  1858.30   1847.00  1796.40   61.90    3.45
#> 6   2021-03-03   765.70   765.70   753.05    754.95   729.85   23.20    3.18
#> 7   2021-03-03    71.35    71.35    71.35     66.65    64.90    6.45    9.94
#> 8   2021-03-03   854.95   854.95   835.00    852.55   828.00    7.00    0.85
#> 9   2021-03-03   906.95   906.95   884.40    894.70   879.80    4.60    0.52
#> 10  2021-03-03   341.00   341.00   335.40    331.65   325.95    9.45    2.90
#> 11  2021-03-03  6004.05  6004.05  6004.05   5898.90  5718.15  285.90    5.00
#> 12        <NA>    41.05    41.05    39.40        NA    29.35   10.05   34.24
#> 13  2021-03-03   101.10   101.10   101.10     96.30    96.30    4.80    4.98
#> 14  2021-03-01    29.65    29.65    29.65     29.40    28.25    1.40    4.96
#> 15  2021-03-03  3494.95  3494.95  3465.00   3391.40  3310.90  154.10    4.65
#> 16  2021-02-18   293.75   293.75   292.90    290.50   282.10   10.80    3.83
#> 17  2021-03-03    56.80    56.80    56.80     54.10    54.10    2.70    4.99
#> 18  2021-02-09   238.70   238.70   234.25    237.00   223.15   11.10    4.97
#> 19  2021-03-03  1312.95  1312.95  1312.35   1250.00  1243.15   69.20    5.57
#> 20  2021-02-08   259.20   259.20   258.20    256.50   250.00    8.20    3.28
#> 21  2021-03-03    41.65    41.65    40.50     39.70    39.70    0.80    2.02
#> 22  2021-03-03   328.00   328.00   320.40    321.10   314.75    5.65    1.80
#> 23  2021-03-02  2224.90  2224.90  2215.00   2220.45  2205.30    9.70    0.44
#> 24  2021-03-03   145.00   145.00   140.65    142.30   135.35    5.30    3.92
#> 25  2021-03-03   701.70   701.70   685.45    689.15   662.75   22.70    3.43
#> 26  2021-03-03  1290.00  1290.00  1260.70   1225.00  1200.90   59.80    4.98
#> 27  2020-12-29   152.40   152.40   146.40    146.70   128.15   18.25   14.24
#> 28  2021-03-03   213.35   213.35   210.45    198.15   192.80   17.65    9.15
#> 29  2021-03-03  2318.80  2318.80  2276.75   2244.95  2198.95   77.80    3.54
#> 30        <NA>   148.00   148.00   130.50        NA   125.90    4.60    3.65
#> 31  2021-03-03   154.95   154.95   153.45    154.00   152.90    0.55    0.36
#> 32  2021-03-03    56.10    56.10    54.60     52.65    51.00    3.60    7.06
#> 33  2021-03-03    89.75    89.75    86.90     88.20    84.25    2.65    3.15
#> 34  2020-12-02    26.45    26.45    25.60     26.00    25.35    0.25    0.99
#> 35  2021-03-02   151.30   151.30   150.50    148.50   143.60    6.90    4.81
#> 36  2021-03-03    63.30    63.30    63.30     60.35    60.30    3.00    4.98
#> 37  2021-03-03    17.00    17.00    17.00     16.20    16.20    0.80    4.94
#> 38  2021-02-25   643.95   643.95   618.60    597.00   578.35   40.25    6.96
#> 39  2021-02-11    49.00    49.00    48.15     48.50    44.60    3.55    7.96
#> 40  2021-01-04    52.05    52.05    50.45     50.40    45.85    4.60   10.03
#> 41  2021-03-03   655.50   655.50   641.00    624.00   620.35   20.65    3.33
#> 42  2021-03-03   896.00   896.00   893.90    882.95   864.45   29.45    3.41
#> 43  2021-03-03    17.65    17.65    17.65     16.85    16.85    0.80    4.75
#> 44  2020-08-11    64.00    64.00    61.90     63.30    58.75    3.15    5.36
#> 45  2021-03-03   178.45   178.45   177.00    178.00   173.60    3.40    1.96
#> 46  2021-02-10    79.45    79.45    79.00     77.45    75.70    3.30    4.36
#> 47  2021-03-03   562.95   562.95   547.60    542.00   531.35   16.25    3.06
#> 48  2021-03-03   457.90   457.90   452.00    433.00   420.45   31.55    7.50
#> 49  2021-03-02  1690.00  1690.00  1635.85   1663.15  1602.15   33.70    2.10
#> 50  2021-02-17    35.00    35.00    35.00     34.00    33.35    1.65    4.95
#> 51  2021-03-03   201.35   201.35   196.85    195.00   192.75    4.10    2.13
#> 52  2020-12-31   455.95   455.95   442.00    424.90   415.25   26.75    6.44
#> 53  2021-03-03   332.70   332.70   328.40    328.60   324.20    4.20    1.30
#> 54  2021-03-03    36.95    36.95    36.75     35.75    35.35    1.40    3.96
#> 55  2021-03-03    28.00    28.00    27.40     27.70    27.05    0.35    1.29
#> 56  2021-02-18    59.60    59.60    59.60     51.60    49.70    9.90   19.92
#> 57  2021-03-03    34.15    34.15    32.65     33.30    32.80   -0.15   -0.46
#> 58  2021-03-03    92.50    92.50    91.20     88.50    88.10    3.10    3.52
#> 59  2021-01-11   184.70   184.70   179.75    182.10   173.90    5.85    3.36
#> 60  2021-01-07   134.50   134.50   133.25    131.40   127.55    5.70    4.47
#> 61  2021-01-25   155.00   155.00   149.35    151.00   139.45    9.90    7.10
#> 62  2020-12-31   116.20   116.20   111.60    106.60   101.35   10.25   10.11
#> 63  2021-01-25   184.00   184.00   180.30    182.60   175.45    4.85    2.76
#> 64  2021-02-18    68.00    68.00    64.50     64.70    56.70    7.80   13.76
#> 65  2021-03-03    96.00    96.00    95.80     91.95    91.55    4.25    4.64
#> 66  2021-02-19   146.40   146.40   144.40    138.85   136.30    8.10    5.94
#> 67  2021-03-03   258.00   258.00   254.80    254.70   246.55    8.25    3.35
#> 68  2020-12-28  2680.00  2680.00  2655.00   2508.55  2436.75  218.25    8.96
#> 69  2020-12-16    29.95    29.95    29.10     29.35    27.75    1.35    4.86
#> 70  2021-03-03     2.20     2.20     2.00      2.10     2.10   -0.10   -4.76
#> 71  2021-03-03  1360.00  1360.00  1358.90   1343.00  1318.10   40.80    3.10
#> 72  2021-03-03    17.15    17.15    17.15     16.35    16.35    0.80    4.89
#> 73  2021-03-03    75.05    75.05    74.00     74.80    71.50    2.50    3.50
#> 74  2021-01-07   334.40   334.40   329.80    328.40   318.05   11.75    3.69
#> 75  2021-02-26   145.55   145.55   142.80    145.00   140.35    2.45    1.75
#> 76  2021-03-03  2520.00  2520.00  2450.00   2430.75  2403.30   46.70    1.94
#> 77  2021-02-10    28.65    28.65    28.65     28.40    27.30    1.35    4.95
#> 78  2021-02-22 49600.00 49600.00 48060.00  48644.00 46682.65 1377.35    2.95
#> 79  2021-03-03   119.50   119.50   117.40    107.75   105.25   12.15   11.54
#> 80  2021-03-03    39.80    39.80    38.11     38.85    38.58   -0.47   -1.22
#> 81  2021-02-25    57.40    57.40    55.95     57.00    55.55    0.40    0.72
#> 82  2021-03-03    69.30    69.30    68.65     68.15    67.10    1.55    2.31
#> 83  2021-03-03    13.20    13.20    11.95     12.80    12.80   -0.85   -6.64
#> 84  2020-12-04   536.00   536.00   518.10    503.95   483.65   34.45    7.12
#> 85  2021-03-03   302.30   302.30   297.70    299.00   294.00    3.70    1.26
#> 86  2021-03-03     8.30     8.30     8.30      7.95     7.95    0.35    4.40
#> 87  2021-01-01   187.00   187.00   184.80    185.80   174.15   10.65    6.12
#> 88  2021-03-03   566.00   566.00   556.05    539.00   530.75   25.30    4.77
#> 89  2021-02-15    41.80    41.80    39.85     41.10    38.00    1.85    4.87
#> 90  2021-03-03    27.70    27.70    25.40     26.95    23.10    2.30    9.96
#> 91  2021-03-02  2015.80  2015.80  1974.30   1988.00  1886.10   88.20    4.68
#> 92  2021-03-03    93.60    93.60    92.30     88.80    85.60    6.70    7.83
#> 93  2021-03-03    34.00    34.00    33.00     32.65    32.65    0.35    1.07
#> 94  2021-02-05    75.60    75.60    74.45     73.90    70.45    4.00    5.68
#> 95  2021-03-03     9.70     9.70     9.70      9.25     9.25    0.45    4.86
#> 96  2021-02-24   459.00   459.00   448.20    450.00   436.75   11.45    2.62
#> 97  2021-03-03   699.00   699.00   678.10    615.40   603.00   75.10   12.45
#> 98  2021-01-12    24.30    24.30    23.40     24.30    22.10    1.30    5.88
#> 99  2021-03-03   211.30   211.30   211.30    202.50   201.25   10.05    4.99
#> 100 2021-03-03    92.50    92.50    92.00     88.55    88.15    3.85    4.37
#> 101 2021-02-12   165.75   165.75   165.65    152.00   140.25   25.40   18.11
#> 102 2021-03-03    86.45    86.45    84.75     85.10    83.25    1.50    1.80
#> 103 2021-03-02    87.85    87.85    85.40     82.30    78.90    6.50    8.24
#> 104 2020-08-27  1799.00  1799.00  1617.65   1680.00  1619.40   -1.75   -0.11
#> 105 2021-03-03   215.20   215.20   203.75    198.70   198.70    5.05    2.54
#> 106 2021-03-03   177.50   177.50   173.40    175.90   173.40    0.00    0.00
#> 107 2021-02-26   800.00   800.00   789.00    787.25   752.30   36.70    4.88
#> 108 2021-02-18    73.50    73.50    72.20     72.80    68.90    3.30    4.79
#> 109 2021-03-03   326.00   326.00   310.80    306.60   301.20    9.60    3.19
#> 110 2021-02-26   168.40   168.40   164.85    158.60   155.10    9.75    6.29
#> 111 2021-02-17    26.49    26.49    25.94     26.00    25.86    0.08    0.31
#> 112 2021-03-03   132.50   132.50   127.65    129.75   126.65    1.00    0.79
#> 113 2021-01-22   552.30   552.30   509.90    543.85   480.25   29.65    6.17
#> 114 2021-02-25   287.00   287.00   286.00    286.00   280.85    5.15    1.83
#> 115 2021-01-14    42.40    42.40    41.65     40.80    37.95    3.70    9.75
#> 116 2021-02-08    89.95    89.95    88.05     89.85    83.55    4.50    5.39
#> 117 2021-03-03   186.70   186.70   186.70    177.85   177.85    8.85    4.98
#> 118 2021-03-03   547.10   547.10   533.50    524.80   516.00   17.50    3.39
#> 119 2021-03-03    17.70    17.70    16.40     16.80    16.80   -0.40   -2.38
#> 120 2021-03-02  2932.20  2932.20  2849.10   2875.00  2791.10   58.00    2.08
#> 121 2021-03-03    94.20    94.20    94.00     93.50    93.00    1.00    1.08
#> 122 2021-02-19    26.65    26.65    25.90     26.20    24.80    1.10    4.44
#> 123 2021-03-03   139.60   139.60   138.10    137.45   136.50    1.60    1.17
#> 124 2021-03-03   198.00   198.00   194.50    193.70   191.65    2.85    1.49
#> 125 2021-02-09   125.50   125.50   121.65    123.90   120.50    1.15    0.95
#> 126 2020-12-31   120.50   120.50   111.50    113.55   104.05    7.45    7.16
#> 127 2021-03-03   208.55   208.55   188.75    198.65   198.65   -9.90   -4.98
#> 128 2021-03-03  1050.70  1050.70  1050.70   1000.70  1000.70   50.00    5.00
#> 129 2021-03-03   113.50   113.50   111.20    100.50    99.85   11.35   11.37
#> 130 2021-03-03     4.05     4.05     4.05      3.90     3.90    0.15    3.85
#> 131 2021-03-03     9.05     9.05     9.05      8.65     8.65    0.40    4.62
#> 132 2021-02-16   138.70   138.70   134.75    135.90   133.55    1.20    0.90
#> 133 2021-03-03    73.75    73.75    70.05     69.00    69.00    1.05    1.52
#> 134 2021-03-03   367.10   367.10   367.10    349.70   349.65   17.45    4.99
#> 135 2021-02-09   214.20   214.20   207.80    212.50   203.15    4.65    2.29
#> 136 2021-03-03    84.45    84.45    82.05     83.70    79.25    2.80    3.53
#> 137 2021-03-02   183.90   183.90   176.80    182.00   172.25    4.55    2.64
#> 138 2021-03-03   104.05   104.05    97.10     99.10    99.10   -2.00   -2.02
#> 139 2021-03-01    75.80    75.80    74.20     73.25    68.40    5.80    8.48
#> 140 2021-03-03    82.40    82.40    79.40     80.70    78.70    0.70    0.89
#> 141 2021-02-25  1028.50  1028.50   979.45   1000.00   972.45    7.00    0.72
#> 142 2021-03-03    95.30    95.30    94.95     90.80    90.80    4.15    4.57
#> 143 2021-03-02   678.00   678.00   654.30    676.40   631.90   22.40    3.54
#> 144 2021-03-03    20.85    20.85    20.05     20.25    20.15   -0.10   -0.50
#> 145 2021-03-03  1038.55  1038.55  1031.35   1021.00  1013.75   17.60    1.74
#> 146 2021-03-03    93.25    93.25    93.25     88.85    88.85    4.40    4.95
#> 147 2021-03-03    10.25    10.25    10.00      9.05     9.05    0.95   10.50
#> 148 2021-01-01   701.70   701.70   680.05    698.95   647.00   33.05    5.11
#> 149 2021-02-25   954.80   954.80   893.15    909.00   841.45   51.70    6.14
#> 150 2021-03-01   459.05   459.05   459.05    399.05   382.55   76.50   20.00
#> 151 2021-03-03   215.35   215.35   215.35    205.10   205.10   10.25    5.00
#> 152 2021-03-03   699.85   699.85   682.05    685.00   681.00    1.05    0.15
#> 153 2021-03-01    97.00    97.00    97.00     93.85    92.40    4.60    4.98
#> 154 2021-02-25    49.30    49.30    48.00     46.00    43.70    4.30    9.84
#> 155 2021-03-03   134.65   134.65   129.60    134.00   123.60    6.00    4.85
#> 156 2021-03-03    18.70    18.70    18.10     18.00    17.00    1.10    6.47
#> 157 2021-03-03     5.85     5.85     5.85      5.60     5.60    0.25    4.46
#> 158 2021-03-03   262.00   262.00   260.00    261.70   254.15    5.85    2.30
#> 159 2021-03-03    49.20    49.20    47.10     47.10    47.10    0.00    0.00
#> 160 2020-10-27    70.00    70.00    68.75     66.90    63.60    5.15    8.10
#> 161 2021-03-03    11.90    11.90    11.90      9.95     9.95    1.95   19.60
#> 162 2021-03-03    11.90    11.90    11.90     11.35    11.35    0.55    4.85
#> 163 2021-03-03  1962.00  1962.00  1948.90   1960.00  1916.50   32.40    1.69
#> 164 2021-03-03    15.40    15.40    15.40     14.70    14.70    0.70    4.76
#> 165 2021-03-03    64.55    64.55    64.50     53.80    53.80   10.70   19.89
#> 166 2021-03-03   313.15   313.15   303.95    303.00   294.15    9.80    3.33
#> 167 2021-01-11   112.00   112.00   109.00    108.00    99.30    9.70    9.77
#> 168 2021-03-03   437.55   437.55   424.00    435.00   428.15   -4.15   -0.97
#> 169 2021-03-01  2133.00  2133.00  2085.00   2125.05  2109.60  -24.60   -1.17
#> 170 2021-03-03   792.05   792.05   773.50    782.00   776.45   -2.95   -0.38
#> 171 2021-03-01   138.80   138.80   135.20    136.95   132.05    3.15    2.39
#> 172 2021-03-03   114.00   114.00   110.00    105.50   105.25    4.75    4.51
#> 173 2020-03-03    66.20    66.20    63.50     65.55    59.15    4.35    7.35
#> 174 2021-03-03     8.10     8.10     7.85      7.80     7.75    0.10    1.29
#> 175 2021-03-03  1186.25  1186.25  1147.00   1152.00  1135.90   11.10    0.98
#> 176 2021-03-03    64.20    64.20    62.95     62.20    59.75    3.20    5.36
#> 177 2021-03-03   426.50   426.50   419.60    409.00   404.75   14.85    3.67
#> 178 2021-03-03   944.70   944.70   927.85    923.00   910.90   16.95    1.86
#> 179 2021-03-03    97.80    97.80    97.20     96.00    94.35    2.85    3.02
#> 180 2020-12-08   421.95   421.95   419.00    403.00   389.80   29.20    7.49
#> 181 2020-12-16    20.20    20.20    19.70     19.80    19.15    0.55    2.87
#> 182 2021-02-10  6830.00  6830.00  6800.50   6589.00  6500.50  300.00    4.62
#> 183 2021-03-03   345.95   345.95   345.00    339.90   334.40   10.60    3.17
#> 184 2021-03-03   631.45   631.45   622.35    616.85   613.60    8.75    1.43
#> 185 2021-03-03   925.00   925.00   908.75    925.00   908.10    0.65    0.07
#> 186 2021-03-03  3957.30  3957.30  3925.05   3884.50  3754.70  170.35    4.54
#> 187 2021-03-03   317.50   317.50   308.15    306.00   294.85   13.30    4.51
#> 188 2021-03-03   422.00   422.00   412.60    418.00   408.55    4.05    0.99
#> 189 2021-03-03    34.85    34.85    34.85     33.20    33.20    1.65    4.97
#> 190 2021-03-03   115.20   115.20   114.20     97.05    96.00   18.20   18.96
#> 191 2020-10-26    78.85    78.85    75.90     78.00    70.65    5.25    7.43
#> 192 2021-02-26   311.95   311.95   306.10    309.00   301.55    4.55    1.51
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
#> 1        BHEL     EQ                  2020-09-18
#> 2      CONCOR     EQ                  2020-11-18
#> 3      AUBANK     EQ                  2019-07-18
#> 4    GMRINFRA     EQ                  2020-09-10
#> 5       IRCTC     EQ                  2020-10-19
#> 6  ULTRACEMCO     EQ                  2020-07-29
#> 7   TATAPOWER     EQ                  2020-07-14
#> 8    SHREECEM     EQ                  2020-02-24
#> 9         PVR     EQ                  2020-07-09
#> 10  AMBUJACEM     EQ                  2021-03-19
#>                                 last_corp_announcement open_price high_price
#> 1                               Annual General Meeting      50.35      56.10
#> 2                    Interim Dividend - Rs 3 Per Share     577.00     643.95
#> 3  Annual General Meeting/Dividend - Rs 0.75 Per Share    1187.65    1290.00
#> 4                               Annual General Meeting      27.30      29.95
#> 5                               Annual General Meeting    1885.00    2015.80
#> 6    Annual General Meeting/Dividend - Rs 13 Per Share    6429.00    6830.00
#> 7  Annual General Meeting/Dividend - Rs 1.55 Per Share     103.80     114.00
#> 8                  Interim Dividend - Rs 110 Per Share   27450.00   28850.00
#> 9                       Rights 7:94 @ Premium Rs 774/-    1410.00    1501.95
#> 10                           Dividend - Re 1 Per Share     281.50     293.75
#>    low_price last_traded_price prev_close_price percent_change traded_quantity
#> 1      49.90             54.60            51.00           7.06       189812744
#> 2     575.05            618.60           578.35           6.96        14701972
#> 3    1176.80           1260.70          1200.90           4.98         2009900
#> 4      27.05             29.10            27.75           4.86        50023897
#> 5    1870.00           1974.30          1886.10           4.68         8932597
#> 6    6394.45           6800.50          6500.50           4.62         1071068
#> 7     102.75            110.00           105.25           4.51       131812381
#> 8   27335.05          28825.55         27695.25           4.08           59120
#> 9    1393.90           1473.10          1417.65           3.91         2062794
#> 10    278.75            292.90           282.10           3.83         7629980
#>    turnover_in_lakhs
#> 1          102574.81
#> 2           91509.48
#> 3           25259.22
#> 4           14401.88
#> 5          176208.87
#> 6           71038.37
#> 7          144347.74
#> 8           16626.67
#> 9           30285.32
#> 10          21911.78

# retain original column names as returned by NSE
nse_fo_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1        BHEL     EQ               2020-09-18
#> 2      CONCOR     EQ               2020-11-18
#> 3      AUBANK     EQ               2019-07-18
#> 4    GMRINFRA     EQ               2020-09-10
#> 5       IRCTC     EQ               2020-10-19
#> 6  ULTRACEMCO     EQ               2020-07-29
#> 7   TATAPOWER     EQ               2020-07-14
#> 8    SHREECEM     EQ               2020-02-24
#> 9         PVR     EQ               2020-07-09
#> 10  AMBUJACEM     EQ               2021-03-19
#>                                   lastCorpAnnouncement openPrice highPrice
#> 1                               Annual General Meeting     50.35     56.10
#> 2                    Interim Dividend - Rs 3 Per Share    577.00    643.95
#> 3  Annual General Meeting/Dividend - Rs 0.75 Per Share   1187.65   1290.00
#> 4                               Annual General Meeting     27.30     29.95
#> 5                               Annual General Meeting   1885.00   2015.80
#> 6    Annual General Meeting/Dividend - Rs 13 Per Share   6429.00   6830.00
#> 7  Annual General Meeting/Dividend - Rs 1.55 Per Share    103.80    114.00
#> 8                  Interim Dividend - Rs 110 Per Share  27450.00  28850.00
#> 9                       Rights 7:94 @ Premium Rs 774/-   1410.00   1501.95
#> 10                           Dividend - Re 1 Per Share    281.50    293.75
#>    lowPrice      ltp previousPrice netPrice tradedQuantity turnoverInLakhs
#> 1     49.90    54.60         51.00     7.06      189812744       102574.81
#> 2    575.05   618.60        578.35     6.96       14701972        91509.48
#> 3   1176.80  1260.70       1200.90     4.98        2009900        25259.22
#> 4     27.05    29.10         27.75     4.86       50023897        14401.88
#> 5   1870.00  1974.30       1886.10     4.68        8932597       176208.87
#> 6   6394.45  6800.50       6500.50     4.62        1071068        71038.37
#> 7    102.75   110.00        105.25     4.51      131812381       144347.74
#> 8  27335.05 28825.55      27695.25     4.08          59120        16626.67
#> 9   1393.90  1473.10       1417.65     3.91        2062794        30285.32
#> 10   278.75   292.90        282.10     3.83        7629980        21911.78
```

### Pre Open Market Data

##### Fetch data of pre open session of Nifty Bank.

``` r
nse_preopen_nifty_bank()
#>        symbol series corp_action_date corp_action   price change percent_change
#> 1    AXISBANK     EQ             <NA>        <NA>  731.10 -22.85          -3.03
#> 2    HDFCBANK     EQ             <NA>        <NA> 1548.55 -38.30          -2.41
#> 3   ICICIBANK     EQ             <NA>        <NA>  618.75 -13.35          -2.11
#> 4     RBLBANK     EQ             <NA>        <NA>  243.80  -5.15          -2.07
#> 5  INDUSINDBK     EQ             <NA>        <NA> 1078.00 -21.75          -1.98
#> 6   KOTAKBANK     EQ             <NA>        <NA> 1863.90 -35.60          -1.87
#> 7  IDFCFIRSTB     EQ             <NA>        <NA>   65.95  -1.15          -1.71
#> 8  FEDERALBNK     EQ             <NA>        <NA>   86.70  -1.40          -1.59
#> 9        SBIN     EQ             <NA>        <NA>  398.70  -6.35          -1.57
#> 10 BANDHANBNK     EQ             <NA>        <NA>  350.00  -4.90          -1.38
#> 11        PNB     EQ             <NA>        <NA>   43.00  -0.55          -1.26
#> 12 BANKBARODA     EQ             <NA>        <NA>   85.00  -0.60          -0.70
#>    prev_close quantity  value   mkt_cap year_high year_low sum_val sum_quantity
#> 1      753.95    57795 422.54 186945.45    799.00   286.00 4120.66      1600400
#> 2     1586.85    60993 944.51 690446.21   1641.00   738.75 4120.66      1600400
#> 3      632.10   110691 684.90 436360.17    679.40   268.30 4120.66      1600400
#> 4      248.95    31732  77.36  11160.81    308.10   101.55 4120.66      1600400
#> 5     1099.75    16466 177.50  62438.62   1119.50   235.55 4120.66      1600400
#> 6     1899.50     5176  96.48 278284.53   2049.00  1001.00 4120.66      1600400
#> 7       67.10   160479 105.84  14082.89     68.15    17.65 4120.66      1600400
#> 8       88.10    80787  70.04  17590.73     88.50    35.70 4120.66      1600400
#> 9      405.05   165134 658.39 155441.30    427.70   149.45 4120.66      1600400
#> 10     354.90    86055 301.19  24003.88    430.70   152.20 4120.66      1600400
#> 11      43.55   694341 298.57  10494.97     46.35    26.30 4120.66      1600400
#> 12      85.60   333343 283.34  10283.53     99.85    36.00 4120.66      1600400
#>    fin_quantity sum_fin_quantity
#> 1         57795          1802992
#> 2         60993          1802992
#> 3        110691          1802992
#> 4         31732          1802992
#> 5         16466          1802992
#> 6          5176          1802992
#> 7        160479          1802992
#> 8         80787          1802992
#> 9        165134          1802992
#> 10        86055          1802992
#> 11       694341          1802992
#> 12       333343          1802992

# retain original column names as returned by NSE
nse_preopen_nifty(clean_names = FALSE)
#>        symbol series        xDt
#> 1   TATASTEEL     EQ       <NA>
#> 2    JSWSTEEL     EQ       <NA>
#> 3    AXISBANK     EQ       <NA>
#> 4  TATAMOTORS     EQ       <NA>
#> 5    HDFCBANK     EQ       <NA>
#> 6  BAJAJFINSV     EQ       <NA>
#> 7   ICICIBANK     EQ       <NA>
#> 8    HINDALCO     EQ       <NA>
#> 9  BAJFINANCE     EQ       <NA>
#> 10 INDUSINDBK     EQ       <NA>
#> 11  POWERGRID     EQ       <NA>
#> 12        UPL     EQ       <NA>
#> 13  KOTAKBANK     EQ       <NA>
#> 14       HDFC     EQ       <NA>
#> 15      TECHM     EQ       <NA>
#> 16         LT     EQ       <NA>
#> 17       SBIN     EQ       <NA>
#> 18      TITAN     EQ       <NA>
#> 19      WIPRO     EQ 2021-01-22
#> 20    HCLTECH     EQ 2021-01-21
#> 21        M&M     EQ       <NA>
#> 22        TCS     EQ 2021-01-14
#> 23 BHARTIARTL     EQ       <NA>
#> 24  EICHERMOT     EQ       <NA>
#> 25 ULTRACEMCO     EQ       <NA>
#> 26        IOC     EQ 2021-02-09
#> 27       NTPC     EQ 2021-02-11
#> 28   RELIANCE     EQ       <NA>
#> 29       GAIL     EQ 2021-01-27
#> 30       BPCL     EQ 2021-02-17
#> 31 ASIANPAINT     EQ       <NA>
#> 32     GRASIM     EQ       <NA>
#> 33   HDFCLIFE     EQ       <NA>
#> 34   SHREECEM     EQ       <NA>
#> 35  BRITANNIA     EQ       <NA>
#> 36 HEROMOTOCO     EQ 2021-02-15
#> 37    SBILIFE     EQ       <NA>
#> 38 BAJAJ-AUTO     EQ       <NA>
#> 39       INFY     EQ       <NA>
#> 40     MARUTI     EQ       <NA>
#> 41      CIPLA     EQ       <NA>
#> 42  COALINDIA     EQ       <NA>
#> 43        ITC     EQ 2021-02-22
#> 44    DRREDDY     EQ       <NA>
#> 45   DIVISLAB     EQ       <NA>
#> 46 HINDUNILVR     EQ       <NA>
#> 47  SUNPHARMA     EQ 2021-02-09
#> 48  NESTLEIND     EQ       <NA>
#> 49       ONGC     EQ 2021-02-17
#> 50 ADANIPORTS     EQ       <NA>
#>                                                                   caAct
#> 1                                                                  <NA>
#> 2                                                                  <NA>
#> 3                                                                  <NA>
#> 4                                                                  <NA>
#> 5                                                                  <NA>
#> 6                                                                  <NA>
#> 7                                                                  <NA>
#> 8                                                                  <NA>
#> 9                                                                  <NA>
#> 10                                                                 <NA>
#> 11                                                                 <NA>
#> 12                                                                 <NA>
#> 13                                                                 <NA>
#> 14                                                                 <NA>
#> 15                                                                 <NA>
#> 16                                                                 <NA>
#> 17                                                                 <NA>
#> 18                                                                 <NA>
#> 19                                    INTERIM DIVIDEND - RE 1 PER SHARE
#> 20                                    INTERIM DIVIDEND - RS 4 PER SHARE
#> 21                                                                 <NA>
#> 22                                    INTERIM DIVIDEND - RS 6 PER SHARE
#> 23                                                                 <NA>
#> 24                                                                 <NA>
#> 25                                                                 <NA>
#> 26                                INTERIM DIVIDEND - RS 7.50  PER SHARE
#> 27                                    INTERIM DIVIDEND - RS 3 PER SHARE
#> 28                                                                 <NA>
#> 29                                 INTERIM DIVIDEND - RS 2.50 PER SHARE
#> 30                                   INTERIM DIVIDEND - RS 16 PER SHARE
#> 31                                                                 <NA>
#> 32                                                                 <NA>
#> 33                                                                 <NA>
#> 34                                                                 <NA>
#> 35                                                                 <NA>
#> 36 INTERIM DIVIDEND - RS 65 PER SHARE SPECIAL DIVIDEND - RS 5 PER SHARE
#> 37                                                                 <NA>
#> 38                                                                 <NA>
#> 39                                                                 <NA>
#> 40                                                                 <NA>
#> 41                                                                 <NA>
#> 42                                                                 <NA>
#> 43                                    INTERIM DIVIDEND - RS 5 PER SHARE
#> 44                                                                 <NA>
#> 45                                                                 <NA>
#> 46                                                                 <NA>
#> 47                                 INTERIM DIVIDEND - RS 5.50 PER SHARE
#> 48                                                                 <NA>
#> 49                                 INTERIM DIVIDEND - RS 1.75 PER SHARE
#> 50                                                                 <NA>
#>         iep     chn perChn     pCls trdQnty    iVal    mktCap    yHigh     yLow
#> 1    751.00  -26.15  -3.36   777.15   84566  635.09  58655.24   782.50   250.85
#> 2    415.10  -13.05  -3.05   428.15   45527  188.98  41397.32   435.00   132.50
#> 3    731.10  -22.85  -3.03   753.95   57795  422.54 186945.45   799.00   286.00
#> 4    339.00   -9.50  -2.73   348.50  222386  753.89  62437.43   357.00    63.50
#> 5   1548.55  -38.30  -2.41  1586.85   60993  944.51 690446.21  1641.00   738.75
#> 6  10150.00 -245.60  -2.36 10395.60     921   93.48  62864.51 10579.00  3985.30
#> 7    618.75  -13.35  -2.11   632.10  110691  684.90 436360.17   679.40   268.30
#> 8    352.00   -7.35  -2.05   359.35  123649  435.24  52475.12   361.30    84.90
#> 9   5430.00 -112.90  -2.04  5542.90    7567  410.89 146963.58  5822.20  1783.00
#> 10  1078.00  -21.75  -1.98  1099.75   16466  177.50  62438.62  1119.50   235.55
#> 11   223.05   -4.45  -1.96   227.50   22232   49.59  58319.15   238.30   122.15
#> 12   602.00  -11.60  -1.89   613.60   15660   94.27  33754.92   616.85   240.15
#> 13  1863.90  -35.60  -1.87  1899.50    5176   96.48 278284.53  2049.00  1001.00
#> 14  2610.00  -44.90  -1.69  2654.90   16205  422.95 477117.09  2896.00  1473.45
#> 15   960.00  -16.00  -1.64   976.00    4469   42.90  60420.83  1081.55   471.40
#> 16  1473.00  -23.90  -1.60  1496.90    6007   88.48 180774.74  1593.00   661.00
#> 17   398.70   -6.35  -1.57   405.05  165134  658.39 155441.30   427.70   149.45
#> 18  1452.00  -22.60  -1.53  1474.60    9089  131.97  61529.09  1621.35   720.90
#> 19   428.90   -6.60  -1.52   435.50   26909  115.41  64714.77   467.45   159.40
#> 20   952.00  -13.25  -1.37   965.25   45035  428.73 104774.61  1067.00   375.25
#> 21   841.85  -10.20  -1.20   852.05    9358   78.78  81563.19   952.05   245.40
#> 22  3023.00  -36.10  -1.18  3059.10   16407  495.98 321409.76  3339.80  1506.05
#> 23   540.00   -6.30  -1.15   546.30   80561  435.03 131136.32   623.00   361.75
#> 24  2570.00  -29.05  -1.12  2599.05    2275   58.47  36219.42  3037.00  1245.01
#> 25  6429.00  -71.50  -1.10  6500.50     864   55.55  75051.37  6589.00  2910.00
#> 26   101.50   -1.10  -1.07   102.60   82112   83.34  26079.10   108.75    71.15
#> 27   111.50   -1.20  -1.06   112.70   87190   97.22  54640.71   114.70    73.20
#> 28  2180.00  -22.10  -1.00  2202.10  119360 2602.05 711964.20  2369.35   866.98
#> 29   145.50   -1.45  -0.99   146.95   45042   65.54  27173.38   152.80    65.00
#> 30   462.00   -4.35  -0.93   466.35   16624   76.80  37430.35   482.40   252.00
#> 31  2380.00  -22.10  -0.92  2402.10    5634  134.09 108292.18  2873.45  1431.20
#> 32  1306.00  -12.10  -0.92  1318.10    2928   38.24  51166.55  1343.00   385.05
#> 33   721.00   -6.50  -0.89   727.50    3606   26.00  57310.48   744.00   340.00
#> 34 27450.00 -245.25  -0.89 27695.25      39   10.71  36972.82 29090.00 15410.00
#> 35  3450.00  -31.15  -0.89  3481.15    1277   44.06  41086.43  4010.00  2100.00
#> 36  3398.00  -26.35  -0.77  3424.35    1749   59.43  44464.82  3629.05  1475.00
#> 37   899.70   -6.75  -0.74   906.45    5118   46.05  35353.29   954.50   519.40
#> 38  3875.00  -26.10  -0.67  3901.10     836   32.40  50798.24  4361.40  1788.65
#> 39  1335.00   -8.55  -0.64  1343.55  105459 1407.88 497891.64  1392.80   509.25
#> 40  7080.00  -44.70  -0.63  7124.70    4552  322.28  94698.11  8329.00  4001.10
#> 41   807.40   -5.10  -0.63   812.50    4941   39.89  41279.96   878.90   355.30
#> 42   154.00   -0.90  -0.58   154.90   57942   89.23  32456.63   180.20   109.55
#> 43   208.80   -1.15  -0.55   209.95  125401  261.84 183424.41   239.20   134.60
#> 44  4482.00  -20.55  -0.46  4502.55    3441  154.23  54659.89  5512.65  2495.05
#> 45  3550.00  -15.15  -0.42  3565.15    1554   55.17  45428.89  3914.95  1626.00
#> 46  2185.00   -8.50  -0.39  2193.50   17442  381.11 195842.56  2614.30  1757.30
#> 47   622.00   -2.35  -0.38   624.35   24962  155.26  67411.12   654.40   312.00
#> 48 16656.55  -42.70  -0.26 16699.25     335   55.80  59572.60 18844.00 12200.00
#> 49   113.95   -0.05  -0.04   114.00  129498  147.56  41590.40   120.50    50.00
#> 50   733.25    3.40   0.47   729.85  161134 1181.52  53383.46   754.95   203.00
#>      sumVal sumQnty finQnty sumfinQnty
#> 1  15567.69 1552461   84566    2164118
#> 2  15567.69 1552461   45527    2164118
#> 3  15567.69 1552461   57795    2164118
#> 4  15567.69 1552461  222386    2164118
#> 5  15567.69 1552461   60993    2164118
#> 6  15567.69 1552461     921    2164118
#> 7  15567.69 1552461  110691    2164118
#> 8  15567.69 1552461  123649    2164118
#> 9  15567.69 1552461    7567    2164118
#> 10 15567.69 1552461   16466    2164118
#> 11 15567.69 1552461   22232    2164118
#> 12 15567.69 1552461   15660    2164118
#> 13 15567.69 1552461    5176    2164118
#> 14 15567.69 1552461   16205    2164118
#> 15 15567.69 1552461    4469    2164118
#> 16 15567.69 1552461    6007    2164118
#> 17 15567.69 1552461  165134    2164118
#> 18 15567.69 1552461    9089    2164118
#> 19 15567.69 1552461   26909    2164118
#> 20 15567.69 1552461   45035    2164118
#> 21 15567.69 1552461    9358    2164118
#> 22 15567.69 1552461   16407    2164118
#> 23 15567.69 1552461   80561    2164118
#> 24 15567.69 1552461    2275    2164118
#> 25 15567.69 1552461     864    2164118
#> 26 15567.69 1552461   82112    2164118
#> 27 15567.69 1552461   87190    2164118
#> 28 15567.69 1552461  119360    2164118
#> 29 15567.69 1552461   45042    2164118
#> 30 15567.69 1552461   16624    2164118
#> 31 15567.69 1552461    5634    2164118
#> 32 15567.69 1552461    2928    2164118
#> 33 15567.69 1552461    3606    2164118
#> 34 15567.69 1552461      39    2164118
#> 35 15567.69 1552461    1277    2164118
#> 36 15567.69 1552461    1749    2164118
#> 37 15567.69 1552461    5118    2164118
#> 38 15567.69 1552461     836    2164118
#> 39 15567.69 1552461  105459    2164118
#> 40 15567.69 1552461    4552    2164118
#> 41 15567.69 1552461    4941    2164118
#> 42 15567.69 1552461   57942    2164118
#> 43 15567.69 1552461  125401    2164118
#> 44 15567.69 1552461    3441    2164118
#> 45 15567.69 1552461    1554    2164118
#> 46 15567.69 1552461   17442    2164118
#> 47 15567.69 1552461   24962    2164118
#> 48 15567.69 1552461     335    2164118
#> 49 15567.69 1552461  129498    2164118
#> 50 15567.69 1552461  161134    2164118
```

### Advances & Declines

``` r
nse_advances_declines()
#>                                     index_name advances declines unchanged
#> 1                                     NIFTY 50       16       34         0
#> 2                                NIFTY NEXT 50       32       18         0
#> 3                                     NIFTY IT        4        6         0
#> 4                                   NIFTY BANK        5        7         0
#> 5                              NIFTY MIDCAP 50       30       19         1
#> 6                                  NIFTY INFRA       18       12         0
#> 7                                 NIFTY REALTY        4        6         0
#> 8                                 NIFTY ENERGY        2        8         0
#> 9                                   NIFTY FMCG        8        7         0
#> 10                                   NIFTY MNC       20        9         1
#> 11                                NIFTY PHARMA        3        7         0
#> 12                                   NIFTY PSE        7       13         0
#> 13                              NIFTY PSU BANK        3        9         0
#> 14                           NIFTY SERV SECTOR        8       22         0
#> 15                           NIFTY COMMODITIES       15       15         0
#> 16                           NIFTY CONSUMPTION       20       10         0
#> 17                           NIFTY FIN SERVICE        3       17         0
#> 18                                  NIFTY AUTO       12        3         0
#> 19                           NIFTY DIV OPPS 50       24       26         0
#> 20                                 NIFTY MEDIA        9        1         0
#> 21                                 NIFTY METAL        6        9         0
#> 22                             NIFTY100 LIQ 15        3       12         0
#> 23                                  NIFTY CPSE        6        6         0
#> 24                           NIFTY GROWSECT 15        7        8         0
#> 25                            NIFTY50 VALUE 20        6       14         0
#> 26                           NIFTY100 QUALTY30       16       14         0
#> 27                              NIFTY PVT BANK        4        6         0
#> 28                            NIFTY MID LIQ 15       10        5         0
#> 29                                   NIFTY 100       48       52         0
#> 30                                   NIFTY 200      108       91         1
#> 31                                   NIFTY 500      296      200         5
#> 32                            NIFTY MIDCAP 100       60       39         1
#> 33                            NIFTY SMLCAP 100       70       30         0
#> 34                    NIFTY ADITYA BIRLA GROUP        5        2         0
#> 35                              NIFTY ALPHA 50       32       18         0
#> 36                          NIFTY HIGH BETA 50       24       26         0
#> 37                     NIFTY LOW VOLATILITY 50       29       21         0
#> 38                        NIFTY MAHINDRA GROUP        4        5         0
#> 39                            NIFTY MIDCAP 150       88       61         1
#> 40                       NIFTY MIDSMALLCAP 400      248      147         5
#> 41                            NIFTY SHARIAH 25       12       13         0
#> 42                          NIFTY SMALLCAP 250      160       86         4
#> 43                           NIFTY SMALLCAP 50       31       19         0
#> 44                            NIFTY TATA GROUP       14       11         0
#> 45                    NIFTY TATA GROUP 25% CAP        5        5         0
#> 46                            NIFTY100 EQL WGT       48       52         0
#> 47                           NIFTY100 LOWVOL30       12       18         0
#> 48                             NIFTY50 SHARIAH        7       11         0
#> 49                            NIFTY500 SHARIAH      125       82         2
#> 50                             NIFTY50 EQL WGT       16       34         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       17       13         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       16       13         1
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30       17       13         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30       16       14         0
#> 55                       NIFTY LARGEMIDCAP 250      136      113         1
#> 56                           NIFTY500 VALUE 50       22       28         0
#> 57                            NIFTY MIDCAP 150       88       61         1
#> 58                             NIFTY SMLCAP 50       31       19         0
#> 59                            NIFTY SMLCAP 250      160       86         4
#> 60                            NIFTY MIDSML 400      248      147         5
#> 61                           NIFTY200 QUALTY30       19       11         0
#> 62                          CNX NIFTY Pre Open        1       49         0

# retain original column names as returned by NSE
nse_advances_declines(clean_names = FALSE)
#>                                        skipped advances declines unchanged
#> 1                                     NIFTY 50       16       34         0
#> 2                                NIFTY NEXT 50       32       18         0
#> 3                                     NIFTY IT        4        6         0
#> 4                                   NIFTY BANK        5        7         0
#> 5                              NIFTY MIDCAP 50       30       19         1
#> 6                                  NIFTY INFRA       18       12         0
#> 7                                 NIFTY REALTY        4        6         0
#> 8                                 NIFTY ENERGY        2        8         0
#> 9                                   NIFTY FMCG        8        7         0
#> 10                                   NIFTY MNC       20        9         1
#> 11                                NIFTY PHARMA        3        7         0
#> 12                                   NIFTY PSE        7       13         0
#> 13                              NIFTY PSU BANK        3        9         0
#> 14                           NIFTY SERV SECTOR        8       22         0
#> 15                           NIFTY COMMODITIES       15       15         0
#> 16                           NIFTY CONSUMPTION       20       10         0
#> 17                           NIFTY FIN SERVICE        3       17         0
#> 18                                  NIFTY AUTO       12        3         0
#> 19                           NIFTY DIV OPPS 50       24       26         0
#> 20                                 NIFTY MEDIA        9        1         0
#> 21                                 NIFTY METAL        6        9         0
#> 22                             NIFTY100 LIQ 15        3       12         0
#> 23                                  NIFTY CPSE        6        6         0
#> 24                           NIFTY GROWSECT 15        7        8         0
#> 25                            NIFTY50 VALUE 20        6       14         0
#> 26                           NIFTY100 QUALTY30       16       14         0
#> 27                              NIFTY PVT BANK        4        6         0
#> 28                            NIFTY MID LIQ 15       10        5         0
#> 29                                   NIFTY 100       48       52         0
#> 30                                   NIFTY 200      108       91         1
#> 31                                   NIFTY 500      296      200         5
#> 32                            NIFTY MIDCAP 100       60       39         1
#> 33                            NIFTY SMLCAP 100       70       30         0
#> 34                    NIFTY ADITYA BIRLA GROUP        5        2         0
#> 35                              NIFTY ALPHA 50       32       18         0
#> 36                          NIFTY HIGH BETA 50       24       26         0
#> 37                     NIFTY LOW VOLATILITY 50       29       21         0
#> 38                        NIFTY MAHINDRA GROUP        4        5         0
#> 39                            NIFTY MIDCAP 150       88       61         1
#> 40                       NIFTY MIDSMALLCAP 400      248      147         5
#> 41                            NIFTY SHARIAH 25       12       13         0
#> 42                          NIFTY SMALLCAP 250      160       86         4
#> 43                           NIFTY SMALLCAP 50       31       19         0
#> 44                            NIFTY TATA GROUP       14       11         0
#> 45                    NIFTY TATA GROUP 25% CAP        5        5         0
#> 46                            NIFTY100 EQL WGT       48       52         0
#> 47                           NIFTY100 LOWVOL30       12       18         0
#> 48                             NIFTY50 SHARIAH        7       11         0
#> 49                            NIFTY500 SHARIAH      125       82         2
#> 50                             NIFTY50 EQL WGT       16       34         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       17       13         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       16       13         1
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30       17       13         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30       16       14         0
#> 55                       NIFTY LARGEMIDCAP 250      136      113         1
#> 56                           NIFTY500 VALUE 50       22       28         0
#> 57                            NIFTY MIDCAP 150       88       61         1
#> 58                             NIFTY SMLCAP 50       31       19         0
#> 59                            NIFTY SMLCAP 250      160       86         4
#> 60                            NIFTY MIDSML 400      248      147         5
#> 61                           NIFTY200 QUALTY30       19       11         0
#> 62                          CNX NIFTY Pre Open        1       49         0
```

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
