RI Panel - Batch 1 (Brain) Total RNA RNA-Seq
========================================================

* 2 samples per strain (SHR, BXH12, HXB13, HXB17, HXB2, HXB25, HXB27, HXB7)
* tissues received from Dr. Michal Pravenec at Academy of Sciences of the Czech Republic, Prague, Czech Republic
* ribosomal RNA depleted total RNA
* 2X100 reads using the stranded protocol
* sequencing done by Beckman Coulter Genomics - received September 5, 2014
* synthetic spike-in were added to each sample 
  * SHR_1, BXH12_1, HXB13_1, HXB17_1, HXB2_1, HXB25_1, HXB27_1, and HXB7_1 have mix 1; SHR_2, BXH12_2, HXB13_2, HXB17_2, HXB2_2, HXB25_2, HXB27_2, and HXB7_2 have mix 2
  * 4 mL of 1:100 diluted spikes were added after RNA extraction but before rRNA-depletion
  * Information regarding the spike-ins can be found here: http://products.invitrogen.com/ivgn/product/4456739

1. Unzip Files - DONE
---------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch1/programs/unzip.yucca.sh
```

2. Determine number of reads sent for each sample - DONE
-------------------------------------------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch1/programs/countRawReads.brain.batch1.sh
```




Raw Reads/Read Fragments
---------------------------

| sample  | Number of Paired-End Reads | Number of Read Fragments |
|:-------:|:--------------------------:|:------------------------:|
| BXH12_1 |        158,661,335         |       317,322,670        |
| BXH12_2 |        189,172,520         |       378,345,040        |
| HXB13_1 |        137,084,983         |       274,169,966        |
| HXB13_2 |        132,515,930         |       265,031,860        |
| HXB17_1 |        132,884,089         |       265,768,178        |
| HXB17_2 |        206,344,183         |       412,688,366        |
| HXB2_1  |        105,150,313         |       210,300,626        |
| HXB2_2  |        130,036,249         |       260,072,498        |
| HXB25_1 |        115,639,769         |       231,279,538        |
| HXB25_2 |        178,617,581         |       357,235,162        |
| HXB27_1 |        120,993,425         |       241,986,850        |
| HXB27_2 |        145,364,335         |       290,728,670        |
| HXB7_1  |        128,794,212         |       257,588,424        |
| HXB7_2  |        195,878,926         |       391,757,852        |
|  SHR_1  |        156,973,256         |       313,946,512        |
|  SHR_2  |        169,578,776         |       339,157,552        |


Total Number of Paired End Reads: 2,403,689,882  
Total Number of Read Fragments:  4,807,379,764  
Average Number of Paired End Reads Per Sample: 150,230,618  

3. Trim reads for adaptors and for quality - RUNNING
---------------

```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch1/programs/trimReads.brain.batch1.sh
```
