
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nse2r

> Fetch data from the National Stock Exchange, India.

<!-- badges: start -->

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/nse2r)](https://cran.r-project.org/package=nse2r)
[![cran
checks](https://cranchecks.info/badges/summary/nse2r)](https://cran.r-project.org/web/checks/check_results_nse2r.html)
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
#>           index_name last_traded_price  change percent_change
#> 1  NIFTY 50 Pre Open        18044.3500 -112.65          -0.62
#> 2           NIFTY 50        18028.2000 -128.80          -0.71
#> 3      NIFTY NEXT 50        42778.1000 -421.60          -0.98
#> 4    NIFTY100 LIQ 15         4697.0500  -69.60          -1.46
#> 5         NIFTY BANK        41603.7500 -179.45          -0.43
#> 6          INDIA VIX           15.5675   -0.35          -2.18
#> 7          NIFTY 100        18267.1000 -139.15          -0.76
#> 8          NIFTY 500        15440.0000 -127.25          -0.82
#> 9   NIFTY MIDCAP 100        31358.6500 -367.65          -1.16
#> 10   NIFTY MIDCAP 50         8675.0500  -85.25          -0.97
#> 11       NIFTY INFRA         5222.0000  -41.90          -0.80
#> 12      NIFTY REALTY          440.9000   -0.65          -0.15
#> 13      NIFTY ENERGY        26712.2500 -229.35          -0.85
#> 14        NIFTY FMCG        44586.9000 -239.65          -0.53
#> 15         NIFTY MNC        20029.1500 -107.75          -0.54
#> 16      NIFTY PHARMA        12983.1000  -96.40          -0.74
#> 17         NIFTY PSE         4276.2500  -36.75          -0.85
#> 18    NIFTY PSU BANK         3786.0000  -49.20          -1.28
#> 19 NIFTY SERV SECTOR        24691.7500 -119.80          -0.48
#> 20          NIFTY IT        28505.7500 -121.05          -0.42
#> 21  NIFTY SMLCAP 100         9668.6000 -112.90          -1.15
#> 22         NIFTY 200         9552.4000  -77.75          -0.81
#> 23        NIFTY AUTO        13080.7500 -260.65          -1.95
#> 24       NIFTY MEDIA         2088.8000   -9.90          -0.47
#> 25       NIFTY METAL         6318.7500  -45.30          -0.71
#> 26 NIFTY DIV OPPS 50         3750.0500  -25.55          -0.68
#> 27 NIFTY COMMODITIES         5873.7500  -76.00          -1.28
#> 28 NIFTY CONSUMPTION         7840.7500  -62.95          -0.80
#> 29        NIFTY CPSE         2809.6500  -19.50          -0.69
#> 30 NIFTY FIN SERVICE        18604.6000  -84.75          -0.45
#> 31 NIFTY GROWSECT 15         8949.1500  -81.70          -0.90
#> 32  NIFTY50 VALUE 20         9007.2500  -58.00          -0.64
#> 33 NIFTY50 TR 2X LEV        12440.8000 -181.10          -1.43
#> 34 NIFTY50 PR 2X LEV         8911.4500 -129.75          -1.44
#> 35 NIFTY50 TR 1X INV          210.7000    1.55           0.74
#> 36 NIFTY50 PR 1X INV          248.7500    1.80           0.73
#> 37    NIFTY ALPHA 50        30716.7500 -389.05          -1.25
#> 38   NIFTY50 EQL WGT        20572.0500 -183.35          -0.88
#> 39  NIFTY100 EQL WGT        20853.9500 -197.55          -0.94
#> 40 NIFTY100 LOWVOL30        13214.4500  -61.30          -0.46
#> 41  NIFTY MID LIQ 15         7692.3500 -108.00          -1.38
#> 42    NIFTY PVT BANK        21146.4500  -72.65          -0.34
#> 43 NIFTY100 QUALTY30         3920.3500  -19.80          -0.50
#> 44   NIFTY GS 8 13YR         2307.3400    7.00           0.30
#> 45     NIFTY GS 10YR         2043.1300    5.99           0.29
#> 46 NIFTY GS 10YR CLN          863.3300    2.40           0.28
#> 47    NIFTY GS 4 8YR         2514.3200    6.34           0.25
#> 48  NIFTY GS 11 15YR         2511.7900   10.10           0.40
#> 49 NIFTY GS 15YRPLUS         2717.8500    6.83           0.25
#> 50 NIFTY GS COMPSITE         2381.6200    8.18           0.34
#> 51  NIFTY MIDCAP 150        11881.9500 -109.30          -0.91
#> 52   NIFTY SMLCAP 50         4285.4000  -58.85          -1.35
#> 53  NIFTY SMLCAP 250         9359.5000 -116.35          -1.23
#> 54  NIFTY MIDSML 400        10976.5000 -112.65          -1.02
#> 55 NIFTY200 QUALTY30        14520.1000  -49.00          -0.34

# retain original column names as returned by NSE
nse_index_quote(clean_names = FALSE)
#>              skipped  lastPrice  change pChange
#> 1  NIFTY 50 Pre Open 18044.3500 -112.65   -0.62
#> 2           NIFTY 50 18028.2000 -128.80   -0.71
#> 3      NIFTY NEXT 50 42778.1000 -421.60   -0.98
#> 4    NIFTY100 LIQ 15  4697.0500  -69.60   -1.46
#> 5         NIFTY BANK 41603.7500 -179.45   -0.43
#> 6          INDIA VIX    15.5675   -0.35   -2.18
#> 7          NIFTY 100 18267.1000 -139.15   -0.76
#> 8          NIFTY 500 15440.0000 -127.25   -0.82
#> 9   NIFTY MIDCAP 100 31358.6500 -367.65   -1.16
#> 10   NIFTY MIDCAP 50  8675.0500  -85.25   -0.97
#> 11       NIFTY INFRA  5222.0000  -41.90   -0.80
#> 12      NIFTY REALTY   440.9000   -0.65   -0.15
#> 13      NIFTY ENERGY 26712.2500 -229.35   -0.85
#> 14        NIFTY FMCG 44586.9000 -239.65   -0.53
#> 15         NIFTY MNC 20029.1500 -107.75   -0.54
#> 16      NIFTY PHARMA 12983.1000  -96.40   -0.74
#> 17         NIFTY PSE  4276.2500  -36.75   -0.85
#> 18    NIFTY PSU BANK  3786.0000  -49.20   -1.28
#> 19 NIFTY SERV SECTOR 24691.7500 -119.80   -0.48
#> 20          NIFTY IT 28505.7500 -121.05   -0.42
#> 21  NIFTY SMLCAP 100  9668.6000 -112.90   -1.15
#> 22         NIFTY 200  9552.4000  -77.75   -0.81
#> 23        NIFTY AUTO 13080.7500 -260.65   -1.95
#> 24       NIFTY MEDIA  2088.8000   -9.90   -0.47
#> 25       NIFTY METAL  6318.7500  -45.30   -0.71
#> 26 NIFTY DIV OPPS 50  3750.0500  -25.55   -0.68
#> 27 NIFTY COMMODITIES  5873.7500  -76.00   -1.28
#> 28 NIFTY CONSUMPTION  7840.7500  -62.95   -0.80
#> 29        NIFTY CPSE  2809.6500  -19.50   -0.69
#> 30 NIFTY FIN SERVICE 18604.6000  -84.75   -0.45
#> 31 NIFTY GROWSECT 15  8949.1500  -81.70   -0.90
#> 32  NIFTY50 VALUE 20  9007.2500  -58.00   -0.64
#> 33 NIFTY50 TR 2X LEV 12440.8000 -181.10   -1.43
#> 34 NIFTY50 PR 2X LEV  8911.4500 -129.75   -1.44
#> 35 NIFTY50 TR 1X INV   210.7000    1.55    0.74
#> 36 NIFTY50 PR 1X INV   248.7500    1.80    0.73
#> 37    NIFTY ALPHA 50 30716.7500 -389.05   -1.25
#> 38   NIFTY50 EQL WGT 20572.0500 -183.35   -0.88
#> 39  NIFTY100 EQL WGT 20853.9500 -197.55   -0.94
#> 40 NIFTY100 LOWVOL30 13214.4500  -61.30   -0.46
#> 41  NIFTY MID LIQ 15  7692.3500 -108.00   -1.38
#> 42    NIFTY PVT BANK 21146.4500  -72.65   -0.34
#> 43 NIFTY100 QUALTY30  3920.3500  -19.80   -0.50
#> 44   NIFTY GS 8 13YR  2307.3400    7.00    0.30
#> 45     NIFTY GS 10YR  2043.1300    5.99    0.29
#> 46 NIFTY GS 10YR CLN   863.3300    2.40    0.28
#> 47    NIFTY GS 4 8YR  2514.3200    6.34    0.25
#> 48  NIFTY GS 11 15YR  2511.7900   10.10    0.40
#> 49 NIFTY GS 15YRPLUS  2717.8500    6.83    0.25
#> 50 NIFTY GS COMPSITE  2381.6200    8.18    0.34
#> 51  NIFTY MIDCAP 150 11881.9500 -109.30   -0.91
#> 52   NIFTY SMLCAP 50  4285.4000  -58.85   -1.35
#> 53  NIFTY SMLCAP 250  9359.5000 -116.35   -1.23
#> 54  NIFTY MIDSML 400 10976.5000 -112.65   -1.02
#> 55 NIFTY200 QUALTY30 14520.1000  -49.00   -0.34
```

### Stock

##### Top gainers for the last trading session.

``` r
nse_stock_top_gainers()
#>        symbol series last_corp_announcement_date
#> 1  HEROMOTOCO     EQ                  2022-07-27
#> 2    HDFCBANK     EQ                  2022-05-12
#> 3   KOTAKBANK     EQ                  2022-08-11
#> 4        ONGC     EQ                  2022-08-18
#> 5  BHARTIARTL     EQ                  2022-08-01
#> 6         UPL     EQ                  2022-07-27
#> 7  ADANIPORTS     EQ                  2022-07-14
#> 8     DRREDDY     EQ                  2022-07-11
#> 9  HINDUNILVR     EQ                  2022-11-01
#> 10       HDFC     EQ                  2022-05-31
#>                                last_corp_announcement open_price high_price
#> 1  Annual General Meeting/Dividend - Rs  35 Per Share    2651.45    2722.00
#> 2                       Dividend - Rs 15.50 Per Share    1497.10    1527.00
#> 3                        Dividend - Rs 1.10 Per Share    1895.00    1915.00
#> 4                        Dividend - Rs 3.25 Per Share     137.50     140.85
#> 5                           Dividend - Rs 3 Per Share     819.80     830.70
#> 6                          Dividend - Rs 10 Per Share     754.95     758.60
#> 7                           Dividend - Rs 5 Per Share     894.00     898.00
#> 8   Annual General Meeting/Dividend - Rs 30 Per Share    4539.95    4616.00
#> 9                  Interim Dividend - Rs 17 Per Share    2504.00    2538.00
#> 10                         Dividend - Rs 30 Per Share    2480.20    2508.40
#>    low_price last_traded_price prev_close_price percent_change traded_quantity
#> 1    2626.35            2715.0          2651.50           2.39          706321
#> 2    1495.05            1527.0          1508.35           1.24         6387091
#> 3    1891.70            1913.6          1893.40           1.07         2510124
#> 4     137.40             139.9           138.65           0.90        15908521
#> 5     817.55             826.0           819.05           0.85         4425290
#> 6     748.05             757.0           753.60           0.45         4929698
#> 7     876.30             894.0           890.80           0.36         9906420
#> 8    4528.00            4550.0          4534.90           0.33          591953
#> 9    2501.05            2515.4          2508.80           0.26         1459152
#> 10   2467.80            2506.0          2503.50           0.10         2403520
#>    turnover_in_lakhs
#> 1           18989.16
#> 2           96531.94
#> 3           47793.51
#> 4           22174.89
#> 5           36499.79
#> 6           37132.46
#> 7           87915.51
#> 8           27035.62
#> 9           36734.59
#> 10          59829.38

# retain original column names as returned by NSE
nse_stock_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1  HEROMOTOCO     EQ               2022-07-27
#> 2    HDFCBANK     EQ               2022-05-12
#> 3   KOTAKBANK     EQ               2022-08-11
#> 4        ONGC     EQ               2022-08-18
#> 5  BHARTIARTL     EQ               2022-08-01
#> 6         UPL     EQ               2022-07-27
#> 7  ADANIPORTS     EQ               2022-07-14
#> 8     DRREDDY     EQ               2022-07-11
#> 9  HINDUNILVR     EQ               2022-11-01
#> 10       HDFC     EQ               2022-05-31
#>                                  lastCorpAnnouncement openPrice highPrice
#> 1  Annual General Meeting/Dividend - Rs  35 Per Share   2651.45   2722.00
#> 2                       Dividend - Rs 15.50 Per Share   1497.10   1527.00
#> 3                        Dividend - Rs 1.10 Per Share   1895.00   1915.00
#> 4                        Dividend - Rs 3.25 Per Share    137.50    140.85
#> 5                           Dividend - Rs 3 Per Share    819.80    830.70
#> 6                          Dividend - Rs 10 Per Share    754.95    758.60
#> 7                           Dividend - Rs 5 Per Share    894.00    898.00
#> 8   Annual General Meeting/Dividend - Rs 30 Per Share   4539.95   4616.00
#> 9                  Interim Dividend - Rs 17 Per Share   2504.00   2538.00
#> 10                         Dividend - Rs 30 Per Share   2480.20   2508.40
#>    lowPrice    ltp previousPrice netPrice tradedQuantity turnoverInLakhs
#> 1   2626.35 2715.0       2651.50     2.39         706321        18989.16
#> 2   1495.05 1527.0       1508.35     1.24        6387091        96531.94
#> 3   1891.70 1913.6       1893.40     1.07        2510124        47793.51
#> 4    137.40  139.9        138.65     0.90       15908521        22174.89
#> 5    817.55  826.0        819.05     0.85        4425290        36499.79
#> 6    748.05  757.0        753.60     0.45        4929698        37132.46
#> 7    876.30  894.0        890.80     0.36        9906420        87915.51
#> 8   4528.00 4550.0       4534.90     0.33         591953        27035.62
#> 9   2501.05 2515.4       2508.80     0.26        1459152        36734.59
#> 10  2467.80 2506.0       2503.50     0.10        2403520        59829.38
```

##### Stocks that have touched their 52 week highs during the day

``` r
nse_stock_year_high()
#>        symbol                                                       symbol_desc
#> 1     ACCELYA                                   Accelya Solutions India Limited
#> 2    ANANTRAJ                                                 Anant Raj Limited
#> 3   AXISCADES                                    AXISCADES Technologies Limited
#> 4  BANKBARODA                                                    Bank of Baroda
#> 5  BECTORFOOD                            Mrs. Bectors Food Specialities Limited
#> 6     BIGBLOC                                      Bigbloc Construction Limited
#> 7    BOHRAIND                                          Bohra Industries Limited
#> 8         BSL                                                       BSL Limited
#> 9  CORDSCABLE                                    Cords Cable Industries Limited
#> 10  CRAFTSMAN                                      Craftsman Automation Limited
#> 11        DCI                             Dc Infotech And Communication Limited
#> 12 DSPSILVETF                                 DSP  Mutual Fund - DSP Silver ETF
#> 13     ELECON                                Elecon Engineering Company Limited
#> 14 FEDERALBNK                                         The Federal Bank  Limited
#> 15      FOCUS                               Focus Lighting and Fixtures Limited
#> 16 GILT5YBEES                        NIPPON INDIA ETF NIFTY 5 YR BENCHMARK GSEC
#> 17    HARDWYN                                             Hardwyn India Limited
#> 18 HDFCSENETF                                HDFC Mutual Fund - HDFC SENSEX ETF
#> 19     HILTON                                      Hilton Metal Forging Limited
#> 20     HLVLTD                                                       HLV LIMITED
#> 21       HPIL                                    Hindprakash Industries Limited
#> 22    ICEMAKE                                    Ice Make Refrigeration Limited
#> 23 ICICINXT50 ICICI Prudential Mutual Fund - ICICI Prudential Nifty Next 50 ETF
#> 24    INDIANB                                                       Indian Bank
#> 25 INDRAMEDCO                          Indraprastha Medical Corporation Limited
#> 26 IONEXCHANG                                      ION Exchange (India) Limited
#> 27 JAIPURKURT                                          Nandani Creation Limited
#> 28 JMCPROJECT                                     JMC Projects (India)  Limited
#> 29   JTLINFRA                                                 JTL Infra Limited
#> 30 KHAITANLTD                                           Khaitan (India) Limited
#> 31 KOTAKPSUBK                                          Kotak Nifty PSU Bank ETF
#> 32   KRITINUT                                           Kriti Nutrients Limited
#> 33  LAXMIMACH                                     Lakshmi Machine Works Limited
#> 34   LIKHITHA                                   Likhitha Infrastructure Limited
#> 35       LINC                                                      Linc Limited
#> 36     MAGNUM                                           Magnum Ventures Limited
#> 37 MASKINVEST                                          Mask Investments Limited
#> 38 MID150BEES                                 NIPPON INDIA ETF NIFTY MIDCAP 150
#> 39     MPSLTD                                                       MPS Limited
#> 40         NH                                         Narayana Hrudayalaya Ltd.
#> 41 OILCOUNTUB                                       Oil Country Tubular Limited
#> 42  ORIENTHOT                                           Oriental Hotels Limited
#> 43 PARACABLES                                  Paramount Communications Limited
#> 44     PENIND                                         Pennar Industries Limited
#> 45    RAINBOW                                Rainbow Childrens Medicare Limited
#> 46   RAJRILTD                                      Raj Rayon Industries Limited
#> 47      REFEX                                          Refex Industries Limited
#> 48    RPGLIFE                                         RPG Life Sciences Limited
#> 49     SAFARI                                 Safari Industries (India) Limited
#> 50 SHREYANIND                                       Shreyans Industries Limited
#> 51 SHRIPISTON                                   Shriram Pistons & Rings Limited
#> 52      SIKKO                                          Sikko Industries Limited
#> 53  SOLARINDS                                    Solar Industries India Limited
#> 54    SPCENET                                Spacenet Enterprises India Limited
#> 55      SUMIT                                               Sumit Woods Limited
#> 56  UNIONBANK                                               Union Bank of India
#> 57 UTIBANKETF                                                UTI Nifty Bank ETF
#> 58     VGUARD                                        V-Guard Industries Limited
#> 59  ZYDUSLIFE                                        Zydus Lifesciences Limited
#>          date new_high     year last_traded_price prev_high prev_close  change
#> 1  2022-11-09  1492.00  1492.00           1484.00   1435.00    1395.45   88.55
#> 2  2022-11-09   117.95   117.95            114.80    117.90     115.40   -0.60
#> 3  2022-11-09   368.05   368.05            368.05    351.40     350.55   17.50
#> 4  2022-11-09   168.15   168.15            165.55    167.00     166.30   -0.75
#> 5  2021-11-09   424.00   424.00            402.00    424.00     414.80  -12.80
#> 6  2022-09-21   158.15   158.15            157.10    152.30     150.65    6.45
#> 7  2022-11-09   106.25   106.25            106.25    101.20     101.20    5.05
#> 8  2022-10-04   175.40   175.40            168.00    169.65     146.20   21.80
#> 9  2022-01-11    76.40    76.40             73.90     73.90      72.10    1.80
#> 10 2022-11-09  3442.95  3442.95           3370.00   3379.45    3332.80   37.20
#> 11 2022-11-09   151.45   151.45            151.45    144.25     144.25    7.20
#> 12 2022-11-09    63.90    63.90             61.01     62.00      61.42    0.00
#> 13 2022-11-09   449.45   449.45            443.75    439.55     435.25    8.50
#> 14 2022-11-07   139.70   139.70            138.00    139.25     138.10   -0.10
#> 15 2022-11-09   269.70   269.70            251.95    259.95     259.20   -7.25
#> 16 2022-09-29    54.99    54.99             49.74     50.25      49.58    0.16
#> 17 2022-11-09   329.80   329.80            329.80    314.10     314.10   15.70
#> 18 2022-11-09   709.99   709.99            657.99    699.70     663.70   -5.71
#> 19 2022-10-07    82.65    82.65             75.90     80.85      78.75   -2.85
#> 20 2022-11-09    13.00    13.00             11.70     12.35      12.20   -0.50
#> 21 2022-11-09   114.50   114.50            106.50    109.35     109.35   -2.85
#> 22 2022-10-31   315.50   315.50            308.80    314.90     300.55    8.25
#> 23 2022-09-07    52.60    52.60             43.95     51.10      44.55   -0.60
#> 24 2022-11-09   270.00   270.00            265.55    269.70     267.45   -1.90
#> 25 2021-12-03    87.60    87.60             83.35     87.50      84.85   -1.50
#> 26 2022-09-14  2419.95  2419.95           2409.00   2345.00    2234.90  174.10
#> 27 2022-11-09   117.25   117.25            108.55    114.25     114.25   -5.70
#> 28 2022-11-09   124.95   124.95            117.05    118.90     117.80   -0.75
#> 29 2022-11-04   307.70   307.70            305.00    307.60     305.05   -0.05
#> 30 2022-11-09    72.25    72.25             69.50     65.70      65.70    3.80
#> 31 2022-11-09   384.97   384.97            376.40    383.80     381.70   -5.30
#> 32 2022-10-07    60.00    60.00             56.40     57.45      51.50    4.90
#> 33 2022-11-09 13587.00 13587.00          13047.00  13510.00   13484.05 -437.05
#> 34 2022-11-09   404.50   404.50            400.00    404.45     395.35    4.65
#> 35 2022-02-21   362.70   362.70            350.00    339.45     302.25   47.75
#> 36 2022-11-09    28.70    28.70             26.45     24.40      24.40    2.05
#> 37 2022-10-18   148.25   148.25            148.25    142.55     141.20    7.05
#> 38 2022-11-04   133.20   133.20            121.53    129.40     122.23   -0.70
#> 39 2022-11-09   934.90   934.90            880.10    908.75     847.45   32.65
#> 40 2022-10-28   820.00   820.00            768.05    798.00     739.80   28.25
#> 41 2022-10-31    25.30    25.30             24.30     24.45      24.30    0.00
#> 42 2022-11-09    87.60    87.60             81.30     86.45      85.65   -4.35
#> 43 2022-11-09    26.75    26.75             26.75     25.50      25.50    1.25
#> 44 2022-10-31    62.80    62.80             61.40     62.25      60.40    1.00
#> 45 2022-11-04   884.40   884.40            824.50    864.40     846.50  -22.00
#> 46 2022-11-09    27.25    27.25             27.25     26.75      26.75    0.50
#> 47 2022-11-09   241.00   241.00            227.50    204.90     204.90   22.60
#> 48 2022-11-09   918.00   918.00            863.40    907.80     897.60  -34.20
#> 49 2022-10-06  1977.00  1977.00           1920.00   1909.20    1843.30   76.70
#> 50 2022-11-09   161.80   161.80            156.00    154.00     149.00    7.00
#> 51 2022-11-09   994.00   994.00            968.00    990.00     966.50    1.50
#> 52 2022-11-09   130.00   130.00            130.00    124.55     123.85    6.15
#> 53 2022-11-09  4250.00  4250.00           4179.80   4224.85    4167.70   12.10
#> 54 2022-09-21    24.85    24.85             24.85     24.75      23.70    1.15
#> 55 2022-11-09    20.55    20.55             20.55     19.60      19.60    0.95
#> 56 2022-11-09    67.50    67.50             66.60     64.50      64.05    2.55
#> 57 2022-10-24    46.00    46.00             41.80     42.64      42.19   -0.39
#> 58 2022-11-03   268.00   268.00            254.60    264.85     261.90   -7.30
#> 59 2022-11-07   454.05   454.05            435.65    453.95     448.40  -12.75
#>    percent_change
#> 1            6.35
#> 2           -0.52
#> 3            4.99
#> 4           -0.45
#> 5           -3.09
#> 6            4.28
#> 7            4.99
#> 8           14.91
#> 9            2.50
#> 10           1.12
#> 11           4.99
#> 12           0.00
#> 13           1.95
#> 14          -0.07
#> 15          -2.80
#> 16           0.32
#> 17           5.00
#> 18          -0.86
#> 19          -3.62
#> 20          -4.10
#> 21          -2.61
#> 22           2.74
#> 23          -1.35
#> 24          -0.71
#> 25          -1.77
#> 26           7.79
#> 27          -4.99
#> 28          -0.64
#> 29          -0.02
#> 30           5.78
#> 31          -1.39
#> 32           9.51
#> 33          -3.24
#> 34           1.18
#> 35          15.80
#> 36           8.40
#> 37           4.99
#> 38          -0.57
#> 39           3.85
#> 40           3.82
#> 41           0.00
#> 42          -5.08
#> 43           4.90
#> 44           1.66
#> 45          -2.60
#> 46           1.87
#> 47          11.03
#> 48          -3.81
#> 49           4.16
#> 50           4.70
#> 51           0.16
#> 52           4.97
#> 53           0.29
#> 54           4.85
#> 55           4.85
#> 56           3.98
#> 57          -0.92
#> 58          -2.79
#> 59          -2.84

# retain original column names as returned by NSE
nse_stock_year_high(clean_names = FALSE)
#>        symbol                                                        symbolDesc
#> 1     ACCELYA                                   Accelya Solutions India Limited
#> 2    ANANTRAJ                                                 Anant Raj Limited
#> 3   AXISCADES                                    AXISCADES Technologies Limited
#> 4  BANKBARODA                                                    Bank of Baroda
#> 5  BECTORFOOD                            Mrs. Bectors Food Specialities Limited
#> 6     BIGBLOC                                      Bigbloc Construction Limited
#> 7    BOHRAIND                                          Bohra Industries Limited
#> 8         BSL                                                       BSL Limited
#> 9  CORDSCABLE                                    Cords Cable Industries Limited
#> 10  CRAFTSMAN                                      Craftsman Automation Limited
#> 11        DCI                             Dc Infotech And Communication Limited
#> 12 DSPSILVETF                                 DSP  Mutual Fund - DSP Silver ETF
#> 13     ELECON                                Elecon Engineering Company Limited
#> 14 FEDERALBNK                                         The Federal Bank  Limited
#> 15      FOCUS                               Focus Lighting and Fixtures Limited
#> 16 GILT5YBEES                        NIPPON INDIA ETF NIFTY 5 YR BENCHMARK GSEC
#> 17    HARDWYN                                             Hardwyn India Limited
#> 18 HDFCSENETF                                HDFC Mutual Fund - HDFC SENSEX ETF
#> 19     HILTON                                      Hilton Metal Forging Limited
#> 20     HLVLTD                                                       HLV LIMITED
#> 21       HPIL                                    Hindprakash Industries Limited
#> 22    ICEMAKE                                    Ice Make Refrigeration Limited
#> 23 ICICINXT50 ICICI Prudential Mutual Fund - ICICI Prudential Nifty Next 50 ETF
#> 24    INDIANB                                                       Indian Bank
#> 25 INDRAMEDCO                          Indraprastha Medical Corporation Limited
#> 26 IONEXCHANG                                      ION Exchange (India) Limited
#> 27 JAIPURKURT                                          Nandani Creation Limited
#> 28 JMCPROJECT                                     JMC Projects (India)  Limited
#> 29   JTLINFRA                                                 JTL Infra Limited
#> 30 KHAITANLTD                                           Khaitan (India) Limited
#> 31 KOTAKPSUBK                                          Kotak Nifty PSU Bank ETF
#> 32   KRITINUT                                           Kriti Nutrients Limited
#> 33  LAXMIMACH                                     Lakshmi Machine Works Limited
#> 34   LIKHITHA                                   Likhitha Infrastructure Limited
#> 35       LINC                                                      Linc Limited
#> 36     MAGNUM                                           Magnum Ventures Limited
#> 37 MASKINVEST                                          Mask Investments Limited
#> 38 MID150BEES                                 NIPPON INDIA ETF NIFTY MIDCAP 150
#> 39     MPSLTD                                                       MPS Limited
#> 40         NH                                         Narayana Hrudayalaya Ltd.
#> 41 OILCOUNTUB                                       Oil Country Tubular Limited
#> 42  ORIENTHOT                                           Oriental Hotels Limited
#> 43 PARACABLES                                  Paramount Communications Limited
#> 44     PENIND                                         Pennar Industries Limited
#> 45    RAINBOW                                Rainbow Childrens Medicare Limited
#> 46   RAJRILTD                                      Raj Rayon Industries Limited
#> 47      REFEX                                          Refex Industries Limited
#> 48    RPGLIFE                                         RPG Life Sciences Limited
#> 49     SAFARI                                 Safari Industries (India) Limited
#> 50 SHREYANIND                                       Shreyans Industries Limited
#> 51 SHRIPISTON                                   Shriram Pistons & Rings Limited
#> 52      SIKKO                                          Sikko Industries Limited
#> 53  SOLARINDS                                    Solar Industries India Limited
#> 54    SPCENET                                Spacenet Enterprises India Limited
#> 55      SUMIT                                               Sumit Woods Limited
#> 56  UNIONBANK                                               Union Bank of India
#> 57 UTIBANKETF                                                UTI Nifty Bank ETF
#> 58     VGUARD                                        V-Guard Industries Limited
#> 59  ZYDUSLIFE                                        Zydus Lifesciences Limited
#>            dt    value     year      ltp value_old     prev  change pChange
#> 1  2022-11-09  1492.00  1492.00  1484.00   1435.00  1395.45   88.55    6.35
#> 2  2022-11-09   117.95   117.95   114.80    117.90   115.40   -0.60   -0.52
#> 3  2022-11-09   368.05   368.05   368.05    351.40   350.55   17.50    4.99
#> 4  2022-11-09   168.15   168.15   165.55    167.00   166.30   -0.75   -0.45
#> 5  2021-11-09   424.00   424.00   402.00    424.00   414.80  -12.80   -3.09
#> 6  2022-09-21   158.15   158.15   157.10    152.30   150.65    6.45    4.28
#> 7  2022-11-09   106.25   106.25   106.25    101.20   101.20    5.05    4.99
#> 8  2022-10-04   175.40   175.40   168.00    169.65   146.20   21.80   14.91
#> 9  2022-01-11    76.40    76.40    73.90     73.90    72.10    1.80    2.50
#> 10 2022-11-09  3442.95  3442.95  3370.00   3379.45  3332.80   37.20    1.12
#> 11 2022-11-09   151.45   151.45   151.45    144.25   144.25    7.20    4.99
#> 12 2022-11-09    63.90    63.90    61.01     62.00    61.42    0.00    0.00
#> 13 2022-11-09   449.45   449.45   443.75    439.55   435.25    8.50    1.95
#> 14 2022-11-07   139.70   139.70   138.00    139.25   138.10   -0.10   -0.07
#> 15 2022-11-09   269.70   269.70   251.95    259.95   259.20   -7.25   -2.80
#> 16 2022-09-29    54.99    54.99    49.74     50.25    49.58    0.16    0.32
#> 17 2022-11-09   329.80   329.80   329.80    314.10   314.10   15.70    5.00
#> 18 2022-11-09   709.99   709.99   657.99    699.70   663.70   -5.71   -0.86
#> 19 2022-10-07    82.65    82.65    75.90     80.85    78.75   -2.85   -3.62
#> 20 2022-11-09    13.00    13.00    11.70     12.35    12.20   -0.50   -4.10
#> 21 2022-11-09   114.50   114.50   106.50    109.35   109.35   -2.85   -2.61
#> 22 2022-10-31   315.50   315.50   308.80    314.90   300.55    8.25    2.74
#> 23 2022-09-07    52.60    52.60    43.95     51.10    44.55   -0.60   -1.35
#> 24 2022-11-09   270.00   270.00   265.55    269.70   267.45   -1.90   -0.71
#> 25 2021-12-03    87.60    87.60    83.35     87.50    84.85   -1.50   -1.77
#> 26 2022-09-14  2419.95  2419.95  2409.00   2345.00  2234.90  174.10    7.79
#> 27 2022-11-09   117.25   117.25   108.55    114.25   114.25   -5.70   -4.99
#> 28 2022-11-09   124.95   124.95   117.05    118.90   117.80   -0.75   -0.64
#> 29 2022-11-04   307.70   307.70   305.00    307.60   305.05   -0.05   -0.02
#> 30 2022-11-09    72.25    72.25    69.50     65.70    65.70    3.80    5.78
#> 31 2022-11-09   384.97   384.97   376.40    383.80   381.70   -5.30   -1.39
#> 32 2022-10-07    60.00    60.00    56.40     57.45    51.50    4.90    9.51
#> 33 2022-11-09 13587.00 13587.00 13047.00  13510.00 13484.05 -437.05   -3.24
#> 34 2022-11-09   404.50   404.50   400.00    404.45   395.35    4.65    1.18
#> 35 2022-02-21   362.70   362.70   350.00    339.45   302.25   47.75   15.80
#> 36 2022-11-09    28.70    28.70    26.45     24.40    24.40    2.05    8.40
#> 37 2022-10-18   148.25   148.25   148.25    142.55   141.20    7.05    4.99
#> 38 2022-11-04   133.20   133.20   121.53    129.40   122.23   -0.70   -0.57
#> 39 2022-11-09   934.90   934.90   880.10    908.75   847.45   32.65    3.85
#> 40 2022-10-28   820.00   820.00   768.05    798.00   739.80   28.25    3.82
#> 41 2022-10-31    25.30    25.30    24.30     24.45    24.30    0.00    0.00
#> 42 2022-11-09    87.60    87.60    81.30     86.45    85.65   -4.35   -5.08
#> 43 2022-11-09    26.75    26.75    26.75     25.50    25.50    1.25    4.90
#> 44 2022-10-31    62.80    62.80    61.40     62.25    60.40    1.00    1.66
#> 45 2022-11-04   884.40   884.40   824.50    864.40   846.50  -22.00   -2.60
#> 46 2022-11-09    27.25    27.25    27.25     26.75    26.75    0.50    1.87
#> 47 2022-11-09   241.00   241.00   227.50    204.90   204.90   22.60   11.03
#> 48 2022-11-09   918.00   918.00   863.40    907.80   897.60  -34.20   -3.81
#> 49 2022-10-06  1977.00  1977.00  1920.00   1909.20  1843.30   76.70    4.16
#> 50 2022-11-09   161.80   161.80   156.00    154.00   149.00    7.00    4.70
#> 51 2022-11-09   994.00   994.00   968.00    990.00   966.50    1.50    0.16
#> 52 2022-11-09   130.00   130.00   130.00    124.55   123.85    6.15    4.97
#> 53 2022-11-09  4250.00  4250.00  4179.80   4224.85  4167.70   12.10    0.29
#> 54 2022-09-21    24.85    24.85    24.85     24.75    23.70    1.15    4.85
#> 55 2022-11-09    20.55    20.55    20.55     19.60    19.60    0.95    4.85
#> 56 2022-11-09    67.50    67.50    66.60     64.50    64.05    2.55    3.98
#> 57 2022-10-24    46.00    46.00    41.80     42.64    42.19   -0.39   -0.92
#> 58 2022-11-03   268.00   268.00   254.60    264.85   261.90   -7.30   -2.79
#> 59 2022-11-07   454.05   454.05   435.65    453.95   448.40  -12.75   -2.84
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
#> 1  GODREJPROP     EQ                  2015-07-27
#> 2   MOTHERSON     EQ                  2022-10-03
#> 3       LUPIN     EQ                  2022-07-14
#> 4  HEROMOTOCO     EQ                  2022-07-27
#> 5         ABB     EQ                  2022-04-27
#> 6  AMARAJABAT     EQ                  2022-11-15
#> 7     HAVELLS     EQ                  2022-06-14
#> 8     ESCORTS     EQ                  2022-06-30
#> 9        IDEA     EQ                  2022-08-18
#> 10       GSPL     EQ                  2022-09-01
#>                                 last_corp_announcement open_price high_price
#> 1  Annual General Meeting/Dividend -  Rs 2/- Per Share    1165.00    1245.00
#> 2                                            Bonus 1:2      68.50      71.75
#> 3                           Dividend - Rs  4 Per Share     717.20     754.00
#> 4   Annual General Meeting/Dividend - Rs  35 Per Share    2651.45    2722.00
#> 5  Annual General Meeting/Dividend - Rs 5.20 Per Share    3103.90    3240.00
#> 6                Interim Dividend - Rs  2.90 Per Share     612.00     633.00
#> 7  Annual General Meeting/Dividend - Rs 4.50 Per Share    1185.00    1229.90
#> 8     Annual General Meeting/Dividend - Rs 7 Per Share    1989.00    2062.85
#> 9                               Annual General Meeting       8.50       8.75
#> 10                           Dividend - Rs 2 Per Share     230.05     234.70
#>    low_price last_traded_price prev_close_price percent_change traded_quantity
#> 1    1154.25           1239.00          1169.70           5.92         2814496
#> 2      67.70             71.15            68.30           4.17        33577029
#> 3     707.60            723.00           694.25           4.14        11685941
#> 4    2626.35           2715.00          2651.50           2.39          706321
#> 5    3054.50           3173.85          3103.90           2.25          507653
#> 6     606.20            628.50           615.45           2.12         4171351
#> 7    1183.10           1228.00          1203.05           2.07          783233
#> 8    1988.00           2022.55          1987.50           1.76          896932
#> 9       8.45              8.65             8.50           1.76       124169423
#> 10    229.95            233.50           230.05           1.50         1440171
#>    turnover_in_lakhs
#> 1           34290.13
#> 2           23325.96
#> 3           85580.82
#> 4           18989.16
#> 5           16130.93
#> 6           26088.46
#> 7            9458.71
#> 8           18088.88
#> 9           10666.15
#> 10           3357.76

# retain original column names as returned by NSE
nse_fo_top_gainers(clean_names = FALSE)
#>        symbol series lastCorpAnnouncementDate
#> 1  GODREJPROP     EQ               2015-07-27
#> 2   MOTHERSON     EQ               2022-10-03
#> 3       LUPIN     EQ               2022-07-14
#> 4  HEROMOTOCO     EQ               2022-07-27
#> 5         ABB     EQ               2022-04-27
#> 6  AMARAJABAT     EQ               2022-11-15
#> 7     HAVELLS     EQ               2022-06-14
#> 8     ESCORTS     EQ               2022-06-30
#> 9        IDEA     EQ               2022-08-18
#> 10       GSPL     EQ               2022-09-01
#>                                   lastCorpAnnouncement openPrice highPrice
#> 1  Annual General Meeting/Dividend -  Rs 2/- Per Share   1165.00   1245.00
#> 2                                            Bonus 1:2     68.50     71.75
#> 3                           Dividend - Rs  4 Per Share    717.20    754.00
#> 4   Annual General Meeting/Dividend - Rs  35 Per Share   2651.45   2722.00
#> 5  Annual General Meeting/Dividend - Rs 5.20 Per Share   3103.90   3240.00
#> 6                Interim Dividend - Rs  2.90 Per Share    612.00    633.00
#> 7  Annual General Meeting/Dividend - Rs 4.50 Per Share   1185.00   1229.90
#> 8     Annual General Meeting/Dividend - Rs 7 Per Share   1989.00   2062.85
#> 9                               Annual General Meeting      8.50      8.75
#> 10                           Dividend - Rs 2 Per Share    230.05    234.70
#>    lowPrice     ltp previousPrice netPrice tradedQuantity turnoverInLakhs
#> 1   1154.25 1239.00       1169.70     5.92        2814496        34290.13
#> 2     67.70   71.15         68.30     4.17       33577029        23325.96
#> 3    707.60  723.00        694.25     4.14       11685941        85580.82
#> 4   2626.35 2715.00       2651.50     2.39         706321        18989.16
#> 5   3054.50 3173.85       3103.90     2.25         507653        16130.93
#> 6    606.20  628.50        615.45     2.12        4171351        26088.46
#> 7   1183.10 1228.00       1203.05     2.07         783233         9458.71
#> 8   1988.00 2022.55       1987.50     1.76         896932        18088.88
#> 9      8.45    8.65          8.50     1.76      124169423        10666.15
#> 10   229.95  233.50        230.05     1.50        1440171         3357.76
```

### Pre Open Market Data

##### Fetch data of pre open session of Nifty Bank.

``` r
nse_preopen_nifty_bank()
#>        symbol series corp_action_date corp_action   price change percent_change
#> 1    AXISBANK     EQ             <NA>        <NA>  843.70 -30.00          -3.43
#> 2    HDFCBANK     EQ             <NA>        <NA> 1497.10 -11.25          -0.75
#> 3  INDUSINDBK     EQ             <NA>        <NA> 1143.00  -6.00          -0.52
#> 4      AUBANK     EQ             <NA>        <NA>  639.50  -3.05          -0.47
#> 5        SBIN     EQ             <NA>        <NA>  613.10  -2.45          -0.40
#> 6   ICICIBANK     EQ             <NA>        <NA>  907.55  -2.95          -0.32
#> 7  FEDERALBNK     EQ             <NA>        <NA>  137.70  -0.40          -0.29
#> 8  BANKBARODA     EQ             <NA>        <NA>  166.00  -0.30          -0.18
#> 9  BANDHANBNK     EQ             <NA>        <NA>  229.00   0.35           0.15
#> 10        PNB     EQ             <NA>        <NA>   45.00   0.05           0.11
#> 11  KOTAKBANK     EQ             <NA>        <NA> 1895.00   1.60           0.08
#> 12 IDFCFIRSTB     EQ             <NA>        <NA>   57.40   0.00           0.00
#>    prev_close quantity   value   mkt_cap year_high year_low sum_val
#> 1      873.70   245952 2075.10 230819.01    919.95   618.25 4349.86
#> 2     1508.35    50363  753.98 663714.37   1722.10  1271.60 4349.86
#> 3     1149.00     1600   18.29  74821.62   1275.80   763.20 4349.86
#> 4      642.55     2485   15.89  30361.62    732.98   462.50 4349.86
#> 5      615.55    44469  272.64 236222.42    622.70   425.00 4349.86
#> 6      910.50    26564  241.08 634383.98    943.25   642.15 4349.86
#> 7      138.10    15221   20.96  27685.59    139.25    78.60 4349.86
#> 8      166.30   234284  388.91  30959.91    167.00    77.05 4349.86
#> 9      228.65    24157   55.32  17310.74    349.55   224.15 4349.86
#> 10      44.95   603496  271.57  13363.52     46.00    28.05 4349.86
#> 11    1893.40    10871  206.01 278211.42   2126.95  1631.00 4349.86
#> 12      57.40    52447   30.10  17852.21     59.45    28.95 4349.86
#>    sum_quantity fin_quantity sum_fin_quantity
#> 1        824413       245952          1311909
#> 2        824413        50363          1311909
#> 3        824413         1600          1311909
#> 4        824413         2485          1311909
#> 5        824413        44469          1311909
#> 6        824413        26564          1311909
#> 7        824413        15221          1311909
#> 8        824413       234284          1311909
#> 9        824413        24157          1311909
#> 10       824413       603496          1311909
#> 11       824413        10871          1311909
#> 12       824413        52447          1311909

# retain original column names as returned by NSE
nse_preopen_nifty(clean_names = FALSE)
#>        symbol series        xDt
#> 1    AXISBANK     EQ       <NA>
#> 2  TATAMOTORS     EQ       <NA>
#> 3        INFY     EQ 2022-10-27
#> 4         TCS     EQ 2022-10-17
#> 5       TECHM     EQ 2022-11-09
#> 6   POWERGRID     EQ       <NA>
#> 7    JSWSTEEL     EQ       <NA>
#> 8        HDFC     EQ       <NA>
#> 9   TATASTEEL     EQ       <NA>
#> 10       ONGC     EQ 2022-08-18
#> 11   HDFCBANK     EQ       <NA>
#> 12     MARUTI     EQ       <NA>
#> 13      WIPRO     EQ       <NA>
#> 14  BRITANNIA     EQ       <NA>
#> 15   RELIANCE     EQ 2022-08-18
#> 16 INDUSINDBK     EQ       <NA>
#> 17        ITC     EQ       <NA>
#> 18 BAJAJFINSV     EQ 2022-09-13
#> 19   HINDALCO     EQ       <NA>
#> 20         LT     EQ       <NA>
#> 21       SBIN     EQ       <NA>
#> 22  SUNPHARMA     EQ 2022-08-19
#> 23    HCLTECH     EQ 2022-10-19
#> 24  ICICIBANK     EQ       <NA>
#> 25     GRASIM     EQ       <NA>
#> 26      TITAN     EQ       <NA>
#> 27       BPCL     EQ 2022-08-19
#> 28 HINDUNILVR     EQ 2022-11-01
#> 29 ULTRACEMCO     EQ       <NA>
#> 30  NESTLEIND     EQ 2022-10-31
#> 31   ADANIENT     EQ       <NA>
#> 32 ASIANPAINT     EQ 2022-10-31
#> 33 TATACONSUM     EQ       <NA>
#> 34 HEROMOTOCO     EQ       <NA>
#> 35  COALINDIA     EQ       <NA>
#> 36 ADANIPORTS     EQ       <NA>
#> 37    SBILIFE     EQ       <NA>
#> 38 APOLLOHOSP     EQ 2022-08-18
#> 39 BAJFINANCE     EQ       <NA>
#> 40        UPL     EQ       <NA>
#> 41  EICHERMOT     EQ       <NA>
#> 42    DRREDDY     EQ       <NA>
#> 43        M&M     EQ       <NA>
#> 44 BHARTIARTL     EQ       <NA>
#> 45  KOTAKBANK     EQ       <NA>
#> 46       NTPC     EQ       <NA>
#> 47      CIPLA     EQ       <NA>
#> 48   DIVISLAB     EQ       <NA>
#> 49 BAJAJ-AUTO     EQ       <NA>
#> 50   HDFCLIFE     EQ       <NA>
#>                                                                          caAct
#> 1                                                                         <NA>
#> 2                                                                         <NA>
#> 3                                        INTERIM DIVIDEND - RS 16.50 PER SHARE
#> 4                                            INTERIM DIVIDEND - RS 8 PER SHARE
#> 5                                           SPECIAL DIVIDEND - RS 18 PER SHARE
#> 6                                                                         <NA>
#> 7                                                                         <NA>
#> 8                                                                         <NA>
#> 9                                                                         <NA>
#> 10                                                DIVIDEND - RS 3.25 PER SHARE
#> 11                                                                        <NA>
#> 12                                                                        <NA>
#> 13                                                                        <NA>
#> 14                                                                        <NA>
#> 15                                                   DIVIDEND - RS 8 PER SHARE
#> 16                                                                        <NA>
#> 17                                                                        <NA>
#> 18 FACE VALUE SPLIT (SUB-DIVISION) - FROM RS 5/- PER SHARE TO RE 1/- PER SHARE
#> 19                                                                        <NA>
#> 20                                                                        <NA>
#> 21                                                                        <NA>
#> 22                                                   DIVIDEND - RS 3 PER SHARE
#> 23                                          INTERIM DIVIDEND - RS 10 PER SHARE
#> 24                                                                        <NA>
#> 25                                                                        <NA>
#> 26                                                                        <NA>
#> 27                            ANNUAL GENERAL MEETING/DIVIDEND - RS 6 PER SHARE
#> 28                                          INTERIM DIVIDEND - RS 17 PER SHARE
#> 29                                                                        <NA>
#> 30                                         INTERIM DIVIDEND - RS 120 PER SHARE
#> 31                                                                        <NA>
#> 32                                        INTERIM DIVIDEND - RS 4.40 PER SHARE
#> 33                                                                        <NA>
#> 34                                                                        <NA>
#> 35                                                                        <NA>
#> 36                                                                        <NA>
#> 37                                                                        <NA>
#> 38                        ANNUAL GENERAL MEETING/DIVIDEND - RS 11.75 PER SHARE
#> 39                                                                        <NA>
#> 40                                                                        <NA>
#> 41                                                                        <NA>
#> 42                                                                        <NA>
#> 43                                                                        <NA>
#> 44                                                                        <NA>
#> 45                                                                        <NA>
#> 46                                                                        <NA>
#> 47                                                                        <NA>
#> 48                                                                        <NA>
#> 49                                                                        <NA>
#> 50                                                                        <NA>
#>         iep    chn perChn     pCls trdQnty    iVal    mktCap    yHigh     yLow
#> 1    843.70 -30.00  -3.43   873.70  245952 2075.10 230819.01   919.95   618.25
#> 2    420.50 -12.65  -2.92   433.15  168076  706.76  77682.62   536.70   366.20
#> 3   1485.00 -26.20  -1.73  1511.20   66818  992.25 553211.86  1953.90  1355.00
#> 4   3170.00 -46.05  -1.43  3216.05   38756 1228.57 329495.38  4043.00  2926.10
#> 5   1015.00 -13.70  -1.33  1028.70   12256  124.40  65070.79  1838.00   943.70
#> 6    216.00  -2.75  -1.26   218.75  148325  320.38  74768.14   248.35   180.30
#> 7    699.80  -6.75  -0.96   706.55    2408   16.85  66607.60   790.00   520.05
#> 8   2480.20 -23.30  -0.93  2503.50   16899  419.13 454023.67  3021.10  2026.00
#> 9    105.20  -0.90  -0.85   106.10  147585  155.26  85580.24   138.67    82.70
#> 10   137.50  -1.15  -0.83   138.65   59921   82.39  54071.93   194.95   119.85
#> 11  1497.10 -11.25  -0.75  1508.35   50363  753.98 663714.37  1722.10  1271.60
#> 12  9201.00 -52.50  -0.57  9253.50    1111  102.22 122993.10  9769.00  6536.55
#> 13   388.80  -2.15  -0.55   390.95   19314   75.09  57902.66   726.80   372.40
#> 14  4152.60 -22.75  -0.54  4175.35    1215   50.45  49279.76  4237.00  3050.00
#> 15  2590.00 -14.00  -0.54  2604.00   31803  823.70 898466.33  2856.15  2180.00
#> 16  1143.00  -6.00  -0.52  1149.00    1600   18.29  74821.62  1275.80   763.20
#> 17   359.00  -1.70  -0.47   360.70   60295  216.46 317539.25   361.45   207.00
#> 18  1745.00  -7.70  -0.44  1752.70    3655   63.78 106085.65  1862.10  1072.72
#> 19   415.30  -1.80  -0.43   417.10   22838   94.85  60924.29   636.00   308.95
#> 20  1995.00  -8.50  -0.42  2003.50    2608   52.03 242115.85  2078.55  1456.35
#> 21   613.10  -2.45  -0.40   615.55   44469  272.64 236222.42   622.70   425.00
#> 22  1010.00  -3.55  -0.35  1013.55    2276   22.99 109433.07  1055.60   733.70
#> 23  1050.00  -3.45  -0.33  1053.45   16687  175.21 111489.71  1359.40   877.35
#> 24   907.55  -2.95  -0.32   910.50   26564  241.08 634383.98   943.25   642.15
#> 25  1740.00  -5.50  -0.32  1745.50     725   12.62  65498.11  1929.80  1276.60
#> 26  2710.00  -8.10  -0.30  2718.10    1344   36.42 113415.30  2791.00  1825.05
#> 27   306.00  -0.85  -0.28   306.85    4021   12.30  29287.95   434.00   288.05
#> 28  2504.00  -4.80  -0.19  2508.80    3003   75.20 223996.87  2734.00  1901.55
#> 29  6895.00  -8.50  -0.12  6903.50     451   31.10  79713.87  8255.05  5157.05
#> 30 20299.60 -20.30  -0.10 20319.90      43    8.73  72488.84 21050.00 16000.00
#> 31  3995.00  -2.20  -0.06  3997.20    4717  188.44 109363.50  4048.00  1528.80
#> 32  3086.00  -0.50  -0.02  3086.50    3758  115.97 139146.51  3590.00  2560.00
#> 33   770.00  -0.15  -0.02   770.15    1020    7.85  46132.65   861.15   650.20
#> 34  2651.45  -0.05   0.00  2651.50     984   26.09  34438.86  2938.60  2146.85
#> 35   257.95   2.15   0.84   255.80   86416  222.91  53598.48   263.40   139.15
#> 36   894.00   3.20   0.36   890.80   39236  350.77  63977.87   987.85   651.95
#> 37  1268.10   4.30   0.34  1263.80     385    4.88  56911.59  1340.35  1003.50
#> 38  4374.50  13.30   0.30  4361.20     742   32.46  44522.23  5935.40  3361.55
#> 39  7158.00  14.00   0.20  7144.00    1308   93.63 190308.20  8045.00  5220.00
#> 40   754.95   1.35   0.18   753.60    3789   28.61  40161.71   848.00   607.50
#> 41  3739.40   6.45   0.17  3732.95     774   28.94  52060.62  3864.10  2159.55
#> 42  4539.95   5.05   0.11  4534.90     391   17.75  55102.37  4931.05  3654.00
#> 43  1339.00   1.45   0.11  1337.55    1502   20.11 128038.08  1364.85   671.15
#> 44   819.80   0.75   0.09   819.05    6701   54.93 200488.85   833.80   628.75
#> 45  1895.00   1.60   0.08  1893.40   10871  206.01 278211.42  2126.95  1631.00
#> 46   173.50   0.10   0.06   173.40    7648   13.27  82388.69   181.85   119.10
#> 47  1130.00   0.60   0.05  1129.40     821    9.28  61065.65  1180.10   850.00
#> 48  3298.75   0.00   0.00  3298.75    3302  108.92  42034.29  5093.25  3276.00
#> 49  3739.55   0.00   0.00  3739.55     332   12.42  47942.14  4131.75  3027.05
#> 50   531.75   0.00   0.00   531.75    4346   23.11  50281.43   723.95   497.05
#>      sumVal sumQnty finQnty sumfinQnty
#> 1  10826.58 1010533  245952    1380424
#> 2  10826.58 1010533  168076    1380424
#> 3  10826.58 1010533   66818    1380424
#> 4  10826.58 1010533   38756    1380424
#> 5  10826.58 1010533   12256    1380424
#> 6  10826.58 1010533  148325    1380424
#> 7  10826.58 1010533    2408    1380424
#> 8  10826.58 1010533   16899    1380424
#> 9  10826.58 1010533  147585    1380424
#> 10 10826.58 1010533   59921    1380424
#> 11 10826.58 1010533   50363    1380424
#> 12 10826.58 1010533    1111    1380424
#> 13 10826.58 1010533   19314    1380424
#> 14 10826.58 1010533    1215    1380424
#> 15 10826.58 1010533   31803    1380424
#> 16 10826.58 1010533    1600    1380424
#> 17 10826.58 1010533   60295    1380424
#> 18 10826.58 1010533    3655    1380424
#> 19 10826.58 1010533   22838    1380424
#> 20 10826.58 1010533    2608    1380424
#> 21 10826.58 1010533   44469    1380424
#> 22 10826.58 1010533    2276    1380424
#> 23 10826.58 1010533   16687    1380424
#> 24 10826.58 1010533   26564    1380424
#> 25 10826.58 1010533     725    1380424
#> 26 10826.58 1010533    1344    1380424
#> 27 10826.58 1010533    4021    1380424
#> 28 10826.58 1010533    3003    1380424
#> 29 10826.58 1010533     451    1380424
#> 30 10826.58 1010533      43    1380424
#> 31 10826.58 1010533    4717    1380424
#> 32 10826.58 1010533    3758    1380424
#> 33 10826.58 1010533    1020    1380424
#> 34 10826.58 1010533     984    1380424
#> 35 10826.58 1010533   86416    1380424
#> 36 10826.58 1010533   39236    1380424
#> 37 10826.58 1010533     385    1380424
#> 38 10826.58 1010533     742    1380424
#> 39 10826.58 1010533    1308    1380424
#> 40 10826.58 1010533    3789    1380424
#> 41 10826.58 1010533     774    1380424
#> 42 10826.58 1010533     391    1380424
#> 43 10826.58 1010533    1502    1380424
#> 44 10826.58 1010533    6701    1380424
#> 45 10826.58 1010533   10871    1380424
#> 46 10826.58 1010533    7648    1380424
#> 47 10826.58 1010533     821    1380424
#> 48 10826.58 1010533    3302    1380424
#> 49 10826.58 1010533     332    1380424
#> 50 10826.58 1010533    4346    1380424
```

### Advances & Declines

``` r
nse_advances_declines()
#>                                     index_name advances declines unchanged
#> 1                                     NIFTY 50       11       39         0
#> 2                                NIFTY NEXT 50       13       37         0
#> 3                                     NIFTY IT        2        8         0
#> 4                                   NIFTY BANK        3        9         0
#> 5                              NIFTY MIDCAP 50       16       34         0
#> 6                                  NIFTY INFRA       10       20         0
#> 7                                 NIFTY REALTY        1        9         0
#> 8                                 NIFTY ENERGY        2        8         0
#> 9                                   NIFTY FMCG        6        9         0
#> 10                                   NIFTY MNC       10       20         0
#> 11                                NIFTY PHARMA        5       15         0
#> 12                                   NIFTY PSE        4       16         0
#> 13                              NIFTY PSU BANK        1       11         0
#> 14                           NIFTY SERV SECTOR        5       25         0
#> 15                           NIFTY COMMODITIES        6       24         0
#> 16                           NIFTY CONSUMPTION        9       21         0
#> 17                           NIFTY FIN SERVICE        3       17         0
#> 18                                  NIFTY AUTO        4       11         0
#> 19                           NIFTY DIV OPPS 50       14       36         0
#> 20                                 NIFTY MEDIA        2        8         0
#> 21                                 NIFTY METAL        3       12         0
#> 22                             NIFTY100 LIQ 15        3       12         0
#> 23                                  NIFTY CPSE        3        8         0
#> 24                           NIFTY GROWSECT 15        4       11         0
#> 25                            NIFTY50 VALUE 20        4       16         0
#> 26                           NIFTY100 QUALTY30       10       20         0
#> 27                              NIFTY PVT BANK        3        7         0
#> 28                            NIFTY MID LIQ 15        3       12         0
#> 29                                   NIFTY 100       24       76         0
#> 30                                   NIFTY 200       55      145         0
#> 31                                   NIFTY 500      124      377         0
#> 32                            NIFTY MIDCAP 100       31       69         0
#> 33                            NIFTY SMLCAP 100       20       80         0
#> 34                    NIFTY ADITYA BIRLA GROUP        3        5         0
#> 35                              NIFTY ALPHA 50       10       40         0
#> 36                          NIFTY HIGH BETA 50        9       41         0
#> 37                     NIFTY LOW VOLATILITY 50       16       34         0
#> 38                        NIFTY MAHINDRA GROUP        0        9         0
#> 39                            NIFTY MIDCAP 150       48      102         0
#> 40                       NIFTY MIDSMALLCAP 400      100      300         0
#> 41                            NIFTY SHARIAH 25       11       14         0
#> 42                          NIFTY SMALLCAP 250       52      198         0
#> 43                           NIFTY SMALLCAP 50        9       41         0
#> 44                            NIFTY TATA GROUP        1       23         0
#> 45                    NIFTY TATA GROUP 25% CAP        0       10         0
#> 46                            NIFTY100 EQL WGT       24       76         0
#> 47                           NIFTY100 LOWVOL30       10       20         0
#> 48                             NIFTY50 SHARIAH        6       16         0
#> 49                            NIFTY500 SHARIAH       70      169         0
#> 50                             NIFTY50 EQL WGT       11       39         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30        9       21         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       10       20         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30        9       21         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30        9       21         0
#> 55                            NIFTY SME EMERGE       35       28        39
#> 56                       NIFTY LARGEMIDCAP 250       72      178         0
#> 57                           NIFTY500 VALUE 50       10       40         0
#> 58                            NIFTY MIDCAP 150       48      102         0
#> 59                             NIFTY SMLCAP 50        9       41         0
#> 60                            NIFTY SMLCAP 250       52      198         0
#> 61                            NIFTY MIDSML 400      100      300         0
#> 62                           NIFTY200 QUALTY30       12       18         0
#> 63                           NIFTY FINSRV25 50        3       17         0
#> 64                           NIFTY ALPHALOWVOL        9       21         0
#> 65                           NIFTY200MOMENTM30        8       22         0
#> 66                            NIFTY HEALTHCARE        5       15         0
#> 67                           NIFTY CONSR DURBL        4       11         0
#> 68                           NIFTY OIL AND GAS        8        7         0
#> 69                           NIFTY500 MULTICAP      124      377         0
#> 70                           NIFTY LARGEMID250       72      178         0
#> 71                            NIFTY MID SELECT        9       16         0
#> 72                             NIFTY TOTAL MKT      188      560         3
#> 73                           NIFTY MICROCAP250       64      183         3
#> 74                           NIFTY IND DIGITAL        7       23         0
#> 75                                NIFTY100 ESG       18       64         0
#> 76                           NIFTY M150 QLTY50       18       32         0
#> 77                          CNX NIFTY Pre Open       13       33         4

# retain original column names as returned by NSE
nse_advances_declines(clean_names = FALSE)
#>                                        skipped advances declines unchanged
#> 1                                     NIFTY 50       11       39         0
#> 2                                NIFTY NEXT 50       13       37         0
#> 3                                     NIFTY IT        2        8         0
#> 4                                   NIFTY BANK        3        9         0
#> 5                              NIFTY MIDCAP 50       16       34         0
#> 6                                  NIFTY INFRA       10       20         0
#> 7                                 NIFTY REALTY        1        9         0
#> 8                                 NIFTY ENERGY        2        8         0
#> 9                                   NIFTY FMCG        6        9         0
#> 10                                   NIFTY MNC       10       20         0
#> 11                                NIFTY PHARMA        5       15         0
#> 12                                   NIFTY PSE        4       16         0
#> 13                              NIFTY PSU BANK        1       11         0
#> 14                           NIFTY SERV SECTOR        5       25         0
#> 15                           NIFTY COMMODITIES        6       24         0
#> 16                           NIFTY CONSUMPTION        9       21         0
#> 17                           NIFTY FIN SERVICE        3       17         0
#> 18                                  NIFTY AUTO        4       11         0
#> 19                           NIFTY DIV OPPS 50       14       36         0
#> 20                                 NIFTY MEDIA        2        8         0
#> 21                                 NIFTY METAL        3       12         0
#> 22                             NIFTY100 LIQ 15        3       12         0
#> 23                                  NIFTY CPSE        3        8         0
#> 24                           NIFTY GROWSECT 15        4       11         0
#> 25                            NIFTY50 VALUE 20        4       16         0
#> 26                           NIFTY100 QUALTY30       10       20         0
#> 27                              NIFTY PVT BANK        3        7         0
#> 28                            NIFTY MID LIQ 15        3       12         0
#> 29                                   NIFTY 100       24       76         0
#> 30                                   NIFTY 200       55      145         0
#> 31                                   NIFTY 500      124      377         0
#> 32                            NIFTY MIDCAP 100       31       69         0
#> 33                            NIFTY SMLCAP 100       20       80         0
#> 34                    NIFTY ADITYA BIRLA GROUP        3        5         0
#> 35                              NIFTY ALPHA 50       10       40         0
#> 36                          NIFTY HIGH BETA 50        9       41         0
#> 37                     NIFTY LOW VOLATILITY 50       16       34         0
#> 38                        NIFTY MAHINDRA GROUP        0        9         0
#> 39                            NIFTY MIDCAP 150       48      102         0
#> 40                       NIFTY MIDSMALLCAP 400      100      300         0
#> 41                            NIFTY SHARIAH 25       11       14         0
#> 42                          NIFTY SMALLCAP 250       52      198         0
#> 43                           NIFTY SMALLCAP 50        9       41         0
#> 44                            NIFTY TATA GROUP        1       23         0
#> 45                    NIFTY TATA GROUP 25% CAP        0       10         0
#> 46                            NIFTY100 EQL WGT       24       76         0
#> 47                           NIFTY100 LOWVOL30       10       20         0
#> 48                             NIFTY50 SHARIAH        6       16         0
#> 49                            NIFTY500 SHARIAH       70      169         0
#> 50                             NIFTY50 EQL WGT       11       39         0
#> 51               NIFTY ALPHA LOW-VOLATILITY 30        9       21         0
#> 52             NIFTY QUALITY LOW-VOLATILITY 30       10       20         0
#> 53       NIFTY ALPHA QUALITY LOW-VOLATILITY 30        9       21         0
#> 54 NIFTY ALPHA QUALITY VALUE LOW-VOLATILITY 30        9       21         0
#> 55                            NIFTY SME EMERGE       35       28        39
#> 56                       NIFTY LARGEMIDCAP 250       72      178         0
#> 57                           NIFTY500 VALUE 50       10       40         0
#> 58                            NIFTY MIDCAP 150       48      102         0
#> 59                             NIFTY SMLCAP 50        9       41         0
#> 60                            NIFTY SMLCAP 250       52      198         0
#> 61                            NIFTY MIDSML 400      100      300         0
#> 62                           NIFTY200 QUALTY30       12       18         0
#> 63                           NIFTY FINSRV25 50        3       17         0
#> 64                           NIFTY ALPHALOWVOL        9       21         0
#> 65                           NIFTY200MOMENTM30        8       22         0
#> 66                            NIFTY HEALTHCARE        5       15         0
#> 67                           NIFTY CONSR DURBL        4       11         0
#> 68                           NIFTY OIL AND GAS        8        7         0
#> 69                           NIFTY500 MULTICAP      124      377         0
#> 70                           NIFTY LARGEMID250       72      178         0
#> 71                            NIFTY MID SELECT        9       16         0
#> 72                             NIFTY TOTAL MKT      188      560         3
#> 73                           NIFTY MICROCAP250       64      183         3
#> 74                           NIFTY IND DIGITAL        7       23         0
#> 75                                NIFTY100 ESG       18       64         0
#> 76                           NIFTY M150 QLTY50       18       32         0
#> 77                          CNX NIFTY Pre Open       13       33         4
```
