RI Panel - Batch 1 (Liver) Small RNA RNA-Seq
============================================

-   2 samples per strain (SHR, BXH12, HXB2, HXB7, HXB13, HXB17, HXB25, HXB27)
-   tissues received from Dr. Michal Pravenec at Academy of Sciences of the Czech Republic, Prague, Czech Republic
-   small RNA (\<200 bp)
-   1X50 reads using the unstranded protocol
-   sequencing done by UCD Genomics Core - received February 25, 2015
-   labeled 150219\_7001413\_0222\_AC6G34ANXX

1. Unzip Files - DONE
---------------------

    gzip -d /hi-seq/RI.Liver.smallRNA.25Feb15/rawReads/*.gz

2. Determine number of reads sent for each sample -
---------------------------------------------------

    /hi-seq/RI.Liver.smallRNA.25Feb15/programs/countRawReads.liver.smRNA.batch1.sh &

Raw Reads/Read Fragments
------------------------

|  sample  | Number of Reads |
|:--------:|:---------------:|
| BXH12\_1 |    43,925,935   |
| BXH12\_2 |    10,699,001   |
| HXB13\_1 |    60,804,232   |
| HXB13\_2 |    61,654,626   |
| HXB17\_1 |    55,402,758   |
| HXB17\_2 |    53,003,869   |
|  HXB2\_1 |    50,062,103   |
|  HXB2\_2 |    42,443,871   |
| HXB25\_1 |    53,411,290   |
| HXB25\_2 |    58,150,555   |
| HXB27\_1 |    56,757,256   |
| HXB27\_2 |    47,770,314   |
|  HXB7\_1 |    40,635,331   |
|  HXB7\_2 |    54,117,572   |
|  SHR\_1  |    58,886,985   |
|  SHR\_2  |    50,428,076   |

Total Number of Reads: 798,153,774
Average Number of Reads Per Sample: 49,884,611
