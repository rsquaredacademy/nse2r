
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
#>           index_name last_traded_price  change percent_change
#> 1  NIFTY 50 Pre Open          13130.00   74.85           0.57
#> 2           NIFTY 50          13024.95  -30.20          -0.23
#> 3      NIFTY NEXT 50          30175.30 -201.85          -0.66
#> 4    NIFTY100 LIQ 15           3159.95   -0.85          -0.03
#> 5         NIFTY BANK          29744.10    6.85           0.02
#> 6          INDIA VIX             22.85    1.79           8.51
#> 7          NIFTY 100          13120.45  -37.85          -0.29
#> 8          NIFTY 500          10700.15  -33.45          -0.31
#> 9   NIFTY MIDCAP 100          19254.95  -97.30          -0.50
#> 10   NIFTY MIDCAP 50           5417.55    7.00           0.13
#> 11       NIFTY INFRA           3446.65    0.65           0.02
#> 12      NIFTY REALTY            255.55   -2.75          -1.06
#> 13      NIFTY ENERGY          16532.80   72.25           0.44
#> 14        NIFTY FMCG          31651.15 -181.05          -0.57
#> 15         NIFTY MNC          14830.60  -70.95          -0.48
#> 16      NIFTY PHARMA          11756.50 -124.30          -1.05
#> 17         NIFTY PSE           2618.20   36.25           1.40
#> 18    NIFTY PSU BANK           1551.10   68.00           4.58
#> 19 NIFTY SERV SECTOR          18240.60  -48.80          -0.27
#> 20          NIFTY IT          21862.40 -201.90          -0.92
#> 21  NIFTY SMLCAP 100           6364.65  -15.35          -0.24
#> 22         NIFTY 200           6727.85  -21.05          -0.31
#> 23        NIFTY AUTO           8847.05  -40.90          -0.46
#> 24       NIFTY MEDIA           1486.90    8.90           0.60
#> 25       NIFTY METAL           2863.60   24.45           0.86
#> 26 NIFTY DIV OPPS 50           2650.65    3.60           0.14
#> 27 NIFTY COMMODITIES           3604.40   -3.10          -0.09
#> 28 NIFTY CONSUMPTION           5377.40  -45.55          -0.84
#> 29        NIFTY CPSE           1519.85   32.60           2.19
#> 30 NIFTY FIN SERVICE          14246.35  -28.90          -0.20
#> 31 NIFTY GROWSECT 15           6526.25  -31.65          -0.48
#> 32  NIFTY50 VALUE 20           6261.40  -11.10          -0.18
#> 33 NIFTY50 TR 2X LEV           7032.20  -32.85          -0.46
#> 34 NIFTY50 PR 2X LEV           5295.20  -25.00          -0.47
#> 35 NIFTY50 TR 1X INV            292.75    0.70           0.24
#> 36 NIFTY50 PR 1X INV            337.15    0.80           0.24
#> 37    NIFTY ALPHA 50          18718.00 -301.50          -1.59
#> 38   NIFTY50 EQL WGT          13535.50   12.75           0.09
#> 39  NIFTY100 EQL WGT          14392.20  -10.90          -0.08
#> 40 NIFTY100 LOWVOL30          10162.55  -52.55          -0.51
#> 41  NIFTY MID LIQ 15           4760.05    1.60           0.03
#> 42    NIFTY PVT BANK          16530.70  -12.25          -0.07
#> 43 NIFTY100 QUALTY30           3027.40  -21.60          -0.71
#> 44   NIFTY GS 8 13YR           2245.34    1.11           0.04
#> 45     NIFTY GS 10YR           2025.31    0.52           0.02
#> 46 NIFTY GS 10YR CLN            969.84    0.09           0.01
#> 47    NIFTY GS 4 8YR           2394.15    2.80           0.11
#> 48  NIFTY GS 11 15YR           2430.22    2.85           0.11
#> 49 NIFTY GS 15YRPLUS           2643.03    3.17           0.12
#> 50 NIFTY GS COMPSITE           2291.81    1.70           0.07
#> 51  NIFTY MIDCAP 150           7302.50  -37.50          -0.51
#> 52   NIFTY SMLCAP 50           3140.70   -5.95          -0.19
#> 53  NIFTY SMLCAP 250           5464.50  -11.35          -0.21
#> 54  NIFTY MIDSML 400           6643.65  -27.90          -0.42
#> 55 NIFTY200 QUALTY30          11135.15  -76.00          -0.68

# retain original column names as returned by NSE
nse_index_quote(clean_names = FALSE)
#>              skipped lastPrice  change pChange
#> 1  NIFTY 50 Pre Open  13130.00   74.85    0.57
#> 2           NIFTY 50  13024.95  -30.20   -0.23
#> 3      NIFTY NEXT 50  30175.30 -201.85   -0.66
#> 4    NIFTY100 LIQ 15   3159.95   -0.85   -0.03
#> 5         NIFTY BANK  29744.10    6.85    0.02
#> 6          INDIA VIX     22.85    1.79    8.51
#> 7          NIFTY 100  13120.45  -37.85   -0.29
#> 8          NIFTY 500  10700.15  -33.45   -0.31
#> 9   NIFTY MIDCAP 100  19254.95  -97.30   -0.50
#> 10   NIFTY MIDCAP 50   5417.55    7.00    0.13
#> 11       NIFTY INFRA   3446.65    0.65    0.02
#> 12      NIFTY REALTY    255.55   -2.75   -1.06
#> 13      NIFTY ENERGY  16532.80   72.25    0.44
#> 14        NIFTY FMCG  31651.15 -181.05   -0.57
#> 15         NIFTY MNC  14830.60  -70.95   -0.48
#> 16      NIFTY PHARMA  11756.50 -124.30   -1.05
#> 17         NIFTY PSE   2618.20   36.25    1.40
#> 18    NIFTY PSU BANK   1551.10   68.00    4.58
#> 19 NIFTY SERV SECTOR  18240.60  -48.80   -0.27
#> 20          NIFTY IT  21862.40 -201.90   -0.92
#> 21  NIFTY SMLCAP 100   6364.65  -15.35   -0.24
#> 22         NIFTY 200   6727.85  -21.05   -0.31
#> 23        NIFTY AUTO   8847.05  -40.90   -0.46
#> 24       NIFTY MEDIA   1486.90    8.90    0.60
#> 25       NIFTY METAL   2863.60   24.45    0.86
#> 26 NIFTY DIV OPPS 50   2650.65    3.60    0.14
#> 27 NIFTY COMMODITIES   3604.40   -3.10   -0.09
#> 28 NIFTY CONSUMPTION   5377.40  -45.55   -0.84
#> 29        NIFTY CPSE   1519.85   32.60    2.19
#> 30 NIFTY FIN SERVICE  14246.35  -28.90   -0.20
#> 31 NIFTY GROWSECT 15   6526.25  -31.65   -0.48
#> 32  NIFTY50 VALUE 20   6261.40  -11.10   -0.18
#> 33 NIFTY50 TR 2X LEV   7032.20  -32.85   -0.46
#> 34 NIFTY50 PR 2X LEV   5295.20  -25.00   -0.47
#> 35 NIFTY50 TR 1X INV    292.75    0.70    0.24
#> 36 NIFTY50 PR 1X INV    337.15    0.80    0.24
#> 37    NIFTY ALPHA 50  18718.00 -301.50   -1.59
#> 38   NIFTY50 EQL WGT  13535.50   12.75    0.09
#> 39  NIFTY100 EQL WGT  14392.20  -10.90   -0.08
#> 40 NIFTY100 LOWVOL30  10162.55  -52.55   -0.51
#> 41  NIFTY MID LIQ 15   4760.05    1.60    0.03
#> 42    NIFTY PVT BANK  16530.70  -12.25   -0.07
#> 43 NIFTY100 QUALTY30   3027.40  -21.60   -0.71
#> 44   NIFTY GS 8 13YR   2245.34    1.11    0.04
#> 45     NIFTY GS 10YR   2025.31    0.52    0.02
#> 46 NIFTY GS 10YR CLN    969.84    0.09    0.01
#> 47    NIFTY GS 4 8YR   2394.15    2.80    0.11
#> 48  NIFTY GS 11 15YR   2430.22    2.85    0.11
#> 49 NIFTY GS 15YRPLUS   2643.03    3.17    0.12
#> 50 NIFTY GS COMPSITE   2291.81    1.70    0.07
#> 51  NIFTY MIDCAP 150   7302.50  -37.50   -0.51
#> 52   NIFTY SMLCAP 50   3140.70   -5.95   -0.19
#> 53  NIFTY SMLCAP 250   5464.50  -11.35   -0.21
#> 54  NIFTY MIDSML 400   6643.65  -27.90   -0.42
#> 55 NIFTY200 QUALTY30  11135.15  -76.00   -0.68
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#>        symbol series last_corp_announcement_date
#> 1        ONGC     EQ                  2020-03-23
#> 2        GAIL     EQ                  2020-02-17
#> 3  ADANIPORTS     EQ                  2020-06-17
#> 4   COALINDIA     EQ                  2020-11-19
#> 5  INDUSINDBK     EQ                  2019-08-08
#> 6     SBILIFE     EQ                  2019-04-03
#> 7    HDFCLIFE     EQ                  2019-07-11
#> 8        SBIN     EQ                  2018-06-15
#> 9  TATAMOTORS     EQ                  2016-07-18
#> 10  POWERGRID     EQ                  2020-09-02
#>                                            last_corp_announcement open_price
#> 1                               Interim Dividend - Rs 5 Per Share      77.20
#> 2                             Interim Dividend - Rs 6.4 Per Share     101.35
#> 3                                          Annual General Meeting     396.30
#> 4                            Interim Dividend - Rs 7.50 Per Share     123.95
#> 5             Annual General Meeting/Dividend - Rs 7.50 Per Share     863.60
#> 6                               Interim Dividend - Rs 2 Per Share     846.05
#> 7                                          Annual General Meeting     672.45
#> 8  Annual General Meeting/ Change In Registrar And Transfer Agent     245.45
#> 9                                  Dividend - Re 0.20/- Per Share     175.00
#> 10            Annual General Meeting/Dividend - Rs 4.04 Per Share     194.50
#>    high_price low_price last_traded_price prev_close_price percent_change
#> 1       80.95     77.15             80.85            76.10           6.24
#> 2      103.70    100.50            103.45           100.30           3.14
#> 3      404.70    384.40            402.85           392.25           2.70
#> 4      126.75    123.25            126.10           123.25           2.31
#> 5      871.60    845.25            871.40           853.70           2.07
#> 6      864.65    844.00            854.85           838.95           1.90
#> 7      688.50    667.05            676.65           664.15           1.88
#> 8      249.30    243.20            248.15           243.85           1.76
#> 9      176.80    172.00            174.35           172.05           1.34
#> 10     197.45    194.05            197.00           194.50           1.29
#>    traded_quantity turnover_in_lakhs
#> 1         59720637          47519.71
#> 2         16843371          17198.77
#> 3         12901681          50966.80
#> 4         16500365          20587.51
#> 5         14205098         121987.70
#> 6          1764711          15085.28
#> 7          5192368          35255.14
#> 8         47976325         118218.46
#> 9         38940971          67913.05
#> 10         7694885          15073.51

