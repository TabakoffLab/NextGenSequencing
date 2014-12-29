RI Panel - Batch 2 (Brain) Total RNA RNA-Seq
========================================================

* 1 sample per strain (SHR, BXH2, HXB10, HXB15, HXB18, HXB1, HXB20, HXB21, HXB22, HXB23, HXB24, HXB29, HXB31, HXB3, HXB4, HXB5, SHR)
* tissues received from Dr. Michal Pravenec at Academy of Sciences of the Czech Republic, Prague, Czech Republic
* ribosomal RNA depleted total RNA
* 2X100 reads using the stranded protocol
* sequencing done by Beckman Coulter Genomics - received September 24, 2014
  * labeled UColorado Tabakoff Batch 5 by Beckman
* synthetic spike-in were added to each sample 
  * HXB1_1, HXB3_1, HXB4_1, HXB15_1, HXB23_1, HXB24_1, HXB31_1, and SHR_1 have mix 1
  * HXB5_1, HXB10_1, HXB18_1, HXB20_1, HXB21_1, HXB22_1, HXB29_1, and BXH2_1 have mix 2
  * 4 mL of 1:100 diluted spikes were added after RNA extraction but before rRNA-depletion
  * Information regarding the spike-ins can be found here: http://products.invitrogen.com/ivgn/product/4456739

1. Unzip Files - DONE
---------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch2/programs/unzip.yucca.sh
```

2. Determine number of reads sent for each sample - DONE
-------------------------------------------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch2/programs/countRawReads.brain.batch2.sh
```




Raw Reads/Read Fragments
---------------------------

| sample  | Number of Paired-End Reads | Number of Read Fragments |
|:-------:|:--------------------------:|:------------------------:|
| BXH2_1  |        174,413,815         |       348,827,630        |
| HXB1_1  |        159,129,032         |       318,258,064        |
| HXB10_1 |        194,539,473         |       389,078,946        |
| HXB15_1 |        177,057,675         |       354,115,350        |
| HXB18_1 |        168,482,405         |       336,964,810        |
| HXB20_1 |        147,520,151         |       295,040,302        |
| HXB21_1 |        163,232,081         |       326,464,162        |
| HXB22_1 |        134,629,467         |       269,258,934        |
| HXB23_1 |        166,909,502         |       333,819,004        |
| HXB24_1 |        114,577,224         |       229,154,448        |
| HXB29_1 |        177,121,877         |       354,243,754        |
| HXB3_1  |        204,742,542         |       409,485,084        |
| HXB31_1 |        143,642,905         |       287,285,810        |
| HXB4_1  |        192,423,216         |       384,846,432        |
| HXB5_1  |        223,080,147         |       446,160,294        |
|  SHR_1  |        118,513,047         |       237,026,094        |


Total Number of Paired End Reads: 2,660,014,559  
Total Number of Read Fragments:  5,320,029,118  
Average Number of Paired End Reads Per Sample: 166,250,910  

3. Trim reads for adaptors and for quality - RUNNING
---------------

```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch2/programs/trimReads.brain.batch2.sh
```
