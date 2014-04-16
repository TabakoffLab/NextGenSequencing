Initial Quality Control of Liver RNA-Seq Reads From UCD Genomics Core (received 4/1/14)
=========================
* 6 liver ribosomal RNA depleted total RNA samples, SHR1, SHR5, SHR25, BNLx1, BNLx2, and BNLx3
* synthetic spikes included Mix 1 in SHR1, BNLx1, and BNLx2 and Mix 2 in SHR5, SHR25, and BNLx3
* 2X100 paired end reads using the stranded protocol


1. Unzip FASTQ files on Yucca - DONE
----------------------------
```
qsub -q smp-q /home/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/unzip.yucca.sh
```

2. Determine number of reads sent for each sample - DONE
----------------------------------------------------------
```
qsub -q smp-q /home/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/rawReadCounts.sh
```




Raw Reads/Read Fragments From UCD Genomic Core
---------------------------

| sample | strain | lane | numPairedReads | numReadFragments |
|:------:|:------:|:----:|:--------------:|:----------------:|
| BNLx1  |  BNLx  | L005 |  119,624,256   |   239,248,512    |
| SHRH1  |  SHR   | L005 |  109,987,327   |   219,974,654    |
| BNLx2  |  BNLx  | L006 |  104,944,610   |   209,889,220    |
| SHRH5  |  SHR   | L006 |   96,770,957   |   193,541,914    |
| BNLx3  |  BNLx  | L007 |   69,001,559   |   138,003,118    |
| SHRL25 |  SHR   | L007 |   82,591,985   |   165,183,970    |


3. Trim Reads for Adaptors and for Quality - DONE
--------------------------------------------
```
qsub -q smp-q /home/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/trimReads.yucca.sh
```

4. Characterizing Trimmed Reads - DONE
----------------------------------
```
qsub -q smp-q /home/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/countTrimmed.yucca.sh
```




Effect of Trimming Adaptors and Poor Quality Base Calls
---------------------------

| sample | strain | lane | numPairedReads | numReadFragments | avgTrimmedReadLength | numTrimmedReadFragments | pctRemovedByTrimming |
|:------:|:------:|:----:|:--------------:|:----------------:|:--------------------:|:-----------------------:|:--------------------:|
| BNLx1  |  BNLx  | L005 |  119,624,256   |   239,248,512    |        92.83         |       234,327,370       |        0.021%        |
| BNLx2  |  BNLx  | L006 |  104,944,610   |   209,889,220    |        96.09         |       207,427,684       |        0.012%        |
| BNLx3  |  BNLx  | L007 |   69,001,559   |   138,003,118    |        90.95         |       137,036,336       |        0.007%        |
| SHRH1  |  SHR   | L005 |  109,987,327   |   219,974,654    |        97.27         |       217,663,066       |        0.011%        |
| SHRH5  |  SHR   | L006 |   96,770,957   |   193,541,914    |        95.94         |       190,584,770       |        0.015%        |
| SHRL25 |  SHR   | L007 |   82,591,985   |   165,183,970    |        90.56         |       163,641,336       |       0.0093%        |


5.  Generate Strain-Specific Genomes Including Spike-In Sequences - DONE
-------------------------------------------
```
qsub -q smp-q /home/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/createGenomeIndex.yucca.sh
```

6. Alignment of Raw Reads to Strain-Specific Genomes - DEBUGGING
------------------------------------
*STOPPED HERE - waiting for response from Ron*
==============================================
7.  Characterization of Aligned Reads
---------------------------

8.  Examine Spike-In Expression 
-----------------------

