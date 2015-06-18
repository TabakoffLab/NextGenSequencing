BNLx and SHR Females (Brain) small RNA RNA-Seq
========================================================

* 4 samples per strain 
* tissues received from Dr. Michal Pravenec at Academy of Sciences of the Czech Republic, Prague, Czech Republic
* small RNA (<200 bp)
* 1X50 reads using the unstranded protocol
* sequencing done by UCD Genomics Core - received ?

1. Unzip Files - 
---------------
```
qsub -q compute -N females.unzip /storage/saba/BNLx.SHR.Brain.Females.smallRNA/programs/unzip.yucca.sh
```

2. Determine number of reads sent for each sample 
-------------------------------------------------
```
qsub -q compute -N females.raw /storage/saba/BNLx.SHR.Brain.Females.smallRNA/programs/rawReadCounts.femaleBrains.sh
```



Raw Reads/Read Fragments
---------------------------


| sample | Number of Reads |
|:------:|:---------------:|
| BNLx1  |   48,702,056    |
| BNLx2  |   37,468,478    |
| BNLx3  |   28,691,114    |
| BNLx4  |   34,355,637    |
|  SHR1  |   31,730,237    |
|  SHR2  |   40,650,744    |
|  SHR3  |   34,212,096    |
|  SHR4  |   41,190,106    |

Total Number of Reads:  297,000,468  
Average Number of Paired End Reads Per Sample: 37,125,058  






