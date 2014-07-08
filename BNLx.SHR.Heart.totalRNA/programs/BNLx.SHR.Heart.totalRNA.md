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


5. Align to ribosomal RNA - RUNNING
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

7. Align to strain-specific genome - RUNNING
---------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/updateRatGenome.wChrM.sh
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/tophatAlign.heart.sh
```
***STOPPED HERE***


















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


