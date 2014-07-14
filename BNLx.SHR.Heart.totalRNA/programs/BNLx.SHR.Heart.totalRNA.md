BN-Lx and SHR left ventricle total RNA RNA-Seq
========================================================

* 4 samples per strain (SHR1, SHR2, SHR3, SHR4, BNLx1, BNLx2, BNLx3, BNLx4)
* ribosomal RNA depleted total RNA
* 2X100 reads using the stranded protocol
* sequencing done by Beckman Coulter Genomics - received May 22, 2014
* synthetic spike-in were added to each sample (SHR1, SHR3, BNLx2, and BNLx4 have mix 1; SHR2, SHR4, BNLx1, and BNLx3 have mix 2)
  * Information regarding the spike-ins can be found here: http://products.invitrogen.com/ivgn/product/4456739

1. Unzip Files - DONE
---------------
```
qsub -q smp /home/saba/BNLx.SHR.Heart.totalRNA/programs/unzip.yucca.sh
```

2. Determine number of reads sent for each sample - DONE
-------------------------------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/countRawReads.heart.sh
```




Raw Reads/Read Fragments
---------------------------

| sample | Number of Paired-End Reads | Number of Read Fragments |
|:------:|:--------------------------:|:------------------------:|
| BNLx1  |        102,416,734         |       204,833,468        |
| BNLx2  |        105,346,919         |       210,693,838        |
| BNLx3  |        101,549,816         |       203,099,632        |
| BNLx4  |         99,254,730         |       198,509,460        |
|  SHR1  |         93,230,933         |       186,461,866        |
|  SHR2  |         90,153,294         |       180,306,588        |
|  SHR3  |         93,942,566         |       187,885,132        |
|  SHR4  |        103,778,181         |       207,556,362        |


Total Number of Paired End Reads: 789,673,173  
Total Number of Read Fragments:  1,579,346,346  
Average Number of Paired End Reads Per Sample: 98,709,147  

3. Trim reads for adaptors and for quality - DONE
---------------
```
qsub -q smp /home/saba/BNLx.SHR.Heart.totalRNA/programs/trimReads.yucca.sh
```

4. Characterize Trimmed Reads - DONE
---------------
```
qsub -q smp /home/saba/BNLx.SHR.Heart.totalRNA/programs/countTrimmedReads.sh
```




Trimmed Reads/Read Fragments
---------------------------

| sample | Number of Paired-End Reads | Number of Read Fragments | Average Read Fragment Length After Trimming (first read fragment) | Average Read Fragment Length After Trimming (second read fragment) | Number of Read Fragments After Trimming | Percent of Read Fragments That Remained After Trimming |
|:------:|:--------------------------:|:------------------------:|:-----------------------------------------------------------------:|:------------------------------------------------------------------:|:---------------------------------------:|:------------------------------------------------------:|
| BNLx1  |        102,416,734         |       204,833,468        |                               96.9                                |                                94.1                                |               198,942,138               |                         97.1%                          |
| BNLx2  |        105,346,919         |       210,693,838        |                               98.4                                |                                95.6                                |               204,310,380               |                         97.0%                          |
| BNLx3  |        101,549,816         |       203,099,632        |                               96.5                                |                                93.1                                |               192,526,482               |                         94.8%                          |
| BNLx4  |         99,254,730         |       198,509,460        |                               96.8                                |                                93.9                                |               190,600,766               |                         96.0%                          |
|  SHR1  |         93,230,933         |       186,461,866        |                               97.9                                |                                94.6                                |               180,414,634               |                         96.8%                          |
|  SHR2  |         90,153,294         |       180,306,588        |                               96.3                                |                                93.3                                |               175,320,928               |                         97.2%                          |
|  SHR3  |         93,942,566         |       187,885,132        |                               97.7                                |                                94.2                                |               180,684,706               |                         96.2%                          |
|  SHR4  |        103,778,181         |       207,556,362        |                               98.2                                |                                94.8                                |               199,355,280               |                         96.0%                          |


Total Number of Paired End Reads After Trimming: 761,077,657  
Total Number of Read Fragments After Trimming:  1,522,155,314  
Average Number of Paired End Reads Per Sample After Trimming: 95,134,707  


5. Align to ribosomal RNA - DONE
---------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/alignTo.rRNA.heart.01Jul14.sh
```
**move files**
```
get SHR1.rRNA/align_summary.txt rRNA.summary.SHR1.txt
get SHR2.rRNA/align_summary.txt rRNA.summary.SHR2.txt
get SHR3.rRNA/align_summary.txt rRNA.summary.SHR3.txt
get SHR4.rRNA/align_summary.txt rRNA.summary.SHR4.txt
get BNLx1.rRNA/align_summary.txt rRNA.summary.BNLx1.txt
get BNLx2.rRNA/align_summary.txt rRNA.summary.BNLx2.txt
get BNLx3.rRNA/align_summary.txt rRNA.summary.BNLx3.txt
get BNLx4.rRNA/align_summary.txt rRNA.summary.BNLx4.txt
```

