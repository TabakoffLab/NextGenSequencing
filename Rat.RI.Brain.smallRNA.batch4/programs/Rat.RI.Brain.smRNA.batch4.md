RI Panel - Batch 4 (Brain) Small RNA RNA-Seq
============================================

-   SHR1, SHR3, and BNLx3
-   tissues received from Dr. Michal Pravenec at Academy of Sciences of the Czech Republic, Prague, Czech Republic
-   small RNA (\<200 bp)
-   1X50 reads using the unstranded protocol
-   sequencing done by UCD Genomics Core - received May 14, 2015
-   labeled 150508\_7001413\_0258\_AC6K0DANXX

Processing Done on PhenoGen Server

1. Unzip Files - DONE
---------------------

    gzip -d /hi-seq/RI.Brain.smallRNA.14May15/rawReads/*.gz

2. Determine number of reads sent for each sample - DONE
--------------------------------------------------------

    /hi-seq/RI.Brain.smallRNA.14May15/programs/countRawReads.brain.smRNA.batch4.sh &

Raw Reads/Read Fragments
------------------------

|  sample | Number of Reads |
|:-------:|:---------------:|
| BNLX\_3 |    6,741,889    |
|  SHR\_1 |    53,716,123   |
|  SHR\_3 |    1,045,948    |

Total Number of Reads: 61,503,960
Average Number of Reads Per Sample: 20,501,320
