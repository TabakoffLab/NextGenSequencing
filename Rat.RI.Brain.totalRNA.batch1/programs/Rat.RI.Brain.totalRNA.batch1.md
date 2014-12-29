RI Panel - Batch 1 (Brain) Total RNA RNA-Seq
========================================================

* 2 samples per strain (SHR, BXH12, HXB13, HXB17, HXB2, HXB25, HXB27, HXB7)
* tissues received from Dr. Michal Pravenec at Academy of Sciences of the Czech Republic, Prague, Czech Republic
* ribosomal RNA depleted total RNA
* 2X100 reads using the stranded protocol
* sequencing done by Beckman Coulter Genomics - received September 5, 2014
* synthetic spike-in were added to each sample 
  * SHR_1, BXH12_1, HXB13_1, HXB17_1, HXB2_1, HXB25_1, HXB27_1, and HXB7_1 have mix 1; SHR_2, BXH12_2, HXB13_2, HXB17_2, HXB2_2, HXB25_2, HXB27_2, and HXB7_2 have mix 2
  * 4 mL of 1:100 diluted spikes were added after RNA extraction but before rRNA-depletion
  * Information regarding the spike-ins can be found here: http://products.invitrogen.com/ivgn/product/4456739

1. Unzip Files - DONE
---------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch1/programs/unzip.yucca.sh
```

2. Determine number of reads sent for each sample - DONE
-------------------------------------------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch1/programs/countRawReads.brain.batch1.sh
```




Raw Reads/Read Fragments
---------------------------

| sample  | Number of Paired-End Reads | Number of Read Fragments |
|:-------:|:--------------------------:|:------------------------:|
| BXH12_1 |        158,661,335         |       317,322,670        |
| BXH12_2 |        189,172,520         |       378,345,040        |
| HXB13_1 |        137,084,983         |       274,169,966        |
| HXB13_2 |        132,515,930         |       265,031,860        |
| HXB17_1 |        132,884,089         |       265,768,178        |
| HXB17_2 |        206,344,183         |       412,688,366        |
| HXB2_1  |        105,150,313         |       210,300,626        |
| HXB2_2  |        130,036,249         |       260,072,498        |
| HXB25_1 |        115,639,769         |       231,279,538        |
| HXB25_2 |        178,617,581         |       357,235,162        |
| HXB27_1 |        120,993,425         |       241,986,850        |
| HXB27_2 |        145,364,335         |       290,728,670        |
| HXB7_1  |        128,794,212         |       257,588,424        |
| HXB7_2  |        195,878,926         |       391,757,852        |
|  SHR_1  |        156,973,256         |       313,946,512        |
|  SHR_2  |        169,578,776         |       339,157,552        |


Total Number of Paired End Reads: 2,403,689,882  
Total Number of Read Fragments:  4,807,379,764  
Average Number of Paired End Reads Per Sample: 150,230,618  

3. Trim reads for adaptors and for quality - DONE
---------------

```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch1/programs/trimReads.brain.batch1.sh
```

