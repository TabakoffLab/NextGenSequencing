BNLx and SHR Brain Transcriptome Reconstruction
========================================================

rRNA-Depleted Total RNA Reconstruction
--------------------






Complete SHR Transcriptome:  
52,086 genes  
58,015 transcripts  
5,458 Ensembl transcripts  
52,557 novel transcripts  

Complete BNLx Transcriptome:  
215,955 genes  
236,143 transcripts  
14,411 Ensembl transcripts  
221,732 novel transcripts  

1. Limit to transcripts with greater than 50 coverage and a transcript length greater than 200 nt (not including introns)
--------------




High Confidence SHR Transcripts:  
7,916 genes  
9,460 transcripts  
3,497 Ensembl transcripts  
1,892 novel transcripts of Ensembl genes  
4,071 novel transcripts/genes   


High Confidence BNLx Transcripts:  
28,020 genes  
32,094 transcripts  
8,441 Ensembl transcripts  
5,104 novel transcripts of Ensembl genes  
18,549 novel transcripts/genes   



2. Identify overlap between novel transcripts in strain-specific reconstructions
---------------------------------



BEDtools version = bedtools v2.19.1
```
export PATH=/usr/local/bedtools2/bin:$PATH
 
cd /data/Tabastore3/LauraS/BNLx.SHR/RNA-Seq.Brain.total/reconstruction/tmp
intersectBed -a shr.bed -b bnlx.bed -wo > overlap.brain.total.byStrain.txt
```

3.  Compare novel transcripts across strain-specific transcriptomes BN-Lx and SHR 
------------------------------------------------------
Two transcripts were "merged" into one transcripts if:  
* they are both assigned to the same strand or one/both did not have a strand designation
* they were identified as novel in opposite strains (one from SHR and one from BNLx)
* if 1) all exon starts and exon stops matched OR 2) all exon junctions matched, transcription start and stop sites could differ OR 3) two one-exon transcripts with transcription start sites within 100 bp of each other and transcription stop sites within 100 bp of each other




Combined Transcriptome:  
* 37,699 transcripts
* 1,162 novel transcripts identified in both strains
* 22,515 novel transcripts only identified in BNLx
* 4,822 novel transcripts only identified in SHR
* 9,177 Ensembl transcripts
* 23 novel transcripts very similar to Ensembl


4.  Identify overlap between transcripts in order to identify transcripts from the same gene
------------------------------------------------------

BEDtools Version = bedtools v2.19.1
```
export PATH=/usr/local/bedtools2/bin:$PATH
cd /data/Tabastore3/LauraS/BNLx.SHR/RNA-Seq.Brain.total/reconstruction/tmp
intersectBed -a combined.brain.total.22Jul14.bed -b combined.brain.total.22Jul14.bed -wo > overlap.brain.total.forGeneID.txt
```

5.  Match transcripts to genes and create new GTF file  
------------------------------------------------------

Two transcripts are from the same gene if:  
* Their transcription start sites matched exactly OR
* Their transcription stop sites matched exactly OR
* At least one exon-exon junction matched exactly




6. Quantitate Combined Transcriptome (1st Iteration)
---------------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/quant.Recon.22Jul14.v1.SHR.sh
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/quant.Recon.22Jul14.v1.BNLx.sh
```


```
## [1] 0.9214
```


In the first iteration, 34,737 out of 37,699 transcripts were retained (30,964 out of 33,077 genes).


7. Quantitate Combined Transcriptome (2nd Iteration)
---------------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/quant.Recon.23Jul14.v2.SHR.sh
qsub -q smp /home/data/saba/BNLx.SHR.Brain.totalRNA/programs/quant.Recon.23Jul14.v2.BNLx.sh
```


```
## [1] 0.9987
```


In the second iteration, 34,692 out of 34,737 transcripts were retained (30,936 out of 30,964 genes).
