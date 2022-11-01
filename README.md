
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nse2r

> Fetch data from the National Stock Exchange, India.

<!-- badges: start -->

[![R build
status](https://github.com/rsquaredacademy/nse2r/workflows/R-CMD-check/badge.svg)](https://github.com/rsquaredacademy/nse2r/actions)
[![Coverage
Status](https://img.shields.io/codecov/c/github/rsquaredacademy/nse2r/master.svg)](https://codecov.io/github/rsquaredacademy/nse2r?branch=master)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html)
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
#> 1  NIFTY 50 Pre Open          18130.70 118.50           0.66
#> 2           NIFTY 50          18111.05  98.85           0.55
#> 3      NIFTY NEXT 50          42869.25 245.40           0.58
#> 4    NIFTY100 LIQ 15           4703.65 -16.60          -0.35
#> 5         NIFTY BANK          41330.40  22.50           0.05
#> 6          INDIA VIX             16.12   0.32           2.00
#> 7          NIFTY 100          18339.60  96.20           0.53
#> 8          NIFTY 500          15499.60  75.60           0.49
#> 9   NIFTY MIDCAP 100          31586.45 154.15           0.49
#> 10   NIFTY MIDCAP 50           8731.20  40.85           0.47
#> 11       NIFTY INFRA           5257.25  22.55           0.43
#> 12      NIFTY REALTY            440.00   1.35           0.31
#> 13      NIFTY ENERGY          26717.60  44.95           0.17
#> 14        NIFTY FMCG          44486.35 190.05           0.43
#> 15         NIFTY MNC          19988.50  78.90           0.40
#> 16      NIFTY PHARMA          13431.25 219.00           1.66
#> 17         NIFTY PSE           4316.70  40.15           0.94
#> 18    NIFTY PSU BANK           3471.55  10.50           0.30
#> 19 NIFTY SERV SECTOR          24899.30 172.90           0.70
#> 20          NIFTY IT          29174.65 447.05           1.56
#> 21  NIFTY SMLCAP 100           9698.15  12.05           0.12
#> 22         NIFTY 200           9594.30  49.90           0.52
#> 23        NIFTY AUTO          13329.20 -52.45          -0.39
#> 24       NIFTY MEDIA           2059.50  -2.85          -0.14
#> 25       NIFTY METAL           5996.70 100.35           1.70
#> 26 NIFTY DIV OPPS 50           3783.90  34.65           0.92
#> 27 NIFTY COMMODITIES           5821.40  34.55           0.60
#> 28 NIFTY CONSUMPTION           7966.95   1.90           0.02
#> 29        NIFTY CPSE           2836.45  36.80           1.31
#> 30 NIFTY FIN SERVICE          18615.15  76.85           0.41
#> 31 NIFTY GROWSECT 15           9143.50  42.65           0.47
#> 32  NIFTY50 VALUE 20           9115.75 102.40           1.14
#> 33 NIFTY50 TR 2X LEV          12571.85 139.05           1.12
#> 34 NIFTY50 PR 2X LEV           9007.85  96.30           1.08
#> 35 NIFTY50 TR 1X INV            209.45  -1.20          -0.57
#> 36 NIFTY50 PR 1X INV            247.30  -1.30          -0.52
#> 37    NIFTY ALPHA 50          30673.30 152.80           0.50
#> 38   NIFTY50 EQL WGT          20688.60 139.85           0.68
#> 39  NIFTY100 EQL WGT          20945.00 134.95           0.65
#> 40 NIFTY100 LOWVOL30          13356.60 126.95           0.96
#> 41  NIFTY MID LIQ 15           7771.50  41.70           0.54
#> 42    NIFTY PVT BANK          21173.55 -20.35          -0.10
#> 43 NIFTY100 QUALTY30           3965.90  29.80           0.76
#> 44   NIFTY GS 8 13YR           2290.47   3.88           0.16
#> 45     NIFTY GS 10YR           2029.34   4.23           0.20
#> 46 NIFTY GS 10YR CLN            858.99   1.64           0.19
#> 47    NIFTY GS 4 8YR           2503.58   2.84           0.11
#> 48  NIFTY GS 11 15YR           2494.27   2.86           0.11
#> 49 NIFTY GS 15YRPLUS           2700.10   1.76           0.06
#> 50 NIFTY GS COMPSITE           2366.81   3.29           0.13
#> 51  NIFTY MIDCAP 150          11924.80  56.65           0.48
#> 52   NIFTY SMLCAP 50           4321.65  11.25           0.26
#> 53  NIFTY SMLCAP 250           9378.60   6.60           0.07
#> 54  NIFTY MIDSML 400          11010.45  37.65           0.34
#> 55 NIFTY200 QUALTY30          14657.55 124.65           0.86

# retain original column names as returned by NSE
nse_index_quote(clean_names = FALSE)
#>              skipped lastPrice change pChange
#> 1  NIFTY 50 Pre Open  18130.70 118.50    0.66
#> 2           NIFTY 50  18111.05  98.85    0.55
#> 3      NIFTY NEXT 50  42869.25 245.40    0.58
#> 4    NIFTY100 LIQ 15   4703.65 -16.60   -0.35
#> 5         NIFTY BANK  41330.40  22.50    0.05
#> 6          INDIA VIX     16.12   0.32    2.00
#> 7          NIFTY 100  18339.60  96.20    0.53
#> 8          NIFTY 500  15499.60  75.60    0.49
#> 9   NIFTY MIDCAP 100  31586.45 154.15    0.49
#> 10   NIFTY MIDCAP 50   8731.20  40.85    0.47
#> 11       NIFTY INFRA   5257.25  22.55    0.43
#> 12      NIFTY REALTY    440.00   1.35    0.31
#> 13      NIFTY ENERGY  26717.60  44.95    0.17
#> 14        NIFTY FMCG  44486.35 190.05    0.43
#> 15         NIFTY MNC  19988.50  78.90    0.40
#> 16      NIFTY PHARMA  13431.25 219.00    1.66
#> 17         NIFTY PSE   4316.70  40.15    0.94
#> 18    NIFTY PSU BANK   3471.55  10.50    0.30
#> 19 NIFTY SERV SECTOR  24899.30 172.90    0.70
#> 20          NIFTY IT  29174.65 447.05    1.56
#> 21  NIFTY SMLCAP 100   9698.15  12.05    0.12
#> 22         NIFTY 200   9594.30  49.90    0.52
#> 23        NIFTY AUTO  13329.20 -52.45   -0.39
#> 24       NIFTY MEDIA   2059.50  -2.85   -0.14
#> 25       NIFTY METAL   5996.70 100.35    1.70
#> 26 NIFTY DIV OPPS 50   3783.90  34.65    0.92
#> 27 NIFTY COMMODITIES   5821.40  34.55    0.60
#> 28 NIFTY CONSUMPTION   7966.95   1.90    0.02
#> 29        NIFTY CPSE   2836.45  36.80    1.31
#> 30 NIFTY FIN SERVICE  18615.15  76.85    0.41
#> 31 NIFTY GROWSECT 15   9143.50  42.65    0.47
#> 32  NIFTY50 VALUE 20   9115.75 102.40    1.14
#> 33 NIFTY50 TR 2X LEV  12571.85 139.05    1.12
#> 34 NIFTY50 PR 2X LEV   9007.85  96.30    1.08
#> 35 NIFTY50 TR 1X INV    209.45  -1.20   -0.57
#> 36 NIFTY50 PR 1X INV    247.30  -1.30   -0.52
#> 37    NIFTY ALPHA 50  30673.30 152.80    0.50
#> 38   NIFTY50 EQL WGT  20688.60 139.85    0.68
#> 39  NIFTY100 EQL WGT  20945.00 134.95    0.65
#> 40 NIFTY100 LOWVOL30  13356.60 126.95    0.96
#> 41  NIFTY MID LIQ 15   7771.50  41.70    0.54
#> 42    NIFTY PVT BANK  21173.55 -20.35   -0.10
#> 43 NIFTY100 QUALTY30   3965.90  29.80    0.76
#> 44   NIFTY GS 8 13YR   2290.47   3.88    0.16
#> 45     NIFTY GS 10YR   2029.34   4.23    0.20
#> 46 NIFTY GS 10YR CLN    858.99   1.64    0.19
#> 47    NIFTY GS 4 8YR   2503.58   2.84    0.11
#> 48  NIFTY GS 11 15YR   2494.27   2.86    0.11
#> 49 NIFTY GS 15YRPLUS   2700.10   1.76    0.06
#> 50 NIFTY GS COMPSITE   2366.81   3.29    0.13
#> 51  NIFTY MIDCAP 150  11924.80  56.65    0.48
#> 52   NIFTY SMLCAP 50   4321.65  11.25    0.26
#> 53  NIFTY SMLCAP 250   9378.60   6.60    0.07
#> 54  NIFTY MIDSML 400  11010.45  37.65    0.34
#> 55 NIFTY200 QUALTY30  14657.55 124.65    0.86
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#>       symbol series last_corp_announcement_date
#> 1   DIVISLAB     EQ                  2022-08-11
#> 2   ADANIENT     EQ                  2022-07-14
#> 3       NTPC     EQ                  2022-08-10
#> 4    DRREDDY     EQ                  2022-07-11
#> 5     GRASIM     EQ                  2022-08-11
#> 6   HINDALCO     EQ                  2022-08-11
#> 7       HDFC     EQ                  2022-05-31
#> 8        TCS     EQ                  2022-10-17
#> 9       INFY     EQ                  2022-10-27
#> 10 POWERGRID     EQ                  2022-08-19
#>                                                                last_corp_announcement
#> 1                                                          Dividend - Rs 30 Per Share
#> 2                                                           Dividend - Re 1 Per Share
#> 3                                                           Dividend - Rs 3 Per Share
#> 4                                   Annual General Meeting/Dividend - Rs 30 Per Share
#> 5  Annual General Meeting/Dividend - Rs 5 Per Share/Special Dividend - Rs 5 Per Share
#> 6                                    Annual General Meeting/Dividend - Rs 4 Per Share
#> 7                                                          Dividend - Rs 30 Per Share
#> 8                                                   Interim Dividend - Rs 8 Per Share
#> 9                                               Interim Dividend - Rs 16.50 Per Share
#> 10                                Annual General Meeting/Dividend - Rs 2.25 Per Share
#>    open_price high_price low_price last_traded_price prev_close_price
#> 1     3626.00    3815.00   3615.05           3809.30          3608.90
#> 2     3361.90    3524.00   3352.00           3515.15          3347.45
#> 3      174.00     180.95    173.50            180.00           173.10
#> 4     4435.25    4580.00   4435.25           4529.95          4433.70
#> 5     1728.20    1770.00   1728.20           1757.00          1721.70
#> 6      406.00     414.65    406.00            413.40           405.65
#> 7     2480.00    2518.00   2474.95           2516.35          2469.80
#> 8     3214.50    3259.00   3203.45           3249.70          3193.15
#> 9     1553.05    1565.00   1547.10           1564.50          1537.65
#> 10     230.65     234.45    229.80            232.15           228.15
#>    percent_change traded_quantity turnover_in_lakhs
#> 1            5.55         1274182          47987.99
#> 2            5.01         1612209          55488.53
#> 3            3.99        25811932          46221.43
#> 4            2.17          682521          30966.18
#> 5            2.05          552277           9713.39
#> 6            1.91         3293230          13525.95
#> 7            1.88         1703916          42684.97
#> 8            1.77         1985728          64229.37
#> 9            1.75         2617568          40752.92
#> 10           1.75         7290229          16954.16

# retain original column names as returned by NSE
nse_stock_top_gainers(clean_names = FALSE)
#>       symbol series lastCorpAnnouncementDate
#> 1   DIVISLAB     EQ               2022-08-11
#> 2   ADANIENT     EQ               2022-07-14
#> 3       NTPC     EQ               2022-08-10
#> 4    DRREDDY     EQ               2022-07-11
#> 5     GRASIM     EQ               2022-08-11
#> 6   HINDALCO     EQ               2022-08-11
#> 7       HDFC     EQ               2022-05-31
#> 8        TCS     EQ               2022-10-17
#> 9       INFY     EQ               2022-10-27
#> 10 POWERGRID     EQ               2022-08-19
#>                                                                  lastCorpAnnouncement
#> 1                                                          Dividend - Rs 30 Per Share
#> 2                                                           Dividend - Re 1 Per Share
#> 3                                                           Dividend - Rs 3 Per Share
#> 4                                   Annual General Meeting/Dividend - Rs 30 Per Share
#> 5  Annual General Meeting/Dividend - Rs 5 Per Share/Special Dividend - Rs 5 Per Share
#> 6                                    Annual General Meeting/Dividend - Rs 4 Per Share
#> 7                                                          Dividend - Rs 30 Per Share
#> 8                                                   Interim Dividend - Rs 8 Per Share
#> 9                                               Interim Dividend - Rs 16.50 Per Share
#> 10                                Annual General Meeting/Dividend - Rs 2.25 Per Share
#>    openPrice highPrice lowPrice     ltp previousPrice netPrice tradedQuantity
#> 1    3626.00   3815.00  3615.05 3809.30       3608.90     5.55        1274182
#> 2    3361.90   3524.00  3352.00 3515.15       3347.45     5.01        1612209
#> 3     174.00    180.95   173.50  180.00        173.10     3.99       25811932
#> 4    4435.25   4580.00  4435.25 4529.95       4433.70     2.17         682521
#> 5    1728.20   1770.00  1728.20 1757.00       1721.70     2.05         552277
#> 6     406.00    414.65   406.00  413.40        405.65     1.91        3293230
#> 7    2480.00   2518.00  2474.95 2516.35       2469.80     1.88        1703916
#> 8    3214.50   3259.00  3203.45 3249.70       3193.15     1.77        1985728
#> 9    1553.05   1565.00  1547.10 1564.50       1537.65     1.75        2617568
#> 10    230.65    234.45   229.80  232.15        228.15     1.75        7290229
#>    turnoverInLakhs
#> 1         47987.99
#> 2         55488.53
#> 3         46221.43
#> 4         30966.18
#> 5          9713.39
#> 6         13525.95
#> 7         42684.97
#> 8         64229.37
#> 9         40752.92
#> 10        16954.16
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#>        symbol                                      symbol_desc       date
#> 1       ABFRL          Aditya Birla Fashion and Retail Limited 2022-10-31
#> 2      AIAENG                          AIA Engineering Limited 2022-09-21
#> 3   AXISCADES                   AXISCADES Technologies Limited 2022-10-25
#> 4  BANKBARODA                                   Bank of Baroda 2022-10-25
#> 5  BHARTIARTL                            Bharti Airtel Limited 2022-10-31
#> 6        BHEL                 Bharat Heavy Electricals Limited 2022-10-28
#> 7  BLUESTARCO                                Blue Star Limited 2022-10-31
#> 8    BOHRAIND                         Bohra Industries Limited 2022-10-31
#> 9       CANBK                                      Canara Bank 2022-10-28
#> 10   CHOICEIN                     Choice International Limited 2022-10-31
#> 11      CIPLA                                    Cipla Limited 2022-10-27
#> 12  CRAFTSMAN                     Craftsman Automation Limited 2022-10-31
#> 13 CUMMINSIND                            Cummins India Limited 2022-10-31
#> 14   DFMFOODS                                DFM Foods Limited 2022-10-28
#> 15  EICHERMOT                            Eicher Motors Limited 2022-10-31
#> 16      FOCUS              Focus Lighting and Fixtures Limited 2022-10-31
#> 17    GANECOS                        Ganesha Ecosphere Limited 2022-10-31
#> 18   GANESHBE                        Ganesh Benzoplast Limited 2022-10-31
#> 19   GOCOLORS                       Go Fashion (India) Limited 2022-10-06
#> 20 GODFRYPHLP                   Godfrey Phillips India Limited 2022-10-28
#> 21   GRANULES                           Granules India Limited 2022-10-31
#> 22 HDFCMOMENT HDFC Mutual Fund - HDFC NIFTY200 Momentum 30 ETF 2022-10-24
#> 23       ICRA                                     ICRA Limited 2022-04-11
#> 24    INDIANB                                      Indian Bank 2022-10-31
#> 25 KALYANIFRG                            Kalyani Forge Limited 2022-10-31
#> 26 KARURVYSYA                         Karur Vysya Bank Limited 2022-10-31
#> 27       KECL               Kirloskar Electric Company Limited 2022-10-31
#> 28 KOTAKBKETF                             Kotak Nifty Bank ETF 2022-10-07
#> 29 KOTAKPSUBK                         Kotak Nifty PSU Bank ETF 2022-10-28
#> 30 KSHITIJPOL                         Kshitij Polyline Limited 2022-10-31
#> 31        M&M                      Mahindra & Mahindra Limited 2022-10-31
#> 32  MAXHEALTH                 Max Healthcare Institute Limited 2022-10-31
#> 33     MEDICO                          Medico Remedies Limited 2022-10-31
#> 34   MEGASTAR                           Megastar Foods Limited 2022-10-28
#> 35    NARMADA                         Narmada Agrobase Limited 2022-10-28
#> 36       NTPC                                     NTPC Limited 2022-09-15
#> 37 OILCOUNTUB                      Oil Country Tubular Limited 2022-10-31
#> 38  ORIENTPPR                Orient Paper & Industries Limited 2022-10-27
#> 39 PDMJEPAPER                  Pudumjee Paper Products Limited 2022-10-31
#> 40 PSUBNKBEES             Nippon India ETF Nifty PSU Bank BeES 2022-10-27
#> 41   RAJRILTD                     Raj Rayon Industries Limited 2022-10-31
#> 42  RAMASTEEL                         Rama Steel Tubes Limited 2022-10-31
#> 43     SAFARI                Safari Industries (India) Limited 2022-10-06
#> 44  SECURCRED                        SecUR Credentials Limited 2022-10-31
#> 45  SETFNIFBK                               SBI-ETF Nifty Bank 2022-09-15
#> 46 SHANTIGEAR                            Shanthi Gears Limited 2022-10-31
#> 47 SHREYANIND                      Shreyans Industries Limited 2022-10-31
#> 48  SOUTHBANK                    The South Indian Bank Limited 2022-10-27
#> 49  SUNPHARMA            Sun Pharmaceutical Industries Limited 2022-10-31
#> 50 TORNTPHARM                  Torrent Pharmaceuticals Limited 2022-10-31
#> 51  TREEHOUSE       Tree House Education & Accessories Limited 2022-10-31
#> 52      TRENT                                    Trent Limited 2022-10-31
#> 53 UNICHEMLAB                     Unichem Laboratories Limited 2022-10-31
#> 54  UNIONBANK                              Union Bank of India 2021-11-09
#> 55 WEIZMANIND                                 Weizmann Limited 2022-10-31
#>    new_high    year last_traded_price prev_high prev_close change
#> 1    359.50  359.50            358.15    355.40     353.90   4.25
#> 2   2734.45 2734.45           2701.00   2723.90    2681.75  19.25
#> 3    259.50  259.50            259.50    247.00     235.95  23.55
#> 4    151.80  151.80            148.65    151.60     147.70   0.95
#> 5    841.45  841.45            834.45    833.80     832.00   2.45
#> 6     76.65   76.65             75.70     74.75      74.05   1.65
#> 7   1273.50 1273.50           1254.35   1250.00    1236.15  18.20
#> 8     79.40   79.40             79.40     75.65      75.65   3.75
#> 9    297.30  297.30            291.45    293.80     290.40   1.05
#> 10   279.50  279.50            278.90    275.80     274.50   4.40
#> 11  1185.25 1185.25           1174.30   1180.10    1167.40   6.90
#> 12  3222.20 3222.20           3157.95   3199.00    3142.55  15.40
#> 13  1372.80 1372.80           1349.10   1351.95    1347.90   1.20
#> 14   388.00  388.00            378.50    388.00     383.05  -4.55
#> 15  3889.65 3889.65           3795.40   3864.10    3850.45 -55.05
#> 16   223.55  223.55            216.70    223.45     218.95  -2.25
#> 17   837.00  837.00            834.60    823.05     818.80  15.80
#> 18   150.70  150.70            146.90    148.95     146.85   0.05
#> 19  1453.00 1453.00           1399.95   1445.00    1399.40   0.55
#> 20  1589.75 1589.75           1570.20   1505.00    1484.50  85.70
#> 21   375.80  375.80            373.40    373.85     372.65   0.75
#> 22   199.00  199.00            196.01    198.00     190.85  -1.55
#> 23  4688.80 4688.80           4232.95   4530.45    4149.40  83.55
#> 24   258.60  258.60            254.20    256.40     253.90   0.30
#> 25   278.45  278.45            278.45    265.20     265.20  13.25
#> 26   106.00  106.00            102.10    104.75     104.00  -1.90
#> 27    59.50   59.50             59.50     56.70      56.70   2.80
#> 28   425.67  425.67            419.33    424.29     418.65   0.68
#> 29   350.59  350.59            346.14    348.59     343.53   2.61
#> 30    64.25   64.25             64.25     61.20      61.20   3.05
#> 31  1366.55 1366.55           1353.35   1358.50    1348.60   4.75
#> 32   470.00  470.00            456.15    460.00     456.30  -0.15
#> 33   204.00  204.00            201.25    194.70     194.65   6.60
#> 34   304.00  304.00            291.10    298.45     290.50   0.60
#> 35    27.00   27.00             25.30     27.00      26.40  -1.10
#> 36   180.95  180.95            180.00    176.15     173.10   6.90
#> 37    25.65   25.65             25.65     24.45      24.45   1.20
#> 38    42.65   42.65             42.00     42.25      41.90   0.10
#> 39    52.15   52.15             51.65     49.20      48.75   2.90
#> 40    39.20   39.20             38.57     39.10      38.27   0.30
#> 41    24.35   24.35             24.35     23.90      23.90   0.45
#> 42   162.75  162.75            159.25    159.75     159.00   0.25
#> 43  1912.00 1912.00           1805.35   1909.20    1857.45 -52.10
#> 44    83.20   83.20             82.75     80.75      76.90   5.85
#> 45   438.69  438.69            414.31    419.67     413.89   0.42
#> 46   399.00  399.00            397.65    391.35     388.75   8.90
#> 47   154.00  154.00            152.90    153.90     150.10   2.80
#> 48    14.65   14.65             14.50     14.15      13.70   0.80
#> 49  1030.00 1030.00           1026.45   1027.30    1016.90   9.55
#> 50  1705.00 1705.00           1685.55   1655.00    1650.00  35.55
#> 51    22.60   22.60             22.60     21.55      21.55   1.05
#> 52  1553.95 1553.95           1546.00   1543.00    1527.90  18.10
#> 53   424.40  424.40            421.40    418.30     411.05  10.35
#> 54    55.20   55.20             53.65     54.80      53.90  -0.25
#> 55   132.30  132.30            126.40    110.25     110.25  16.15
#>    percent_change
#> 1            1.20
#> 2            0.72
#> 3            9.98
#> 4            0.64
#> 5            0.29
#> 6            2.23
#> 7            1.47
#> 8            4.96
#> 9            0.36
#> 10           1.60
#> 11           0.59
#> 12           0.49
#> 13           0.09
#> 14          -1.19
#> 15          -1.43
#> 16          -1.03
#> 17           1.93
#> 18           0.03
#> 19           0.04
#> 20           5.77
#> 21           0.20
#> 22          -0.78
#> 23           2.01
#> 24           0.12
#> 25           5.00
#> 26          -1.83
#> 27           4.94
#> 28           0.16
#> 29           0.76
#> 30           4.98
#> 31           0.35
#> 32          -0.03
#> 33           3.39
#> 34           0.21
#> 35          -4.17
#> 36           3.99
#> 37           4.91
#> 38           0.24
#> 39           5.95
#> 40           0.78
#> 41           1.88
#> 42           0.16
#> 43          -2.80
#> 44           7.61
#> 45           0.10
#> 46           2.29
#> 47           1.87
#> 48           5.84
#> 49           0.94
#> 50           2.15
#> 51           4.87
#> 52           1.18
#> 53           2.52
#> 54          -0.46
#> 55          14.65

# retain original column names as returned by NSE
nse_stock_year_high(clean_names = FALSE)
#>        symbol                                       symbolDesc         dt
#> 1       ABFRL          Aditya Birla Fashion and Retail Limited 2022-10-31
#> 2      AIAENG                          AIA Engineering Limited 2022-09-21
#> 3   AXISCADES                   AXISCADES Technologies Limited 2022-10-25
#> 4  BANKBARODA                                   Bank of Baroda 2022-10-25
#> 5  BHARTIARTL                            Bharti Airtel Limited 2022-10-31
#> 6        BHEL                 Bharat Heavy Electricals Limited 2022-10-28
#> 7  BLUESTARCO                                Blue Star Limited 2022-10-31
#> 8    BOHRAIND                         Bohra Industries Limited 2022-10-31
#> 9       CANBK                                      Canara Bank 2022-10-28
#> 10   CHOICEIN                     Choice International Limited 2022-10-31
#> 11      CIPLA                                    Cipla Limited 2022-10-27
#> 12  CRAFTSMAN                     Craftsman Automation Limited 2022-10-31
#> 13 CUMMINSIND                            Cummins India Limited 2022-10-31
#> 14   DFMFOODS                                DFM Foods Limited 2022-10-28
#> 15  EICHERMOT                            Eicher Motors Limited 2022-10-31
#> 16      FOCUS              Focus Lighting and Fixtures Limited 2022-10-31
#> 17    GANECOS                        Ganesha Ecosphere Limited 2022-10-31
#> 18   GANESHBE                        Ganesh Benzoplast Limited 2022-10-31
#> 19   GOCOLORS                       Go Fashion (India) Limited 2022-10-06
#> 20 GODFRYPHLP                   Godfrey Phillips India Limited 2022-10-28
#> 21   GRANULES                           Granules India Limited 2022-10-31
#> 22 HDFCMOMENT HDFC Mutual Fund - HDFC NIFTY200 Momentum 30 ETF 2022-10-24
#> 23       ICRA                                     ICRA Limited 2022-04-11
#> 24    INDIANB                                      Indian Bank 2022-10-31
#> 25 KALYANIFRG                            Kalyani Forge Limited 2022-10-31
#> 26 KARURVYSYA                         Karur Vysya Bank Limited 2022-10-31
#> 27       KECL               Kirloskar Electric Company Limited 2022-10-31
#> 28 KOTAKBKETF                             Kotak Nifty Bank ETF 2022-10-07
#> 29 KOTAKPSUBK                         Kotak Nifty PSU Bank ETF 2022-10-28
#> 30 KSHITIJPOL                         Kshitij Polyline Limited 2022-10-31
#> 31        M&M                      Mahindra & Mahindra Limited 2022-10-31
#> 32  MAXHEALTH                 Max Healthcare Institute Limited 2022-10-31
#> 33     MEDICO                          Medico Remedies Limited 2022-10-31
#> 34   MEGASTAR                           Megastar Foods Limited 2022-10-28
#> 35    NARMADA                         Narmada Agrobase Limited 2022-10-28
#> 36       NTPC                                     NTPC Limited 2022-09-15
#> 37 OILCOUNTUB                      Oil Country Tubular Limited 2022-10-31
#> 38  ORIENTPPR                Orient Paper & Industries Limited 2022-10-27
#> 39 PDMJEPAPER                  Pudumjee Paper Products Limited 2022-10-31
#> 40 PSUBNKBEES             Nippon India ETF Nifty PSU Bank BeES 2022-10-27
#> 41   RAJRILTD                     Raj Rayon Industries Limited 2022-10-31
#> 42  RAMASTEEL                         Rama Steel Tubes Limited 2022-10-31
#> 43     SAFARI                Safari Industries (India) Limited 2022-10-06
#> 44  SECURCRED                        SecUR Credentials Limited 2022-10-31
#> 45  SETFNIFBK                               SBI-ETF Nifty Bank 2022-09-15
#> 46 SHANTIGEAR                            Shanthi Gears Limited 2022-10-31
#> 47 SHREYANIND                      Shreyans Industries Limited 2022-10-31
#> 48  SOUTHBANK                    The South Indian Bank Limited 2022-10-27
#> 49  SUNPHARMA            Sun Pharmaceutical Industries Limited 2022-10-31
#> 50 TORNTPHARM                  Torrent Pharmaceuticals Limited 2022-10-31
#> 51  TREEHOUSE       Tree House Education & Accessories Limited 2022-10-31
#> 52      TRENT                                    Trent Limited 2022-10-31
#> 53 UNICHEMLAB                     Unichem Laboratories Limited 2022-10-31
#> 54  UNIONBANK                              Union Bank of India 2021-11-09
#> 55 WEIZMANIND                                 Weizmann Limited 2022-10-31
#>      value    year     ltp value_old    prev change pChange
#> 1   359.50  359.50  358.15    355.40  353.90   4.25    1.20
#> 2  2734.45 2734.45 2701.00   2723.90 2681.75  19.25    0.72
#> 3   259.50  259.50  259.50    247.00  235.95  23.55    9.98
#> 4   151.80  151.80  148.65    151.60  147.70   0.95    0.64
#> 5   841.45  841.45  834.45    833.80  832.00   2.45    0.29
#> 6    76.65   76.65   75.70     74.75   74.05   1.65    2.23
#> 7  1273.50 1273.50 1254.35   1250.00 1236.15  18.20    1.47
#> 8    79.40   79.40   79.40     75.65   75.65   3.75    4.96
#> 9   297.30  297.30  291.45    293.80  290.40   1.05    0.36
#> 10  279.50  279.50  278.90    275.80  274.50   4.40    1.60
#> 11 1185.25 1185.25 1174.30   1180.10 1167.40   6.90    0.59
#> 12 3222.20 3222.20 3157.95   3199.00 3142.55  15.40    0.49
#> 13 1372.80 1372.80 1349.10   1351.95 1347.90   1.20    0.09
#> 14  388.00  388.00  378.50    388.00  383.05  -4.55   -1.19
#> 15 3889.65 3889.65 3795.40   3864.10 3850.45 -55.05   -1.43
#> 16  223.55  223.55  216.70    223.45  218.95  -2.25   -1.03
#> 17  837.00  837.00  834.60    823.05  818.80  15.80    1.93
#> 18  150.70  150.70  146.90    148.95  146.85   0.05    0.03
#> 19 1453.00 1453.00 1399.95   1445.00 1399.40   0.55    0.04
#> 20 1589.75 1589.75 1570.20   1505.00 1484.50  85.70    5.77
#> 21  375.80  375.80  373.40    373.85  372.65   0.75    0.20
#> 22  199.00  199.00  196.01    198.00  190.85  -1.55   -0.78
#> 23 4688.80 4688.80 4232.95   4530.45 4149.40  83.55    2.01
#> 24  258.60  258.60  254.20    256.40  253.90   0.30    0.12
#> 25  278.45  278.45  278.45    265.20  265.20  13.25    5.00
#> 26  106.00  106.00  102.10    104.75  104.00  -1.90   -1.83
#> 27   59.50   59.50   59.50     56.70   56.70   2.80    4.94
#> 28  425.67  425.67  419.33    424.29  418.65   0.68    0.16
#> 29  350.59  350.59  346.14    348.59  343.53   2.61    0.76
#> 30   64.25   64.25   64.25     61.20   61.20   3.05    4.98
#> 31 1366.55 1366.55 1353.35   1358.50 1348.60   4.75    0.35
#> 32  470.00  470.00  456.15    460.00  456.30  -0.15   -0.03
#> 33  204.00  204.00  201.25    194.70  194.65   6.60    3.39
#> 34  304.00  304.00  291.10    298.45  290.50   0.60    0.21
#> 35   27.00   27.00   25.30     27.00   26.40  -1.10   -4.17
#> 36  180.95  180.95  180.00    176.15  173.10   6.90    3.99
#> 37   25.65   25.65   25.65     24.45   24.45   1.20    4.91
#> 38   42.65   42.65   42.00     42.25   41.90   0.10    0.24
#> 39   52.15   52.15   51.65     49.20   48.75   2.90    5.95
#> 40   39.20   39.20   38.57     39.10   38.27   0.30    0.78
#> 41   24.35   24.35   24.35     23.90   23.90   0.45    1.88
#> 42  162.75  162.75  159.25    159.75  159.00   0.25    0.16
#> 43 1912.00 1912.00 1805.35   1909.20 1857.45 -52.10   -2.80
#> 44   83.20   83.20   82.75     80.75   76.90   5.85    7.61
#> 45  438.69  438.69  414.31    419.67  413.89   0.42    0.10
#> 46  399.00  399.00  397.65    391.35  388.75   8.90    2.29
#> 47  154.00  154.00  152.90    153.90  150.10   2.80    1.87
#> 48   14.65   14.65   14.50     14.15   13.70   0.80    5.84
#> 49 1030.00 1030.00 1026.45   1027.30 1016.90   9.55    0.94
#> 50 1705.00 1705.00 1685.55   1655.00 1650.00  35.55    2.15
#> 51   22.60   22.60   22.60     21.55   21.55   1.05    4.87
#> 52 1553.95 1553.95 1546.00   1543.00 1527.90  18.10    1.18
#> 53  424.40  424.40  421.40    418.30  411.05  10.35    2.52
#> 54   55.20   55.20   53.65     54.80   53.90  -0.25   -0.46
#> 55  132.30  132.30  126.40    110.25  110.25  16.15   14.65
```

##### Most actively traded stocks in a month

``` r
nse_stock_most_traded()
#>                       security share_turnover traded_quantity no_of_trades
#> 1           AMBUJA CEMENTS LTD       2.253422       5958.7059      5423278
#> 2    ADANI ENTERPRISES LIMITED       2.204980        839.3031      2664705
#> 3      RELIANCE INDUSTRIES LTD       2.190071       1188.5201      4813674
#> 4              ICICI BANK LTD.       1.690899       2575.5756      4653570
#> 5                HDFC BANK LTD       1.617889       1483.1957      3701175
#> 6        BAJAJ FINANCE LIMITED       1.380521        253.6659      2247190
#> 7         ADANI PORT & SEZ LTD       1.316899       1974.7166      2956612
#> 8            AXIS BANK LIMITED       1.237304       2178.8787      3754014
#> 9     TATA CONSULTANCY SERV LT       1.225732        539.3680      3484100
#> 10                    HDFC LTD       1.205301        681.4314      2704079
#> 11 TOTAL of Top Ten securities      16.323018      17673.3610     36402397
#> 12                       TOTAL     100.000000     626058.1869    454803193
#>    avg_daily_turnonver   turnover
#> 1            1386.8448   30510.59
#> 2            1357.0319   29854.70
#> 3            1347.8565   29652.84
#> 4            1040.6463   22894.22
#> 5             995.7127   21905.68
#> 6             849.6274   18691.80
#> 7             810.4718   17830.38
#> 8             761.4859   16752.69
#> 9             754.3642   16596.01
#> 10            741.7897   16319.37
#> 11          10045.8313  221008.29
#> 12          61543.9577 1353967.07

# retain original column names as returned by NSE
nse_stock_most_traded(clean_names = FALSE)
#>                        skipped sharetotal      trdQty nooftrades avgdailyturn
#> 1           AMBUJA CEMENTS LTD   2.253422   5958.7059    5423278    1386.8448
#> 2    ADANI ENTERPRISES LIMITED   2.204980    839.3031    2664705    1357.0319
#> 3      RELIANCE INDUSTRIES LTD   2.190071   1188.5201    4813674    1347.8565
#> 4              ICICI BANK LTD.   1.690899   2575.5756    4653570    1040.6463
#> 5                HDFC BANK LTD   1.617889   1483.1957    3701175     995.7127
#> 6        BAJAJ FINANCE LIMITED   1.380521    253.6659    2247190     849.6274
#> 7         ADANI PORT & SEZ LTD   1.316899   1974.7166    2956612     810.4718
#> 8            AXIS BANK LIMITED   1.237304   2178.8787    3754014     761.4859
#> 9     TATA CONSULTANCY SERV LT   1.225732    539.3680    3484100     754.3642
#> 10                    HDFC LTD   1.205301    681.4314    2704079     741.7897
#> 11 TOTAL of Top Ten securities  16.323018  17673.3610   36402397   10045.8313
#> 12                       TOTAL 100.000000 626058.1869  454803193   61543.9577
#>      turnover
#> 1    30510.59
#> 2    29854.70
#> 3    29652.84
#> 4    22894.22
#> 5    21905.68
#> 6    18691.80
#> 7    17830.38
#> 8    16752.69
#> 9    16596.01
#> 10   16319.37
#> 11  221008.29
#> 12 1353967.07
```

### Futures & Options

##### Top futures and options gainers for the last trading session.

``` r
nse_fo_top_gainers()
#>        symbol series last_corp_announcement_date
#> 1    DIVISLAB     EQ                  2022-08-11
#> 2    ADANIENT     EQ                  2022-07-14
#> 3  BALRAMCHIN     EQ                  2022-08-18
#> 4      AUBANK     EQ                  2022-07-28
#> 5        NTPC     EQ                  2022-08-10
#> 6        NMDC     EQ                  2022-10-27
#> 7         ABB     EQ                  2022-04-27
#> 8  METROPOLIS     EQ                  2022-08-08
#> 9        VEDL     EQ                  2022-08-03
#> 10    IPCALAB     EQ                  2022-08-03
#>                                 last_corp_announcement open_price high_price
#> 1                           Dividend - Rs 30 Per Share    3626.00    3815.00
#> 2                            Dividend - Re 1 Per Share    3361.90    3524.00
#> 3                               Annual General Meeting     317.55     331.50
#> 4                         Dividend - Rs 0.50 Per Share     593.95     616.60
#> 5                            Dividend - Rs 3 Per Share     174.00     180.95
#> 6                                             Demerger     100.00     104.70
#> 7  Annual General Meeting/Dividend - Rs 5.20 Per Share    3072.45    3194.20
#> 8                               Annual General Meeting    1698.00    1763.50
#> 9                               Annual General Meeting     281.55     288.80
#> 10                              Annual General Meeting     901.00     935.75
#>    low_price last_traded_price prev_close_price percent_change traded_quantity
#> 1    3615.05           3809.30          3608.90           5.55         1274182
#> 2    3352.00           3515.15          3347.45           5.01         1612209
#> 3     313.05            329.20           315.95           4.19         2037125
#> 4     592.00            613.10           589.55           3.99         2165308
#> 5     173.50            180.00           173.10           3.99        25811932
#> 6      98.80            103.70            99.75           3.96        11833606
#> 7    3060.00           3149.60          3049.75           3.27          307067
#> 8    1692.30           1742.35          1691.80           2.99          374389
#> 9     281.00            288.50           280.80           2.74         5577370
#> 10    901.00            929.75           905.10           2.72          215703
#>    turnover_in_lakhs
#> 1           47987.99
#> 2           55488.53
#> 3            6596.62
#> 4           13178.50
#> 5           46221.43
#> 6           12137.73
#> 7            9654.59
#> 8            6521.97
#> 9           15926.18
#> 10           1984.51

# retain original column names as returned by NSE
nse_fo_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1    DIVISLAB     EQ               2022-08-11
#> 2    ADANIENT     EQ               2022-07-14
#> 3  BALRAMCHIN     EQ               2022-08-18
#> 4      AUBANK     EQ               2022-07-28
#> 5        NTPC     EQ               2022-08-10
#> 6        NMDC     EQ               2022-10-27
#> 7         ABB     EQ               2022-04-27
#> 8  METROPOLIS     EQ               2022-08-08
#> 9        VEDL     EQ               2022-08-03
#> 10    IPCALAB     EQ               2022-08-03
#>                                   lastCorpAnnouncement openPrice highPrice
#> 1                           Dividend - Rs 30 Per Share   3626.00   3815.00
#> 2                            Dividend - Re 1 Per Share   3361.90   3524.00
#> 3                               Annual General Meeting    317.55    331.50
#> 4                         Dividend - Rs 0.50 Per Share    593.95    616.60
#> 5                            Dividend - Rs 3 Per Share    174.00    180.95
#> 6                                             Demerger    100.00    104.70
#> 7  Annual General Meeting/Dividend - Rs 5.20 Per Share   3072.45   3194.20
#> 8                               Annual General Meeting   1698.00   1763.50
#> 9                               Annual General Meeting    281.55    288.80
#> 10                              Annual General Meeting    901.00    935.75
#>    lowPrice     ltp previousPrice netPrice tradedQuantity turnoverInLakhs
#> 1   3615.05 3809.30       3608.90     5.55        1274182        47987.99
#> 2   3352.00 3515.15       3347.45     5.01        1612209        55488.53
#> 3    313.05  329.20        315.95     4.19        2037125         6596.62
#> 4    592.00  613.10        589.55     3.99        2165308        13178.50
#> 5    173.50  180.00        173.10     3.99       25811932        46221.43
#> 6     98.80  103.70         99.75     3.96       11833606        12137.73
#> 7   3060.00 3149.60       3049.75     3.27         307067         9654.59
#> 8   1692.30 1742.35       1691.80     2.99         374389         6521.97
#> 9    281.00  288.50        280.80     2.74        5577370        15926.18
#> 10   901.00  929.75        905.10     2.72         215703         1984.51
```

### Pre Open Market Data

##### Fetch data of pre open session of Nifty Bank.

``` r
nse_preopen_nifty_bank()
#>        symbol series corp_action_date
#> 1   ICICIBANK     EQ       2022-08-08
#> 2         PNB     EQ             <NA>
#> 3    AXISBANK     EQ             <NA>
#> 4  BANDHANBNK     EQ             <NA>
#> 5      AUBANK     EQ             <NA>
#> 6  FEDERALBNK     EQ             <NA>
#> 7  IDFCFIRSTB     EQ             <NA>
#> 8  BANKBARODA     EQ             <NA>
#> 9    HDFCBANK     EQ             <NA>
#> 10       SBIN     EQ             <NA>
#> 11 INDUSINDBK     EQ       2022-08-11
#> 12  KOTAKBANK     EQ       2022-08-11
#>                                            corp_action   price change
#> 1                            DIVIDEND - RS 5 PER SHARE  921.00  12.30
#> 2                                                 <NA>   43.20   0.55
#> 3                                                 <NA>  904.00  -2.00
#> 4                                                 <NA>  240.85   2.30
#> 5                                                 <NA>  593.95   4.40
#> 6                                                 <NA>  132.20   0.70
#> 7                                                 <NA>   56.40   0.30
#> 8                                                 <NA>  148.40   0.70
#> 9                                                 <NA> 1503.50   6.80
#> 10                                                <NA>  576.35   2.55
#> 11 ANNUAL GENERAL MEETING/DIVIDEND - RS 8.50 PER SHARE 1146.50   3.85
#> 12                        DIVIDEND - RS 1.10 PER SHARE 1908.00   6.05
#>    percent_change prev_close quantity   value   mkt_cap year_high year_low
#> 1            1.35     908.70   146870 1352.67 633129.85    943.25   642.15
#> 2            1.29      42.65   381701  164.89  12679.73     44.80    28.05
#> 3           -0.22     906.00   466851 4220.33 239352.21    919.95   618.25
#> 4            0.96     238.55    91874  221.28  18060.25    349.55   229.55
#> 5            0.75     589.55     5313   31.56  27857.28    732.98   462.50
#> 6            0.53     131.50    27633   36.53  26362.46    136.00    78.60
#> 7            0.53      56.10   117874   66.48  17447.89     59.45    28.95
#> 8            0.47     147.70    40906   60.70  27497.17    151.60    77.05
#> 9            0.45    1496.70   138498 2082.32 658588.06   1722.10  1271.60
#> 10           0.44     573.80    31317  180.50 220200.52    586.20   425.00
#> 11           0.34    1142.65     3018   34.60  74408.12   1275.80   763.20
#> 12           0.32    1901.95     2636   50.29 279467.74   2127.60  1631.00
#>    sum_val sum_quantity fin_quantity sum_fin_quantity
#> 1  8502.16      1284585       146870          1454491
#> 2  8502.16      1284585       381701          1454491
#> 3  8502.16      1284585       466851          1454491
#> 4  8502.16      1284585        91874          1454491
#> 5  8502.16      1284585         5313          1454491
#> 6  8502.16      1284585        27633          1454491
#> 7  8502.16      1284585       117874          1454491
#> 8  8502.16      1284585        40906          1454491
#> 9  8502.16      1284585       138498          1454491
#> 10 8502.16      1284585        31317          1454491
#> 11 8502.16      1284585         3018          1454491
#> 12 8502.16      1284585         2636          1454491

# retain original column names as returned by NSE
nse_preopen_nifty(clean_names = FALSE)
#>        symbol series        xDt
#> 1   TATASTEEL     EQ       <NA>
#> 2    RELIANCE     EQ 2022-08-18
#> 3  HINDUNILVR     EQ 2022-11-01
#> 4   ICICIBANK     EQ 2022-08-08
#> 5  APOLLOHOSP     EQ 2022-08-18
#> 6      MARUTI     EQ       <NA>
#> 7   POWERGRID     EQ 2022-08-19
#> 8         UPL     EQ       <NA>
#> 9   EICHERMOT     EQ 2022-08-12
#> 10       INFY     EQ 2022-10-27
#> 11   JSWSTEEL     EQ       <NA>
#> 12 BHARTIARTL     EQ       <NA>
#> 13   AXISBANK     EQ       <NA>
#> 14        M&M     EQ       <NA>
#> 15    HCLTECH     EQ 2022-10-19
#> 16 BAJFINANCE     EQ       <NA>
#> 17        TCS     EQ 2022-10-17
#> 18      TECHM     EQ       <NA>
#> 19       NTPC     EQ 2022-08-10
#> 20 TATAMOTORS     EQ       <NA>
#> 21  SUNPHARMA     EQ 2022-08-19
#> 22 ADANIPORTS     EQ       <NA>
#> 23 HEROMOTOCO     EQ       <NA>
#> 24   HDFCLIFE     EQ       <NA>
#> 25   DIVISLAB     EQ 2022-08-11
#> 26   HDFCBANK     EQ       <NA>
#> 27       SBIN     EQ       <NA>
#> 28         LT     EQ       <NA>
#> 29  COALINDIA     EQ 2022-08-11
#> 30   ADANIENT     EQ       <NA>
#> 31 ULTRACEMCO     EQ       <NA>
#> 32       HDFC     EQ       <NA>
#> 33 BAJAJ-AUTO     EQ       <NA>
#> 34     GRASIM     EQ 2022-08-11
#> 35      WIPRO     EQ       <NA>
#> 36 TATACONSUM     EQ       <NA>
#> 37  BRITANNIA     EQ       <NA>
#> 38 INDUSINDBK     EQ 2022-08-11
#> 39  KOTAKBANK     EQ 2022-08-11
#> 40      TITAN     EQ       <NA>
#> 41 BAJAJFINSV     EQ 2022-09-13
#> 42  NESTLEIND     EQ 2022-10-31
#> 43        ITC     EQ       <NA>
#> 44 ASIANPAINT     EQ 2022-10-31
#> 45   HINDALCO     EQ 2022-08-11
#> 46       ONGC     EQ 2022-08-18
#> 47    DRREDDY     EQ       <NA>
#> 48      CIPLA     EQ 2022-08-08
#> 49    SBILIFE     EQ       <NA>
#> 50       BPCL     EQ 2022-08-19
#>                                                                                 caAct
#> 1                                                                                <NA>
#> 2                                                           DIVIDEND - RS 8 PER SHARE
#> 3                                                  INTERIM DIVIDEND - RS 17 PER SHARE
#> 4                                                           DIVIDEND - RS 5 PER SHARE
#> 5                                ANNUAL GENERAL MEETING/DIVIDEND - RS 11.75 PER SHARE
#> 6                                                                                <NA>
#> 7                                 ANNUAL GENERAL MEETING/DIVIDEND - RS 2.25 PER SHARE
#> 8                                                                                <NA>
#> 9                                   ANNUAL GENERAL MEETING/DIVIDEND - RS 21 PER SHARE
#> 10                                              INTERIM DIVIDEND - RS 16.50 PER SHARE
#> 11                                                                               <NA>
#> 12                                                                               <NA>
#> 13                                                                               <NA>
#> 14                                                                               <NA>
#> 15                                                 INTERIM DIVIDEND - RS 10 PER SHARE
#> 16                                                                               <NA>
#> 17                                                  INTERIM DIVIDEND - RS 8 PER SHARE
#> 18                                                                               <NA>
#> 19                                                          DIVIDEND - RS 3 PER SHARE
#> 20                                                                               <NA>
#> 21                                                          DIVIDEND - RS 3 PER SHARE
#> 22                                                                               <NA>
#> 23                                                                               <NA>
#> 24                                                                               <NA>
#> 25                                                         DIVIDEND - RS 30 PER SHARE
#> 26                                                                               <NA>
#> 27                                                                               <NA>
#> 28                                                                               <NA>
#> 29                                                          DIVIDEND - RS 3 PER SHARE
#> 30                                                                               <NA>
#> 31                                                                               <NA>
#> 32                                                                               <NA>
#> 33                                                                               <NA>
#> 34 ANNUAL GENERAL MEETING/DIVIDEND - RS 5 PER SHARE/SPECIAL DIVIDEND - RS 5 PER SHARE
#> 35                                                                               <NA>
#> 36                                                                               <NA>
#> 37                                                                               <NA>
#> 38                                ANNUAL GENERAL MEETING/DIVIDEND - RS 8.50 PER SHARE
#> 39                                                       DIVIDEND - RS 1.10 PER SHARE
#> 40                                                                               <NA>
#> 41        FACE VALUE SPLIT (SUB-DIVISION) - FROM RS 5/- PER SHARE TO RE 1/- PER SHARE
#> 42                                                INTERIM DIVIDEND - RS 120 PER SHARE
#> 43                                                                               <NA>
#> 44                                               INTERIM DIVIDEND - RS 4.40 PER SHARE
#> 45                                   ANNUAL GENERAL MEETING/DIVIDEND - RS 4 PER SHARE
#> 46                                                       DIVIDEND - RS 3.25 PER SHARE
#> 47                                                                               <NA>
#> 48                                                          DIVIDEND - RS 5 PER SHARE
#> 49                                                                               <NA>
#> 50                                   ANNUAL GENERAL MEETING/DIVIDEND - RS 6 PER SHARE
#>         iep    chn perChn     pCls trdQnty    iVal    mktCap    yHigh     yLow
#> 1     98.55  -3.00  -2.95   101.55 1301278 1282.41  81910.22   138.67    82.70
#> 2   2600.00  50.40   1.98  2549.60  261154 6790.00 879696.53  2856.15  2180.00
#> 3   2569.00  35.30   1.39  2550.70   13696  351.85 227737.89  2734.00  1901.55
#> 4    921.00  12.30   1.35   908.70  146870 1352.67 633129.85   943.25   642.15
#> 5   4577.00  59.50   1.32  4517.50    2329  106.60  46117.85  5935.40  3361.55
#> 6   9635.00 107.40   1.13  9527.60    4123  397.25 126636.31  9769.00  6536.55
#> 7    230.65   2.50   1.10   228.15   52266  120.55  77981.03   248.35   180.30
#> 8    737.80   7.60   1.04   730.20   28946  213.56  38914.65   848.00   607.50
#> 9   3889.65  39.20   1.02  3850.45    4936  191.99  53699.31  3864.10  2159.55
#> 10  1553.05  15.40   1.00  1537.65   76381 1186.24 562894.54  1953.90  1355.00
#> 11   670.00  -3.95  -0.59   673.95    7808   52.31  63534.34   790.00   520.05
#> 12   828.00  -4.00  -0.48   832.00  128139 1060.99 203658.78   833.80   628.75
#> 13   904.00  -2.00  -0.22   906.00  466851 4220.33 239352.21   919.95   618.25
#> 14  1361.00  12.40   0.92  1348.60   18061  245.81 129095.85  1358.50   671.15
#> 15  1049.00   7.85   0.75  1041.15    7261   76.17 110187.96  1359.40   877.35
#> 16  7196.95  52.85   0.74  7144.10    4674  336.39 190310.87  8045.00  5220.00
#> 17  3214.50  21.35   0.67  3193.15   15797  507.79 327149.20  4043.00  2926.10
#> 18  1069.00   5.60   0.53  1063.40    7769   83.05  67265.75  1838.00   943.70
#> 19   174.00   0.90   0.52   173.10   23211   40.39  82246.15   176.15   119.10
#> 20   414.90   2.15   0.52   412.75   51706  214.53  74024.01   536.70   366.20
#> 21  1021.95   5.05   0.50  1016.90    4081   41.71 109794.77  1027.30   733.70
#> 22   827.70   4.15   0.50   823.55   18073  149.59  59147.93   987.85   651.95
#> 23  2690.25  13.40   0.50  2676.85     401   10.79  34768.12  2938.60  2146.85
#> 24   543.05   2.60   0.48   540.45    3621   19.66  51104.09   723.95   497.05
#> 25  3626.00  17.10   0.47  3608.90     529   19.18  45986.38  5285.05  3365.55
#> 26  1503.50   6.80   0.45  1496.70  138498 2082.32 658588.06  1722.10  1271.60
#> 27   576.35   2.55   0.44   573.80   31317  180.50 220200.52   586.20   425.00
#> 28  2032.00   8.90   0.44  2023.10   67974 1381.23 244484.44  2078.55  1456.35
#> 29   247.00   1.05   0.43   245.95   10415   25.73  51534.58   247.80   139.15
#> 30  3361.90  14.45   0.43  3347.45    2111   70.97  91586.32  3885.00  1411.20
#> 31  6743.95  29.00   0.43  6714.95    1052   70.95  77536.70  8269.00  5157.05
#> 32  2480.00  10.20   0.41  2469.80   24488  607.30 447911.99  3021.10  2026.00
#> 33  3686.55  14.70   0.40  3671.85     209    7.70  47074.21  4131.75  3027.05
#> 34  1728.20   6.50   0.38  1721.70     565    9.76  64605.04  1929.80  1276.60
#> 35   388.00   1.45   0.38   386.55   13762   53.40  57250.99   726.80   372.40
#> 36   773.00   2.85   0.37   770.15    2148   16.60  46132.65   861.15   650.20
#> 37  3780.00  13.45   0.36  3766.55     273   10.32  44454.88  3949.35  3050.00
#> 38  1146.50   3.85   0.34  1142.65    3018   34.60  74408.12  1275.80   763.20
#> 39  1908.00   6.05   0.32  1901.95    2636   50.29 279467.74  2127.60  1631.00
#> 40  2770.15   8.65   0.31  2761.50    1487   41.19 115226.21  2791.00  1825.05
#> 41  1692.00   4.50   0.27  1687.50    4293   72.64 102139.29  1862.10  1072.72
#> 42 20399.55  36.15   0.18 20363.40      54   11.02  72644.02 21050.00 16000.00
#> 43   349.25   0.55   0.16   348.70   20327   70.99 306975.15   353.20   207.00
#> 44  3110.50   2.80   0.09  3107.70    2378   73.97 140102.25  3590.00  2560.00
#> 45   406.00   0.35   0.09   405.65    8925   36.24  59251.83   636.00   308.95
#> 46   134.10   0.05   0.04   134.05   27056   36.28  52277.98   194.95   119.85
#> 47  4435.25   1.55   0.03  4433.70    1581   70.12  53872.72  4931.05  3654.00
#> 48  1167.50   0.10   0.01  1167.40    1980   23.12  63120.28  1180.10   850.00
#> 49  1265.95   0.00   0.00  1265.95     486    6.15  57008.41  1340.35  1003.50
#> 50   303.65   0.00   0.00   303.65   12517   38.01  28982.52   434.00   288.05
#>      sumVal sumQnty finQnty sumfinQnty
#> 1  24153.21 2762297 1301278    3029511
#> 2  24153.21 2762297  261154    3029511
#> 3  24153.21 2762297   13696    3029511
#> 4  24153.21 2762297  146870    3029511
#> 5  24153.21 2762297    2329    3029511
#> 6  24153.21 2762297    4123    3029511
#> 7  24153.21 2762297   52266    3029511
#> 8  24153.21 2762297   28946    3029511
#> 9  24153.21 2762297    4936    3029511
#> 10 24153.21 2762297   76381    3029511
#> 11 24153.21 2762297    7808    3029511
#> 12 24153.21 2762297  128139    3029511
#> 13 24153.21 2762297  466851    3029511
#> 14 24153.21 2762297   18061    3029511
#> 15 24153.21 2762297    7261    3029511
#> 16 24153.21 2762297    4674    3029511
#> 17 24153.21 2762297   15797    3029511
#> 18 24153.21 2762297    7769    3029511
#> 19 24153.21 2762297   23211    3029511
#> 20 24153.21 2762297   51706    3029511
#> 21 24153.21 2762297    4081    3029511
#> 22 24153.21 2762297   18073    3029511
#> 23 24153.21 2762297     401    3029511
#> 24 24153.21 2762297    3621    3029511
#> 25 24153.21 2762297     529    3029511
#> 26 24153.21 2762297  138498    3029511
#> 27 24153.21 2762297   31317    3029511
#> 28 24153.21 2762297   67974    3029511
#> 29 24153.21 2762297   10415    3029511
#> 30 24153.21 2762297    2111    3029511
#> 31 24153.21 2762297    1052    3029511
#> 32 24153.21 2762297   24488    3029511
#> 33 24153.21 2762297     209    3029511
#> 34 24153.21 2762297     565    3029511
#> 35 24153.21 2762297   13762    3029511
#> 36 24153.21 2762297    2148    3029511
#> 37 24153.21 2762297     273    3029511
#> 38 24153.21 2762297    3018    3029511
#> 39 24153.21 2762297    2636    3029511
#> 40 24153.21 2762297    1487    3029511
#> 41 24153.21 2762297    4293    3029511
#> 42 24153.21 2762297      54    3029511
#> 43 24153.21 2762297   20327    3029511
#> 44 24153.21 2762297    2378    3029511
#> 45 24153.21 2762297    8925    3029511
#> 46 24153.21 2762297   27056    3029511
#> 47 24153.21 2762297    1581    3029511
#> 48 24153.21 2762297    1980    3029511
#> 49 24153.21 2762297     486    3029511
#> 50 24153.21 2762297   12517    3029511
```

### Advances & Declines

``` r
nse_advances_declines()
#>                                     index_name advances declines unchanged
#> 1                                     NIFTY 50       40       10         0
#> 2                                NIFTY NEXT 50       39       11         0
#> 3                                     NIFTY IT       10        0         0
#> 4                                   NIFTY BANK        9        3         0
#> 5                              NIFTY MIDCAP 50       37       13         0
#> 6                                  NIFTY INFRA       23        7         0
#> 7                                 NIFTY REALTY        6        4         0
#> 8                                 NIFTY ENERGY        7        3         0
#> 9                                   NIFTY FMCG       13        2         0
#> 10                                   NIFTY MNC       23        7         0
#> 11                                NIFTY PHARMA       18        2         0
#> 12                                   NIFTY PSE       14        6         0
#> 13                              NIFTY PSU BANK        8        3         1
#> 14                           NIFTY SERV SECTOR       23        7         0
#> 15                           NIFTY COMMODITIES       22        8         0
#> 16                           NIFTY CONSUMPTION       22        8         0
#> 17                           NIFTY FIN SERVICE       14        6         0
#> 18                                  NIFTY AUTO        9        6         0
#> 19                           NIFTY DIV OPPS 50       36       14         0
#> 20                                 NIFTY MEDIA        2        8         0
#> 21                                 NIFTY METAL        9        6         0
#> 22                             NIFTY100 LIQ 15       10        5         0
#> 23                                  NIFTY CPSE        9        2         0
#> 24                           NIFTY GROWSECT 15       13        2         0
#> 25                            NIFTY50 VALUE 20       17        3         0
#> 26                           NIFTY100 QUALTY30       23        7         0
#> 27                              NIFTY PVT BANK        6        4         0
#> 28                            NIFTY MID LIQ 15       11        4         0
#> 29                                   NIFTY 100       79       21         0
#> 30                                   NIFTY 200      151       49         0
#> 31                                   NIFTY 500      328      168         5
#> 32                            NIFTY MIDCAP 100       72       28         0
#> 33                            NIFTY SMLCAP 100       61       37         2
#> 34                    NIFTY ADITYA BIRLA GROUP        8        0         0
#> 35                              NIFTY ALPHA 50       33       17         0
#> 36                          NIFTY HIGH BETA 50       37       13         0
#> 37                     NIFTY LOW VOLATILITY 50       42        7         1
#> 38                        NIFTY MAHINDRA GROUP        6        3         0
#> 39                            NIFTY MIDCAP 150      107       42         1
#> 40                       NIFTY MIDSMALLCAP 400      248      147         5
#> 41                            NIFTY SHARIAH 25       20        5         0
#> 42                          NIFTY SMALLCAP 250      141      105         4
#> 43                           NIFTY SMALLCAP 50       34       16         0
#> 44                            NIFTY TATA GROUP       16        8         0
#> 45                    NIFTY TATA GROUP 25% CAP        7        3         0
#> 46                            NIFTY100 EQL WGT       79       21         0
#> 47                           NIFTY100 LOWVOL30       27        3         0
#> 48                             NIFTY50 SHARIAH       18        4         0
#> 49                            NIFTY500 SHARIAH      154       84         1
#> 50                             NIFTY50 EQL WGT       40       10         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       25        5         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       26        4         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30       24        6         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30       25        5         0
#> 55                       NIFTY LARGEMIDCAP 250      186       63         1
#> 56                           NIFTY500 VALUE 50       32       18         0
#> 57                            NIFTY MIDCAP 150      107       42         1
#> 58                             NIFTY SMLCAP 50       34       16         0
#> 59                            NIFTY SMLCAP 250      141      105         4
#> 60                            NIFTY MIDSML 400      248      147         5
#> 61                           NIFTY200 QUALTY30       24        6         0
#> 62                           NIFTY FINSRV25 50       14        6         0
#> 63                           NIFTY ALPHALOWVOL       25        5         0
#> 64                           NIFTY200MOMENTM30       23        7         0
#> 65                            NIFTY HEALTHCARE       18        2         0
#> 66                           NIFTY CONSR DURBL       12        3         0
#> 67                           NIFTY OIL AND GAS        9        6         0
#> 68                           NIFTY500 MULTICAP      328      168         5
#> 69                           NIFTY LARGEMID250      186       63         1
#> 70                            NIFTY MID SELECT       18        7         0
#> 71                             NIFTY TOTAL MKT      466      273        12
#> 72                           NIFTY MICROCAP250      138      105         7
#> 73                           NIFTY IND DIGITAL       26        4         0
#> 74                                NIFTY100 ESG       63       19         0
#> 75                          CNX NIFTY Pre Open       44        4         2

# retain original column names as returned by NSE
nse_advances_declines(clean_names = FALSE)
#>                                        skipped advances declines unchanged
#> 1                                     NIFTY 50       40       10         0
#> 2                                NIFTY NEXT 50       39       11         0
#> 3                                     NIFTY IT       10        0         0
#> 4                                   NIFTY BANK        9        3         0
#> 5                              NIFTY MIDCAP 50       37       13         0
#> 6                                  NIFTY INFRA       23        7         0
#> 7                                 NIFTY REALTY        6        4         0
#> 8                                 NIFTY ENERGY        7        3         0
#> 9                                   NIFTY FMCG       13        2         0
#> 10                                   NIFTY MNC       23        7         0
#> 11                                NIFTY PHARMA       18        2         0
#> 12                                   NIFTY PSE       14        6         0
#> 13                              NIFTY PSU BANK        8        3         1
#> 14                           NIFTY SERV SECTOR       23        7         0
#> 15                           NIFTY COMMODITIES       22        8         0
#> 16                           NIFTY CONSUMPTION       22        8         0
#> 17                           NIFTY FIN SERVICE       14        6         0
#> 18                                  NIFTY AUTO        9        6         0
#> 19                           NIFTY DIV OPPS 50       36       14         0
#> 20                                 NIFTY MEDIA        2        8         0
#> 21                                 NIFTY METAL        9        6         0
#> 22                             NIFTY100 LIQ 15       10        5         0
#> 23                                  NIFTY CPSE        9        2         0
#> 24                           NIFTY GROWSECT 15       13        2         0
#> 25                            NIFTY50 VALUE 20       17        3         0
#> 26                           NIFTY100 QUALTY30       23        7         0
#> 27                              NIFTY PVT BANK        6        4         0
#> 28                            NIFTY MID LIQ 15       11        4         0
#> 29                                   NIFTY 100       79       21         0
#> 30                                   NIFTY 200      151       49         0
#> 31                                   NIFTY 500      328      168         5
#> 32                            NIFTY MIDCAP 100       72       28         0
#> 33                            NIFTY SMLCAP 100       61       37         2
#> 34                    NIFTY ADITYA BIRLA GROUP        8        0         0
#> 35                              NIFTY ALPHA 50       33       17         0
#> 36                          NIFTY HIGH BETA 50       37       13         0
#> 37                     NIFTY LOW VOLATILITY 50       42        7         1
#> 38                        NIFTY MAHINDRA GROUP        6        3         0
#> 39                            NIFTY MIDCAP 150      107       42         1
#> 40                       NIFTY MIDSMALLCAP 400      248      147         5
#> 41                            NIFTY SHARIAH 25       20        5         0
#> 42                          NIFTY SMALLCAP 250      141      105         4
#> 43                           NIFTY SMALLCAP 50       34       16         0
#> 44                            NIFTY TATA GROUP       16        8         0
#> 45                    NIFTY TATA GROUP 25% CAP        7        3         0
#> 46                            NIFTY100 EQL WGT       79       21         0
#> 47                           NIFTY100 LOWVOL30       27        3         0
#> 48                             NIFTY50 SHARIAH       18        4         0
#> 49                            NIFTY500 SHARIAH      154       84         1
#> 50                             NIFTY50 EQL WGT       40       10         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30       25        5         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       26        4         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30       24        6         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30       25        5         0
#> 55                       NIFTY LARGEMIDCAP 250      186       63         1
#> 56                           NIFTY500 VALUE 50       32       18         0
#> 57                            NIFTY MIDCAP 150      107       42         1
#> 58                             NIFTY SMLCAP 50       34       16         0
#> 59                            NIFTY SMLCAP 250      141      105         4
#> 60                            NIFTY MIDSML 400      248      147         5
#> 61                           NIFTY200 QUALTY30       24        6         0
#> 62                           NIFTY FINSRV25 50       14        6         0
#> 63                           NIFTY ALPHALOWVOL       25        5         0
#> 64                           NIFTY200MOMENTM30       23        7         0
#> 65                            NIFTY HEALTHCARE       18        2         0
#> 66                           NIFTY CONSR DURBL       12        3         0
#> 67                           NIFTY OIL AND GAS        9        6         0
#> 68                           NIFTY500 MULTICAP      328      168         5
#> 69                           NIFTY LARGEMID250      186       63         1
#> 70                            NIFTY MID SELECT       18        7         0
#> 71                             NIFTY TOTAL MKT      466      273        12
#> 72                           NIFTY MICROCAP250      138      105         7
#> 73                           NIFTY IND DIGITAL       26        4         0
#> 74                                NIFTY100 ESG       63       19         0
#> 75                          CNX NIFTY Pre Open       44        4         2
```
