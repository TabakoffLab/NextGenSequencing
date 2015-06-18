RI Panel - Batch 2 (Brain) Small RNA RNA-Seq
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
qsub -q smp /storage/saba/Rat.RI.Brain.smallRNA.batch2/programs/unzip.yucca.sh
```

2. Determine number of reads sent for each sample - DONE
-------------------------------------------------
```
qsub -q compute /storage/saba/Rat.RI.Brain.smallRNA.batch2/programs/countRawReads.brain.smRNA.batch2.sh
```



Raw Reads/Read Fragments
---------------------------


| sample  | Number of Reads |
|:-------:|:---------------:|
| HXB10_1 |   15,225,719    |
| HXB15_1 |   39,303,282    |
| HXB18_1 |   30,607,960    |
| HXB1_1  |   30,808,660    |
| HXB20_1 |   27,022,687    |
| HXB21_1 |   17,414,703    |
| HXB22_1 |   54,357,112    |
| HXB23_1 |   17,560,321    |
| HXB24_1 |   53,508,254    |
| HXB29_1 |   54,617,709    |
| BXH2_1  |    2,095,366    |
| HXB31_1 |    2,467,030    |
| HXB3_1  |   28,809,866    |
| HXB4_1  |   31,148,558    |
| HXB5_1  |   32,673,767    |
|  SHR_1  |   29,864,267    |

Total Number of Reads:  467,485,261  
Average Number of Reads Per Sample: 29,217,829  