# retain original column names as returned by NSE
nse_stock_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1        ONGC     EQ               2020-03-23
#> 2        GAIL     EQ               2020-02-17
#> 3  ADANIPORTS     EQ               2020-06-17
#> 4   COALINDIA     EQ               2020-11-19
#> 5  INDUSINDBK     EQ               2019-08-08
#> 6     SBILIFE     EQ               2019-04-03
#> 7    HDFCLIFE     EQ               2019-07-11
#> 8        SBIN     EQ               2018-06-15
#> 9  TATAMOTORS     EQ               2016-07-18
#> 10  POWERGRID     EQ               2020-09-02
#>                                              lastCorpAnnouncement openPrice
#> 1                               Interim Dividend - Rs 5 Per Share     77.20
#> 2                             Interim Dividend - Rs 6.4 Per Share    101.35
#> 3                                          Annual General Meeting    396.30
#> 4                            Interim Dividend - Rs 7.50 Per Share    123.95
#> 5             Annual General Meeting/Dividend - Rs 7.50 Per Share    863.60
#> 6                               Interim Dividend - Rs 2 Per Share    846.05
#> 7                                          Annual General Meeting    672.45
#> 8  Annual General Meeting/ Change In Registrar And Transfer Agent    245.45
#> 9                                  Dividend - Re 0.20/- Per Share    175.00
#> 10            Annual General Meeting/Dividend - Rs 4.04 Per Share    194.50
#>    highPrice lowPrice    ltp previousPrice netPrice tradedQuantity
#> 1      80.95    77.15  80.85         76.10     6.24       59720637
#> 2     103.70   100.50 103.45        100.30     3.14       16843371
#> 3     404.70   384.40 402.85        392.25     2.70       12901681
#> 4     126.75   123.25 126.10        123.25     2.31       16500365
#> 5     871.60   845.25 871.40        853.70     2.07       14205098
#> 6     864.65   844.00 854.85        838.95     1.90        1764711
#> 7     688.50   667.05 676.65        664.15     1.88        5192368
#> 8     249.30   243.20 248.15        243.85     1.76       47976325
#> 9     176.80   172.00 174.35        172.05     1.34       38940971
#> 10    197.45   194.05 197.00        194.50     1.29        7694885
#>    turnoverInLakhs
#> 1         47519.71
#> 2         17198.77
#> 3         50966.80
#> 4         20587.51
#> 5        121987.70
#> 6         15085.28
#> 7         35255.14
#> 8        118218.46
#> 9         67913.05
#> 10        15073.51
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#>        symbol
#> 1       AARON
#> 2  ADANIPORTS
#> 3  AMARAJABAT
#> 4   ASHIMASYN
#> 5        BEPL
#> 6  BIOFILCHEM
#> 7    BLISSGVS
#> 8        CAMS
#> 9     CGPOWER
#> 10 CHAMBLFERT
#> 11   CHOLAFIN
#> 12       DHFL
#> 13  EICHERMOT
#> 14        EKC
#> 15   EMAMILTD
#> 16  GINNIFILA
#> 17      GLAND
#> 18       GPIL
#> 19   GRANULES
#> 20     GRASIM
#> 21  GUJGASLTD
#> 22   HBANKETF
#> 23        HCG
#> 24   HDFCBANK
#> 25   HDFCLIFE
#> 26   HINDALCO
#> 27  ICICIMCAP
#> 28 ICICINIFTY
#> 29  ICICINV20
#> 30    IFBAGRO
#> 31 INDSWFTLAB
#> 32  INTELLECT
#> 33  INVENTURE
#> 34        IVP
#> 35 IVZINNIFTY
#> 36 JINDALSTEL
#> 37      JSWHL
#> 38 KELLTONTEC
#> 39 KEYFINSERV
#> 40   KRISHANA
#> 41       LASA
#> 42       M100
#> 43    MAANALU
#> 44   MAESGETF
#> 45    MAJESCO
#> 46   MAN50ETF
#> 47     NAUKRI
#> 48 ORCHPHARMA
#> 49  PALREDTEC
#> 50  PANAMAPET
#> 51 PILANIINVS
#> 52 PLASTIBLEN
#> 53     PRECOT
#> 54 PREMIERPOL
#> 55      PURVA
#> 56   RELIGARE
#> 57       ROML
#> 58   SBIETFPB
#> 59 SBIETFQLTY
#> 60    SKIPPER
#> 61 SOMANYCERA
#> 62       SPYL
#> 63 SUNDARMFIN
#> 64   SUPPETRO
#> 65      TANLA
#> 66   TATACOMM
#> 67  TATAPOWER
#> 68  TATASTEEL
#> 69 TATASTLBSL
#> 70      TOTAL
#> 71 TPLPLASTEH
#> 72   TREJHARA
#> 73     TRIGYN
#> 74     UTIAMC
#> 75  UTINEXT50
#> 76 VAIBHAVGBL
#> 77   VIDEOIND
#> 78       VSSL
#>                                                               symbol_desc
#> 1                                                Aaron Industries Limited
#> 2                           Adani Ports and Special Economic Zone Limited
#> 3                                            Amara Raja Batteries Limited
#> 4                                                          Ashima Limited
#> 5                                   Bhansali Engineering Polymers Limited
#> 6                              Biofil Chemicals & Pharmaceuticals Limited
#> 7                                                Bliss GVS Pharma Limited
#> 8                                Computer Age Management Services Limited
#> 9                               CG Power and Industrial Solutions Limited
#> 10                                Chambal Fertilizers & Chemicals Limited
#> 11                   Cholamandalam Investment and Finance Company Limited
#> 12                              Dewan Housing Finance Corporation Limited
#> 13                                                  Eicher Motors Limited
#> 14                                         Everest Kanto Cylinder Limited
#> 15                                                          Emami Limited
#> 16                                                Ginni Filaments Limited
#> 17                                                   Gland Pharma Limited
#> 18                                       Godawari Power And Ispat limited
#> 19                                                 Granules India Limited
#> 20                                              Grasim Industries Limited
#> 21                                                    Gujarat Gas Limited
#> 22                                    HDFC Mutual Fund - HDFC Banking ETF
#> 23                                  Healthcare Global Enterprises Limited
#> 24                                                      HDFC Bank Limited
#> 25                                    HDFC Life Insurance Company Limited
#> 26                                            Hindalco Industries Limited
#> 27                                     ICICI Prudential Midcap Select ETF
#> 28                                             ICICI Prudential Nifty ETF
#> 29                                              ICICI Prudential NV20 ETF
#> 30                                            IFB Agro Industries Limited
#> 31                                         Ind-Swift Laboratories Limited
#> 32                                         Intellect Design Arena Limited
#> 33                                  Inventure Growth & Securities Limited
#> 34                                                            IVP Limited
#> 35                               Invesco India Nifty Exchange Traded Fund
#> 36                                           Jindal Steel & Power Limited
#> 37                                                   JSW Holdings Limited
#> 38                                         Kellton Tech Solutions Limited
#> 39                                     Keynote Financial Services Limited
#> 40                                              Krishana Phoschem Limited
#> 41                                             Lasa Supergenerics Limited
#> 42      Motilal Oswal Mutual Fund - Motilal Oswal MOSt Shares M100 ETF GO
#> 43                                                 Maan Aluminium Limited
#> 44            Mirae Asset Mutual Fund -Mirae Asset ESG Sector Leaders ETF
#> 45                                                        Majesco Limited
#> 46                     Mirae Asset Mutual Fund - Mirae Asset Nifty 50 ETF
#> 47                                              Info Edge (India) Limited
#> 48                                                  Orchid Pharma Limited
#> 49                                            Palred Technologies Limited
#> 50                                               Panama Petrochem Limited
#> 51                   Pilani Investment and Industries Corporation Limited
#> 52                                             Plastiblends India Limited
#> 53                                                Precot Meridian Limited
#> 54                                               Premier Polyfilm Limited
#> 55                                                    Puravankara Limited
#> 56                                           Religare Enterprises Limited
#> 57                                                  Raj Oil Mills Limited
#> 58          SBI Mutual Fund - SBI ETF Private Bank - SBI ETF Private Bank
#> 59                  SBI Mutual Fund - SBI - ETF Quality - SBI-ETF Quality
#> 60                                                        Skipper Limited
#> 61                                                Somany Ceramics Limited
#> 62                                           Shekhawati Poly-Yarn Limited
#> 63                                               Sundaram Finance Limited
#> 64                                              Supreme Petrochem Limited
#> 65                                                Tanla Platforms Limited
#> 66                                            Tata Communications Limited
#> 67                                             Tata Power Company Limited
#> 68                                                     Tata Steel Limited
#> 69                                                 Tata Steel Bsl Limited
#> 70                                        Total Transport Systems Limited
#> 71                                                   TPL Plastech Limited
#> 72                                             TREJHARA SOLUTIONS LIMITED
#> 73                                            Trigyn Technologies Limited
#> 74                                   UTI Asset Management Company Limited
#> 75 UTI Mutual Fund - UTI NIfty Next 50 Exchange Traded Fund - UTI NIFTY N
#> 76                                                 Vaibhav Global Limited
#> 77                                            Videocon Industries Limited
#> 78                                        Vardhman Special Steels Limited
#>          date new_high    year last_traded_price prev_high prev_close change
#> 1  2020-11-24    61.70   61.70             61.70     56.10      56.10   5.60
#> 2  2020-11-24   404.70  404.70            402.85    402.00     392.25  10.60
#> 3  2020-11-24   899.00  899.00            890.40    895.00     891.25  -0.85
#> 4  2020-11-24    10.35   10.35             10.00      9.90       9.90   0.10
#> 5  2020-11-24   127.60  127.60            124.00    120.40     118.10   5.90
#> 6  2020-11-24   198.45  198.45            198.45    189.00     189.00   9.45
#> 7  2020-10-06   181.60  181.60            169.00    181.60     161.80   7.20
#> 8  2020-10-05  1498.70 1498.70           1483.45   1489.00    1438.45  45.00
#> 9  2020-11-17    39.65   39.65             39.65     39.50      37.80   1.85
#> 10 2020-11-24   194.00  194.00            192.70    192.25     187.35   5.35
#> 11 2020-11-24   366.90  366.90            363.30    363.85     360.20   3.10
#> 12 2020-11-24    24.60   24.60             24.60     23.45      23.45   1.15
#> 13 2020-11-24  2727.00 2727.00           2615.30   2715.00    2693.30 -78.00
#> 14 2020-11-24    45.35   45.35             43.70     43.20      43.20   0.50
#> 15 2020-09-15   422.65  422.65            420.40    407.55     403.80  16.60
#> 16 2020-11-24    18.55   18.55             18.40     17.70      17.70   0.70
#> 17 2020-11-23  2222.00 2222.00           2131.65   2183.45    2048.50  83.15
#> 18 2020-11-18   410.00  410.00            396.65    406.10     390.50   6.15
#> 19 2020-11-24   425.00  425.00            419.05    420.00     418.65   0.40
#> 20 2020-11-23   873.80  873.80            856.00    868.90     853.25   2.75
#> 21 2020-11-24   345.55  345.55            338.55    339.50     334.05   4.50
#> 22 2020-11-19   300.00  300.00            294.46    297.00     295.32  -0.86
#> 23 2020-11-24   144.90  144.90            143.10    144.90     143.75  -0.65
#> 24 2020-11-24  1464.40 1464.40           1429.20   1445.00    1438.20  -9.00
#> 25 2020-11-18   688.50  688.50            676.65    676.10     664.15  12.50
#> 26 2020-11-24   230.00  230.00            226.00    227.25     226.00   0.00
#> 27 2020-11-14    81.90   81.90             72.00     76.10      72.49  -0.49
#> 28 2020-11-14   156.20  156.20            138.35    154.90     138.20   0.15
#> 29 2020-11-24    70.00   70.00             65.24     67.00      65.33  -0.09
#> 30 2020-01-03   524.70  524.70            496.00    477.70     469.50  26.50
#> 31 2020-11-24    72.90   72.90             67.35     71.85      70.85  -3.50
#> 32 2020-11-24   270.00  270.00            266.85    270.00     265.70   1.15
#> 33 2020-11-23    22.75   22.75             21.40     22.10      21.50  -0.10
#> 34 2020-11-24    74.20   74.20             67.20     70.70      70.70  -3.50
#> 35 2020-11-18  1648.00 1648.00           1406.50   1545.80    1405.00   1.50
#> 36 2020-11-23   248.00  248.00            240.80    245.80     240.95  -0.15
#> 37 2020-11-24  3499.00 3499.00           3413.50   3485.45    3451.65 -38.15
#> 38 2020-11-24    55.40   55.40             52.95     55.20      54.10  -1.15
#> 39 2020-11-24   111.55  111.55            111.50    106.25     106.25   5.25
#> 40 2020-11-24    83.00   83.00             80.95     79.25      79.25   1.70
#> 41 2020-11-24    88.50   88.50             84.40     84.40      81.35   3.05
#> 42 2020-11-23    21.98   21.98             20.02     20.88      20.13  -0.11
#> 43 2020-08-28    83.05   83.05             80.90     80.20      78.35   2.55
#> 44 2020-11-24    23.00   23.00             22.43     22.60      22.54   0.06
#> 45 2020-11-23   971.40  971.40            947.60    952.00     939.90   7.70
#> 46 2020-11-14   134.01  134.01            132.99    134.00     132.91   0.08
#> 47 2020-11-24  4091.00 4091.00           4023.30   4089.95    4047.90 -24.60
#> 48 2020-11-24    38.60   38.60             38.60     36.80      36.80   1.80
#> 49 2020-11-24    39.20   39.20             39.20     37.90      37.35   1.85
#> 50 2020-11-24    84.25   84.25             80.60     78.25      76.30   4.30
#> 51 2020-11-24  2239.95 2239.95           2159.65   2222.00    2202.90 -43.25
#> 52 2020-11-24   264.80  264.80            254.45    257.85     252.20   2.25
#> 53 2020-11-24    62.45   62.45             56.55     59.50      59.50  -2.95
#> 54 2020-11-24    35.20   35.20             33.80     33.70      33.05   0.75
#> 55 2020-01-29    74.50   74.50             72.60     71.40      67.70   4.90
#> 56 2020-10-23    57.60   57.60             55.90     55.20      52.25   3.65
#> 57 2020-11-24    15.30   15.30             15.30     14.60      14.60   0.70
#> 58 2020-11-24   167.80  167.80            162.35    165.00     164.71  -2.36
#> 59 2020-11-17   116.90  116.90            113.31    115.45     114.60  -1.29
#> 60 2020-11-19    57.50   57.50             56.20     57.50      53.45   2.75
#> 61 2020-11-23   272.00  272.00            270.50    269.30     261.50   9.00
#> 62 2020-11-24     0.50    0.50              0.50      0.45       0.45   0.05
#> 63 2020-11-24  1834.00 1834.00           1784.40   1805.90    1795.20 -10.80
#> 64 2020-11-23   332.80  332.80            325.00    328.00     323.10   1.90
#> 65 2020-11-24   555.90  555.90            548.75    529.45     529.45  19.30
#> 66 2020-11-10  1104.75 1104.75           1025.95   1064.05    1052.15 -26.20
#> 67 2020-08-21    63.90   63.90             63.35     63.40      59.95   3.40
#> 68 2020-11-24   558.65  558.65            550.90    550.45     548.30   2.60
#> 69 2020-11-24    34.00   34.00             33.50     33.50      33.30   0.20
#> 70 2020-11-24    59.80   59.80             56.00     57.15      57.10  -1.10
#> 71 2020-08-26   147.90  147.90            146.05    147.90     130.80  15.25
#> 72 2020-11-24    30.70   30.70             30.70     29.25      29.25   1.45
#> 73 2020-11-24    72.20   72.20             65.65     69.10      69.10  -3.45
#> 74 2020-11-24   561.05  561.05            548.15    550.00     546.20   1.95
#> 75 2020-11-24   320.00  320.00            311.40    317.69     312.00  -0.60
#> 76 2020-11-24  2155.00 2155.00           2114.50   2155.00    2140.30 -25.80
#> 77 2020-11-24     5.50    5.50              5.50      5.25       5.25   0.25
#> 78 2020-11-24    98.55   98.55             98.55     95.45      93.90   4.65
#>    percent_change
#> 1            9.98
#> 2            2.70
#> 3           -0.10
#> 4            1.01
#> 5            5.00
#> 6            5.00
#> 7            4.45
#> 8            3.13
#> 9            4.89
#> 10           2.86
#> 11           0.86
#> 12           4.90
#> 13          -2.90
#> 14           1.16
#> 15           4.11
#> 16           3.95
#> 17           4.06
#> 18           1.57
#> 19           0.10
#> 20           0.32
#> 21           1.35
#> 22          -0.29
#> 23          -0.45
#> 24          -0.63
#> 25           1.88
#> 26           0.00
#> 27          -0.68
#> 28           0.11
#> 29          -0.14
#> 30           5.64
#> 31          -4.94
#> 32           0.43
#> 33          -0.47
#> 34          -4.95
#> 35           0.11
#> 36          -0.06
#> 37          -1.11
#> 38          -2.13
#> 39           4.94
#> 40           2.15
#> 41           3.75
#> 42          -0.55
#> 43           3.25
#> 44           0.27
#> 45           0.82
#> 46           0.06
#> 47          -0.61
#> 48           4.89
#> 49           4.95
#> 50           5.64
#> 51          -1.96
#> 52           0.89
#> 53          -4.96
#> 54           2.27
#> 55           7.24
#> 56           6.99
#> 57           4.79
#> 58          -1.43
#> 59          -1.13
#> 60           5.14
#> 61           3.44
#> 62          11.11
#> 63          -0.60
#> 64           0.59
#> 65           3.65
#> 66          -2.49
#> 67           5.67
#> 68           0.47
#> 69           0.60
#> 70          -1.93
#> 71          11.66
#> 72           4.96
#> 73          -4.99
#> 74           0.36
#> 75          -0.19
#> 76          -1.21
#> 77           4.76
#> 78           4.95

