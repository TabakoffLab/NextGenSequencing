Initial Quality Control of Liver RNA-Seq Reads From UCD Genomics Core (received 4/1/14)
=========================
* 5 liver small RNA samples, SHR1, SHR5, BNLx1, BNLx2, and BNLx3
* 2X100 paired end reads using the stranded protocol

1. Unzip FASTQ files on Yucca - DONE
----------------------------
```
qsub -q smp-q /home/saba/BNLx.SHR.Liver.smallRNA.UCD/programs/unzip.yucca.11Apr14.sh
```

2. Determine number of reads sent for each sample - DONE
----------------------------------------------------------
```
qsub -q smp-q /home/saba/BNLx.SHR.Liver.smallRNA.UCD/programs/rawReadCounts.14Apr14.sh
```




Raw Reads/Read Fragments From UCD Genomic Core
---------------------------

| sample | strain | numPairedReads | numReadFragments |
|:------:|:------:|:--------------:|:----------------:|
| BNLx1  |  BNLx  |   42,273,076   |    84,546,152    |
| BNLx2  |  BNLx  |   68,673,192   |   137,346,384    |
| BNLx3  |  BNLx  |   72,883,707   |   145,767,414    |
|  SHR1  |  SHR   |   82,446,872   |   164,893,744    |
|  SHR5  |  SHR   |   75,364,419   |   150,728,838    |


3. Trim Reads for Adaptors and for Quality - DONE
--------------------------------------------
```
qsub -q smp-q /home/saba/BNLx.SHR.Liver.smallRNA.UCD/programs/trimReads.11Apr14.sh
```
### Code used for trimming (trimReads.11Apr14.sh)
```
#!/bin/bash
module add bio/trim_galore
FILES1=/home/saba/BNLx.SHR.Liver.smallRNA.UCD/rawReads/*R1*.fastq
for f in $FILES1
do
  f2=${f//R1/R2} 
	trim_galore --paired --stringency 3 -a TGGAATTCTCGGGTGCCAAGG -a2 GATCGTCGGACTGTAGAACTCTGAAC -q 20 -o /home/saba/BNLx.SHR.Liver.smallRNA.UCD/trimmedReads/ $f $f2
done
```


4. Characterizing Trimmed Reads - DONE
----------------------------------
```
qsub -q smp-q /home/saba/BNLx.SHR.Liver.smallRNA.UCD/programs/countTrimmed.14Apr14.sh
```




Effect of Trimming Adaptors and Poor Quality Base Calls
---------------------------

| sample | strain | numPairedReads | numReadFragments | avgTrimmedReadLength | numTrimmedReadFragments | pctRemovedByTrimming |
|:------:|:------:|:--------------:|:----------------:|:--------------------:|:-----------------------:|:--------------------:|
| BNLx1  |  BNLx  |   42,273,076   |    84,546,152    |        45.69         |        79,456,274       |        6.02%         |
| BNLx2  |  BNLx  |   68,673,192   |   137,346,384    |        32.46         |       113,284,650       |        17.5%         |
| BNLx3  |  BNLx  |   72,883,707   |   145,767,414    |        23.56         |       116,989,606       |        19.7%         |
|  SHR1  |  SHR   |   82,446,872   |   164,893,744    |        31.47         |       138,556,574       |         16%          |
|  SHR5  |  SHR   |   75,364,419   |   150,728,838    |        30.93         |       119,405,650       |        20.8%         |


5.  Generate Strain-Specific Genomes Including Spike-In Sequences - DONE PREVIOUSLY
-------------------------------------------

6. Alignment of Raw Reads to Strain-Specific Genomes - DEBUGGING
------------------------------------




*STOPPED HERE* 
==============================================
7.  Characterization of Aligned Reads
---------------------------

8.  Examine Spike-In Expression 
-----------------------

