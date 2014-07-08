BNLx and SHR Brain ribosomal RNA depleted total RNA
=========================
* 6 brain ribosomal RNA depleted total RNA samples, SHR1, SHR2, SHR3, BNLx1, BNLx2, and BNLx3
  * 2X100 paired end reads using the unstranded protocol

1. Unzip raw reads - DONE
-----------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/unzip.yucca.sh
```

2. Consolidate reads by sample and determine number of reads sent for each sample 
-------------------------------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/countRawReads.sh
```




Raw Reads/Read Fragments
---------------------------

| sample | Number of Paired-End Reads | Number of Read Fragments |
|:------:|:--------------------------:|:------------------------:|
| BNLx1  |         90,846,224         |       181,692,448        |
| BNLx2  |        101,364,795         |       202,729,590        |
| BNLx3  |        103,455,074         |       206,910,148        |
|  SHR1  |         98,205,223         |       196,410,446        |
|  SHR2  |         99,380,646         |       198,761,292        |
|  SHR3  |        151,429,599         |       302,859,198        |


Total Number of Paired End Reads: 644,681,561  
Total Number of Read Fragments:  1,289,363,122  
Average Number of Paired End Reads Per Sample: 107,446,927  


3. Trim reads for adaptors and for quality - DONE
---------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/trimReads.yucca.sh
```


4.  Characterize trimmed reads - DONE
-----------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/countTrimmedReads.sh
```



Trimmed Reads/Read Fragments
---------------------------

| sample | Number of Paired-End Reads | Number of Read Fragments | Average Read Fragment Length After Trimming (first read fragment) | Average Read Fragment Length After Trimming (second read fragment) | Number of Read Fragments After Trimming | Percent of Read Fragments That Remained After Trimming |
|:------:|:--------------------------:|:------------------------:|:-----------------------------------------------------------------:|:------------------------------------------------------------------:|:---------------------------------------:|:------------------------------------------------------:|
| BNLx1  |         90,846,224         |       181,692,448        |                               96.7                                |                                94.9                                |               175,440,236               |                         96.6%                          |
| BNLx2  |        101,364,795         |       202,729,590        |                               97.7                                |                                96.0                                |               189,391,052               |                         93.4%                          |
| BNLx3  |        103,455,074         |       206,910,148        |                               98.1                                |                                96.6                                |               203,559,392               |                         98.4%                          |
|  SHR1  |         98,205,223         |       196,410,446        |                               97.7                                |                                95.8                                |               190,582,634               |                         97.0%                          |
|  SHR2  |         99,380,646         |       198,761,292        |                               97.8                                |                                96.4                                |               188,637,976               |                         94.9%                          |
|  SHR3  |        151,429,599         |       302,859,198        |                               97.7                                |                                95.9                                |               299,201,504               |                         98.8%                          |


Total Number of Paired End Reads After Trimming: 623,406,397  
Total Number of Read Fragments After Trimming:  1,246,812,794  
Average Number of Paired End Reads Per Sample After Trimming: 103,901,066  

5.  Align trimmed reads to ribosomal RNA - DONE
-------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/alignTo.rRNA.brain.01Jul14.sh
```

*tranfer files to phenogen server*  
get BNLx1.rRNA/align_summary.txt rRNA.summary.BNLx1.txt  
get BNLx2.rRNA/align_summary.txt rRNA.summary.BNLx2.txt  
get BNLx3.rRNA/align_summary.txt rRNA.summary.BNLx3.txt  
get SHR1.rRNA/align_summary.txt rRNA.summary.SHR1.txt  
get SHR2.rRNA/align_summary.txt rRNA.summary.SHR2.txt  
get SHR3.rRNA/align_summary.txt rRNA.summary.SHR3.txt  




| Sample | Number of Paired-End Reads After Trimming | Number of Paired-End Reads with at Least One Fragment Aligned to rRNA | Percent of Paired-End Reads Aligned to rRNA | Number of Paired-End Reads NOT Aligned to rRNA |
|:------:|:-----------------------------------------:|:---------------------------------------------------------------------:|:-------------------------------------------:|:----------------------------------------------:|
| BNLx1  |                 87,720,118                |                               1,961,603                               |                    2.2%                     |                   85,758,515                   |
| BNLx2  |                 94,695,526                |                               1,667,365                               |                    1.8%                     |                   93,028,161                   |
| BNLx3  |                101,779,696                |                               1,672,624                               |                    1.6%                     |                  100,107,072                   |
|  SHR1  |                 95,291,317                |                               1,327,152                               |                    1.4%                     |                   93,964,165                   |
|  SHR2  |                 94,318,988                |                               1,371,750                               |                    1.5%                     |                   92,947,238                   |
|  SHR3  |                149,600,752                |                               3,227,627                               |                    2.2%                     |                  146,373,125                   |


Total Number of Paired End Reads After Eliminating rRNA Aligned Reads: 612,178,276    
Average Number of Paired End Reads Per Sample After Eliminating rRNA Aligned Reads: 102,029,713  

6.  Convert unmapped reads (BAM file) back to fastQ format - DONE
------------------------------------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/convertToFastQ.brain.sh
```

7.  Align non-ribosomal trimmed reads to strain specific genomes including mitochondrial chromosome - RUNNING
----------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/tophatAlign.brain.sh
```

***STOPPED HERE***



8.  Sort and merge BAM files by strain
----------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/sortAndMerge.brain.sh
```

9.  Strain-Specific Transcriptome Reconstruction (Ensembl-Guided)
--------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/reconSHR.brain.sh
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/reconBNLx.brain.sh
```

10.  Generate BigWig files
-------------------------

