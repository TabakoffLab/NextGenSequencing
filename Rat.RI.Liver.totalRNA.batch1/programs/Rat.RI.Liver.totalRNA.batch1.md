RI Panel - Batch 1 (Liver) Total RNA RNA-Seq
============================================

-   2 samples per strain (SHR, BXH12, HXB13, HXB17, HXB2, HXB25, HXB27, HXB7)
-   tissues received from Dr. Michal Pravenec at Academy of Sciences of the Czech Republic, Prague, Czech Republic
-   ribosomal RNA depleted total RNA
-   2X100 reads using the stranded protocol
-   sequencing done by Beckman Coulter Genomics - received June 5, 2015
-   synthetic spike-in were added to each sample
-   SHR\_1, BXH12\_1, HXB13\_1, HXB17\_1, HXB2\_1, HXB25\_2, HXB27\_1, and HXB7\_1 have mix 1; SHR\_2, BXH12\_2, HXB13\_2, HXB17\_2, HXB2\_2, HXB25\_1, HXB27\_2, and HXB7\_2 have mix 2
-   4 mL of 1:100 diluted spikes were added after RNA extraction but before rRNA-depletion
-   Information regarding the spike-ins can be found here: <http://products.invitrogen.com/ivgn/product/4456739>

1. Unzip Files - DONE
---------------------

    qsub -q smp -N liver.batch1 /storage/saba/Rat.RI.Liver.totalRNA.batch1/programs/unzip.yucca.sh

2. Determine number of reads sent for each sample - DONE
--------------------------------------------------------

    qsub -q smp -N cntRaw /storage/saba/Rat.RI.Liver.totalRNA.batch1/programs/countRawReads.liver.batch1.sh

Raw Reads/Read Fragments
------------------------

|  sample  | Number of Paired-End Reads | Number of Read Fragments |
|:--------:|:--------------------------:|:------------------------:|
| BXH12\_1 |         48,944,095         |        97,888,190        |
| BXH12\_2 |         46,809,812         |        93,619,624        |
| HXB13\_1 |         50,150,896         |        100,301,792       |
| HXB13\_2 |         45,529,860         |        91,059,720        |
| HXB17\_1 |         46,594,113         |        93,188,226        |
| HXB17\_2 |         37,696,059         |        75,392,118        |
|  HXB2\_1 |         40,389,886         |        80,779,772        |
|  HXB2\_2 |         41,680,207         |        83,360,414        |
| HXB25\_1 |         35,104,202         |        70,208,404        |
| HXB25\_2 |         47,102,360         |        94,204,720        |
| HXB27\_1 |         35,651,237         |        71,302,474        |
| HXB27\_2 |         45,626,177         |        91,252,354        |
|  HXB7\_1 |         53,174,270         |        106,348,540       |
|  HXB7\_2 |         49,021,976         |        98,043,952        |
|  SHR\_1  |         49,060,694         |        98,121,388        |
|  SHR\_2  |         50,009,902         |        100,019,804       |

Total Number of Paired End Reads: 722,545,746

Total Number of Read Fragments: 1,445,091,492

Average Number of Paired End Reads Per Sample: 45,159,109

3. Trim reads for adaptors and for quality -
--------------------------------------------

    qsub -q smp -N trimBatch1 /storage/saba/Rat.RI.Liver.totalRNA.batch1/programs/trimReads.liver.batch1.sh

4. Characterize Trimmed Reads - DONE
------------------------------------

    qsub -q smp -N cntTrimmed1 /storage/saba/Rat.RI.Liver.totalRNA.batch1/programs/countTrimmedReads.liver.batch1.sh

Trimmed Reads/Read Fragments
----------------------------