# retain original column names as returned by NSE
nse_stock_year_high(clean_names = FALSE)
#>        symbol
#> 1       AARON
#> 2  ADANIPORTS
#> 3  AMARAJABAT
#> 4   ASHIMASYN
#> 5        BEPL
#> 6  BIOFILCHEM
#> 7    BLISSGVS
#> 8        CAMS
#> 9     CGPOWER
#> 10 CHAMBLFERT
#> 11   CHOLAFIN
#> 12       DHFL
#> 13  EICHERMOT
#> 14        EKC
#> 15   EMAMILTD
#> 16  GINNIFILA
#> 17      GLAND
#> 18       GPIL
#> 19   GRANULES
#> 20     GRASIM
#> 21  GUJGASLTD
#> 22   HBANKETF
#> 23        HCG
#> 24   HDFCBANK
#> 25   HDFCLIFE
#> 26   HINDALCO
#> 27  ICICIMCAP
#> 28 ICICINIFTY
#> 29  ICICINV20
#> 30    IFBAGRO
#> 31 INDSWFTLAB
#> 32  INTELLECT
#> 33  INVENTURE
#> 34        IVP
#> 35 IVZINNIFTY
#> 36 JINDALSTEL
#> 37      JSWHL
#> 38 KELLTONTEC
#> 39 KEYFINSERV
#> 40   KRISHANA
#> 41       LASA
#> 42       M100
#> 43    MAANALU
#> 44   MAESGETF
#> 45    MAJESCO
#> 46   MAN50ETF
#> 47     NAUKRI
#> 48 ORCHPHARMA
#> 49  PALREDTEC
#> 50  PANAMAPET
#> 51 PILANIINVS
#> 52 PLASTIBLEN
#> 53     PRECOT
#> 54 PREMIERPOL
#> 55      PURVA
#> 56   RELIGARE
#> 57       ROML
#> 58   SBIETFPB
#> 59 SBIETFQLTY
#> 60    SKIPPER
#> 61 SOMANYCERA
#> 62       SPYL
#> 63 SUNDARMFIN
#> 64   SUPPETRO
#> 65      TANLA
#> 66   TATACOMM
#> 67  TATAPOWER
#> 68  TATASTEEL
#> 69 TATASTLBSL
#> 70      TOTAL
#> 71 TPLPLASTEH
#> 72   TREJHARA
#> 73     TRIGYN
#> 74     UTIAMC
#> 75  UTINEXT50
#> 76 VAIBHAVGBL
#> 77   VIDEOIND
#> 78       VSSL
#>                                                                symbolDesc
#> 1                                                Aaron Industries Limited
#> 2                           Adani Ports and Special Economic Zone Limited
#> 3                                            Amara Raja Batteries Limited
#> 4                                                          Ashima Limited
#> 5                                   Bhansali Engineering Polymers Limited
#> 6                              Biofil Chemicals & Pharmaceuticals Limited
#> 7                                                Bliss GVS Pharma Limited
#> 8                                Computer Age Management Services Limited
#> 9                               CG Power and Industrial Solutions Limited
#> 10                                Chambal Fertilizers & Chemicals Limited
#> 11                   Cholamandalam Investment and Finance Company Limited
#> 12                              Dewan Housing Finance Corporation Limited
#> 13                                                  Eicher Motors Limited
#> 14                                         Everest Kanto Cylinder Limited
#> 15                                                          Emami Limited
#> 16                                                Ginni Filaments Limited
#> 17                                                   Gland Pharma Limited
#> 18                                       Godawari Power And Ispat limited
#> 19                                                 Granules India Limited
#> 20                                              Grasim Industries Limited
#> 21                                                    Gujarat Gas Limited
#> 22                                    HDFC Mutual Fund - HDFC Banking ETF
#> 23                                  Healthcare Global Enterprises Limited
#> 24                                                      HDFC Bank Limited
#> 25                                    HDFC Life Insurance Company Limited
#> 26                                            Hindalco Industries Limited
#> 27                                     ICICI Prudential Midcap Select ETF
#> 28                                             ICICI Prudential Nifty ETF
#> 29                                              ICICI Prudential NV20 ETF
#> 30                                            IFB Agro Industries Limited
#> 31                                         Ind-Swift Laboratories Limited
#> 32                                         Intellect Design Arena Limited
#> 33                                  Inventure Growth & Securities Limited
#> 34                                                            IVP Limited
#> 35                               Invesco India Nifty Exchange Traded Fund
#> 36                                           Jindal Steel & Power Limited
#> 37                                                   JSW Holdings Limited
#> 38                                         Kellton Tech Solutions Limited
#> 39                                     Keynote Financial Services Limited
#> 40                                              Krishana Phoschem Limited
#> 41                                             Lasa Supergenerics Limited
#> 42      Motilal Oswal Mutual Fund - Motilal Oswal MOSt Shares M100 ETF GO
#> 43                                                 Maan Aluminium Limited
#> 44            Mirae Asset Mutual Fund -Mirae Asset ESG Sector Leaders ETF
#> 45                                                        Majesco Limited
#> 46                     Mirae Asset Mutual Fund - Mirae Asset Nifty 50 ETF
#> 47                                              Info Edge (India) Limited
#> 48                                                  Orchid Pharma Limited
#> 49                                            Palred Technologies Limited
#> 50                                               Panama Petrochem Limited
#> 51                   Pilani Investment and Industries Corporation Limited
#> 52                                             Plastiblends India Limited
#> 53                                                Precot Meridian Limited
#> 54                                               Premier Polyfilm Limited
#> 55                                                    Puravankara Limited
#> 56                                           Religare Enterprises Limited
#> 57                                                  Raj Oil Mills Limited
#> 58          SBI Mutual Fund - SBI ETF Private Bank - SBI ETF Private Bank
#> 59                  SBI Mutual Fund - SBI - ETF Quality - SBI-ETF Quality
#> 60                                                        Skipper Limited
#> 61                                                Somany Ceramics Limited
#> 62                                           Shekhawati Poly-Yarn Limited
#> 63                                               Sundaram Finance Limited
#> 64                                              Supreme Petrochem Limited
#> 65                                                Tanla Platforms Limited
#> 66                                            Tata Communications Limited
#> 67                                             Tata Power Company Limited
#> 68                                                     Tata Steel Limited
#> 69                                                 Tata Steel Bsl Limited
#> 70                                        Total Transport Systems Limited
#> 71                                                   TPL Plastech Limited
#> 72                                             TREJHARA SOLUTIONS LIMITED
#> 73                                            Trigyn Technologies Limited
#> 74                                   UTI Asset Management Company Limited
#> 75 UTI Mutual Fund - UTI NIfty Next 50 Exchange Traded Fund - UTI NIFTY N
#> 76                                                 Vaibhav Global Limited
#> 77                                            Videocon Industries Limited
#> 78                                        Vardhman Special Steels Limited
#>            dt   value    year     ltp value_old    prev change pChange
#> 1  2020-11-24   61.70   61.70   61.70     56.10   56.10   5.60    9.98
#> 2  2020-11-24  404.70  404.70  402.85    402.00  392.25  10.60    2.70
#> 3  2020-11-24  899.00  899.00  890.40    895.00  891.25  -0.85   -0.10
#> 4  2020-11-24   10.35   10.35   10.00      9.90    9.90   0.10    1.01
#> 5  2020-11-24  127.60  127.60  124.00    120.40  118.10   5.90    5.00
#> 6  2020-11-24  198.45  198.45  198.45    189.00  189.00   9.45    5.00
#> 7  2020-10-06  181.60  181.60  169.00    181.60  161.80   7.20    4.45
#> 8  2020-10-05 1498.70 1498.70 1483.45   1489.00 1438.45  45.00    3.13
#> 9  2020-11-17   39.65   39.65   39.65     39.50   37.80   1.85    4.89
#> 10 2020-11-24  194.00  194.00  192.70    192.25  187.35   5.35    2.86
#> 11 2020-11-24  366.90  366.90  363.30    363.85  360.20   3.10    0.86
#> 12 2020-11-24   24.60   24.60   24.60     23.45   23.45   1.15    4.90
#> 13 2020-11-24 2727.00 2727.00 2615.30   2715.00 2693.30 -78.00   -2.90
#> 14 2020-11-24   45.35   45.35   43.70     43.20   43.20   0.50    1.16
#> 15 2020-09-15  422.65  422.65  420.40    407.55  403.80  16.60    4.11
#> 16 2020-11-24   18.55   18.55   18.40     17.70   17.70   0.70    3.95
#> 17 2020-11-23 2222.00 2222.00 2131.65   2183.45 2048.50  83.15    4.06
#> 18 2020-11-18  410.00  410.00  396.65    406.10  390.50   6.15    1.57
#> 19 2020-11-24  425.00  425.00  419.05    420.00  418.65   0.40    0.10
#> 20 2020-11-23  873.80  873.80  856.00    868.90  853.25   2.75    0.32
#> 21 2020-11-24  345.55  345.55  338.55    339.50  334.05   4.50    1.35
#> 22 2020-11-19  300.00  300.00  294.46    297.00  295.32  -0.86   -0.29
#> 23 2020-11-24  144.90  144.90  143.10    144.90  143.75  -0.65   -0.45
#> 24 2020-11-24 1464.40 1464.40 1429.20   1445.00 1438.20  -9.00   -0.63
#> 25 2020-11-18  688.50  688.50  676.65    676.10  664.15  12.50    1.88
#> 26 2020-11-24  230.00  230.00  226.00    227.25  226.00   0.00    0.00
#> 27 2020-11-14   81.90   81.90   72.00     76.10   72.49  -0.49   -0.68
#> 28 2020-11-14  156.20  156.20  138.35    154.90  138.20   0.15    0.11
#> 29 2020-11-24   70.00   70.00   65.24     67.00   65.33  -0.09   -0.14
#> 30 2020-01-03  524.70  524.70  496.00    477.70  469.50  26.50    5.64
#> 31 2020-11-24   72.90   72.90   67.35     71.85   70.85  -3.50   -4.94
#> 32 2020-11-24  270.00  270.00  266.85    270.00  265.70   1.15    0.43
#> 33 2020-11-23   22.75   22.75   21.40     22.10   21.50  -0.10   -0.47
#> 34 2020-11-24   74.20   74.20   67.20     70.70   70.70  -3.50   -4.95
#> 35 2020-11-18 1648.00 1648.00 1406.50   1545.80 1405.00   1.50    0.11
#> 36 2020-11-23  248.00  248.00  240.80    245.80  240.95  -0.15   -0.06
#> 37 2020-11-24 3499.00 3499.00 3413.50   3485.45 3451.65 -38.15   -1.11
#> 38 2020-11-24   55.40   55.40   52.95     55.20   54.10  -1.15   -2.13
#> 39 2020-11-24  111.55  111.55  111.50    106.25  106.25   5.25    4.94
#> 40 2020-11-24   83.00   83.00   80.95     79.25   79.25   1.70    2.15
#> 41 2020-11-24   88.50   88.50   84.40     84.40   81.35   3.05    3.75
#> 42 2020-11-23   21.98   21.98   20.02     20.88   20.13  -0.11   -0.55
#> 43 2020-08-28   83.05   83.05   80.90     80.20   78.35   2.55    3.25
#> 44 2020-11-24   23.00   23.00   22.43     22.60   22.54   0.06    0.27
#> 45 2020-11-23  971.40  971.40  947.60    952.00  939.90   7.70    0.82
#> 46 2020-11-14  134.01  134.01  132.99    134.00  132.91   0.08    0.06
#> 47 2020-11-24 4091.00 4091.00 4023.30   4089.95 4047.90 -24.60   -0.61
#> 48 2020-11-24   38.60   38.60   38.60     36.80   36.80   1.80    4.89
#> 49 2020-11-24   39.20   39.20   39.20     37.90   37.35   1.85    4.95
#> 50 2020-11-24   84.25   84.25   80.60     78.25   76.30   4.30    5.64
#> 51 2020-11-24 2239.95 2239.95 2159.65   2222.00 2202.90 -43.25   -1.96
#> 52 2020-11-24  264.80  264.80  254.45    257.85  252.20   2.25    0.89
#> 53 2020-11-24   62.45   62.45   56.55     59.50   59.50  -2.95   -4.96
#> 54 2020-11-24   35.20   35.20   33.80     33.70   33.05   0.75    2.27
#> 55 2020-01-29   74.50   74.50   72.60     71.40   67.70   4.90    7.24
#> 56 2020-10-23   57.60   57.60   55.90     55.20   52.25   3.65    6.99
#> 57 2020-11-24   15.30   15.30   15.30     14.60   14.60   0.70    4.79
#> 58 2020-11-24  167.80  167.80  162.35    165.00  164.71  -2.36   -1.43
#> 59 2020-11-17  116.90  116.90  113.31    115.45  114.60  -1.29   -1.13
#> 60 2020-11-19   57.50   57.50   56.20     57.50   53.45   2.75    5.14
#> 61 2020-11-23  272.00  272.00  270.50    269.30  261.50   9.00    3.44
#> 62 2020-11-24    0.50    0.50    0.50      0.45    0.45   0.05   11.11
#> 63 2020-11-24 1834.00 1834.00 1784.40   1805.90 1795.20 -10.80   -0.60
#> 64 2020-11-23  332.80  332.80  325.00    328.00  323.10   1.90    0.59
#> 65 2020-11-24  555.90  555.90  548.75    529.45  529.45  19.30    3.65
#> 66 2020-11-10 1104.75 1104.75 1025.95   1064.05 1052.15 -26.20   -2.49
#> 67 2020-08-21   63.90   63.90   63.35     63.40   59.95   3.40    5.67
#> 68 2020-11-24  558.65  558.65  550.90    550.45  548.30   2.60    0.47
#> 69 2020-11-24   34.00   34.00   33.50     33.50   33.30   0.20    0.60
#> 70 2020-11-24   59.80   59.80   56.00     57.15   57.10  -1.10   -1.93
#> 71 2020-08-26  147.90  147.90  146.05    147.90  130.80  15.25   11.66
#> 72 2020-11-24   30.70   30.70   30.70     29.25   29.25   1.45    4.96
#> 73 2020-11-24   72.20   72.20   65.65     69.10   69.10  -3.45   -4.99
#> 74 2020-11-24  561.05  561.05  548.15    550.00  546.20   1.95    0.36
#> 75 2020-11-24  320.00  320.00  311.40    317.69  312.00  -0.60   -0.19
#> 76 2020-11-24 2155.00 2155.00 2114.50   2155.00 2140.30 -25.80   -1.21
#> 77 2020-11-24    5.50    5.50    5.50      5.25    5.25   0.25    4.76
#> 78 2020-11-24   98.55   98.55   98.55     95.45   93.90   4.65    4.95
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
#> 1       CANBK     EQ                  2020-07-31
#> 2  BANKBARODA     EQ                  2020-07-22
#> 3         PNB     EQ                  2020-07-27
#> 4        ONGC     EQ                  2020-03-23
#> 5  IBULHSGFIN     EQ                  2020-09-03
#> 6   TATAPOWER     EQ                  2020-07-14
#> 7  MANAPPURAM     EQ                  2020-11-18
#> 8  SRTRANSFIN     EQ                  2020-11-09
#> 9  BANDHANBNK     EQ                  2020-08-13
#> 10 FEDERALBNK     EQ                  2020-07-09
#>                                 last_corp_announcement open_price high_price
#> 1                               Annual General Meeting      94.00     100.60
#> 2                               Annual General Meeting      47.55      50.50
#> 3                               Annual General Meeting      30.65      32.50
#> 4                    Interim Dividend - Rs 5 Per Share      77.20      80.95
#> 5                               Annual General Meeting     184.00     195.90
#> 6  Annual General Meeting/Dividend - Rs 1.55 Per Share      60.45      63.90
#> 7                 Interim Dividend - Rs 0.60 Per Share     163.70     172.75
#> 8                    Interim Dividend - Rs 6 Per Share    1034.80    1078.60
#> 9                               Annual General Meeting     362.00     374.95
#> 10                              Annual General Meeting      59.00      61.55
#>    low_price last_traded_price prev_close_price percent_change traded_quantity
#> 1      94.00            100.45            93.25           7.72        25068388
#> 2      47.30             50.45            46.85           7.68        66696253
#> 3      30.55             32.50            30.40           6.91        69662592
#> 4      77.15             80.85            76.10           6.24        59720637
#> 5     183.70            192.00           181.70           5.67        43226481
#> 6      60.20             63.35            59.95           5.67        56543030
#> 7     162.90            171.65           163.15           5.21        12012500
#> 8    1033.00           1077.70          1029.20           4.71         5980477
#> 9     361.15            373.45           358.75           4.10        14212004
#> 10     58.80             60.40            58.50           3.25        50285433
#>    turnover_in_lakhs
#> 1           24328.87
#> 2           32741.19
#> 3           22048.21
#> 4           47519.71
#> 5           82463.16
#> 6           35237.62
#> 7           20233.86
#> 8           63115.56
#> 9           52348.50
#> 10          30231.60

