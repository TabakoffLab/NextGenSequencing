BN-Lx and SHR Female Brain Total RNA RNA-Seq
========================================================

* 4 samples per strain (SHR1, SHR2, SHR3, SHR4, BNLx1, BNLx2, BNLx3, BNLx4)
* ribosomal RNA depleted total RNA
* 2X100 reads using the stranded protocol
* sequencing done by Beckman Coulter Genomics - received June 18th, 2014
* synthetic spike-in were added to each sample (SHR1, SHR3, BNLx2, and BNLx4 have mix 1; SHR2, SHR4, BNLx1, and BNLx3 have mix 2)
* Information regarding the spike-ins can be found here: http://products.invitrogen.com/ivgn/product/4456739

1. Unzip Files 
---------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.Females.totalRNA/programs/unzip.yucca.sh
```

2. Determine number of reads sent for each sample 
-------------------------------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.Females.totalRNA/programs/countRawReads.femaleBrain.sh
```




Raw Reads/Read Fragments
---------------------------

|id  | sample | lane | Number of Paired-End Reads | Number of Read Fragments |
|:---|:------:|:----:|:--------------------------:|:------------------------:|
|1   | BNLx1  | L001 |         62,784,996         |       125,569,992        |
|9   | BNLx1  | L002 |         64,290,267         |       128,580,534        |
|2   | BNLx2  | L001 |         68,391,044         |       136,782,088        |
|10  | BNLx2  | L002 |         68,269,835         |       136,539,670        |
|3   | BNLx3  | L001 |         64,358,304         |       128,716,608        |
|11  | BNLx3  | L002 |         66,204,000         |       132,408,000        |
|4   | BNLx4  | L001 |         51,229,872         |       102,459,744        |
|12  | BNLx4  | L002 |         51,698,100         |       103,396,200        |
|5   |  SHR1  | L001 |         60,154,945         |       120,309,890        |
|13  |  SHR1  | L002 |         61,642,412         |       123,284,824        |
|6   |  SHR2  | L001 |         49,555,245         |        99,110,490        |
|14  |  SHR2  | L002 |         49,452,858         |        98,905,716        |
|7   |  SHR3  | L001 |         62,786,750         |       125,573,500        |
|15  |  SHR3  | L002 |         64,265,863         |       128,531,726        |
|8   |  SHR4  | L001 |         68,375,841         |       136,751,682        |
|16  |  SHR4  | L002 |         68,643,223         |       137,286,446        |


Total Number of Paired End Reads: 982,103,555  
Total Number of Read Fragments:  1,964,207,110  
Average Number of Paired End Reads Per Sample: 122,762,944  

3. Trim reads for adaptors and for quality
---------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.Females.totalRNA/programs/trimReads.femaleBrain.sh
```

4. Characterize Trimmed Reads
---------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.Females.totalRNA/programs/countTrimmedReads.femaleBrain.sh
```




Trimmed Reads/Read Fragments
---------------------------