Proportion of Reads Aligned to rRNA
-----------------------------------



| Sample | Number of Paired-End Reads After Trimming | Number of Paired-End Reads with at Least One Fragment Aligned to rRNA | Percent of Paired-End Reads Aligned to rRNA | Number of Paired-End Reads NOT Aligned to rRNA |
|:------:|:-----------------------------------------:|:---------------------------------------------------------------------:|:-------------------------------------------:|:----------------------------------------------:|
| BNLx1  |                 99,471,069                |                               3,577,529                               |                    3.6%                     |                   95,893,540                   |
| BNLx2  |                102,155,190                |                               6,192,366                               |                    6.1%                     |                   95,962,824                   |
| BNLx3  |                 96,263,241                |                               3,687,942                               |                    3.8%                     |                   92,575,299                   |
| BNLx4  |                 95,300,383                |                               5,035,410                               |                    5.3%                     |                   90,264,973                   |
|  SHR1  |                 90,207,317                |                               8,244,503                               |                    9.1%                     |                   81,962,814                   |
|  SHR2  |                 87,660,464                |                               3,898,849                               |                    4.4%                     |                   83,761,615                   |
|  SHR3  |                 90,342,353                |                              17,765,222                               |                    19.7%                    |                   72,577,131                   |
|  SHR4  |                 99,677,640                |                               7,391,434                               |                    7.4%                     |                   92,286,206                   |


6.  Convert unmapped.bam file into fastq files - DONE
-----------------------------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/convertToFastQ.heart.sh
```

7. Align to strain-specific genome - DONE
---------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/updateRatGenome.wChrM.sh
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/tophatAlign.heart.sh
```

8. Sort and merge BAM files by strain - DONE
---------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/sortAndMerge.heart.BNLx.sh
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/sortAndMerge.heart.SHR.sh
```


9. Characterize aligned reads
---------------

**move files**
```
cd /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads
get ./BNLx1/align_summary.txt align_summary.BNLx1.txt
get ./BNLx2/align_summary.txt align_summary.BNLx2.txt
get ./BNLx3/align_summary.txt align_summary.BNLx3.txt
get ./BNLx4/align_summary.txt align_summary.BNLx4.txt
get ./SHR1/align_summary.txt align_summary.SHR1.txt
get ./SHR2/align_summary.txt align_summary.SHR2.txt
get ./SHR3/align_summary.txt align_summary.SHR3.txt
get ./SHR4/align_summary.txt align_summary.SHR4.txt
```




### Statistics on Alignment to Genome
|                           Label                           | BNLx1 (num) | BNLx1 (pct) | BNLx2 (num) | BNLx2 (pct) | BNLx3 (num) | BNLx3 (pct) | BNLx4 (num) | BNLx4 (pct) | SHR1 (num) | SHR1 (pct) | SHR2 (num) | SHR2 (pct) | SHR3 (num) | SHR3 (pct) | SHR4 (num) | SHR4 (pct) |
|:---------------------------------------------------------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|:----------:|:----------:|:----------:|:----------:|:----------:|:----------:|:----------:|:----------:|
|                number of paired-end reads                 | 95,893,540  |   100.00%   | 95,962,824  |   100.00%   | 92,575,299  |   100.00%   | 90,264,973  |   100.00%   | 81,962,814 |  100.00%   | 83,761,615 |  100.00%   | 72,577,131 |  100.00%   | 92,286,206 |  100.00%   |
|           number of left reads mapped to genome           | 92,567,136  |   96.53%    | 93,294,714  |   97.22%    | 89,234,367  |   96.39%    | 87,754,462  |   97.22%    | 78,011,637 |   95.18%   | 79,546,248 |   94.97%   | 69,079,762 |   95.18%   | 88,382,788 |   95.77%   |
|          number of right reads mapped to genome           | 92,641,654  |   96.61%    | 92,965,639  |   96.88%    | 88,856,052  |   95.98%    | 87,251,448  |   96.66%    | 77,604,186 |   94.68%   | 79,582,274 |   95.01%   | 68,716,473 |   94.68%   | 87,793,964 |   95.13%   |
|   number of mapped left reads with multiple alignments    |  6,665,443  |    6.95%    |  5,682,217  |    5.92%    |  6,204,248  |    6.70%    |  5,143,101  |    5.70%    |  5,227,374 |   6.38%    |  5,560,512 |   6.64%    |  4,081,284 |   5.62%    |  6,339,384 |   6.87%    |
|   number of mapped right reads with multiple alignments   |  6,691,926  |    6.98%    |  5,667,443  |    5.91%    |  6,184,076  |    6.68%    |  5,112,540  |    5.66%    |  5,229,141 |   6.38%    |  5,598,259 |   6.68%    |  4,088,983 |   5.63%    |  6,321,371 |   6.85%    |
| number of mapped left reads with more than 20 alignments  |    298,313  |    0.31%    |    251,627  |    0.26%    |    284,964  |    0.31%    |    243,138  |    0.27%    |    217,764 |   0.27%    |    273,492 |   0.33%    |    222,638 |   0.31%    |    289,477 |   0.31%    |
| number of mapped right reads with more than 20 alignments |    298,644  |    0.31%    |    251,867  |    0.26%    |    285,471  |    0.31%    |    243,297  |    0.27%    |    217,918 |   0.27%    |    273,682 |   0.33%    |    222,755 |   0.31%    |    289,644 |   0.31%    |
|                number of mapped read pairs                | 90,676,921  |   94.56%    | 91,505,530  |   95.36%    | 87,069,865  |   94.05%    | 85,972,094  |   95.24%    | 75,462,909 |   92.07%   | 77,066,121 |   92.01%   | 66,796,381 |   92.04%   | 85,637,749 |   92.80%   |
|   number of mapped read pairs with multiple alignments    |  6,500,481  |    6.78%    |  5,531,524  |    5.76%    |  6,013,314  |    6.50%    |  4,995,113  |    5.53%    |  5,059,805 |   6.17%    |  5,393,028 |   6.44%    |  3,948,087 |   5.44%    |  6,149,622 |   6.66%    |
|  number of mapped read pairs with discordant alignments   |  1,111,407  |    1.16%    |  1,233,744  |    1.29%    |  1,498,511  |    1.62%    |    985,238  |    1.09%    |  1,235,862 |   1.51%    |  1,186,536 |   1.42%    |  1,134,793 |   1.56%    |  1,624,973 |   1.76%    |


### Characteristics of Alignments
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/countByChrom.heart.sh
```