# retain original column names as returned by NSE
nse_fo_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1       CANBK     EQ               2020-07-31
#> 2  BANKBARODA     EQ               2020-07-22
#> 3         PNB     EQ               2020-07-27
#> 4        ONGC     EQ               2020-03-23
#> 5  IBULHSGFIN     EQ               2020-09-03
#> 6   TATAPOWER     EQ               2020-07-14
#> 7  MANAPPURAM     EQ               2020-11-18
#> 8  SRTRANSFIN     EQ               2020-11-09
#> 9  BANDHANBNK     EQ               2020-08-13
#> 10 FEDERALBNK     EQ               2020-07-09
#>                                   lastCorpAnnouncement openPrice highPrice
#> 1                               Annual General Meeting     94.00    100.60
#> 2                               Annual General Meeting     47.55     50.50
#> 3                               Annual General Meeting     30.65     32.50
#> 4                    Interim Dividend - Rs 5 Per Share     77.20     80.95
#> 5                               Annual General Meeting    184.00    195.90
#> 6  Annual General Meeting/Dividend - Rs 1.55 Per Share     60.45     63.90
#> 7                 Interim Dividend - Rs 0.60 Per Share    163.70    172.75
#> 8                    Interim Dividend - Rs 6 Per Share   1034.80   1078.60
#> 9                               Annual General Meeting    362.00    374.95
#> 10                              Annual General Meeting     59.00     61.55
#>    lowPrice     ltp previousPrice netPrice tradedQuantity turnoverInLakhs
#> 1     94.00  100.45         93.25     7.72       25068388        24328.87
#> 2     47.30   50.45         46.85     7.68       66696253        32741.19
#> 3     30.55   32.50         30.40     6.91       69662592        22048.21
#> 4     77.15   80.85         76.10     6.24       59720637        47519.71
#> 5    183.70  192.00        181.70     5.67       43226481        82463.16
#> 6     60.20   63.35         59.95     5.67       56543030        35237.62
#> 7    162.90  171.65        163.15     5.21       12012500        20233.86
#> 8   1033.00 1077.70       1029.20     4.71        5980477        63115.56
#> 9    361.15  373.45        358.75     4.10       14212004        52348.50
#> 10    58.80   60.40         58.50     3.25       50285433        30231.60
```

### Pre Open Market Data

##### Fetch data of pre open session of Nifty Bank.

``` r
nse_preopen_nifty_bank()
#>        symbol series corp_action_date corp_action   price change percent_change
#> 1  BANKBARODA     EQ             <NA>        <NA>   47.55   0.70           1.49
#> 2   ICICIBANK     EQ             <NA>        <NA>  485.00   6.80           1.42
#> 3  INDUSINDBK     EQ             <NA>        <NA>  863.60   9.90           1.16
#> 4     RBLBANK     EQ             <NA>        <NA>  229.00   2.60           1.15
#> 5  BANDHANBNK     EQ             <NA>        <NA>  362.00   3.25           0.91
#> 6    HDFCBANK     EQ             <NA>        <NA> 1451.30  13.10           0.91
#> 7    AXISBANK     EQ             <NA>        <NA>  625.00   5.35           0.86
#> 8  FEDERALBNK     EQ             <NA>        <NA>   59.00   0.50           0.85
#> 9         PNB     EQ             <NA>        <NA>   30.65   0.25           0.82
#> 10  KOTAKBANK     EQ             <NA>        <NA> 1939.00  14.10           0.73
#> 11       SBIN     EQ             <NA>        <NA>  245.45   1.60           0.66
#> 12 IDFCFIRSTB     EQ             <NA>        <NA>   37.00   0.10           0.27
#>    prev_close quantity   value   mkt_cap year_high year_low sum_val
#> 1       46.85   127349   60.55   5628.31    108.25    36.00 2883.45
#> 2      478.20    83729  406.09 329766.51    552.20   268.30 2883.45
#> 3      853.70    19972  172.48  48424.85   1596.55   235.55 2883.45
#> 4      226.40    76025  174.10  10481.26    391.20   101.55 2883.45
#> 5      358.75    35101  127.07  24263.87    597.00   152.20 2883.45
#> 6     1438.20    76184 1105.66 625253.19   1445.00   738.75 2883.45
#> 7      619.65    45376  283.60 153590.74    765.85   286.00 2883.45
#> 8       58.50    78529   46.33  11669.67     96.95    35.70 2883.45
#> 9       30.40    56152   17.21   4005.16     67.70    26.30 2883.45
#> 10    1924.90     9803  190.08 281923.51   1948.40  1001.00 2883.45
#> 11     243.85   111165  272.85  93579.46    351.00   149.45 2883.45
#> 12      36.90    74146   27.43   7744.45     47.95    17.65 2883.45
#>    sum_quantity fin_quantity sum_fin_quantity
#> 1        663693       127349           793531
#> 2        663693        83729           793531
#> 3        663693        19972           793531
#> 4        663693        76025           793531
#> 5        663693        35101           793531
#> 6        663693        76184           793531
#> 7        663693        45376           793531
#> 8        663693        78529           793531
#> 9        663693        56152           793531
#> 10       663693         9803           793531
#> 11       663693       111165           793531
#> 12       663693        74146           793531

