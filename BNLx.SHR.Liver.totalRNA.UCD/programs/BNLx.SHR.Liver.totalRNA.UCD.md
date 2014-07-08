BNLx and SHR Liver rRNA-Depleted Total RNA From UCD Genomics Core
=========================
* 6 liver ribosomal RNA depleted total RNA samples, SHR1, SHR5, SHR25, BNLx1, BNLx2, and BNLx3
* synthetic spikes included Mix 1 in SHR1, BNLx1, and BNLx2 and Mix 2 in SHR5, SHR25, and BNLx3
* 2X100 paired end reads using the stranded protocol
* received 4/1/14


1. Unzip FASTQ files on Yucca - DONE
----------------------------
```
qsub -q smp-q /home/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/unzip.yucca.sh
```

2. Determine number of reads sent for each sample - DONE
----------------------------------------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/countRawReads.liver.sh
```




Raw Reads/Read Fragments
---------------------------

| sample | Number of Paired-End Reads | Number of Read Fragments |
|:------:|:--------------------------:|:------------------------:|
| BNLx1  |        119,624,256         |       239,248,512        |
| BNLx2  |        104,944,610         |       209,889,220        |
| BNLx3  |         69,001,559         |       138,003,118        |
|  SHR1  |        109,987,327         |       219,974,654        |
| SHR25  |         82,591,985         |       165,183,970        |
|  SHR5  |         96,770,957         |       193,541,914        |


Total Number of Paired End Reads: 582,920,694  
Total Number of Read Fragments:  1,165,841,388  
Average Number of Paired End Reads Per Sample: 97,153,449  



3. Trim Reads for Adaptors and for Quality - DONE
--------------------------------------------
```
qsub -q smp-q /home/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/trimReads.yucca.sh
```

4. Characterizing Trimmed Reads - DONE
----------------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/countTrimmedReads.liver.sh
```




Trimmed Reads/Read Fragments
---------------------------

| sample | Number of Paired-End Reads | Number of Read Fragments | Average Read Fragment Length After Trimming (first read fragment) | Average Read Fragment Length After Trimming (second read fragment) | Number of Read Fragments After Trimming | Percent of Read Fragments That Remained After Trimming |
|:------:|:--------------------------:|:------------------------:|:-----------------------------------------------------------------:|:------------------------------------------------------------------:|:---------------------------------------:|:------------------------------------------------------:|
| BNLx1  |        119,624,256         |       239,248,512        |                               94.2                                |                                91.4                                |               234,327,370               |                         97.9%                          |
| BNLx2  |        104,944,610         |       209,889,220        |                               96.6                                |                                95.6                                |               207,427,684               |                         98.8%                          |
| BNLx3  |         69,001,559         |       138,003,118        |                               84.7                                |                                97.2                                |               137,036,336               |                         99.3%                          |
|  SHR1  |        109,987,327         |       219,974,654        |                               97.8                                |                                96.7                                |               217,663,066               |                         98.9%                          |
| SHR25  |         82,591,985         |       165,183,970        |                               84.2                                |                                96.9                                |               163,641,336               |                         99.1%                          |
|  SHR5  |         96,770,957         |       193,541,914        |                               96.5                                |                                95.3                                |               190,584,770               |                         98.5%                          |


Total Number of Paired End Reads After Trimming: 575,340,281  
Total Number of Read Fragments After Trimming:  1,150,680,562  
Average Number of Paired End Reads Per Sample After Trimming: 95,890,047  


5.  Generate Strain-Specific Genomes Including Spike-In Sequences - DONE
-------------------------------------------
```
qsub -q smp-q /home/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/createGenomeIndex.yucca.sh
```

