RI Panel - Batch 2 (Liver) Small RNA RNA-Seq
============================================

-   1 sample per strain (HXB23,HXB24,BXH2,HXB29,HXB10,HXB31,HXB1,HXB3,HXB18,HXB4,HXB20,HXB5,HXB21,HXB22,HXB15,SHR)
-   tissues received from Dr. Michal Pravenec at Academy of Sciences of the Czech Republic, Prague, Czech Republic
-   small RNA (\<200 bp)
-   1X50 reads using the unstranded protocol
-   sequencing done by UCD Genomics Core - received June 18, 2015
-   labeled 150602\_7001413\_0268\_BC6K12ANXX

1. Unzip Files -
----------------

    gzip -d /hi-seq/RI.Liver.smallRNA.18Jun15/rawReads/*.gz & 

2. Determine number of reads sent for each sample -
---------------------------------------------------

    /hi-seq/RI.Liver.smallRNA.18Jun15/programs/countRawReads.liver.smRNA.batch2.sh &

Raw Reads/Read Fragments
------------------------

|  sample  | Number of Reads |
|:--------:|:---------------:|
|  BXH2\_1 |    2,864,385    |
| HXB10\_1 |    11,044,349   |
|  HXB1\_1 |    4,997,005    |
| HXB18\_1 |    7,230,254    |
| HXB20\_1 |    63,065,606   |
| HXB21\_1 |    1,748,843    |
| HXB22\_1 |    22,223,509   |
| HXB23\_1 |    16,920,548   |
| HXB24\_1 |    22,911,600   |
| HXB29\_1 |    4,577,185    |
| HXB31\_1 |    3,588,447    |
|  HXB3\_1 |    77,170,326   |
|  HXB4\_1 |    17,198,733   |
|  HXB5\_1 |    9,632,673    |
|  SHR\_1  |    2,078,737    |
| HXB15\_1 |    2,476,091    |

Total Number of Reads: 269,728,291
Average Number of Reads Per Sample: 16,858,018
