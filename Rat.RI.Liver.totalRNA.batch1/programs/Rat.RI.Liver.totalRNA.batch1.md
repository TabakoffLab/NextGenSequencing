RI Panel - Batch 1 (Liver) Total RNA RNA-Seq
============================================

-   2 samples per strain (SHR, BXH12, HXB13, HXB17, HXB2, HXB25, HXB27, HXB7)
-   tissues received from Dr. Michal Pravenec at Academy of Sciences of the Czech Republic, Prague, Czech Republic
-   ribosomal RNA depleted total RNA
-   2X100 reads using the stranded protocol
-   sequencing done by Beckman Coulter Genomics - received June 5, 2015
-   synthetic spike-in were added to each sample
-   SHR\_1, BXH12\_1, HXB13\_1, HXB17\_1, HXB2\_1, HXB25\_2, HXB27\_1, and HXB7\_1 have mix 1; SHR\_2, BXH12\_2, HXB13\_2, HXB17\_2, HXB2\_2, HXB25\_1, HXB27\_2, and HXB7\_2 have mix 2
-   4 mL of 1:100 diluted spikes were added after RNA extraction but before rRNA-depletion
-   Information regarding the spike-ins can be found here: <http://products.invitrogen.com/ivgn/product/4456739>

1. Unzip Files - DONE
---------------------

    qsub -q smp -N liver.batch1 /storage/saba/Rat.RI.Liver.totalRNA.batch1/programs/unzip.yucca.sh

2. Determine number of reads sent for each sample - DONE
--------------------------------------------------------

    qsub -q smp -N cntRaw /storage/saba/Rat.RI.Liver.totalRNA.batch1/programs/countRawReads.liver.batch1.sh

Raw Reads/Read Fragments
------------------------

|  sample  | Number of Paired-End Reads | Number of Read Fragments |
|:--------:|:--------------------------:|:------------------------:|
| BXH12\_1 |         48,944,095         |        97,888,190        |
| BXH12\_2 |         46,809,812         |        93,619,624        |
| HXB13\_1 |         50,150,896         |        100,301,792       |
| HXB13\_2 |         45,529,860         |        91,059,720        |
| HXB17\_1 |         46,594,113         |        93,188,226        |
| HXB17\_2 |         37,696,059         |        75,392,118        |
|  HXB2\_1 |         40,389,886         |        80,779,772        |
|  HXB2\_2 |         41,680,207         |        83,360,414        |
| HXB25\_1 |         35,104,202         |        70,208,404        |
| HXB25\_2 |         47,102,360         |        94,204,720        |
| HXB27\_1 |         35,651,237         |        71,302,474        |
| HXB27\_2 |         45,626,177         |        91,252,354        |
|  HXB7\_1 |         53,174,270         |        106,348,540       |
|  HXB7\_2 |         49,021,976         |        98,043,952        |
|  SHR\_1  |         49,060,694         |        98,121,388        |
|  SHR\_2  |         50,009,902         |        100,019,804       |

Total Number of Paired End Reads: 361,272,873
Total Number of Read Fragments: 722,545,746
Average Number of Paired End Reads Per Sample: 22,579,555

3. Trim reads for adaptors and for quality -
--------------------------------------------

    qsub -q smp -N trimBatch1 /storage/saba/Rat.RI.Liver.totalRNA.batch1/programs/trimReads.liver.batch1.sh

Compress raw reads after trimmed reads become available

    qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch1/programs/compressRawReads.sh

4. Characterize Trimmed Reads - RUNNING
---------------------------------------

    qsub -q smp -N cntTrimmed1 /storage/saba/Rat.RI.Liver.totalRNA.batch1/programs/countTrimmedReads.liver.batch1.sh

5. Align to ribosomal RNA - RUNNING
-----------------------------------

    qsub -q smp -N rRNA1 /storage/saba/Rat.RI.Liver.totalRNA.batch1/programs/alignTo.rRNA.liver.totalRNA.batch1.sh