6. Align trimmed reads to ribosomal RNA - DONE
-----------------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/alignTo.rRNA.liver.01Jul14.sh
```

**move files**
```
get BNLx1.rRNA/align_summary.txt rRNA.summary.BNLx1.txt  
get BNLx2.rRNA/align_summary.txt rRNA.summary.BNLx2.txt  
get BNLx3.rRNA/align_summary.txt rRNA.summary.BNLx3.txt  
get SHR1.rRNA/align_summary.txt rRNA.summary.SHR1.txt  
get SHR25.rRNA/align_summary.txt rRNA.summary.SHR25.txt  
get SHR5.rRNA/align_summary.txt rRNA.summary.SHR5.txt  
```




| Sample | Number of Paired-End Reads After Trimming | Number of Paired-End Reads with at Least One Fragment Aligned to rRNA | Percent of Paired-End Reads Aligned to rRNA | Number of Paired-End Reads NOT Aligned to rRNA |
|:------:|:-----------------------------------------:|:---------------------------------------------------------------------:|:-------------------------------------------:|:----------------------------------------------:|
| BNLx1  |                117,163,685                |                              27,582,382                               |                    23.5%                    |                   89,581,303                   |
| BNLx2  |                103,713,842                |                              22,154,258                               |                    21.4%                    |                   81,559,584                   |
| BNLx3  |                 68,518,168                |                               4,224,768                               |                    6.2%                     |                   64,293,400                   |
|  SHR1  |                108,831,533                |                               6,658,641                               |                    6.1%                     |                  102,172,892                   |
| SHR25  |                 81,820,668                |                               7,966,721                               |                    9.7%                     |                   73,853,947                   |
|  SHR5  |                 95,292,385                |                               6,749,851                               |                    7.1%                     |                   88,542,534                   |


Total Number of Paired End Reads After Eliminating rRNA Aligned Reads: 500,003,660  
Average Number of Paired End Reads Per Sample After Eliminating rRNA Aligned Reads: 83,333,943  


7. Convert unmapped.bam into fastq files - DONE
----------------------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/convertToFastQ.liver.sh
```


8. Alignment of Raw Reads to Strain-Specific Genomes With Mitochondrial Chromosome - RUNNING (7/7/14)
------------------------------------

```
qsub -q smp /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/tophatAlign.liver.sh
```

***STOPPED HERE***













9.  Characterization of Aligned Reads
---------------------------
**move files**
```
cd /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads
get ./BNLx1.withMT/align_summary.txt align_summary.BNLx1.txt
get ./BNLx2.withMT/align_summary.txt align_summary.BNLx2.txt
get ./BNLx3.withMT/align_summary.txt align_summary.BNLx3.txt
get ./SHR1.withMT/align_summary.txt align_summary.SHR1.txt
get ./SHR5.withMT/align_summary.txt align_summary.SHR5.txt
get ./SHR25.withMT/align_summary.txt align_summary.SHR25.txt
```




### Statistics on Alignment to Genome



10.  Examine Spike-In Expression - HAVEN'T RUN FOR DATA WITH MITO
-----------------------

```
qsub -q smp-q /home/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/quantifyControlSpikes.21Apr14.sh
```




### Synthetic spike-in summary




### Comparison of raw read count versus spike concentrations


Each color represents a different sample.  The y-axis of the plot on the left represents the log base 2 of the read count for each spike plus 1. The y-axis of the plot in the middle represents the "voom" expression values when the library size is calculated as ALL mapped reads. The y-axis of the plot on the right represents the "voom" expression values when the library size is calculated as only the reads that map to a synthetic spike-in.  

### Expected Differential Expression In Spikes Between Mixes


Red lines represent the expected log 2 fold differences.  Only spikes that were included in a concentration greater than 0.5 in both samples were included in figure (66 out of 92 spikes).






11.  Sort and Merge Aligned Reads By Strain
--------------------------

```
qsub -q smp /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/sortAndMerge.liver.sh
```

12.  Strain-Specific Transcriptome Reconstruction (Ensembl-Guided)
--------------------------

```
qsub -q smp /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/reconSHR.liver.sh
qsub -q smp /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/reconBNLx.liver.sh
```

13.  Create BigWig Files
-------------------
```
qsub -q smp /home/saba/BNLx.SHR.Liver.totalRNA.UCD/programs/testBigWig.sh
```

