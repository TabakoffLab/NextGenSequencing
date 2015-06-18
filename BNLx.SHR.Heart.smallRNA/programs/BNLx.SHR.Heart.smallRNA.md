BNLx and SHR Heart small RNA RNA-Seq
========================================================

* 4 samples per strain 
* tissues received from Dr. Michal Pravenec at Academy of Sciences of the Czech Republic, Prague, Czech Republic
* small RNA (<200 bp)
* 1X50 reads using the unstranded protocol
* sequencing done by UCD Genomics Core - received ?

1. Unzip Files - 
---------------
```
qsub -q compute -N heart.unzip /storage/saba/BNLx.SHR.Heart.smallRNA/programs/unzip.yucca.sh
```

2. Determine number of reads sent for each sample 
-------------------------------------------------
```
qsub -q compute -N heart.raw /storage/saba/BNLx.SHR.Heart.smallRNA/programs/rawReadCounts.heart.smallRNA.sh
```


Raw Reads/Read Fragments
---------------------------


| sample | Number of Reads |
|:------:|:---------------:|
| BNLx1  |   34,453,707    |
| BNLx2  |   39,522,215    |
| BNLx3  |   42,963,408    |
| BNLx4  |   31,742,668    |
|  SHR1  |   36,157,840    |
|  SHR2  |   31,249,257    |
|  SHR3  |   36,320,213    |
|  SHR4  |   47,431,045    |

Total Number of Reads:  299,840,353  
Average Number of Paired End Reads Per Sample: 37,480,044  