# retain original column names as returned by NSE
nse_preopen_nifty(clean_names = FALSE)
#>        symbol series        xDt
#> 1  TATAMOTORS     EQ       <NA>
#> 2     DRREDDY     EQ       <NA>
#> 3        ONGC     EQ       <NA>
#> 4   ICICIBANK     EQ       <NA>
#> 5    SHREECEM     EQ       <NA>
#> 6      MARUTI     EQ       <NA>
#> 7    HDFCLIFE     EQ       <NA>
#> 8  INDUSINDBK     EQ       <NA>
#> 9        GAIL     EQ       <NA>
#> 10 ADANIPORTS     EQ       <NA>
#> 11 ASIANPAINT     EQ 2020-10-28
#> 12      TECHM     EQ 2020-10-29
#> 13       INFY     EQ 2020-10-23
#> 14   HDFCBANK     EQ       <NA>
#> 15 BAJAJFINSV     EQ       <NA>
#> 16   DIVISLAB     EQ 2020-09-04
#> 17   AXISBANK     EQ       <NA>
#> 18    SBILIFE     EQ       <NA>
#> 19   RELIANCE     EQ       <NA>
#> 20   JSWSTEEL     EQ       <NA>
#> 21  KOTAKBANK     EQ       <NA>
#> 22      WIPRO     EQ       <NA>
#> 23       SBIN     EQ       <NA>
#> 24  NESTLEIND     EQ 2020-10-29
#> 25  COALINDIA     EQ 2020-11-19
#> 26         LT     EQ 2020-11-04
#> 27 ULTRACEMCO     EQ       <NA>
#> 28  TATASTEEL     EQ       <NA>
#> 29 BHARTIARTL     EQ       <NA>
#> 30       HDFC     EQ       <NA>
#> 31        IOC     EQ       <NA>
#> 32        M&M     EQ       <NA>
#> 33     GRASIM     EQ       <NA>
#> 34        UPL     EQ       <NA>
#> 35       NTPC     EQ 2020-11-12
#> 36       BPCL     EQ 2020-09-18
#> 37      TITAN     EQ       <NA>
#> 38        TCS     EQ       <NA>
#> 39 BAJFINANCE     EQ       <NA>
#> 40        ITC     EQ       <NA>
#> 41  BRITANNIA     EQ       <NA>
#> 42 HINDUNILVR     EQ 2020-10-28
#> 43      CIPLA     EQ       <NA>
#> 44  SUNPHARMA     EQ       <NA>
#> 45 HEROMOTOCO     EQ       <NA>
#> 46 BAJAJ-AUTO     EQ       <NA>
#> 47  EICHERMOT     EQ       <NA>
#> 48  POWERGRID     EQ 2020-09-02
#> 49    HCLTECH     EQ 2020-10-22
#> 50   HINDALCO     EQ 2020-09-03
#>                                                  caAct      iep    chn perChn
#> 1                                                 <NA>   175.00   2.95   1.71
#> 2                                                 <NA>  4998.00  82.50   1.68
#> 3                                                 <NA>    77.20   1.10   1.45
#> 4                                                 <NA>   485.00   6.80   1.42
#> 5                                                 <NA> 24580.00 336.45   1.39
#> 6                                                 <NA>  7250.00  91.60   1.28
#> 7                                                 <NA>   672.45   8.30   1.25
#> 8                                                 <NA>   863.60   9.90   1.16
#> 9                                                 <NA>   101.35   1.05   1.05
#> 10                                                <NA>   396.30   4.05   1.03
#> 11                INTERIM DIVIDEND - RS 3.35 PER SHARE  2197.25 -10.65  -0.48
#> 12                  SPECIAL DIVIDEND - RS 15 PER SHARE   875.00  -2.65  -0.30
#> 13                  INTERIM DIVIDEND - RS 12 PER SHARE  1137.00  -3.05  -0.27
#> 14                                                <NA>  1451.30  13.10   0.91
#> 15                                                <NA>  8940.00  80.30   0.91
#> 16                              ANNUAL GENERAL MEETING  3567.95  30.90   0.87
#> 17                                                <NA>   625.00   5.35   0.86
#> 18                                                <NA>   846.05   7.10   0.85
#> 19                                                <NA>  1980.00  15.95   0.81
#> 20                                                <NA>   343.50   2.65   0.78
#> 21                                                <NA>  1939.00  14.10   0.73
#> 22                                                <NA>   357.90   2.40   0.68
#> 23                                                <NA>   245.45   1.60   0.66
#> 24                 INTERIM DIVIDNED - RS 135 PER SHARE 17789.00 111.40   0.63
#> 25                INTERIM DIVIDEND - RS 7.50 PER SHARE   123.95   0.70   0.57
#> 26                  SPECIAL DIVIDEND - RS 18 PER SHARE  1141.50   6.00   0.53
#> 27                                                <NA>  4899.00  25.80   0.53
#> 28                                                <NA>   551.00   2.70   0.49
#> 29                                                <NA>   476.50   2.25   0.47
#> 30                                                <NA>  2228.00  10.30   0.46
#> 31                                                <NA>    86.50   0.35   0.41
#> 32                                                <NA>   732.00   2.65   0.36
#> 33                                                <NA>   856.00   2.75   0.32
#> 34                                                <NA>   428.80   1.35   0.32
#> 35                                            BUY-BACK    94.45   0.30   0.32
#> 36                              ANNUAL GENERAL MEETING   391.00   1.25   0.32
#> 37                                                <NA>  1331.00   3.85   0.29
#> 38                                                <NA>  2729.00   6.95   0.26
#> 39                                                <NA>  4822.00  11.35   0.24
#> 40                                                <NA>   196.00   0.45   0.23
#> 41                                                <NA>  3570.60   8.35   0.23
#> 42                  INTERIM DIVIDEND - RS 14 PER SHARE  2162.00   4.65   0.22
#> 43                                                <NA>   750.10   1.65   0.22
#> 44                                                <NA>   521.20   1.05   0.20
#> 45                                                <NA>  3079.50   5.35   0.17
#> 46                                                <NA>  3100.00   4.30   0.14
#> 47                                                <NA>  2696.00   2.70   0.10
#> 48 ANNUAL GENERAL MEETING/DIVIDEND - RS 4.04 PER SHARE   194.50   0.00   0.00
#> 49                   INTERIM DIVIDEND - RS 4 PER SHARE   840.50   0.00   0.00
#> 50    ANNUAL GENERAL MEETING/DIVIDEND - RE 1 PER SHARE   226.00   0.00   0.00
#>        pCls trdQnty    iVal    mktCap    yHigh     yLow  sumVal sumQnty finQnty
#> 1    172.05  242124  423.72  30824.56   201.70    63.50 9051.65 1003584  242124
#> 2   4915.50    9893  494.45  59657.53  5512.65  2495.05 9051.65 1003584    9893
#> 3     76.10  143400  110.70  27763.42   134.55    50.00 9051.65 1003584  143400
#> 4    478.20   83729  406.09 329766.51   552.20   268.30 9051.65 1003584   83729
#> 5  24243.55     157   38.59  32364.84 25355.00 15410.00 9051.65 1003584     157
#> 6   7158.40    6239  452.33  95146.04  7569.90  4001.10 9051.65 1003584    6239
#> 7    664.15   13617   91.57  52304.56   676.10   340.00 9051.65 1003584   13617
#> 8    853.70   19972  172.48  48424.85  1596.55   235.55 9051.65 1003584   19972
#> 9    100.30   31392   31.82  18547.06   133.35    65.00 9051.65 1003584   31392
#> 10   392.25   19347   76.67  28690.37   402.00   203.00 9051.65 1003584   19347
#> 11  2207.90    2445   53.72  99537.20  2249.00  1431.20 9051.65 1003584    2445
#> 12   877.65    7362   64.42  54282.46   890.00   471.40 9051.65 1003584    7362
#> 13  1140.05   23308  265.01 417609.42  1186.00   509.25 9051.65 1003584   23308
#> 14  1438.20   76184 1105.66 625253.19  1445.00   738.75 9051.65 1003584   76184
#> 15  8859.70    4246  379.59  53576.53  9950.00  3985.30 9051.65 1003584    4246
#> 16  3537.05    1006   35.89  45070.83  3637.80  1626.00 9051.65 1003584    1006
#> 17   619.65   45376  283.60 153590.74   765.85   286.00 9051.65 1003584   45376
#> 18   838.95    4222   35.72  32720.57  1020.00   519.40 9051.65 1003584    4222
#> 19  1964.05   76215 1509.06 634996.90  2369.35   866.98 9051.65 1003584   76215
#> 20   340.85   13447   46.19  33780.29   350.50   132.50 9051.65 1003584   13447
#> 21  1924.90    9803  190.08 281923.51  1948.40  1001.00 9051.65 1003584    9803
#> 22   355.50   14395   51.52  52819.04   381.70   159.40 9051.65 1003584   14395
#> 23   243.85  111165  272.85  93579.46   351.00   149.45 9051.65 1003584  111165
#> 24 17677.60     127   22.59  63062.74 18369.95 12200.00 9051.65 1003584     127
#> 25   123.25   18000   22.31  25824.91   214.60   109.55 9051.65 1003584   18000
#> 26  1135.50    3703   42.27 138702.50  1389.00   661.00 9051.65 1003584    3703
#> 27  4873.20     245   12.00  56261.30  4979.00  2910.00 9051.65 1003584     245
#> 28   548.30   25893  142.67  41382.83   550.45   250.85 9051.65 1003584   25893
#> 29   474.25   13757   65.55 113841.12   612.00   361.75 9051.65 1003584   13757
#> 30  2217.70   22764  507.18 397257.77  2499.90  1473.45 9051.65 1003584   22764
#> 31    86.15   42430   36.70  21897.80   133.70    71.15 9051.65 1003584   42430
#> 32   729.35   12501   91.51  69817.63   745.50   245.40 9051.65 1003584   12501
#> 33   853.25     582    4.98  33682.64   868.90   385.05 9051.65 1003584     582
#> 34   427.45    6314   27.07  23514.57   614.90   240.15 9051.65 1003584    6314
#> 35    94.15   31635   29.88  45647.06   125.00    73.20 9051.65 1003584   31635
#> 36   389.75    4328   16.92  31282.25   518.45   252.00 9051.65 1003584    4328
#> 37  1327.15    4131   54.98  55376.59  1375.00   720.90 9051.65 1003584    4131
#> 38  2722.05   12873  351.30 285997.01  2885.00  1506.05 9051.65 1003584   12873
#> 39  4810.65    8097  390.44 127548.82  4923.40  1783.00 9051.65 1003584    8097
#> 40   195.55   76724  150.38 170839.49   250.40   134.60 9051.65 1003584   76724
#> 41  3562.25     919   32.81  42018.72  4010.00  2100.00 9051.65 1003584     919
#> 42  2157.35    2209   47.76 192614.98  2614.30  1757.30 9051.65 1003584    2209
#> 43   748.45   10657   79.94  38020.52   829.05   355.30 9051.65 1003584   10657
#> 44   520.15   19566  101.98  56160.63   564.75   312.00 9051.65 1003584   19566
#> 45  3074.15     850   26.18  39913.90  3394.90  1475.00 9051.65 1003584     850
#> 46  3095.70     552   17.11  40310.71  3315.15  1788.65 9051.65 1003584     552
#> 47  2693.30    2029   54.70  37529.05  2715.00  1245.01 9051.65 1003584    2029
#> 48   194.50   10347   20.12  49859.67   211.00   122.15 9051.65 1003584   10347
#> 49   840.50    6929   58.24  91233.42   910.70   375.25 9051.65 1003584    6929
#> 50   226.00   23155   52.33  32997.92   227.25    84.90 9051.65 1003584   23155
#>    sumfinQnty
#> 1     1320361
#> 2     1320361
#> 3     1320361
#> 4     1320361
#> 5     1320361
#> 6     1320361
#> 7     1320361
#> 8     1320361
#> 9     1320361
#> 10    1320361
#> 11    1320361
#> 12    1320361
#> 13    1320361
#> 14    1320361
#> 15    1320361
#> 16    1320361
#> 17    1320361
#> 18    1320361
#> 19    1320361
#> 20    1320361
#> 21    1320361
#> 22    1320361
#> 23    1320361
#> 24    1320361
#> 25    1320361
#> 26    1320361
#> 27    1320361
#> 28    1320361
#> 29    1320361
#> 30    1320361
#> 31    1320361
#> 32    1320361
#> 33    1320361
#> 34    1320361
#> 35    1320361
#> 36    1320361
#> 37    1320361
#> 38    1320361
#> 39    1320361
#> 40    1320361
#> 41    1320361
#> 42    1320361
#> 43    1320361
#> 44    1320361
#> 45    1320361
#> 46    1320361
#> 47    1320361
#> 48    1320361
#> 49    1320361
#> 50    1320361
```

### Advances & Declines

``` r
nse_advances_declines()
#>                                     index_name advances declines unchanged
#> 1                                     NIFTY 50       22       26         2
#> 2                                NIFTY NEXT 50       19       31         0
#> 3                                     NIFTY IT        1        9         0
#> 4                                   NIFTY BANK        8        4         0
#> 5                              NIFTY MIDCAP 50       21       29         0
#> 6                                  NIFTY INFRA       14       15         1
#> 7                                 NIFTY REALTY        3        7         0
#> 8                                 NIFTY ENERGY        6        3         1
#> 9                                   NIFTY FMCG        3       12         0
#> 10                                   NIFTY MNC        9       21         0
#> 11                                NIFTY PHARMA        1        9         0
#> 12                                   NIFTY PSE       14        5         1
#> 13                              NIFTY PSU BANK       11        1         0
#> 14                           NIFTY SERV SECTOR       17       12         1
#> 15                           NIFTY COMMODITIES       13       15         2
#> 16                           NIFTY CONSUMPTION        5       25         0
#> 17                           NIFTY FIN SERVICE       13        7         0
#> 18                                  NIFTY AUTO        5       10         0
#> 19                           NIFTY DIV OPPS 50       22       27         1
#> 20                                 NIFTY MEDIA        5        5         0
#> 21                                 NIFTY METAL       11        3         1
#> 22                             NIFTY100 LIQ 15        9        6         0
#> 23                                  NIFTY CPSE       10        1         1
#> 24                           NIFTY GROWSECT 15        4       11         0
#> 25                            NIFTY50 VALUE 20        8       10         2
#> 26                           NIFTY100 QUALTY30        6       24         0
#> 27                              NIFTY PVT BANK        5        5         0
#> 28                            NIFTY MID LIQ 15        9        6         0
#> 29                                   NIFTY 100       41       57         2
#> 30                                   NIFTY 200       77      121         2
#> 31                                   NIFTY 500      193      303         5
#> 32                            NIFTY MIDCAP 100       36       64         0
#> 33                            NIFTY SMLCAP 100       36       63         1
#> 34                    NIFTY ADITYA BIRLA GROUP        4        2         1
#> 35                              NIFTY ALPHA 50       14       36         0
#> 36                          NIFTY HIGH BETA 50       27       22         1
#> 37                     NIFTY LOW VOLATILITY 50       15       34         1
#> 38                        NIFTY MAHINDRA GROUP        1        8         0
#> 39                            NIFTY MIDCAP 150       58       92         0
#> 40                       NIFTY MIDSMALLCAP 400      151      246         3
#> 41                            NIFTY SHARIAH 25        6       19         0
#> 42                          NIFTY SMALLCAP 250       93      154         3
#> 43                           NIFTY SMALLCAP 50       20       30         0
#> 44                            NIFTY TATA GROUP       10       14         1
#> 45                    NIFTY TATA GROUP 25% CAP        3        7         0
#> 46                            NIFTY100 EQL WGT       41       57         2
#> 47                           NIFTY100 LOWVOL30        8       21         1
#> 48                             NIFTY50 SHARIAH        5       13         0
#> 49                            NIFTY500 SHARIAH       69      140         1
#> 50                             NIFTY50 EQL WGT       22       26         2
#> 51               NIFTY ALPHA LOW-VOLATILITY 30        7       22         1
#> 52             NIFTY QUALITY LOW-VOLATILITY 30        5       25         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30        6       24         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30        7       22         1
#> 55                       NIFTY LARGEMIDCAP 250       99      149         2
#> 56                           NIFTY500 VALUE 50       24       24         2
#> 57                            NIFTY MIDCAP 150       58       92         0
#> 58                             NIFTY SMLCAP 50       20       30         0
#> 59                            NIFTY SMLCAP 250       93      154         3
#> 60                            NIFTY MIDSML 400      151      246         3
#> 61                           NIFTY200 QUALTY30        6       24         0
#> 62                          CNX NIFTY Pre Open       44        3         3