| sample | lane | Number of Paired-End Reads | Number of Read Fragments | Average Read Fragment Length After Trimming (first read fragment) | Average Read Fragment Length After Trimming (second read fragment) | Number of Read Fragments After Trimming | Percent of Read Fragments That Remained After Trimming |
|:------:|:----:|:--------------------------:|:------------------------:|:-----------------------------------------------------------------:|:------------------------------------------------------------------:|:---------------------------------------:|:------------------------------------------------------:|
| BNLx1  | L001 |         62,784,996         |       125,569,992        |                               97.8                                |                                96.9                                |               123,837,806               |                         98.6%                          |
| BNLx1  | L002 |         64,290,267         |       128,580,534        |                               97.8                                |                                96.8                                |               126,788,580               |                         98.6%                          |
| BNLx2  | L001 |         68,391,044         |       136,782,088        |                               96.6                                |                                95.4                                |               135,013,118               |                         98.7%                          |
| BNLx2  | L002 |         68,269,835         |       136,539,670        |                               96.5                                |                                95.3                                |               134,735,488               |                         98.7%                          |
| BNLx3  | L001 |         64,358,304         |       128,716,608        |                               98.1                                |                                96.9                                |               127,437,742               |                         99.0%                          |
| BNLx3  | L002 |         66,204,000         |       132,408,000        |                               98.1                                |                                96.9                                |               131,065,632               |                         99.0%                          |
| BNLx4  | L001 |         51,229,872         |       102,459,744        |                               96.8                                |                                96.0                                |               101,490,762               |                         99.1%                          |
| BNLx4  | L002 |         51,698,100         |       103,396,200        |                               96.8                                |                                96.0                                |               102,416,740               |                         99.1%                          |
|  SHR1  | L001 |         60,154,945         |       120,309,890        |                               98.6                                |                                97.3                                |               118,772,152               |                         98.7%                          |
|  SHR1  | L002 |         61,642,412         |       123,284,824        |                               98.6                                |                                97.2                                |               121,686,888               |                         98.7%                          |
|  SHR2  | L001 |         49,555,245         |        99,110,490        |                               96.4                                |                                95.1                                |                98,184,392               |                         99.1%                          |
|  SHR2  | L002 |         49,452,858         |        98,905,716        |                               96.3                                |                                95.0                                |                97,976,326               |                         99.1%                          |
|  SHR3  | L001 |         62,786,750         |       125,573,500        |                               97.7                                |                                96.4                                |               123,716,320               |                         98.5%                          |
|  SHR3  | L002 |         64,265,863         |       128,531,726        |                               97.7                                |                                96.4                                |               126,610,316               |                         98.5%                          |
|  SHR4  | L001 |         68,375,841         |       136,751,682        |                               98.4                                |                                97.2                                |               135,148,896               |                         98.8%                          |
|  SHR4  | L002 |         68,643,223         |       137,286,446        |                               98.4                                |                                97.2                                |               135,665,804               |                         98.8%                          |


Total Number of Paired End Reads After Trimming: 970,273,481  
Total Number of Read Fragments After Trimming:  1,940,546,962  
Average Number of Paired End Reads Per Sample After Trimming: 121,284,185  


5. Align to ribosomal RNA 
---------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.Females.totalRNA/programs/alignTo.rRNA.femaleBrain.sh
```





***STOPPED HERE***






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


6.  Convert unmapped.bam file into fastq files
-----------------------------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/convertToFastQ.heart.sh
```

7. Align to strain-specific genome
---------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/updateRatGenome.wChrM.sh
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/tophatAlign.heart.sh
```

8. Sort and merge BAM files by strain
---------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/sortAndMerge.heart.sh
```

9. Create BigWig Files
---------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/createBigWig.heart.sh
```

UCSC Browser Tracks
track type=bigWig name="SHR.plus.heart" description="SHR Total RNA Heart - plus strand" bigDataUrl=http://ucsc:JU7etr5t@phenogen.ucdenver.edu/ucsc/SHR.heart.genome.plus.bw

track type=bigWig name="SHR.minus.heart" description="SHR Total RNA Heart - minus strand" bigDataUrl=http://ucsc:JU7etr5t@phenogen.ucdenver.edu/ucsc/SHR.heart.genome.minus.bw

track type=bigWig name="BNLx.plus.heart" description="BNLx Total RNA Heart - plus strand" bigDataUrl=http://ucsc:JU7etr5t@phenogen.ucdenver.edu/ucsc/BNLx.heart.genome.plus.bw

track type=bigWig name="BNLx.minus.heart" description="BNLx Total RNA Heart - minus strand" bigDataUrl=http://ucsc:JU7etr5t@phenogen.ucdenver.edu/ucsc/BNLx.heart.genome.minus.bw




10. Characterize aligned reads
---------------

**move files**
```
cd /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads
get ./BNLx1.withMT/align_summary.txt align_summary.BNLx1.txt
get ./BNLx2.withMT/align_summary.txt align_summary.BNLx2.txt
get ./BNLx3.withMT/align_summary.txt align_summary.BNLx3.txt
get ./BNLx4.withMT/align_summary.txt align_summary.BNLx4.txt
get ./SHR1.withMT/align_summary.txt align_summary.SHR1.txt
get ./SHR2.withMT/align_summary.txt align_summary.SHR2.txt
get ./SHR3.withMT/align_summary.txt align_summary.SHR3.txt
get ./SHR4.withMT/align_summary.txt align_summary.SHR4.txt
```




### Statistics on Alignment to Genome



### Characteristics of Alignments
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/countByChrom.heart.sh
```




### Synthetic spike-in summary




9. Transcriptome Reconstruction (Ensembl-Guided)
---------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/reconSHR.heart.sh
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/reconBNLx.heart.sh
```


