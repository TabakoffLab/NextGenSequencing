RI Panel - Batch 1 (Brain) Small RNA RNA-Seq
========================================================

* 16 samples
* tissues received from Dr. Michal Pravenec at Academy of Sciences of the Czech Republic, Prague, Czech Republic
* small RNA (<200 bp)
* 1X50 reads using the unstranded protocol
* sequencing done by UCD Genomics Core - received ?

1. Unzip Files - DONE
---------------
```
qsub -q compute -N batch3.unzip /storage/saba/Rat.RI.Brain.smallRNA.batch1/programs/unzip.yucca.sh
```

2. Determine number of reads sent for each sample - DONE
-------------------------------------------------
```
qsub -q compute -N batch3.raw /storage/saba/Rat.RI.Brain.smallRNA.batch1/programs/countRawReads.brain.smRNA.batch1.sh
```



Raw Reads/Read Fragments
---------------------------


| sample  | Number of Reads |
|:-------:|:---------------:|
| HXB2_2  |   33,576,761    |
| HXB13_2 |   33,252,447    |
| BXH12_1 |   35,398,581    |
| HXB2_1  |   34,791,940    |
| BXH12_2 |   35,365,795    |
| HXB13_1 |   36,322,662    |
| HXB17_2 |   34,335,917    |
| HXB27_1 |   38,224,046    |
|  SHR_1  |   35,847,101    |
| HXB7_1  |   34,962,577    |
|  SHR_2  |   33,951,564    |
| HXB25_2 |   42,289,157    |
| HXB25_1 |   39,348,928    |
| HXB7_2  |   39,960,808    |
| HXB27_2 |   36,869,277    |
| HXB17_1 |   33,730,417    |

Total Number of Reads:  578,227,978  
Average Number of Reads Per Sample: 36,139,249  