# retain original column names as returned by NSE
nse_advances_declines(clean_names = FALSE)
#>                                        skipped advances declines unchanged
#> 1                                     NIFTY 50       22       26         2
#> 2                                NIFTY NEXT 50       19       31         0
#> 3                                     NIFTY IT        1        9         0
#> 4                                   NIFTY BANK        8        4         0
#> 5                              NIFTY MIDCAP 50       21       29         0
#> 6                                  NIFTY INFRA       14       15         1
#> 7                                 NIFTY REALTY        3        7         0
#> 8                                 NIFTY ENERGY        6        3         1
#> 9                                   NIFTY FMCG        3       12         0
#> 10                                   NIFTY MNC        9       21         0
#> 11                                NIFTY PHARMA        1        9         0
#> 12                                   NIFTY PSE       14        5         1
#> 13                              NIFTY PSU BANK       11        1         0
#> 14                           NIFTY SERV SECTOR       17       12         1
#> 15                           NIFTY COMMODITIES       13       15         2
#> 16                           NIFTY CONSUMPTION        5       25         0
#> 17                           NIFTY FIN SERVICE       13        7         0
#> 18                                  NIFTY AUTO        5       10         0
#> 19                           NIFTY DIV OPPS 50       22       27         1
#> 20                                 NIFTY MEDIA        5        5         0
#> 21                                 NIFTY METAL       11        3         1
#> 22                             NIFTY100 LIQ 15        9        6         0
#> 23                                  NIFTY CPSE       10        1         1
#> 24                           NIFTY GROWSECT 15        4       11         0
#> 25                            NIFTY50 VALUE 20        8       10         2
#> 26                           NIFTY100 QUALTY30        6       24         0
#> 27                              NIFTY PVT BANK        5        5         0
#> 28                            NIFTY MID LIQ 15        9        6         0
#> 29                                   NIFTY 100       41       57         2
#> 30                                   NIFTY 200       77      121         2
#> 31                                   NIFTY 500      193      303         5
#> 32                            NIFTY MIDCAP 100       36       64         0
#> 33                            NIFTY SMLCAP 100       36       63         1
#> 34                    NIFTY ADITYA BIRLA GROUP        4        2         1
#> 35                              NIFTY ALPHA 50       14       36         0
#> 36                          NIFTY HIGH BETA 50       27       22         1
#> 37                     NIFTY LOW VOLATILITY 50       15       34         1
#> 38                        NIFTY MAHINDRA GROUP        1        8         0
#> 39                            NIFTY MIDCAP 150       58       92         0
#> 40                       NIFTY MIDSMALLCAP 400      151      246         3
#> 41                            NIFTY SHARIAH 25        6       19         0
#> 42                          NIFTY SMALLCAP 250       93      154         3
#> 43                           NIFTY SMALLCAP 50       20       30         0
#> 44                            NIFTY TATA GROUP       10       14         1
#> 45                    NIFTY TATA GROUP 25% CAP        3        7         0
#> 46                            NIFTY100 EQL WGT       41       57         2
#> 47                           NIFTY100 LOWVOL30        8       21         1
#> 48                             NIFTY50 SHARIAH        5       13         0
#> 49                            NIFTY500 SHARIAH       69      140         1
#> 50                             NIFTY50 EQL WGT       22       26         2
#> 51               NIFTY ALPHA LOW-VOLATILITY 30        7       22         1
#> 52             NIFTY QUALITY LOW-VOLATILITY 30        5       25         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30        6       24         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30        7       22         1
#> 55                       NIFTY LARGEMIDCAP 250       99      149         2
#> 56                           NIFTY500 VALUE 50       24       24         2
#> 57                            NIFTY MIDCAP 150       58       92         0
#> 58                             NIFTY SMLCAP 50       20       30         0
#> 59                            NIFTY SMLCAP 250       93      154         3
#> 60                            NIFTY MIDSML 400      151      246         3
#> 61                           NIFTY200 QUALTY30        6       24         0
#> 62                          CNX NIFTY Pre Open       44        3         3
```

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