4. Characterize Trimmed Reads - DONE
---------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch1/programs/countTrimmedReads.sh
```




Trimmed Reads/Read Fragments
---------------------------

| sample  | lane | Number of Paired-End Reads | Number of Read Fragments | Average Read Fragment Length After Trimming (first read fragment) | Average Read Fragment Length After Trimming (second read fragment) | Number of Read Fragments After Trimming | Percent of Read Fragments That Remained After Trimming |
|:-------:|:----:|:--------------------------:|:------------------------:|:-----------------------------------------------------------------:|:------------------------------------------------------------------:|:---------------------------------------:|:------------------------------------------------------:|
| BXH12_1 | L001 |         79,425,993         |       158,851,986        |                               97.0                                |                                95.3                                |               154,512,608               |                         97.3%                          |
| BXH12_1 | L002 |         79,235,342         |       158,470,684        |                               97.1                                |                                95.4                                |               154,199,202               |                         97.3%                          |
| BXH12_2 | L001 |         95,934,792         |       191,869,584        |                               92.1                                |                                90.5                                |               187,446,530               |                         97.7%                          |
| BXH12_2 | L002 |         93,237,728         |       186,475,456        |                               91.9                                |                                90.3                                |               182,296,210               |                         97.8%                          |
| HXB13_1 | L001 |         68,614,312         |       137,228,624        |                               94.2                                |                                92.2                                |               133,569,138               |                         97.3%                          |
| HXB13_1 | L002 |         68,470,671         |       136,941,342        |                               94.2                                |                                92.2                                |               133,197,198               |                         97.3%                          |
| HXB13_2 | L001 |         66,448,581         |       132,897,162        |                               95.3                                |                                93.7                                |               130,991,988               |                         98.6%                          |
| HXB13_2 | L002 |         66,067,349         |       132,134,698        |                               95.3                                |                                93.7                                |               130,254,270               |                         98.6%                          |
| HXB17_1 | L001 |         66,025,749         |       132,051,498        |                               92.9                                |                                90.7                                |               129,042,418               |                         97.7%                          |
| HXB17_1 | L002 |         66,858,340         |       133,716,680        |                               93.0                                |                                90.8                                |               130,604,420               |                         97.7%                          |
| HXB17_2 | L001 |        102,517,288         |       205,034,576        |                               96.9                                |                                95.2                                |               201,473,076               |                         98.3%                          |
| HXB17_2 | L002 |        103,826,895         |       207,653,790        |                               96.9                                |                                95.2                                |               203,829,380               |                         98.2%                          |
| HXB2_1  | L001 |         49,921,299         |        99,842,598        |                               95.6                                |                                92.0                                |                95,806,194               |                         96.0%                          |
| HXB2_1  | L002 |         55,229,014         |       110,458,028        |                               95.7                                |                                92.8                                |               106,517,394               |                         96.4%                          |
| HXB2_2  | L001 |         64,546,195         |       129,092,390        |                               94.7                                |                                92.1                                |               122,491,250               |                         94.9%                          |
| HXB2_2  | L002 |         65,490,054         |       130,980,108        |                               94.7                                |                                92.1                                |               124,273,424               |                         94.9%                          |
| HXB25_1 | L001 |         57,270,703         |       114,541,406        |                               94.8                                |                                93.5                                |               112,283,812               |                         98.0%                          |
| HXB25_1 | L002 |         58,369,066         |       116,738,132        |                               94.9                                |                                93.5                                |               114,338,636               |                         97.9%                          |
| HXB25_2 | L001 |         89,391,911         |       178,783,822        |                               97.1                                |                                95.1                                |               175,132,790               |                         98.0%                          |
| HXB25_2 | L002 |         89,225,670         |       178,451,340        |                               97.1                                |                                95.2                                |               174,874,506               |                         98.0%                          |
| HXB27_1 | L001 |         61,440,747         |       122,881,494        |                               94.2                                |                                91.2                                |               120,272,758               |                         97.9%                          |
| HXB27_1 | L002 |         59,552,678         |       119,105,356        |                               94.0                                |                                91.0                                |               116,650,202               |                         97.9%                          |
| HXB27_2 | L001 |         69,017,734         |       138,035,468        |                               92.7                                |                                88.2                                |               132,305,516               |                         95.8%                          |
| HXB27_2 | L002 |         76,346,601         |       152,693,202        |                               92.9                                |                                89.2                                |               147,371,758               |                         96.5%                          |
| HXB7_1  | L001 |         64,586,450         |       129,172,900        |                               96.6                                |                                94.9                                |               127,268,692               |                         98.5%                          |
| HXB7_1  | L002 |         64,207,762         |       128,415,524        |                               96.6                                |                                94.9                                |               126,537,628               |                         98.5%                          |
| HXB7_2  | L001 |         98,150,006         |       196,300,012        |                               97.3                                |                                95.9                                |               193,055,396               |                         98.3%                          |
| HXB7_2  | L002 |         97,728,920         |       195,457,840        |                               97.3                                |                                95.9                                |               192,119,260               |                         98.3%                          |
|  SHR_1  | L001 |         78,020,870         |       156,041,740        |                               94.8                                |                                92.2                                |               151,866,538               |                         97.3%                          |
|  SHR_1  | L002 |         78,952,386         |       157,904,772        |                               94.8                                |                                92.2                                |               153,615,466               |                         97.3%                          |
|  SHR_2  | L001 |         84,086,289         |       168,172,578        |                               98.0                                |                                96.8                                |               166,001,874               |                         98.7%                          |
|  SHR_2  | L002 |         85,492,487         |       170,984,974        |                               98.0                                |                                96.8                                |               168,745,982               |                         98.7%                          |


Total Number of Paired End Reads After Trimming: 2,346,472,757  
Total Number of Read Fragments After Trimming:  4,692,945,514  
Average Number of Paired End Reads Per Sample After Trimming: 146,654,547  

5. Align to ribosomal RNA - DONE
---------------------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch1/programs/alignTo.rRNA.batch1.10Oct14.sh
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch1/programs/alignTo.rRNA.batch1.10Oct14.HXB27.sh
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch1/programs/alignTo.rRNA.heart.30Sep14.BXH12_2.sh
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch1/programs/alignTo.rRNA.batch1.13Oct14.HXB7_2.sh


```
**move files**