![plot of chunk unnamed-chunk-10](figure/unnamed-chunk-10.png) 


![plot of chunk unnamed-chunk-11](figure/unnamed-chunk-11.png) 





### Synthetic spike-in summary
| Sample | Num of Read Fragments | Num of rRNA Aligned Read Fragments | Num of Genome-Aligned Read Fragments | Num of Read Fragments Aligned to Spikes | Percent of Genome-Aligned Read Fragments Aligned to Spikes | Percent of All Read Fragments Aligned to Spikes |
|:------:|:---------------------:|:----------------------------------:|:------------------------------------:|:---------------------------------------:|:----------------------------------------------------------:|:-----------------------------------------------:|
| BNLx1  |      198,942,138      |              7,155,058             |             185,208,790              |                1,495,184                |                           0.81%                            |                      0.75%                      |
| BNLx2  |      204,310,380      |             12,384,732             |             186,260,353              |                1,519,994                |                           0.82%                            |                      0.74%                      |
| BNLx3  |      192,526,482      |              7,375,884             |             178,090,419              |                1,078,247                |                           0.61%                            |                      0.56%                      |
| BNLx4  |      190,600,766      |             10,070,820             |             175,005,910              |                2,014,939                |                           1.15%                            |                      1.06%                      |
|  SHR1  |      180,414,634      |             16,489,006             |             155,615,823              |                  965,642                |                           0.62%                            |                      0.54%                      |
|  SHR2  |      175,320,928      |              7,797,698             |             159,128,522              |                  707,144                |                           0.44%                            |                      0.40%                      |
|  SHR3  |      180,684,706      |             35,530,444             |             137,796,235              |                  919,958                |                           0.67%                            |                      0.51%                      |
|  SHR4  |      199,355,280      |             14,782,868             |             176,176,752              |                1,049,125                |                           0.60%                            |                      0.53%                      |


9. Create BigWig Files - RUNNING
---------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/createBigWig.heart.sh
```

**UCSC Browser Tracks**
```
track type=bigWig name="SHR.plus.heart" description="SHR Total RNA Heart - plus strand" bigDataUrl=http://ucsc:JU7etr5t@phenogen.ucdenver.edu/ucsc/SHR.heart.genome.plus.bw

track type=bigWig name="SHR.minus.heart" description="SHR Total RNA Heart - minus strand" bigDataUrl=http://ucsc:JU7etr5t@phenogen.ucdenver.edu/ucsc/SHR.heart.genome.minus.bw

track type=bigWig name="BNLx.plus.heart" description="BNLx Total RNA Heart - plus strand" bigDataUrl=http://ucsc:JU7etr5t@phenogen.ucdenver.edu/ucsc/BNLx.heart.genome.plus.bw

track type=bigWig name="BNLx.minus.heart" description="BNLx Total RNA Heart - minus strand" bigDataUrl=http://ucsc:JU7etr5t@phenogen.ucdenver.edu/ucsc/BNLx.heart.genome.minus.bw
```

9. Transcriptome Reconstruction (Ensembl-Guided) - RUNNING (started 8am 7/14/14)
---------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/reconSHR.heart.sh
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/reconBNLx.heart.sh
```


