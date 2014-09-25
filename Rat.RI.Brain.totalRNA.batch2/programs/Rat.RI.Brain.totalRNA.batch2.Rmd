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

1. Unzip Files
---------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch2/programs/unzip.yucca.sh
```

2. Determine number of reads sent for each sample - DONE
-------------------------------------------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch2/programs/countRawReads.brain.batch2.sh
```
