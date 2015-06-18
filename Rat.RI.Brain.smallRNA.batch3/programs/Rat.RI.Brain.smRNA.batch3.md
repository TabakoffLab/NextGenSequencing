RI Panel - Batch 3 (Brain) Small RNA RNA-Seq
========================================================

* 1 sample per strain (SHR, BXH2, HXB10, HXB15, HXB18, HXB1, HXB20, HXB21, HXB22, HXB23, HXB24, HXB29, HXB31, HXB3, HXB4, HXB5, SHR)
* tissues received from Dr. Michal Pravenec at Academy of Sciences of the Czech Republic, Prague, Czech Republic
* small RNA (<200 bp)
* 1X50 reads using the unstranded protocol
* sequencing done by UCD Genomics Core - received ?
  * labeled ?

1. Unzip Files - DONE
---------------
```
qsub -q compute -N batch3.unzip /storage/saba/Rat.RI.Brain.smallRNA.batch3/programs/unzip.yucca.sh
```

2. Determine number of reads sent for each sample - DONE
-------------------------------------------------
```
qsub -q compute -N batch3.raw /storage/saba/Rat.RI.Brain.smallRNA.batch3/programs/countRawReads.brain.smRNA.batch3.sh
```


Raw Reads/Read Fragments
---------------------------


| sample  | Number of Reads |
|:-------:|:---------------:|
| BNLX_1  |   70,265,084    |
| BNLX_2  |   69,900,589    |
| BXH10_1 |   43,019,242    |
| BXH10_2 |   47,670,815    |
| BXH11_1 |   79,473,155    |
| BXh11_2 |   47,694,651    |
| BXH13_1 |   51,198,339    |
| BXH3_1  |   22,188,392    |
| BXH3_2  |   85,888,891    |
| BXH5_1  |   68,937,683    |
| BXH6_1  |   29,046,012    |
| BXH6_2  |   72,204,207    |
| BXH8_1  |   29,321,441    |
| BXH9_1  |   31,656,431    |
| BXH9_2  |   47,920,713    |
|  SHR_1  |   81,068,255    |

Total Number of Reads:  877,453,900  
Average Number of Reads Per Sample: 54,840,869  








