
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nse2r

> Fetch data from the National Stock Exchange, India.

<!-- badges: start -->

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/nse2r)](https://cran.r-project.org/package=nse2r)
[![cran
checks](https://cranchecks.info/badges/summary/nse2r)](https://cran.r-project.org/web/checks/check_results_nse2r.html)
[![R build
status](https://github.com/rsquaredacademy/nsetools/workflows/R-CMD-check/badge.svg)](https://github.com/rsquaredacademy/nsetools/actions)
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
#> 1  NIFTY 50 Pre Open        13002.6000  76.15           0.59
#> 2           NIFTY 50        13055.1500 128.70           1.00
#> 3      NIFTY NEXT 50        30377.1500 156.85           0.52
#> 4    NIFTY100 LIQ 15         3160.8000  47.95           1.54
#> 5         NIFTY BANK        29737.2500 713.05           2.46
#> 6          INDIA VIX           21.0575   0.26           1.25
#> 7          NIFTY 100        13158.3000 121.65           0.93
#> 8          NIFTY 500        10733.6000  97.65           0.92
#> 9   NIFTY MIDCAP 100        19352.2500 140.85           0.73
#> 10   NIFTY MIDCAP 50         5410.5500  45.00           0.84
#> 11       NIFTY INFRA         3446.0000   9.50           0.28
#> 12      NIFTY REALTY          258.3000   4.55           1.79
#> 13      NIFTY ENERGY        16460.5500  55.00           0.34
#> 14        NIFTY FMCG        31832.2000 264.10           0.84
#> 15         NIFTY MNC        14901.5500 112.40           0.76
#> 16      NIFTY PHARMA        11880.8000 143.60           1.22
#> 17         NIFTY PSE         2581.9500   1.00           0.04
#> 18    NIFTY PSU BANK         1483.1000  16.25           1.11
#> 19 NIFTY SERV SECTOR        18289.4000 188.10           1.04
#> 20          NIFTY IT        22064.3000  57.25           0.26
#> 21  NIFTY SMLCAP 100         6380.0000  70.35           1.11
#> 22         NIFTY 200         6748.9000  60.90           0.91
#> 23        NIFTY AUTO         8887.9500 149.35           1.71
#> 24       NIFTY MEDIA         1478.0000   0.70           0.05
#> 25       NIFTY METAL         2839.1500  30.55           1.09
#> 26 NIFTY DIV OPPS 50         2647.0500  16.65           0.63
#> 27 NIFTY COMMODITIES         3607.5000  12.75           0.35
#> 28 NIFTY CONSUMPTION         5422.9500  35.50           0.66
#> 29        NIFTY CPSE         1487.2500   3.40           0.23
#> 30 NIFTY FIN SERVICE        14275.2500 216.15           1.54
#> 31 NIFTY GROWSECT 15         6557.9000  86.15           1.33
#> 32  NIFTY50 VALUE 20         6272.5000  40.45           0.65
#> 33 NIFTY50 TR 2X LEV         7065.0500 137.35           1.98
#> 34 NIFTY50 PR 2X LEV         5320.2000 103.45           1.98
#> 35 NIFTY50 TR 1X INV          292.0500  -2.90          -0.98
#> 36 NIFTY50 PR 1X INV          336.3500  -3.35          -0.99
#> 37    NIFTY ALPHA 50        19019.5000 144.45           0.77
#> 38   NIFTY50 EQL WGT        13522.7500 113.45           0.85
#> 39  NIFTY100 EQL WGT        14403.1000  94.75           0.66
#> 40 NIFTY100 LOWVOL30        10215.1000  68.45           0.67
#> 41  NIFTY MID LIQ 15         4758.4500  43.90           0.93
#> 42    NIFTY PVT BANK        16542.9500 376.10           2.33
#> 43 NIFTY100 QUALTY30         3049.0000  25.90           0.86
#> 44   NIFTY GS 8 13YR         2244.3700   2.69           0.12
#> 45     NIFTY GS 10YR         2024.7400   2.76           0.14
#> 46 NIFTY GS 10YR CLN          969.7200   1.19           0.12
#> 47    NIFTY GS 4 8YR         2391.6100   2.94           0.12
#> 48  NIFTY GS 11 15YR         2427.8400   5.60           0.23
#> 49 NIFTY GS 15YRPLUS         2639.2700   2.76           0.10
#> 50 NIFTY GS COMPSITE         2290.2900   2.86           0.13
#> 51  NIFTY MIDCAP 150         7340.0000  60.50           0.83
#> 52   NIFTY SMLCAP 50         3146.6500  35.15           1.13
#> 53  NIFTY SMLCAP 250         5475.8500  48.45           0.89
#> 54  NIFTY MIDSML 400         6671.5500  56.20           0.85
#> 55 NIFTY200 QUALTY30        11211.1500  79.75           0.72

# retain original column names as returned by NSE
nse_index_quote(clean_names = FALSE)
#>              skipped  lastPrice change pChange
#> 1  NIFTY 50 Pre Open 13002.6000  76.15    0.59
#> 2           NIFTY 50 13055.1500 128.70    1.00
#> 3      NIFTY NEXT 50 30377.1500 156.85    0.52
#> 4    NIFTY100 LIQ 15  3160.8000  47.95    1.54
#> 5         NIFTY BANK 29737.2500 713.05    2.46
#> 6          INDIA VIX    21.0575   0.26    1.25
#> 7          NIFTY 100 13158.3000 121.65    0.93
#> 8          NIFTY 500 10733.6000  97.65    0.92
#> 9   NIFTY MIDCAP 100 19352.2500 140.85    0.73
#> 10   NIFTY MIDCAP 50  5410.5500  45.00    0.84
#> 11       NIFTY INFRA  3446.0000   9.50    0.28
#> 12      NIFTY REALTY   258.3000   4.55    1.79
#> 13      NIFTY ENERGY 16460.5500  55.00    0.34
#> 14        NIFTY FMCG 31832.2000 264.10    0.84
#> 15         NIFTY MNC 14901.5500 112.40    0.76
#> 16      NIFTY PHARMA 11880.8000 143.60    1.22
#> 17         NIFTY PSE  2581.9500   1.00    0.04
#> 18    NIFTY PSU BANK  1483.1000  16.25    1.11
#> 19 NIFTY SERV SECTOR 18289.4000 188.10    1.04
#> 20          NIFTY IT 22064.3000  57.25    0.26
#> 21  NIFTY SMLCAP 100  6380.0000  70.35    1.11
#> 22         NIFTY 200  6748.9000  60.90    0.91
#> 23        NIFTY AUTO  8887.9500 149.35    1.71
#> 24       NIFTY MEDIA  1478.0000   0.70    0.05
#> 25       NIFTY METAL  2839.1500  30.55    1.09
#> 26 NIFTY DIV OPPS 50  2647.0500  16.65    0.63
#> 27 NIFTY COMMODITIES  3607.5000  12.75    0.35
#> 28 NIFTY CONSUMPTION  5422.9500  35.50    0.66
#> 29        NIFTY CPSE  1487.2500   3.40    0.23
#> 30 NIFTY FIN SERVICE 14275.2500 216.15    1.54
#> 31 NIFTY GROWSECT 15  6557.9000  86.15    1.33
#> 32  NIFTY50 VALUE 20  6272.5000  40.45    0.65
#> 33 NIFTY50 TR 2X LEV  7065.0500 137.35    1.98
#> 34 NIFTY50 PR 2X LEV  5320.2000 103.45    1.98
#> 35 NIFTY50 TR 1X INV   292.0500  -2.90   -0.98
#> 36 NIFTY50 PR 1X INV   336.3500  -3.35   -0.99
#> 37    NIFTY ALPHA 50 19019.5000 144.45    0.77
#> 38   NIFTY50 EQL WGT 13522.7500 113.45    0.85
#> 39  NIFTY100 EQL WGT 14403.1000  94.75    0.66
#> 40 NIFTY100 LOWVOL30 10215.1000  68.45    0.67
#> 41  NIFTY MID LIQ 15  4758.4500  43.90    0.93
#> 42    NIFTY PVT BANK 16542.9500 376.10    2.33
#> 43 NIFTY100 QUALTY30  3049.0000  25.90    0.86
#> 44   NIFTY GS 8 13YR  2244.3700   2.69    0.12
#> 45     NIFTY GS 10YR  2024.7400   2.76    0.14
#> 46 NIFTY GS 10YR CLN   969.7200   1.19    0.12
#> 47    NIFTY GS 4 8YR  2391.6100   2.94    0.12
#> 48  NIFTY GS 11 15YR  2427.8400   5.60    0.23
#> 49 NIFTY GS 15YRPLUS  2639.2700   2.76    0.10
#> 50 NIFTY GS COMPSITE  2290.2900   2.86    0.13
#> 51  NIFTY MIDCAP 150  7340.0000  60.50    0.83
#> 52   NIFTY SMLCAP 50  3146.6500  35.15    1.13
#> 53  NIFTY SMLCAP 250  5475.8500  48.45    0.89
#> 54  NIFTY MIDSML 400  6671.5500  56.20    0.85
#> 55 NIFTY200 QUALTY30 11211.1500  79.75    0.72
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#>        symbol series last_corp_announcement_date
#> 1  ADANIPORTS     EQ                  2020-06-17
#> 2    AXISBANK     EQ                  2019-07-04
#> 3    HDFCBANK     EQ                  2019-09-19
#> 4   EICHERMOT     EQ                  2020-08-24
#> 5    HINDALCO     EQ                  2020-09-03
#> 6         M&M     EQ                  2020-07-16
#> 7         ITC     EQ                  2020-07-06
#> 8        SBIN     EQ                  2018-06-15
#> 9   ICICIBANK     EQ                  2019-07-22
#> 10    DRREDDY     EQ                  2020-07-13
#>                                                          last_corp_announcement
#> 1                                                        Annual General Meeting
#> 2                             Annual General Meeting/ Dividend - Re 1 Per Share
#> 3       Face Value Split (Sub-Division) - From Rs 2 Per Share To Rs 1 Per Share
#> 4  Face Value Split (Sub-Division) - From Rs 10/- Per Share To Re 1/- Per Share
#> 5                              Annual General Meeting/Dividend - Re 1 Per Share
#> 6                           Annual General Meeting/Dividend - Rs 2.35 Per Share
#> 7                                                 Dividend - Rs 10.15 Per Share
#> 8                Annual General Meeting/ Change In Registrar And Transfer Agent
#> 9                              Annual General Meeting/Dividend - Re 1 Per Share
#> 10                            Annual General Meeting/Dividend - Rs 25 Per Share
#>    open_price high_price low_price last_traded_price prev_close_price
#> 1       378.0     402.00    376.00            391.90           375.15
#> 2       603.0     622.60    600.55            619.00           595.60
#> 3      1408.0    1445.00   1402.05           1444.00          1394.60
#> 4      2596.0    2715.00   2590.10           2688.80          2597.35
#> 5       220.0     227.25    218.60            225.55           218.05
#> 6       710.0     745.50    706.25            727.00           705.45
#> 7       190.6     196.45    190.60            195.65           190.85
#> 8       240.5     245.00    239.50            244.40           238.70
#> 9       474.0     480.00    471.20            479.00           468.25
#> 10     4850.0    4940.00   4785.80           4934.10          4828.75
#>    percent_change traded_quantity turnover_in_lakhs
#> 1            4.46        19485370          76998.39
#> 2            3.93        30742369         188410.76
#> 3            3.54        20077200         287103.96
#> 4            3.52         2418981          64838.61
#> 5            3.44        18538052          41356.54
#> 6            3.05        16121626         117747.52
#> 7            2.52        45411815          88385.02
#> 8            2.39        47636611         115237.73
#> 9            2.30        23135994         110034.79
#> 10           2.18         1922298          93644.75

# retain original column names as returned by NSE
nse_stock_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1  ADANIPORTS     EQ               2020-06-17
#> 2    AXISBANK     EQ               2019-07-04
#> 3    HDFCBANK     EQ               2019-09-19
#> 4   EICHERMOT     EQ               2020-08-24
#> 5    HINDALCO     EQ               2020-09-03
#> 6         M&M     EQ               2020-07-16
#> 7         ITC     EQ               2020-07-06
#> 8        SBIN     EQ               2018-06-15
#> 9   ICICIBANK     EQ               2019-07-22
#> 10    DRREDDY     EQ               2020-07-13
#>                                                            lastCorpAnnouncement
#> 1                                                        Annual General Meeting
#> 2                             Annual General Meeting/ Dividend - Re 1 Per Share
#> 3       Face Value Split (Sub-Division) - From Rs 2 Per Share To Rs 1 Per Share
#> 4  Face Value Split (Sub-Division) - From Rs 10/- Per Share To Re 1/- Per Share
#> 5                              Annual General Meeting/Dividend - Re 1 Per Share
#> 6                           Annual General Meeting/Dividend - Rs 2.35 Per Share
#> 7                                                 Dividend - Rs 10.15 Per Share
#> 8                Annual General Meeting/ Change In Registrar And Transfer Agent
#> 9                              Annual General Meeting/Dividend - Re 1 Per Share
#> 10                            Annual General Meeting/Dividend - Rs 25 Per Share
#>    openPrice highPrice lowPrice     ltp previousPrice netPrice tradedQuantity
#> 1      378.0    402.00   376.00  391.90        375.15     4.46       19485370
#> 2      603.0    622.60   600.55  619.00        595.60     3.93       30742369
#> 3     1408.0   1445.00  1402.05 1444.00       1394.60     3.54       20077200
#> 4     2596.0   2715.00  2590.10 2688.80       2597.35     3.52        2418981
#> 5      220.0    227.25   218.60  225.55        218.05     3.44       18538052
#> 6      710.0    745.50   706.25  727.00        705.45     3.05       16121626
#> 7      190.6    196.45   190.60  195.65        190.85     2.52       45411815
#> 8      240.5    245.00   239.50  244.40        238.70     2.39       47636611
#> 9      474.0    480.00   471.20  479.00        468.25     2.30       23135994
#> 10    4850.0   4940.00  4785.80 4934.10       4828.75     2.18        1922298
#>    turnoverInLakhs
#> 1         76998.39
#> 2        188410.76
#> 3        287103.96
#> 4         64838.61
#> 5         41356.54
#> 6        117747.52
#> 7         88385.02
#> 8        115237.73
#> 9        110034.79
#> 10        93644.75
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#>        symbol
#> 1       AARON
#> 2    ADANIENT
#> 3  ADANIGREEN
#> 4  ADANIPORTS
#> 5       AFFLE
#> 6  ALKYLAMINE
#> 7     ALMONDZ
#> 8  AMARAJABAT
#> 9  APOLLOHOSP
#> 10  ASHIMASYN
#> 11  AUTOAXLES
#> 12  BALAMINES
#> 13 BALKRISIND
#> 14 BANCOINDIA
#> 15       BEPL
#> 16 BIOFILCHEM
#> 17       CGCL
#> 18 CHAMBLFERT
#> 19   CHOLAFIN
#> 20     COLPAL
#> 21  DALBHARAT
#> 22       DHFL
#> 23      DIXON
#> 24  EICHERMOT
#> 25   EIDPARRY
#> 26        EKC
#> 27 EQUITASBNK
#> 28        FCL
#> 29        FSL
#> 30  GINNIFILA
#> 31       GPPL
#> 32   GRANULES
#> 33  GUJGASLTD
#> 34        HCG
#> 35   HDFCBANK
#> 36   HINDALCO
#> 37  ICICIM150
#> 38  ICICINV20
#> 39       IDFC
#> 40   INDIACEM
#> 41 INDSWFTLAB
#> 42  INTELLECT
#> 43        IVP
#> 44 JISLJALEQS
#> 45      JSWHL
#> 46   JUBLFOOD
#> 47   JUBLINDS
#> 48 KAJARIACER
#> 49 KELLTONTEC
#> 50 KEYFINSERV
#> 51  KOTAKBANK
#> 52   KRISHANA
#> 53       LASA
#> 54        M&M
#> 55   MAESGETF
#> 56 METROPOLIS
#> 57     NAUKRI
#> 58 ORCHPHARMA
#> 59  PALREDTEC
#> 60  PANAMAPET
#> 61       PGHL
#> 62 PILANIINVS
#> 63 PLASTIBLEN
#> 64     PRECOT
#> 65 PREMIERPOL
#> 66  RESPONIND
#> 67       ROML
#> 68   SBIETFPB
#> 69       SPYL
#> 70        SRF
#> 71 SRHHYPOLTD
#> 72 SUNDARMFIN
#> 73 SUPREMEIND
#> 74      TANLA
#> 75  TATASTEEL
#> 76 TATASTLBSL
#> 77      TECHM
#> 78    TIINDIA
#> 79      TOTAL
#> 80   TREJHARA
#> 81     TRIGYN
#> 82     UTIAMC
#> 83 UTIBANKETF
#> 84  UTINEXT50
#> 85 VAIBHAVGBL
#> 86     VERTOZ
#> 87   VIDEOIND
#> 88       VSSL
#>                                                               symbol_desc
#> 1                                                Aaron Industries Limited
#> 2                                               Adani Enterprises Limited
#> 3                                              Adani Green Energy Limited
#> 4                           Adani Ports and Special Economic Zone Limited
#> 5                                                   Affle (India) Limited
#> 6                                          Alkyl Amines Chemicals Limited
#> 7                                       Almondz Global Securities Limited
#> 8                                            Amara Raja Batteries Limited
#> 9                                     Apollo Hospitals Enterprise Limited
#> 10                                                         Ashima Limited
#> 11                                               Automotive Axles Limited
#> 12                                                  Balaji Amines Limited
#> 13                                          Balkrishna Industries Limited
#> 14                                             Banco Products (I) Limited
#> 15                                  Bhansali Engineering Polymers Limited
#> 16                             Biofil Chemicals & Pharmaceuticals Limited
#> 17                                           Capri Global Capital Limited
#> 18                                Chambal Fertilizers & Chemicals Limited
#> 19                   Cholamandalam Investment and Finance Company Limited
#> 20                                      Colgate Palmolive (India) Limited
#> 21                                                  Dalmia Bharat Limited
#> 22                              Dewan Housing Finance Corporation Limited
#> 23                                     Dixon Technologies (India) Limited
#> 24                                                  Eicher Motors Limited
#> 25                                                EID Parry India Limited
#> 26                                         Everest Kanto Cylinder Limited
#> 27                                     Equitas Small Finance Bank Limited
#> 28                                              Fineotex Chemical Limited
#> 29                                          Firstsource Solutions Limited
#> 30                                                Ginni Filaments Limited
#> 31                                           Gujarat Pipavav Port Limited
#> 32                                                 Granules India Limited
#> 33                                                    Gujarat Gas Limited
#> 34                                  Healthcare Global Enterprises Limited
#> 35                                                      HDFC Bank Limited
#> 36                                            Hindalco Industries Limited
#> 37         ICICI Prudential Mutual Fund - ICICI Prudential Midcap 150 ETF
#> 38                                              ICICI Prudential NV20 ETF
#> 39                                                           IDFC Limited
#> 40                                              The India Cements Limited
#> 41                                         Ind-Swift Laboratories Limited
#> 42                                         Intellect Design Arena Limited
#> 43                                                            IVP Limited
#> 44                                        Jain Irrigation Systems Limited
#> 45                                                   JSW Holdings Limited
#> 46                                             Jubilant Foodworks Limited
#> 47                                            Jubilant Industries Limited
#> 48                                               Kajaria Ceramics Limited
#> 49                                         Kellton Tech Solutions Limited
#> 50                                     Keynote Financial Services Limited
#> 51                                            Kotak Mahindra Bank Limited
#> 52                                              Krishana Phoschem Limited
#> 53                                             Lasa Supergenerics Limited
#> 54                                            Mahindra & Mahindra Limited
#> 55            Mirae Asset Mutual Fund -Mirae Asset ESG Sector Leaders ETF
#> 56                                          Metropolis Healthcare Limited
#> 57                                              Info Edge (India) Limited
#> 58                                                  Orchid Pharma Limited
#> 59                                            Palred Technologies Limited
#> 60                                               Panama Petrochem Limited
#> 61                                        Procter & Gamble Health Limited
#> 62                   Pilani Investment and Industries Corporation Limited
#> 63                                             Plastiblends India Limited
#> 64                                                Precot Meridian Limited
#> 65                                               Premier Polyfilm Limited
#> 66                                          Responsive Industries Limited
#> 67                                                  Raj Oil Mills Limited
#> 68          SBI Mutual Fund - SBI ETF Private Bank - SBI ETF Private Bank
#> 69                                           Shekhawati Poly-Yarn Limited
#> 70                                                            SRF Limited
#> 71                              Sree Rayalaseema Hi-Strength Hypo Limited
#> 72                                               Sundaram Finance Limited
#> 73                                             Supreme Industries Limited
#> 74                                                Tanla Platforms Limited
#> 75                                                     Tata Steel Limited
#> 76                                                 Tata Steel Bsl Limited
#> 77                                                  Tech Mahindra Limited
#> 78                                      Tube Investments of India Limited
#> 79                                        Total Transport Systems Limited
#> 80                                             TREJHARA SOLUTIONS LIMITED
#> 81                                            Trigyn Technologies Limited
#> 82                                   UTI Asset Management Company Limited
#> 83                        UTI Mutual Fund - UTI Bank Exchange Traded Fund
#> 84 UTI Mutual Fund - UTI NIfty Next 50 Exchange Traded Fund - UTI NIFTY N
#> 85                                                 Vaibhav Global Limited
#> 86                                             Vertoz Advertising Limited
#> 87                                            Videocon Industries Limited
#> 88                                        Vardhman Special Steels Limited
#>          date new_high     year last_traded_price prev_high prev_close change
#> 1  2020-11-23    56.10    56.10             56.10     51.00      51.00   5.10
#> 2  2020-11-23   415.50   415.50            407.55    413.70     409.05  -1.50
#> 3  2020-11-23  1220.00  1220.00           1200.00   1191.25    1180.30  19.70
#> 4  2020-11-18   402.00   402.00            391.90    395.20     375.15  16.75
#> 5  2020-11-23  3468.45  3468.45           3309.85   3303.30    3303.30   6.55
#> 6  2020-11-23  3830.00  3830.00           3734.60   3789.55    3746.60 -12.00
#> 7  2020-02-26    17.70    17.70             16.20     17.50      17.05  -0.85
#> 8  2020-11-23   895.00   895.00            894.00    879.00     874.40  19.60
#> 9  2020-11-19  2423.40  2423.40           2320.00   2415.00    2375.35 -55.35
#> 10 2020-01-16     9.90     9.90              9.90      9.65       9.45   0.45
#> 11 2020-11-23   962.95   962.95            917.00    932.00     920.70  -3.70
#> 12 2020-11-23  1054.55  1054.55           1011.90   1044.00    1033.15 -21.25
#> 13 2020-11-23  1701.45  1701.45           1662.00   1690.00    1676.90 -14.90
#> 14 2020-11-19   134.50   134.50            132.00    124.85     120.35  11.65
#> 15 2020-11-23   120.40   120.40            118.25    107.90     106.75  11.50
#> 16 2020-11-23   189.00   189.00            189.00    180.00     180.00   9.00
#> 17 2020-11-23   300.50   300.50            298.00    286.00     285.60  12.40
#> 18 2020-11-18   192.25   192.25            186.10    189.60     186.10   0.00
#> 19 2020-11-23   363.85   363.85            362.20    355.20     351.70  10.50
#> 20 2020-11-23  1578.90  1578.90           1550.00   1574.95    1567.10 -17.10
#> 21 2020-11-23  1094.80  1094.80           1065.00   1049.00    1031.40  33.60
#> 22 2019-11-25    23.45    23.45             23.45     23.30      22.35   1.10
#> 23 2020-11-23 11000.00 11000.00          10875.00  10829.10   10709.30 165.70
#> 24 2020-11-19  2715.00  2715.00           2688.80   2658.00    2597.35  91.45
#> 25 2020-11-23   332.40   332.40            330.00    325.00     323.30   6.70
#> 26 2020-11-23    43.20    43.20             43.20     41.15      41.15   2.05
#> 27 2020-11-23    39.00    39.00             36.20     38.00      37.30  -1.10
#> 28 2020-11-23    47.00    47.00             43.55     44.50      43.50   0.05
#> 29 2020-11-23    79.50    79.50             78.75     79.50      76.55   2.20
#> 30 2020-11-23    17.70    17.70             17.70     16.90      16.90   0.80
#> 31 2020-02-06   105.90   105.90             97.50     99.40      94.45   5.15
#> 32 2020-09-29   420.00   420.00            418.50    406.90     398.60  19.90
#> 33 2020-08-14   339.50   339.50            334.00    334.40     323.30  10.70
#> 34 2020-11-23   144.90   144.90            144.90    143.00     140.25   4.65
#> 35 2020-11-23  1445.00  1445.00           1444.00   1423.65    1394.60  49.40
#> 36 2020-11-19   227.25   227.25            225.55    227.25     218.05   7.50
#> 37 2020-02-27    75.00    75.00             74.06     75.00      73.44   0.62
#> 38 2020-11-14    67.00    67.00             65.45     66.70      64.96   0.49
#> 39 2020-01-16    45.00    45.00             41.00     40.50      40.20   0.80
#> 40 2020-11-23   161.90   161.90            154.00    158.80     155.70  -1.70
#> 41 2020-11-23    71.85    71.85             70.00     68.45      68.45   1.55
#> 42 2020-11-19   270.00   270.00            266.90    270.00     262.65   4.25
#> 43 2020-11-23    70.70    70.70             70.70     67.35      67.35   3.35
#> 44 2020-11-23    20.95    20.95             19.40     20.40      20.40  -1.00
#> 45 2020-11-23  3485.45  3485.45           3450.00   3415.00    3401.55  48.45
#> 46 2020-11-23  2659.95  2659.95           2545.00   2645.00    2620.25 -75.25
#> 47 2020-11-23   218.80   218.80            206.50    200.35     200.35   6.15
#> 48 2020-11-17   630.95   630.95            628.50    624.00     622.60   5.90
#> 49 2020-10-26    55.20    55.20             53.50     53.00      52.60   0.90
#> 50 2020-11-23   106.25   106.25            106.25    101.20     101.20   5.05
#> 51 2020-11-23  1948.40  1948.40           1927.95   1905.30    1897.85  30.10
#> 52 2020-11-20    79.25    79.25             79.25     78.10      75.50   3.75
#> 53 2020-11-10    84.40    84.40             81.95     83.50      77.10   4.85
#> 54 2020-11-19   745.50   745.50            727.00    728.40     705.45  21.55
#> 55       <NA>    22.60    22.60             22.54        NA      22.34   0.20
#> 56 2020-11-23  2323.00  2323.00           2290.00   2247.80    2239.20  50.80
#> 57 2020-11-23  4089.95  4089.95           4045.00   4073.20    4058.45 -13.45
#> 58 2020-11-23    36.80    36.80             36.80     35.05      35.05   1.75
#> 59 2020-11-23    37.90    37.90             36.80     36.50      36.10   0.70
#> 60 2020-01-15    78.25    78.25             76.40     76.00      72.75   3.65
#> 61 2020-11-23  6479.20  6479.20           6365.00   6446.00    6243.60 121.40
#> 62 2020-10-26  2222.00  2222.00           2210.00   2120.00    2032.35 177.65
#> 63 2020-11-23   257.85   257.85            252.10    249.80     245.80   6.30
#> 64 2020-11-23    59.50    59.50             59.50     56.70      56.70   2.80
#> 65 2020-08-31    33.70    33.70             33.10     33.00      29.95   3.15
#> 66 2020-11-10   172.70   172.70            166.20    167.95     166.00   0.20
#> 67 2020-11-23    14.60    14.60             14.60     13.95      13.95   0.65
#> 68 2020-11-19   165.00   165.00            165.00    164.98     162.52   2.48
#> 69 2020-08-06     0.45     0.45              0.45      0.45       0.40   0.05
#> 70 2020-11-19  5367.20  5367.20           5351.00   5215.00    5159.05 191.95
#> 71 2020-11-23   273.80   273.80            260.50    256.00     252.25   8.25
#> 72 2020-11-23  1805.90  1805.90           1799.00   1790.00    1769.05  29.95
#> 73 2020-11-23  1736.00  1736.00           1717.10   1699.95    1693.45  23.65
#> 74 2020-11-23   529.45   529.45            529.45    504.25     504.25  25.20
#> 75 2020-11-23   550.45   550.45            548.25    546.00     543.10   5.15
#> 76 2020-11-23    33.50    33.50             33.35     33.25      33.10   0.25
#> 77 2020-10-08   890.00   890.00            879.00    887.55     865.75  13.25
#> 78 2020-11-23   857.50   857.50            846.00    838.00     830.40  15.60
#> 79 2020-11-23    57.15    57.15             56.05     54.45      54.45   1.60
#> 80 2020-11-23    29.25    29.25             29.25     27.90      27.90   1.35
#> 81 2020-11-23    69.10    69.10             69.10     65.85      65.85   3.25
#> 82 2020-10-12   550.00   550.00            547.50    529.95     522.25  25.25
#> 83 2020-11-18   303.00   303.00            296.05    298.77     290.53   5.52
#> 84 2020-11-23   317.69   317.69            312.00    314.24     311.85   0.15
#> 85 2020-11-23  2155.00  2155.00           2140.00   2153.05    2141.00  -1.00
#> 86 2020-11-17   192.00   192.00            184.75    189.40     186.95  -2.20
#> 87 2020-01-06     5.25     5.25              5.25      5.10       5.00   0.25
#> 88 2020-11-23    95.45    95.45             94.50     94.05      92.85   1.65
#>    percent_change
#> 1           10.00
#> 2           -0.37
#> 3            1.67
#> 4            4.46
#> 5            0.20
#> 6           -0.32
#> 7           -4.99
#> 8            2.24
#> 9           -2.33
#> 10           4.76
#> 11          -0.40
#> 12          -2.06
#> 13          -0.89
#> 14           9.68
#> 15          10.77
#> 16           5.00
#> 17           4.34
#> 18           0.00
#> 19           2.99
#> 20          -1.09
#> 21           3.26
#> 22           4.92
#> 23           1.55
#> 24           3.52
#> 25           2.07
#> 26           4.98
#> 27          -2.95
#> 28           0.11
#> 29           2.87
#> 30           4.73
#> 31           5.58
#> 32           4.99
#> 33           3.31
#> 34           3.32
#> 35           3.54
#> 36           3.44
#> 37           0.84
#> 38           0.75
#> 39           1.99
#> 40          -1.09
#> 41           2.26
#> 42           1.62
#> 43           4.97
#> 44          -4.90
#> 45           1.42
#> 46          -2.87
#> 47           3.07
#> 48           0.95
#> 49           1.71
#> 50           4.99
#> 51           1.59
#> 52           4.97
#> 53           6.29
#> 54           3.05
#> 55           0.90
#> 56           2.27
#> 57          -0.33
#> 58           4.99
#> 59           1.94
#> 60           5.02
#> 61           1.94
#> 62           8.74
#> 63           2.56
#> 64           4.94
#> 65          10.52
#> 66           0.12
#> 67           4.66
#> 68           1.53
#> 69          12.50
#> 70           3.72
#> 71           3.27
#> 72           1.69
#> 73           1.40
#> 74           5.00
#> 75           0.95
#> 76           0.76
#> 77           1.53
#> 78           1.88
#> 79           2.94
#> 80           4.84
#> 81           4.94
#> 82           4.83
#> 83           1.90
#> 84           0.05
#> 85          -0.05
#> 86          -1.18
#> 87           5.00
#> 88           1.78

# retain original column names as returned by NSE
nse_stock_year_high(clean_names = FALSE)
#>        symbol
#> 1       AARON
#> 2    ADANIENT
#> 3  ADANIGREEN
#> 4  ADANIPORTS
#> 5       AFFLE
#> 6  ALKYLAMINE
#> 7     ALMONDZ
#> 8  AMARAJABAT
#> 9  APOLLOHOSP
#> 10  ASHIMASYN
#> 11  AUTOAXLES
#> 12  BALAMINES
#> 13 BALKRISIND
#> 14 BANCOINDIA
#> 15       BEPL
#> 16 BIOFILCHEM
#> 17       CGCL
#> 18 CHAMBLFERT
#> 19   CHOLAFIN
#> 20     COLPAL
#> 21  DALBHARAT
#> 22       DHFL
#> 23      DIXON
#> 24  EICHERMOT
#> 25   EIDPARRY
#> 26        EKC
#> 27 EQUITASBNK
#> 28        FCL
#> 29        FSL
#> 30  GINNIFILA
#> 31       GPPL
#> 32   GRANULES
#> 33  GUJGASLTD
#> 34        HCG
#> 35   HDFCBANK
#> 36   HINDALCO
#> 37  ICICIM150
#> 38  ICICINV20
#> 39       IDFC
#> 40   INDIACEM
#> 41 INDSWFTLAB
#> 42  INTELLECT
#> 43        IVP
#> 44 JISLJALEQS
#> 45      JSWHL
#> 46   JUBLFOOD
#> 47   JUBLINDS
#> 48 KAJARIACER
#> 49 KELLTONTEC
#> 50 KEYFINSERV
#> 51  KOTAKBANK
#> 52   KRISHANA
#> 53       LASA
#> 54        M&M
#> 55   MAESGETF
#> 56 METROPOLIS
#> 57     NAUKRI
#> 58 ORCHPHARMA
#> 59  PALREDTEC
#> 60  PANAMAPET
#> 61       PGHL
#> 62 PILANIINVS
#> 63 PLASTIBLEN
#> 64     PRECOT
#> 65 PREMIERPOL
#> 66  RESPONIND
#> 67       ROML
#> 68   SBIETFPB
#> 69       SPYL
#> 70        SRF
#> 71 SRHHYPOLTD
#> 72 SUNDARMFIN
#> 73 SUPREMEIND
#> 74      TANLA
#> 75  TATASTEEL
#> 76 TATASTLBSL
#> 77      TECHM
#> 78    TIINDIA
#> 79      TOTAL
#> 80   TREJHARA
#> 81     TRIGYN
#> 82     UTIAMC
#> 83 UTIBANKETF
#> 84  UTINEXT50
#> 85 VAIBHAVGBL
#> 86     VERTOZ
#> 87   VIDEOIND
#> 88       VSSL
#>                                                                symbolDesc
#> 1                                                Aaron Industries Limited
#> 2                                               Adani Enterprises Limited
#> 3                                              Adani Green Energy Limited
#> 4                           Adani Ports and Special Economic Zone Limited
#> 5                                                   Affle (India) Limited
#> 6                                          Alkyl Amines Chemicals Limited
#> 7                                       Almondz Global Securities Limited
#> 8                                            Amara Raja Batteries Limited
#> 9                                     Apollo Hospitals Enterprise Limited
#> 10                                                         Ashima Limited
#> 11                                               Automotive Axles Limited
#> 12                                                  Balaji Amines Limited
#> 13                                          Balkrishna Industries Limited
#> 14                                             Banco Products (I) Limited
#> 15                                  Bhansali Engineering Polymers Limited
#> 16                             Biofil Chemicals & Pharmaceuticals Limited
#> 17                                           Capri Global Capital Limited
#> 18                                Chambal Fertilizers & Chemicals Limited
#> 19                   Cholamandalam Investment and Finance Company Limited
#> 20                                      Colgate Palmolive (India) Limited
#> 21                                                  Dalmia Bharat Limited
#> 22                              Dewan Housing Finance Corporation Limited
#> 23                                     Dixon Technologies (India) Limited
#> 24                                                  Eicher Motors Limited
#> 25                                                EID Parry India Limited
#> 26                                         Everest Kanto Cylinder Limited
#> 27                                     Equitas Small Finance Bank Limited
#> 28                                              Fineotex Chemical Limited
#> 29                                          Firstsource Solutions Limited
#> 30                                                Ginni Filaments Limited
#> 31                                           Gujarat Pipavav Port Limited
#> 32                                                 Granules India Limited
#> 33                                                    Gujarat Gas Limited
#> 34                                  Healthcare Global Enterprises Limited
#> 35                                                      HDFC Bank Limited
#> 36                                            Hindalco Industries Limited
#> 37         ICICI Prudential Mutual Fund - ICICI Prudential Midcap 150 ETF
#> 38                                              ICICI Prudential NV20 ETF
#> 39                                                           IDFC Limited
#> 40                                              The India Cements Limited
#> 41                                         Ind-Swift Laboratories Limited
#> 42                                         Intellect Design Arena Limited
#> 43                                                            IVP Limited
#> 44                                        Jain Irrigation Systems Limited
#> 45                                                   JSW Holdings Limited
#> 46                                             Jubilant Foodworks Limited
#> 47                                            Jubilant Industries Limited
#> 48                                               Kajaria Ceramics Limited
#> 49                                         Kellton Tech Solutions Limited
#> 50                                     Keynote Financial Services Limited
#> 51                                            Kotak Mahindra Bank Limited
#> 52                                              Krishana Phoschem Limited
#> 53                                             Lasa Supergenerics Limited
#> 54                                            Mahindra & Mahindra Limited
#> 55            Mirae Asset Mutual Fund -Mirae Asset ESG Sector Leaders ETF
#> 56                                          Metropolis Healthcare Limited
#> 57                                              Info Edge (India) Limited
#> 58                                                  Orchid Pharma Limited
#> 59                                            Palred Technologies Limited
#> 60                                               Panama Petrochem Limited
#> 61                                        Procter & Gamble Health Limited
#> 62                   Pilani Investment and Industries Corporation Limited
#> 63                                             Plastiblends India Limited
#> 64                                                Precot Meridian Limited
#> 65                                               Premier Polyfilm Limited
#> 66                                          Responsive Industries Limited
#> 67                                                  Raj Oil Mills Limited
#> 68          SBI Mutual Fund - SBI ETF Private Bank - SBI ETF Private Bank
#> 69                                           Shekhawati Poly-Yarn Limited
#> 70                                                            SRF Limited
#> 71                              Sree Rayalaseema Hi-Strength Hypo Limited
#> 72                                               Sundaram Finance Limited
#> 73                                             Supreme Industries Limited
#> 74                                                Tanla Platforms Limited
#> 75                                                     Tata Steel Limited
#> 76                                                 Tata Steel Bsl Limited
#> 77                                                  Tech Mahindra Limited
#> 78                                      Tube Investments of India Limited
#> 79                                        Total Transport Systems Limited
#> 80                                             TREJHARA SOLUTIONS LIMITED
#> 81                                            Trigyn Technologies Limited
#> 82                                   UTI Asset Management Company Limited
#> 83                        UTI Mutual Fund - UTI Bank Exchange Traded Fund
#> 84 UTI Mutual Fund - UTI NIfty Next 50 Exchange Traded Fund - UTI NIFTY N
#> 85                                                 Vaibhav Global Limited
#> 86                                             Vertoz Advertising Limited
#> 87                                            Videocon Industries Limited
#> 88                                        Vardhman Special Steels Limited
#>            dt    value     year      ltp value_old     prev change pChange
#> 1  2020-11-23    56.10    56.10    56.10     51.00    51.00   5.10   10.00
#> 2  2020-11-23   415.50   415.50   407.55    413.70   409.05  -1.50   -0.37
#> 3  2020-11-23  1220.00  1220.00  1200.00   1191.25  1180.30  19.70    1.67
#> 4  2020-11-18   402.00   402.00   391.90    395.20   375.15  16.75    4.46
#> 5  2020-11-23  3468.45  3468.45  3309.85   3303.30  3303.30   6.55    0.20
#> 6  2020-11-23  3830.00  3830.00  3734.60   3789.55  3746.60 -12.00   -0.32
#> 7  2020-02-26    17.70    17.70    16.20     17.50    17.05  -0.85   -4.99
#> 8  2020-11-23   895.00   895.00   894.00    879.00   874.40  19.60    2.24
#> 9  2020-11-19  2423.40  2423.40  2320.00   2415.00  2375.35 -55.35   -2.33
#> 10 2020-01-16     9.90     9.90     9.90      9.65     9.45   0.45    4.76
#> 11 2020-11-23   962.95   962.95   917.00    932.00   920.70  -3.70   -0.40
#> 12 2020-11-23  1054.55  1054.55  1011.90   1044.00  1033.15 -21.25   -2.06
#> 13 2020-11-23  1701.45  1701.45  1662.00   1690.00  1676.90 -14.90   -0.89
#> 14 2020-11-19   134.50   134.50   132.00    124.85   120.35  11.65    9.68
#> 15 2020-11-23   120.40   120.40   118.25    107.90   106.75  11.50   10.77
#> 16 2020-11-23   189.00   189.00   189.00    180.00   180.00   9.00    5.00
#> 17 2020-11-23   300.50   300.50   298.00    286.00   285.60  12.40    4.34
#> 18 2020-11-18   192.25   192.25   186.10    189.60   186.10   0.00    0.00
#> 19 2020-11-23   363.85   363.85   362.20    355.20   351.70  10.50    2.99
#> 20 2020-11-23  1578.90  1578.90  1550.00   1574.95  1567.10 -17.10   -1.09
#> 21 2020-11-23  1094.80  1094.80  1065.00   1049.00  1031.40  33.60    3.26
#> 22 2019-11-25    23.45    23.45    23.45     23.30    22.35   1.10    4.92
#> 23 2020-11-23 11000.00 11000.00 10875.00  10829.10 10709.30 165.70    1.55
#> 24 2020-11-19  2715.00  2715.00  2688.80   2658.00  2597.35  91.45    3.52
#> 25 2020-11-23   332.40   332.40   330.00    325.00   323.30   6.70    2.07
#> 26 2020-11-23    43.20    43.20    43.20     41.15    41.15   2.05    4.98
#> 27 2020-11-23    39.00    39.00    36.20     38.00    37.30  -1.10   -2.95
#> 28 2020-11-23    47.00    47.00    43.55     44.50    43.50   0.05    0.11
#> 29 2020-11-23    79.50    79.50    78.75     79.50    76.55   2.20    2.87
#> 30 2020-11-23    17.70    17.70    17.70     16.90    16.90   0.80    4.73
#> 31 2020-02-06   105.90   105.90    97.50     99.40    94.45   5.15    5.58
#> 32 2020-09-29   420.00   420.00   418.50    406.90   398.60  19.90    4.99
#> 33 2020-08-14   339.50   339.50   334.00    334.40   323.30  10.70    3.31
#> 34 2020-11-23   144.90   144.90   144.90    143.00   140.25   4.65    3.32
#> 35 2020-11-23  1445.00  1445.00  1444.00   1423.65  1394.60  49.40    3.54
#> 36 2020-11-19   227.25   227.25   225.55    227.25   218.05   7.50    3.44
#> 37 2020-02-27    75.00    75.00    74.06     75.00    73.44   0.62    0.84
#> 38 2020-11-14    67.00    67.00    65.45     66.70    64.96   0.49    0.75
#> 39 2020-01-16    45.00    45.00    41.00     40.50    40.20   0.80    1.99
#> 40 2020-11-23   161.90   161.90   154.00    158.80   155.70  -1.70   -1.09
#> 41 2020-11-23    71.85    71.85    70.00     68.45    68.45   1.55    2.26
#> 42 2020-11-19   270.00   270.00   266.90    270.00   262.65   4.25    1.62
#> 43 2020-11-23    70.70    70.70    70.70     67.35    67.35   3.35    4.97
#> 44 2020-11-23    20.95    20.95    19.40     20.40    20.40  -1.00   -4.90
#> 45 2020-11-23  3485.45  3485.45  3450.00   3415.00  3401.55  48.45    1.42
#> 46 2020-11-23  2659.95  2659.95  2545.00   2645.00  2620.25 -75.25   -2.87
#> 47 2020-11-23   218.80   218.80   206.50    200.35   200.35   6.15    3.07
#> 48 2020-11-17   630.95   630.95   628.50    624.00   622.60   5.90    0.95
#> 49 2020-10-26    55.20    55.20    53.50     53.00    52.60   0.90    1.71
#> 50 2020-11-23   106.25   106.25   106.25    101.20   101.20   5.05    4.99
#> 51 2020-11-23  1948.40  1948.40  1927.95   1905.30  1897.85  30.10    1.59
#> 52 2020-11-20    79.25    79.25    79.25     78.10    75.50   3.75    4.97
#> 53 2020-11-10    84.40    84.40    81.95     83.50    77.10   4.85    6.29
#> 54 2020-11-19   745.50   745.50   727.00    728.40   705.45  21.55    3.05
#> 55       <NA>    22.60    22.60    22.54        NA    22.34   0.20    0.90
#> 56 2020-11-23  2323.00  2323.00  2290.00   2247.80  2239.20  50.80    2.27
#> 57 2020-11-23  4089.95  4089.95  4045.00   4073.20  4058.45 -13.45   -0.33
#> 58 2020-11-23    36.80    36.80    36.80     35.05    35.05   1.75    4.99
#> 59 2020-11-23    37.90    37.90    36.80     36.50    36.10   0.70    1.94
#> 60 2020-01-15    78.25    78.25    76.40     76.00    72.75   3.65    5.02
#> 61 2020-11-23  6479.20  6479.20  6365.00   6446.00  6243.60 121.40    1.94
#> 62 2020-10-26  2222.00  2222.00  2210.00   2120.00  2032.35 177.65    8.74
#> 63 2020-11-23   257.85   257.85   252.10    249.80   245.80   6.30    2.56
#> 64 2020-11-23    59.50    59.50    59.50     56.70    56.70   2.80    4.94
#> 65 2020-08-31    33.70    33.70    33.10     33.00    29.95   3.15   10.52
#> 66 2020-11-10   172.70   172.70   166.20    167.95   166.00   0.20    0.12
#> 67 2020-11-23    14.60    14.60    14.60     13.95    13.95   0.65    4.66
#> 68 2020-11-19   165.00   165.00   165.00    164.98   162.52   2.48    1.53
#> 69 2020-08-06     0.45     0.45     0.45      0.45     0.40   0.05   12.50
#> 70 2020-11-19  5367.20  5367.20  5351.00   5215.00  5159.05 191.95    3.72
#> 71 2020-11-23   273.80   273.80   260.50    256.00   252.25   8.25    3.27
#> 72 2020-11-23  1805.90  1805.90  1799.00   1790.00  1769.05  29.95    1.69
#> 73 2020-11-23  1736.00  1736.00  1717.10   1699.95  1693.45  23.65    1.40
#> 74 2020-11-23   529.45   529.45   529.45    504.25   504.25  25.20    5.00
#> 75 2020-11-23   550.45   550.45   548.25    546.00   543.10   5.15    0.95
#> 76 2020-11-23    33.50    33.50    33.35     33.25    33.10   0.25    0.76
#> 77 2020-10-08   890.00   890.00   879.00    887.55   865.75  13.25    1.53
#> 78 2020-11-23   857.50   857.50   846.00    838.00   830.40  15.60    1.88
#> 79 2020-11-23    57.15    57.15    56.05     54.45    54.45   1.60    2.94
#> 80 2020-11-23    29.25    29.25    29.25     27.90    27.90   1.35    4.84
#> 81 2020-11-23    69.10    69.10    69.10     65.85    65.85   3.25    4.94
#> 82 2020-10-12   550.00   550.00   547.50    529.95   522.25  25.25    4.83
#> 83 2020-11-18   303.00   303.00   296.05    298.77   290.53   5.52    1.90
#> 84 2020-11-23   317.69   317.69   312.00    314.24   311.85   0.15    0.05
#> 85 2020-11-23  2155.00  2155.00  2140.00   2153.05  2141.00  -1.00   -0.05
#> 86 2020-11-17   192.00   192.00   184.75    189.40   186.95  -2.20   -1.18
#> 87 2020-01-06     5.25     5.25     5.25      5.10     5.00   0.25    5.00
#> 88 2020-11-23    95.45    95.45    94.50     94.05    92.85   1.65    1.78
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
#> 1    BOSCHLTD     EQ                  2020-08-03
#> 2     RBLBANK     EQ                  2020-07-09
#> 3  SRTRANSFIN     EQ                  2020-11-09
#> 4      M&MFIN     EQ                  2020-07-22
#> 5  ADANIPORTS     EQ                  2020-06-17
#> 6  AUROPHARMA     EQ                  2020-11-23
#> 7    AXISBANK     EQ                  2019-07-04
#> 8         SRF     EQ                  2020-08-06
#> 9    HDFCBANK     EQ                  2019-09-19
#> 10        PEL     EQ                  2020-07-16
#>                                                     last_corp_announcement
#> 1                       Annual General Meeting/Dividend - Rs 105 Per Share
#> 2                                                   Annual General Meeting
#> 3                                        Interim Dividend - Rs 6 Per Share
#> 4                                             Rights 1:1 @ Premium Rs 48/-
#> 5                                                   Annual General Meeting
#> 6                                    Interim Dividend - Rs  1.25 Per Share
#> 7                        Annual General Meeting/ Dividend - Re 1 Per Share
#> 8                                        Interim Dividend - Rs 5 Per Share
#> 9  Face Value Split (Sub-Division) - From Rs 2 Per Share To Rs 1 Per Share
#> 10                       Annual General Meeting/Dividend - Rs 14 Per Share
#>    open_price high_price low_price last_traded_price prev_close_price
#> 1    11850.00   13300.00  11800.00          12960.00         11819.50
#> 2      216.40     230.00    215.60            225.45           212.65
#> 3      982.70    1039.50    974.00           1033.00           974.65
#> 4      160.00     170.00    158.80            166.95           158.65
#> 5      378.00     402.00    376.00            391.90           375.15
#> 6      853.95     884.35    845.10            882.00           848.50
#> 7      603.00     622.60    600.55            619.00           595.60
#> 8     5174.00    5367.20   5160.05           5351.00          5159.05
#> 9     1408.00    1445.00   1402.05           1444.00          1394.60
#> 10    1395.50    1443.00   1390.05           1442.00          1392.90
#>    percent_change traded_quantity turnover_in_lakhs
#> 1            9.65          411535          52464.29
#> 2            6.02        37826692          84731.79
#> 3            5.99         7881601          79505.65
#> 4            5.23        22037664          36714.75
#> 5            4.46        19485370          76998.39
#> 6            3.95         5774755          50154.90
#> 7            3.93        30742369         188410.76
#> 8            3.72          439124          23273.40
#> 9            3.54        20077200         287103.96
#> 10           3.53         1438521          20410.60

# retain original column names as returned by NSE
nse_fo_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1    BOSCHLTD     EQ               2020-08-03
#> 2     RBLBANK     EQ               2020-07-09
#> 3  SRTRANSFIN     EQ               2020-11-09
#> 4      M&MFIN     EQ               2020-07-22
#> 5  ADANIPORTS     EQ               2020-06-17
#> 6  AUROPHARMA     EQ               2020-11-23
#> 7    AXISBANK     EQ               2019-07-04
#> 8         SRF     EQ               2020-08-06
#> 9    HDFCBANK     EQ               2019-09-19
#> 10        PEL     EQ               2020-07-16
#>                                                       lastCorpAnnouncement
#> 1                       Annual General Meeting/Dividend - Rs 105 Per Share
#> 2                                                   Annual General Meeting
#> 3                                        Interim Dividend - Rs 6 Per Share
#> 4                                             Rights 1:1 @ Premium Rs 48/-
#> 5                                                   Annual General Meeting
#> 6                                    Interim Dividend - Rs  1.25 Per Share
#> 7                        Annual General Meeting/ Dividend - Re 1 Per Share
#> 8                                        Interim Dividend - Rs 5 Per Share
#> 9  Face Value Split (Sub-Division) - From Rs 2 Per Share To Rs 1 Per Share
#> 10                       Annual General Meeting/Dividend - Rs 14 Per Share
#>    openPrice highPrice lowPrice      ltp previousPrice netPrice tradedQuantity
#> 1   11850.00  13300.00 11800.00 12960.00      11819.50     9.65         411535
#> 2     216.40    230.00   215.60   225.45        212.65     6.02       37826692
#> 3     982.70   1039.50   974.00  1033.00        974.65     5.99        7881601
#> 4     160.00    170.00   158.80   166.95        158.65     5.23       22037664
#> 5     378.00    402.00   376.00   391.90        375.15     4.46       19485370
#> 6     853.95    884.35   845.10   882.00        848.50     3.95        5774755
#> 7     603.00    622.60   600.55   619.00        595.60     3.93       30742369
#> 8    5174.00   5367.20  5160.05  5351.00       5159.05     3.72         439124
#> 9    1408.00   1445.00  1402.05  1444.00       1394.60     3.54       20077200
#> 10   1395.50   1443.00  1390.05  1442.00       1392.90     3.53        1438521
#>    turnoverInLakhs
#> 1         52464.29
#> 2         84731.79
#> 3         79505.65
#> 4         36714.75
#> 5         76998.39
#> 6         50154.90
#> 7        188410.76
#> 8         23273.40
#> 9        287103.96
#> 10        20410.60
```

### Pre Open Market Data

##### Fetch data of pre open session of Nifty Bank.

``` r
nse_preopen_nifty_bank()
#>        symbol series corp_action_date corp_action  price change percent_change
#> 1     RBLBANK     EQ             <NA>        <NA>  216.4   3.75           1.76
#> 2    AXISBANK     EQ             <NA>        <NA>  603.0   7.40           1.24
#> 3   ICICIBANK     EQ             <NA>        <NA>  474.0   5.75           1.23
#> 4  IDFCFIRSTB     EQ             <NA>        <NA>   37.3   0.45           1.22
#> 5  FEDERALBNK     EQ             <NA>        <NA>   59.0   0.70           1.20
#> 6   KOTAKBANK     EQ             <NA>        <NA> 1896.0  -1.85          -0.10
#> 7    HDFCBANK     EQ             <NA>        <NA> 1408.0  13.40           0.96
#> 8  BANDHANBNK     EQ             <NA>        <NA>  357.0   3.10           0.88
#> 9         PNB     EQ             <NA>        <NA>   30.3   0.25           0.83
#> 10       SBIN     EQ             <NA>        <NA>  240.5   1.80           0.75
#> 11 BANKBARODA     EQ             <NA>        <NA>   47.2   0.30           0.64
#> 12 INDUSINDBK     EQ             <NA>        <NA>  852.0   2.25           0.26
#>    prev_close quantity  value   mkt_cap year_high year_low sum_val sum_quantity
#> 1      212.65    42452  91.87   9844.70    391.20   101.55 2736.25       895603
#> 2      595.60    55386 333.98 147629.54    765.85   286.00 2736.25       895603
#> 3      468.25    80097 379.66 322904.99    552.20   268.30 2736.25       895603
#> 4       36.85   293982 109.66   7733.96     47.95    17.65 2736.25       895603
#> 5       58.30   114555  67.59  11629.78     96.95    35.70 2736.25       895603
#> 6     1897.85    14352 272.11 277961.73   1905.30  1001.00 2736.25       895603
#> 7     1394.60    62708 882.93 606298.22   1423.65   738.75 2736.25       895603
#> 8      353.90    11443  40.85  23935.85    597.00   152.20 2736.25       895603
#> 9       30.05    59988  18.18   3959.05     67.70    26.30 2736.25       895603
#> 10     238.70    83879 201.73  91603.11    351.00   149.45 2736.25       895603
#> 11      46.90    39004  18.41   5634.32    108.25    36.00 2736.25       895603
#> 12     849.75    37476 319.30  48200.79   1596.55   235.55 2736.25       895603
#>    fin_quantity sum_fin_quantity
#> 1         42452           895322
#> 2         55386           895322
#> 3         80097           895322
#> 4        293982           895322
#> 5        114555           895322
#> 6         14352           895322
#> 7         62708           895322
#> 8         11443           895322
#> 9         59988           895322
#> 10        83879           895322
#> 11        39004           895322
#> 12        37476           895322

# retain original column names as returned by NSE
nse_preopen_nifty(clean_names = FALSE)
#>        symbol series        xDt
#> 1    DIVISLAB     EQ 2020-09-04
#> 2    AXISBANK     EQ       <NA>
#> 3   ICICIBANK     EQ       <NA>
#> 4   NESTLEIND     EQ 2020-10-29
#> 5         ITC     EQ       <NA>
#> 6  HEROMOTOCO     EQ       <NA>
#> 7   KOTAKBANK     EQ       <NA>
#> 8   EICHERMOT     EQ       <NA>
#> 9  BAJAJ-AUTO     EQ       <NA>
#> 10   HDFCBANK     EQ       <NA>
#> 11       HDFC     EQ       <NA>
#> 12       BPCL     EQ 2020-09-18
#> 13       GAIL     EQ       <NA>
#> 14   HINDALCO     EQ 2020-09-03
#> 15     MARUTI     EQ       <NA>
#> 16      WIPRO     EQ       <NA>
#> 17  TATASTEEL     EQ       <NA>
#> 18         LT     EQ 2020-11-04
#> 19  COALINDIA     EQ 2020-11-19
#> 20 ADANIPORTS     EQ       <NA>
#> 21       SBIN     EQ       <NA>
#> 22   RELIANCE     EQ       <NA>
#> 23 TATAMOTORS     EQ       <NA>
#> 24       NTPC     EQ 2020-11-12
#> 25        M&M     EQ       <NA>
#> 26   HDFCLIFE     EQ       <NA>
#> 27        IOC     EQ       <NA>
#> 28    HCLTECH     EQ 2020-10-22
#> 29 BAJAJFINSV     EQ       <NA>
#> 30 BAJFINANCE     EQ       <NA>
#> 31      TECHM     EQ 2020-10-29
#> 32  BRITANNIA     EQ       <NA>
#> 33       INFY     EQ 2020-10-23
#> 34    DRREDDY     EQ       <NA>
#> 35        TCS     EQ       <NA>
#> 36        UPL     EQ       <NA>
#> 37   SHREECEM     EQ       <NA>
#> 38   JSWSTEEL     EQ       <NA>
#> 39       ONGC     EQ       <NA>
#> 40 ASIANPAINT     EQ 2020-10-28
#> 41     GRASIM     EQ       <NA>
#> 42      CIPLA     EQ       <NA>
#> 43 INDUSINDBK     EQ       <NA>
#> 44 BHARTIARTL     EQ       <NA>
#> 45 ULTRACEMCO     EQ       <NA>
#> 46  SUNPHARMA     EQ       <NA>
#> 47  POWERGRID     EQ 2020-09-02
#> 48 HINDUNILVR     EQ 2020-10-28
#> 49    SBILIFE     EQ       <NA>
#> 50      TITAN     EQ       <NA>
#>                                                  caAct      iep    chn perChn
#> 1                               ANNUAL GENERAL MEETING  3609.95  63.65   1.79
#> 2                                                 <NA>   603.00   7.40   1.24
#> 3                                                 <NA>   474.00   5.75   1.23
#> 4                  INTERIM DIVIDNED - RS 135 PER SHARE 17750.00 -36.40  -0.20
#> 5                                                 <NA>   190.60  -0.25  -0.13
#> 6                                                 <NA>  3056.00  -3.75  -0.12
#> 7                                                 <NA>  1896.00  -1.85  -0.10
#> 8                                                 <NA>  2596.00  -1.35  -0.05
#> 9                                                 <NA>  3077.00  -0.75  -0.02
#> 10                                                <NA>  1408.00  13.40   0.96
#> 11                                                <NA>  2272.25  21.45   0.95
#> 12                              ANNUAL GENERAL MEETING   398.00   3.55   0.90
#> 13                                                <NA>   101.80   0.90   0.89
#> 14    ANNUAL GENERAL MEETING/DIVIDEND - RE 1 PER SHARE   220.00   1.95   0.89
#> 15                                                <NA>  7050.00  62.25   0.89
#> 16                                                <NA>   359.00   3.15   0.89
#> 17                                                <NA>   547.95   4.85   0.89
#> 18                  SPECIAL DIVIDEND - RS 18 PER SHARE  1135.00   9.15   0.81
#> 19                INTERIM DIVIDEND - RS 7.50 PER SHARE   123.75   1.00   0.81
#> 20                                                <NA>   378.00   2.85   0.76
#> 21                                                <NA>   240.50   1.80   0.75
#> 22                                                <NA>  1964.00  13.30   0.68
#> 23                                                <NA>   171.85   1.15   0.67
#> 24                                            BUY-BACK    94.25   0.60   0.64
#> 25                                                <NA>   710.00   4.55   0.64
#> 26                                                <NA>   665.50   4.20   0.64
#> 27                                                <NA>    87.00   0.55   0.64
#> 28                   INTERIM DIVIDEND - RS 4 PER SHARE   843.90   4.70   0.56
#> 29                                                <NA>  8819.90  45.55   0.52
#> 30                                                <NA>  4835.00  23.55   0.49
#> 31                  SPECIAL DIVIDEND - RS 15 PER SHARE   870.00   4.25   0.49
#> 32                                                <NA>  3575.00  17.60   0.49
#> 33                  INTERIM DIVIDEND - RS 12 PER SHARE  1145.00   5.15   0.45
#> 34                                                <NA>  4850.00  21.25   0.44
#> 35                                                <NA>  2734.40  10.15   0.37
#> 36                                                <NA>   428.00   1.55   0.36
#> 37                                                <NA> 24550.00  84.70   0.35
#> 38                                                <NA>   338.90   1.15   0.34
#> 39                                                <NA>    76.75   0.25   0.33
#> 40                INTERIM DIVIDEND - RS 3.35 PER SHARE  2192.90   6.65   0.30
#> 41                                                <NA>   857.00   2.40   0.28
#> 42                                                <NA>   748.30   2.00   0.27
#> 43                                                <NA>   852.00   2.25   0.26
#> 44                                                <NA>   478.40   1.15   0.24
#> 45                                                <NA>  4900.00  10.50   0.21
#> 46                                                <NA>   513.50   0.65   0.13
#> 47 ANNUAL GENERAL MEETING/DIVIDEND - RS 4.04 PER SHARE   195.00   0.25   0.13
#> 48                  INTERIM DIVIDEND - RS 14 PER SHARE  2132.00   2.60   0.12
#> 49                                                <NA>   831.95   0.35   0.04
#> 50                                                <NA>  1347.60   0.00   0.00
#>        pCls trdQnty    iVal    mktCap    yHigh     yLow  sumVal sumQnty finQnty
#> 1   3546.30    4245  153.24  45188.70  3637.80  1626.00 9848.43 1032626    4245
#> 2    595.60   55386  333.98 147629.54   765.85   286.00 9848.43 1032626   55386
#> 3    468.25   80097  379.66 322904.99   552.20   268.30 9848.43 1032626   80097
#> 4  17786.40     269   47.75  63450.87 18369.95 12200.00 9848.43 1032626     269
#> 5    190.85   47650   90.82 166733.40   250.40   134.60 9848.43 1032626   47650
#> 6   3059.75    6090  186.11  39726.93  3394.90  1475.00 9848.43 1032626    6090
#> 7   1897.85   14352  272.11 277961.73  1905.30  1001.00 9848.43 1032626   14352
#> 8   2597.35    1628   42.26  36192.06  2658.00  1245.01 9848.43 1032626    1628
#> 9   3077.75    1119   34.43  40076.97  3315.15  1788.65 9848.43 1032626    1119
#> 10  1394.60   62708  882.93 606298.22  1423.65   738.75 9848.43 1032626   62708
#> 11  2250.80   40351  916.88 403186.99  2499.90  1473.45 9848.43 1032626   40351
#> 12   394.45   35752  142.29  31659.48   518.45   252.00 9848.43 1032626   35752
#> 13   100.90   56217   57.23  18658.01   133.35    65.00 9848.43 1032626   56217
#> 14   218.05   19019   41.84  31837.15   227.25    84.90 9848.43 1032626   19019
#> 15  6987.75    4487  316.33  92877.84  7569.90  4001.10 9848.43 1032626    4487
#> 16   355.85   46034  165.26  52871.04   381.70   159.40 9848.43 1032626   46034
#> 17   543.10   34657  189.90  40990.36   546.00   250.85 9848.43 1032626   34657
#> 18  1125.85    9544  108.32 137523.74  1389.00   661.00 9848.43 1032626    9544
#> 19   122.75   65854   81.49  25720.15   214.60   109.55 9848.43 1032626   65854
#> 20   375.15    5885   22.25  27439.62   395.20   203.00 9848.43 1032626    5885
#> 21   238.70   83879  201.73  91603.11   351.00   149.45 9848.43 1032626   83879
#> 22  1950.70   73325 1440.10 630680.71  2369.35   866.98 9848.43 1032626   73325
#> 23   170.70   92543  159.04  30582.69   201.70    63.50 9848.43 1032626   92543
#> 24    93.65   61688   58.14  45404.64   125.00    73.20 9848.43 1032626   61688
#> 25   705.45    8660   61.49  67529.78   728.40   245.40 9848.43 1032626    8660
#> 26   661.30    5555   36.97  52080.11   676.10   340.00 9848.43 1032626    5555
#> 27    86.45  118978  103.51  21974.06   133.70    71.15 9848.43 1032626  118978
#> 28   839.20   13096  110.52  91092.31   910.70   375.25 9848.43 1032626   13096
#> 29  8774.35    5226  460.93  53060.40  9950.00  3985.30 9848.43 1032626    5226
#> 30  4811.45   13161  636.33 127570.03  4923.40  1783.00 9848.43 1032626   13161
#> 31   865.75   12764  111.05  53546.44   887.55   471.40 9848.43 1032626   12764
#> 32  3557.40    1220   43.62  41961.51  4010.00  2100.00 9848.43 1032626    1220
#> 33  1139.85   22128  253.37 417536.16  1186.00   509.25 9848.43 1032626   22128
#> 34  4828.75    3694  179.16  58604.68  5512.65  2495.05 9848.43 1032626    3694
#> 35  2724.25   18040  493.29 286228.15  2885.00  1506.05 9848.43 1032626   18040
#> 36   426.45   13514   57.84  23459.56   614.90   240.15 9848.43 1032626   13514
#> 37 24465.30     222   54.50  32660.87 25355.00 15410.00 9848.43 1032626     222
#> 38   337.75    6798   23.04  33473.06   350.50   132.50 9848.43 1032626    6798
#> 39    76.50  124763   95.76  27909.35   134.55    50.00 9848.43 1032626  124763
#> 40  2186.25    2545   55.81  98561.17  2249.00  1431.20 9848.43 1032626    2545
#> 41   854.60    1360   11.66  33735.93   868.90   385.05 9848.43 1032626    1360
#> 42   746.30    9236   69.11  37911.30   829.05   355.30 9848.43 1032626    9236
#> 43   849.75   37476  319.30  48200.79  1596.55   235.55 9848.43 1032626   37476
#> 44   477.25   16350   78.22 114561.25   612.00   361.75 9848.43 1032626   16350
#> 45  4889.50     268   13.13  56449.49  4979.00  2910.00 9848.43 1032626     268
#> 46   512.85    9754   50.09  55372.45   564.75   312.00 9848.43 1032626    9754
#> 47   194.75   24408   47.60  49923.75   211.00   122.15 9848.43 1032626   24408
#> 48  2129.40    4831  103.00 190119.51  2614.30  1757.30 9848.43 1032626    4831
#> 49   831.60    2140   17.80  32433.90  1020.00   519.40 9848.43 1032626    2140
#> 50  1347.60    2765   37.26  56229.89  1375.00   720.90 9848.43 1032626    2765
#>    sumfinQnty
#> 1     1381731
#> 2     1381731
#> 3     1381731
#> 4     1381731
#> 5     1381731
#> 6     1381731
#> 7     1381731
#> 8     1381731
#> 9     1381731
#> 10    1381731
#> 11    1381731
#> 12    1381731
#> 13    1381731
#> 14    1381731
#> 15    1381731
#> 16    1381731
#> 17    1381731
#> 18    1381731
#> 19    1381731
#> 20    1381731
#> 21    1381731
#> 22    1381731
#> 23    1381731
#> 24    1381731
#> 25    1381731
#> 26    1381731
#> 27    1381731
#> 28    1381731
#> 29    1381731
#> 30    1381731
#> 31    1381731
#> 32    1381731
#> 33    1381731
#> 34    1381731
#> 35    1381731
#> 36    1381731
#> 37    1381731
#> 38    1381731
#> 39    1381731
#> 40    1381731
#> 41    1381731
#> 42    1381731
#> 43    1381731
#> 44    1381731
#> 45    1381731
#> 46    1381731
#> 47    1381731
#> 48    1381731
#> 49    1381731
#> 50    1381731
```

### Advances & Declines

``` r
nse_advances_declines()
#>                                     index_name advances declines unchanged
#> 1                                     NIFTY 50       38       12         0
#> 2                                NIFTY NEXT 50       24       26         0
#> 3                                     NIFTY IT        9        1         0
#> 4                                   NIFTY BANK       11        0         1
#> 5                              NIFTY MIDCAP 50       31       18         1
#> 6                                  NIFTY INFRA       13       17         0
#> 7                                 NIFTY REALTY        8        2         0
#> 8                                 NIFTY ENERGY        5        5         0
#> 9                                   NIFTY FMCG        6        9         0
#> 10                                   NIFTY MNC       16       14         0
#> 11                                NIFTY PHARMA        8        2         0
#> 12                                   NIFTY PSE       11        9         0
#> 13                              NIFTY PSU BANK       10        1         1
#> 14                           NIFTY SERV SECTOR       23        7         0
#> 15                           NIFTY COMMODITIES       17       13         0
#> 16                           NIFTY CONSUMPTION       15       15         0
#> 17                           NIFTY FIN SERVICE       16        4         0
#> 18                                  NIFTY AUTO        9        6         0
#> 19                           NIFTY DIV OPPS 50       33       17         0
#> 20                                 NIFTY MEDIA        5        4         1
#> 21                                 NIFTY METAL        8        7         0
#> 22                             NIFTY100 LIQ 15       10        5         0
#> 23                                  NIFTY CPSE        9        3         0
#> 24                           NIFTY GROWSECT 15       11        4         0
#> 25                            NIFTY50 VALUE 20       16        4         0
#> 26                           NIFTY100 QUALTY30       19       11         0
#> 27                              NIFTY PVT BANK        9        0         1
#> 28                            NIFTY MID LIQ 15       10        5         0
#> 29                                   NIFTY 100       62       38         0
#> 30                                   NIFTY 200      127       72         1
#> 31                                   NIFTY 500      317      178         6
#> 32                            NIFTY MIDCAP 100       65       34         1
#> 33                            NIFTY SMLCAP 100       62       36         2
#> 34                    NIFTY ADITYA BIRLA GROUP        3        4         0
#> 35                              NIFTY ALPHA 50       28       22         0
#> 36                          NIFTY HIGH BETA 50       33       16         1
#> 37                     NIFTY LOW VOLATILITY 50       30       20         0
#> 38                        NIFTY MAHINDRA GROUP        6        3         0
#> 39                            NIFTY MIDCAP 150      103       46         1
#> 40                       NIFTY MIDSMALLCAP 400      254      140         6
#> 41                            NIFTY SHARIAH 25       14       11         0
#> 42                          NIFTY SMALLCAP 250      151       94         5
#> 43                           NIFTY SMALLCAP 50       35       14         1
#> 44                            NIFTY TATA GROUP       17        8         0
#> 45                    NIFTY TATA GROUP 25% CAP        8        2         0
#> 46                            NIFTY100 EQL WGT       62       38         0
#> 47                           NIFTY100 LOWVOL30       22        8         0
#> 48                             NIFTY50 SHARIAH       13        5         0
#> 49                            NIFTY500 SHARIAH      134       76         0
#> 50                             NIFTY50 EQL WGT       38       12         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       19       11         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       19       11         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30       18       12         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30       21        9         0
#> 55                            NIFTY SME EMERGE       15       24        50
#> 56                       NIFTY LARGEMIDCAP 250      165       84         1
#> 57                           NIFTY500 VALUE 50       31       19         0
#> 58                            NIFTY MIDCAP 150      103       46         1
#> 59                             NIFTY SMLCAP 50       35       14         1
#> 60                            NIFTY SMLCAP 250      151       94         5
#> 61                            NIFTY MIDSML 400      254      140         6
#> 62                           NIFTY200 QUALTY30       19       11         0
#> 63                           NIFTY FINSRV25 50       16        4         0
#> 64                          CNX NIFTY Pre Open       43        6         1

# retain original column names as returned by NSE
nse_advances_declines(clean_names = FALSE)
#>                                        skipped advances declines unchanged
#> 1                                     NIFTY 50       38       12         0
#> 2                                NIFTY NEXT 50       24       26         0
#> 3                                     NIFTY IT        9        1         0
#> 4                                   NIFTY BANK       11        0         1
#> 5                              NIFTY MIDCAP 50       31       18         1
#> 6                                  NIFTY INFRA       13       17         0
#> 7                                 NIFTY REALTY        8        2         0
#> 8                                 NIFTY ENERGY        5        5         0
#> 9                                   NIFTY FMCG        6        9         0
#> 10                                   NIFTY MNC       16       14         0
#> 11                                NIFTY PHARMA        8        2         0
#> 12                                   NIFTY PSE       11        9         0
#> 13                              NIFTY PSU BANK       10        1         1
#> 14                           NIFTY SERV SECTOR       23        7         0
#> 15                           NIFTY COMMODITIES       17       13         0
#> 16                           NIFTY CONSUMPTION       15       15         0
#> 17                           NIFTY FIN SERVICE       16        4         0
#> 18                                  NIFTY AUTO        9        6         0
#> 19                           NIFTY DIV OPPS 50       33       17         0
#> 20                                 NIFTY MEDIA        5        4         1
#> 21                                 NIFTY METAL        8        7         0
#> 22                             NIFTY100 LIQ 15       10        5         0
#> 23                                  NIFTY CPSE        9        3         0
#> 24                           NIFTY GROWSECT 15       11        4         0
#> 25                            NIFTY50 VALUE 20       16        4         0
#> 26                           NIFTY100 QUALTY30       19       11         0
#> 27                              NIFTY PVT BANK        9        0         1
#> 28                            NIFTY MID LIQ 15       10        5         0
#> 29                                   NIFTY 100       62       38         0
#> 30                                   NIFTY 200      127       72         1
#> 31                                   NIFTY 500      317      178         6
#> 32                            NIFTY MIDCAP 100       65       34         1
#> 33                            NIFTY SMLCAP 100       62       36         2
#> 34                    NIFTY ADITYA BIRLA GROUP        3        4         0
#> 35                              NIFTY ALPHA 50       28       22         0
#> 36                          NIFTY HIGH BETA 50       33       16         1
#> 37                     NIFTY LOW VOLATILITY 50       30       20         0
#> 38                        NIFTY MAHINDRA GROUP        6        3         0
#> 39                            NIFTY MIDCAP 150      103       46         1
#> 40                       NIFTY MIDSMALLCAP 400      254      140         6
#> 41                            NIFTY SHARIAH 25       14       11         0
#> 42                          NIFTY SMALLCAP 250      151       94         5
#> 43                           NIFTY SMALLCAP 50       35       14         1
#> 44                            NIFTY TATA GROUP       17        8         0
#> 45                    NIFTY TATA GROUP 25% CAP        8        2         0
#> 46                            NIFTY100 EQL WGT       62       38         0
#> 47                           NIFTY100 LOWVOL30       22        8         0
#> 48                             NIFTY50 SHARIAH       13        5         0
#> 49                            NIFTY500 SHARIAH      134       76         0
#> 50                             NIFTY50 EQL WGT       38       12         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       19       11         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       19       11         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30       18       12         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30       21        9         0
#> 55                            NIFTY SME EMERGE       15       24        50
#> 56                       NIFTY LARGEMIDCAP 250      165       84         1
#> 57                           NIFTY500 VALUE 50       31       19         0
#> 58                            NIFTY MIDCAP 150      103       46         1
#> 59                             NIFTY SMLCAP 50       35       14         1
#> 60                            NIFTY SMLCAP 250      151       94         5
#> 61                            NIFTY MIDSML 400      254      140         6
#> 62                           NIFTY200 QUALTY30       19       11         0
#> 63                           NIFTY FINSRV25 50       16        4         0
#> 64                          CNX NIFTY Pre Open       43        6         1
```

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