|  sample  | lane | Number of Paired-End Reads | Number of Read Fragments | Average Read Fragment Length After Trimming (first read fragment) | Average Read Fragment Length After Trimming (second read fragment) | Number of Read Fragments After Trimming | Percent of Read Fragments That Remained After Trimming |
|:--------:|:----:|:--------------------------:|:------------------------:|:-----------------------------------------------------------------:|:------------------------------------------------------------------:|:---------------------------------------:|:------------------------------------------------------:|
| BXH12\_1 | L006 |         48,944,095         |        97,888,190        |                                97.6                               |                                95.2                                |                93,045,774               |                          95.1%                         |
| BXH12\_2 | L007 |         46,809,812         |        93,619,624        |                                97.3                               |                                94.6                                |                88,751,742               |                          94.8%                         |
| HXB13\_1 | L007 |         50,150,896         |        100,301,792       |                                96.6                               |                                93.7                                |                93,391,098               |                          93.1%                         |
| HXB13\_2 | L005 |         45,529,860         |        91,059,720        |                                96.2                               |                                92.9                                |                86,281,220               |                          94.8%                         |
| HXB17\_1 | L004 |         46,594,113         |        93,188,226        |                                96.9                               |                                94.3                                |                87,697,048               |                          94.1%                         |
| HXB17\_2 | L007 |         37,696,059         |        75,392,118        |                                97.4                               |                                94.4                                |                69,564,926               |                          92.3%                         |
|  HXB2\_1 | L006 |         40,389,886         |        80,779,772        |                                96.4                               |                                93.5                                |                76,816,580               |                          95.1%                         |
|  HXB2\_2 | L005 |         41,680,207         |        83,360,414        |                                95.8                               |                                93.1                                |                77,783,436               |                          93.3%                         |
| HXB25\_1 | L006 |         35,104,202         |        70,208,404        |                                98.1                               |                                95.6                                |                66,696,022               |                          95.0%                         |
| HXB25\_2 | L005 |         47,102,360         |        94,204,720        |                                95.9                               |                                92.5                                |                90,325,420               |                          95.9%                         |
| HXB27\_1 | L004 |         35,651,237         |        71,302,474        |                                97.1                               |                                94.8                                |                67,262,682               |                          94.3%                         |
| HXB27\_2 | L007 |         45,626,177         |        91,252,354        |                                97.5                               |                                94.3                                |                86,678,818               |                          95.0%                         |
|  HXB7\_1 | L004 |         53,174,270         |        106,348,540       |                                96.0                               |                                92.2                                |               100,204,486               |                          94.2%                         |
|  HXB7\_2 | L006 |         49,021,976         |        98,043,952        |                                98.2                               |                                95.4                                |                93,699,446               |                          95.6%                         |
|  SHR\_1  | L004 |         49,060,694         |        98,121,388        |                                93.9                               |                                90.6                                |                94,595,122               |                          96.4%                         |
|  SHR\_2  | L005 |         50,009,902         |        100,019,804       |                                95.9                               |                                92.8                                |                95,399,012               |                          95.4%                         |

Total Number of Paired End Reads After Trimming: 684,096,416

Total Number of Read Fragments After Trimming: 1,368,192,832

Average Number of Paired End Reads Per Sample After Trimming: 42,756,026

5. Align to ribosomal RNA - DONE
--------------------------------

    qsub -q smp -N rRNA1 /storage/saba/Rat.RI.Liver.totalRNA.batch1/programs/alignTo.rRNA.liver.totalRNA.batch1.sh

**move files**

Proportion of Reads Aligned to rRNA
-----------------------------------

This batch was subjected to 2 washes with riboZero.

|  Sample  | Number of Paired-End Reads After Trimming | Number of Paired-End Reads with at Least One Fragment Aligned to rRNA | Percent of Paired-End Reads Aligned to rRNA | Number of Paired-End Reads NOT Aligned to rRNA |
|:--------:|:-----------------------------------------:|:---------------------------------------------------------------------:|:-------------------------------------------:|:----------------------------------------------:|
|  SHR\_1  |                 47,297,561                |                               39,238,828                              |                    83.0%                    |                    8,058,733                   |
|  SHR\_2  |                 47,699,506                |                               8,863,675                               |                    18.6%                    |                   38,835,831                   |
| BXH12\_1 |                 46,522,887                |                               2,641,923                               |                     5.7%                    |                   43,880,964                   |
| BXH12\_2 |                 44,375,871                |                               9,112,676                               |                    20.5%                    |                   35,263,195                   |
| HXB13\_1 |                 46,695,549                |                               3,971,059                               |                     8.5%                    |                   42,724,490                   |
| HXB13\_2 |                 43,140,610                |                               16,388,391                              |                    38.0%                    |                   26,752,219                   |
| HXB17\_1 |                 43,848,524                |                               2,200,164                               |                     5.0%                    |                   41,648,360                   |
| HXB17\_2 |                 34,782,463                |                               2,168,752                               |                     6.2%                    |                   32,613,711                   |
|  HXB2\_1 |                 38,408,290                |                               21,388,953                              |                    55.7%                    |                   17,019,337                   |
|  HXB2\_2 |                 38,891,718                |                               1,567,612                               |                     4.0%                    |                   37,324,106                   |
| HXB25\_1 |                 33,348,011                |                               3,510,385                               |                    10.5%                    |                   29,837,626                   |
| HXB25\_2 |                 45,162,710                |                               33,053,592                              |                    73.2%                    |                   12,109,118                   |
| HXB27\_1 |                 33,631,341                |                               2,319,115                               |                     6.9%                    |                   31,312,226                   |
| HXB27\_2 |                 43,339,409                |                               17,255,811                              |                    39.8%                    |                   26,083,598                   |
|  HXB7\_1 |                 50,102,243                |                               32,714,649                              |                    65.3%                    |                   17,387,594                   |
|  HXB7\_2 |                 46,849,723                |                               2,161,425                               |                     4.6%                    |                   44,688,298                   |
