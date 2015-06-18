BNLx and SHR (Brain) small RNA RNA-Seq
========================================================

* 3 samples per strain 
* tissues received from ?
* small RNA (<200 bp)
* 1X50 reads using the unstranded protocol
* sequencing done by ?

1. Determine number of reads sent for each sample 
-------------------------------------------------
```
qsub -q compute -N brain.raw /storage/saba/BNLx.SHR.Brain.smallRNA/programs/rawReadCounts.brain.smallRNA.sh
```



Raw Reads/Read Fragments
---------------------------


| sample | Number of Reads |
|:------:|:---------------:|
| BNLx1  |    9,448,818    |
| BNLx2  |   25,103,528    |
| BNLx3  |   25,124,754    |
|  SHR1  |   17,444,034    |
|  SHR2  |   19,203,563    |
|  SHR3  |        5,687    |

Total Number of Reads:  96,330,384  
Average Number of Paired End Reads Per Sample: 16,055,064  