Proportion of Reads Aligned to rRNA
-----------------------------------
This batch was only subjected to 1 wash with riboZero.  The next batch received two washes.  



| Sample  | Number of Paired-End Reads After Trimming | Number of Paired-End Reads with at Least One Fragment Aligned to rRNA | Percent of Paired-End Reads Aligned to rRNA | Number of Paired-End Reads NOT Aligned to rRNA |
|:-------:|:-----------------------------------------:|:---------------------------------------------------------------------:|:-------------------------------------------:|:----------------------------------------------:|
|  SHR_1  |                152,741,002                |                               13,460,593                              |                    8.8%                     |                  139,280,409                   |
|  SHR_2  |                167,373,928                |                                4,291,567                              |                    2.6%                     |                  163,082,361                   |
| BXH12_1 |                154,355,905                |                                6,016,371                              |                    3.9%                     |                  148,339,534                   |
| BXH12_2 |                184,871,370                |                              125,338,475                              |                    67.8%                    |                   59,532,895                   |
| HXB13_1 |                133,383,168                |                               16,425,528                              |                    12.3%                    |                  116,957,640                   |
| HXB13_2 |                130,623,129                |                               79,249,908                              |                    60.7%                    |                   51,373,221                   |
| HXB17_1 |                129,823,419                |                               40,737,282                              |                    31.4%                    |                   89,086,137                   |
| HXB17_2 |                202,651,228                |                               33,635,267                              |                    16.6%                    |                  169,015,961                   |
| HXB2_1  |                101,161,794                |                                2,008,352                              |                    2.0%                     |                   99,153,442                   |
| HXB2_2  |                123,382,337                |                                9,008,501                              |                    7.3%                     |                  114,373,836                   |
| HXB25_1 |                113,311,224                |                               13,964,653                              |                    12.3%                    |                   99,346,571                   |
| HXB25_2 |                175,003,648                |                                8,798,242                              |                    5.0%                     |                  166,205,406                   |
| HXB27_1 |                118,461,480                |                               12,460,389                              |                    10.5%                    |                  106,001,091                   |
| HXB27_2 |                139,838,637                |                               15,049,365                              |                    10.8%                    |                  124,789,272                   |
| HXB7_1  |                126,903,160                |                               11,180,339                              |                    8.8%                     |                  115,722,821                   |
| HXB7_2  |                192,587,328                |                               30,127,919                              |                    15.6%                    |                  162,459,409                   |


6.  Convert unmapped.bam file into fastq files - RUNNING
-----------------------------------------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch1/programs/convertToFastQ.batch1.sh
```

