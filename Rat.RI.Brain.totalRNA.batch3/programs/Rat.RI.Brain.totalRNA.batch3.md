RI Panel - Batch 3 (Brain) Total RNA RNA-Seq
========================================================

* 1 sample per strain (SHR, BXH13, BXH5, BXH8)
* 2 samples per strain (BNLx, BXH10, BXH11, BXH3, BXH6, BXH9)
* tissues received from Dr. Michal Pravenec at Academy of Sciences of the Czech Republic, Prague, Czech Republic
* ribosomal RNA depleted total RNA
* 2X100 reads using the stranded protocol
* sequencing done by Beckman Coulter Genomics - received November 22, 2014
  * labeled UColorado Tabakoff Batch 5 by Beckman
* synthetic spike-in were added to each sample 
  * BXH3_1, BXH3_2, BXH5_1, BXH8_1, BXH10_1, BXH11_2, BXH13_1, and SHR_1 have mix 1
  * BXH6_1, BXH6_2, BXH9_1, BXH9_2, BXH10_2, BXH11_1, BNLx_1, and BNLx_2 have mix 2
  * 4 mL of 1:100 diluted spikes were added after RNA extraction but before rRNA-depletion
  * Information regarding the spike-ins can be found here: http://products.invitrogen.com/ivgn/product/4456739

1. Unzip Files - DONE
---------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/unzip.yucca.sh
```

2. Determine number of reads sent for each sample - DONE
-------------------------------------------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/countRawReads.brain.batch3.sh
```




Raw Reads/Read Fragments
---------------------------

| sample  | Number of Paired-End Reads | Number of Read Fragments |
|:-------:|:--------------------------:|:------------------------:|
| BNLX_1  |        149,664,346         |       299,328,692        |
| BNLX_2  |        147,573,455         |       295,146,910        |
| BXH10_1 |        136,119,802         |       272,239,604        |
| BXH10_2 |        143,559,349         |       287,118,698        |
| BXH11_1 |        143,165,227         |       286,330,454        |
| BXH11_2 |        142,142,287         |       284,284,574        |
| BXH13_1 |        136,469,855         |       272,939,710        |
| BXH3_1  |        148,297,982         |       296,595,964        |
| BXH3_2  |        138,276,728         |       276,553,456        |
| BXH5_1  |        141,525,963         |       283,051,926        |
| BXH6_1  |        140,776,240         |       281,552,480        |
| BXH6_2  |        146,263,134         |       292,526,268        |
| BXH8_1  |        130,847,183         |       261,694,366        |
| BXH9_1  |        132,797,003         |       265,594,006        |
| BXH9_2  |        133,839,175         |       267,678,350        |
|  SHR_1  |        146,707,331         |       293,414,662        |


Total Number of Paired End Reads: 2,258,025,060  
Total Number of Read Fragments:  4,516,050,120  
Average Number of Paired End Reads Per Sample: 141,126,566  

3. Trim reads for adaptors and for quality - RUNNING (job number 44238)
---------------

```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/trimReads.brain.batch3.sh
```
