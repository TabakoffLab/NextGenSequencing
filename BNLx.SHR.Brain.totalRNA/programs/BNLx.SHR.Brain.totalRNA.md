BNLx and SHR Brain ribosomal RNA depleted total RNA
=========================
* 6 brain ribosomal RNA depleted total RNA samples, SHR1, SHR2, SHR3, BNLx1, BNLx2, and BNLx3
  * 2X100 paired end reads using the unstranded protocol

1. Unzip raw reads - DONE
-----------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/unzip.yucca.sh
```

2. Consolidate reads by sample and determine number of reads sent for each sample - DONE
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

7.  Align non-ribosomal trimmed reads to strain specific genomes including mitochondrial chromosome - DONE
----------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/tophatAlign.brain.sh
```

8.  Sort and merge BAM files by strain -DONE
----------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/sortAndMerge.brain.BNLx.sh
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/sortAndMerge.brain.SHR.sh
```

9. Characterize aligned reads - BNLx is DONE, SHR is RUNNING
-----------------------------
**move files**
```
cd /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads
get ./BNLx1/align_summary.txt align_summary.BNLx1.txt
get ./BNLx2/align_summary.txt align_summary.BNLx2.txt
get ./BNLx3/align_summary.txt align_summary.BNLx3.txt
get ./SHR1/align_summary.txt align_summary.SHR1.txt
get ./SHR2/align_summary.txt align_summary.SHR2.txt
get ./SHR3/align_summary.txt align_summary.SHR3.txt
```




### Statistics on Alignment to Genome
|                           Label                           | BNLx1 (num) | BNLx1 (pct) | BNLx2 (num) | BNLx2 (pct) | BNLx3 (num) | BNLx3 (pct) | SHR1 (num)  | SHR1 (pct) | SHR2 (num)  | SHR2 (pct) | SHR3 (num)  | SHR3 (pct) |
|:---------------------------------------------------------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:----------:|:-----------:|:----------:|:-----------:|:----------:|
|                number of paired-end reads                 |  85,758,515 |   100.00%   |  93,028,161 |   100.00%   | 100,107,072 |   100.00%   |  93,964,165 |  100.00%   |  92,947,238 |  100.00%   | 146,373,125 |  100.00%   |
|           number of left reads mapped to genome           |  81,416,527 |   94.94%    |  88,937,543 |   95.60%    |  96,132,612 |   96.03%    |  88,958,448 |   94.67%   |  87,047,555 |   93.65%   | 138,486,084 |   94.61%   |
|          number of right reads mapped to genome           |  81,753,165 |   95.33%    |  88,497,261 |   95.13%    |  95,734,275 |   95.63%    |  88,179,222 |   93.84%   |  87,301,329 |   93.93%   | 135,828,380 |   92.80%   |
|   number of mapped left reads with multiple alignments    |   6,720,985 |    7.84%    |   6,847,953 |    7.36%    |   7,615,074 |    7.61%    |   7,515,136 |   8.00%    |   7,046,859 |   7.58%    |  11,531,979 |   7.88%    |
|   number of mapped right reads with multiple alignments   |   6,790,612 |    7.92%    |   6,806,098 |    7.32%    |   7,586,124 |    7.58%    |   7,469,209 |   7.95%    |   7,091,888 |   7.63%    |  11,340,491 |   7.75%    |
| number of mapped left reads with more than 20 alignments  |     557,159 |    0.65%    |     601,092 |    0.65%    |     603,423 |    0.60%    |     702,058 |   0.75%    |     579,214 |   0.62%    |     933,649 |   0.64%    |
| number of mapped right reads with more than 20 alignments |     561,028 |    0.65%    |     603,449 |    0.65%    |     604,315 |    0.60%    |     704,183 |   0.75%    |     580,721 |   0.62%    |     934,769 |   0.64%    |
|                number of mapped read pairs                |  79,626,822 |   92.85%    |  86,617,196 |   93.11%    |  93,683,557 |   93.58%    |  85,877,441 |   91.39%   |  84,232,953 |   90.62%   | 132,070,847 |   90.23%   |
|   number of mapped read pairs with multiple alignments    |   6,529,296 |    7.61%    |   6,587,582 |    7.08%    |   7,334,529 |    7.33%    |   7,227,138 |   7.69%    |   6,781,111 |   7.30%    |  10,946,798 |   7.48%    |
|  number of mapped read pairs with discordant alignments   |   1,579,894 |    1.84%    |   1,266,620 |    1.36%    |   1,537,274 |    1.54%    |   1,430,056 |   1.52%    |   1,692,702 |   1.82%    |   2,342,484 |   1.60%    |


Total Number of Aligned Paired End Reads: 562,108,816    
Total Number of Aligned Read Fragments: 1,158,272,401  
Average Number of Aligned Read Fragments Per Sample: 193,045,400  
**Average Rate of Alignment (Read Fragments):** 94.7%  

### Statistics By Chromosome and By Spike
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/countByChrom.brain.total.sh
```




![plot of chunk unnamed-chunk-10](figure/unnamed-chunk-10.png) 


![plot of chunk unnamed-chunk-11](figure/unnamed-chunk-11.png) 


10.  Strain-Specific Transcriptome Reconstruction (Ensembl-Guided) - BNLx and SHR are RUNNING
--------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/reconBNLx.brain.sh
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/reconSHR.brain.sh
```

11.  Generate BigWig files - didn't run because of memory?
-------------------------

```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/createBigWig.brain.total.sh
```
