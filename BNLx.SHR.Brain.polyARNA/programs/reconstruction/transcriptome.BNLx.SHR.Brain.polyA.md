BNLx and SHR Brain Transcriptome Reconstruction
========================================================

PolyA+ Reconstruction
--------------------






Complete SHR Transcriptome:  
43,787 genes  
56,696 transcripts  
14,389 Ensembl transcripts  
42,307 novel transcripts  

Complete BNLx Transcriptome:  
37,499 genes  
50,431 transcripts  
13,750 Ensembl transcripts  
36,681 novel transcripts  

1.  Limit to transcripts with greater than 50 coverage and a transcript length greater than 200 nt (not including introns)
--------------




High Confidence SHR Transcripts:  
11,174 genes  
15,505 transcripts  
7,924 Ensembl transcripts  
5,854 novel transcripts of Ensembl genes  
1,727 novel transcripts/genes   


High Confidence BNLx Transcripts:  
9,479 genes  
12,717 transcripts  
6,665 Ensembl transcripts  
4,824 novel transcripts of Ensembl genes  
1,228 novel transcripts/genes  



2. Identify overlap between novel transcripts in strain-specific reconstructions
---------------------------------



BEDtools version = bedtools v2.19.1

```
export PATH=/usr/local/bedtools2/bin:$PATH
cd /data/Tabastore3/LauraS/BNLx.SHR/RNA-Seq.Brain.polyA/reconstruction/tmp
intersectBed -a shr.bed -b shr.bed -wo > overlap.polyA.SHR.txt
intersectBed -a bnlx.bed -b bnlx.bed -wo > overlap.polyA.BNLx.txt
intersectBed -a shr.bed -b bnlx.bed -wo > overlap.polyA.byStrain.txt
```

3.  Identify novel transcripts that were identified in both BN-Lx and SHR 
------------------------------------------------------
Two transcripts were "merged" into one transcripts if:  
* they are both assigned to the same strand or one/both did not have a strand designation
* they were identified as novel in opposite strains (one from SHR and one from BNLx)
* if 1) all exon starts and exon stops matched OR 2) all exon junctions matched, transcription start and stop sites could differ OR 3) two one-exon transcripts with transcription start sites within 100 bp of each other and transcription stop sites within 100 bp of each other




Combined Transcriptome:  
* 19,793 transcripts
* 2,107 novel transcripts identified in both strains
* 4,022 novel transcripts only identified in BNLx
* 5,513 novel transcripts only identified in SHR
* 8,105 Ensembl transcripts
* 46 novel transcripts very similar to Ensembl


5.  Identify overlap between transcripts in order to identify transcripts from the same gene
------------------------------------------------------

BEDtools Version = bedtools v2.19.1
```
export PATH=/usr/local/bedtools2/bin:$PATH
cd /data/Tabastore3/LauraS/BNLx.SHR/RNA-Seq.Brain.polyA/reconstruction/tmp
intersectBed -a combined.brain.polyA.21Jul14.bed -b combined.brain.polyA.21Jul14.bed -wo > overlap.brain.polyA.forGeneID.txt
```

6.  Match transcripts to genes and create new GTF file  
------------------------------------------------------

Two transcripts are from the same gene if:  
* Their transcription start sites matched exactly OR
* Their transcription stop sites matched exactly OR
* At least one exon-exon junction matched exactly


```
## Error: argument is of length zero
```

```
## Loading required package: graph
## 
## Attaching package: 'graph'
## 
## The following objects are masked from 'package:igraph':
## 
##     degree, edges
## 
## Loading required package: RBGL
## 
## Attaching package: 'RBGL'
## 
## The following object is masked from 'package:igraph':
## 
##     transitivity
```

```
## Error: argument is of length zero
```

```
## Error: object 'graph.polyA' not found
```

```
## Error: error in evaluating the argument 'object' in selecting a method for function 'nodes': Error: object 'graph.polyA' not found
```

```
## Error: object 'compList' not found
```

```
## Error: object 'geneNames' not found
```

```
## Error: object 'geneNames' not found
```

```
## Error: object 'geneNames' not found
```

```
## Error: object 'compList' not found
```

```
## Error: object 'compList' not found
```

```
## Error: object 'multiTrans' not found
```

```
## Error: object 'multiTrans' not found
```

```
## Error: object 'compList' not found
```

```
## Error: object 'singleTrans' not found
```

```
## Error: object 'multiTrans' not found
```

```
## Error: object 'ids' not found
```

```
## Error: object 'ids' not found
```

```
## Error: object 'updated' not found
```

```
## Error: object 'updated' not found
```


7. Quantitate Combined Transcriptome (Version 1)
------------------------------------
```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.polyARNA/programs/quant.Recon.21Jul14.v1.SHR.sh
qsub -q smp /home/data/saba/BNLx.SHR.Brain.polyARNA/programs/quant.Recon.21Jul14.v1.BNLx.sh
```



In the first iteration, 17,293 out of 19,793 transcripts were retained (12,308 out of 12,960 genes).

8. Quantitate Combined Transcriptome (Version 2)
------------------------------------

```
qsub -q smp /home/data/saba/BNLx.SHR.Brain.polyARNA/programs/quant.Recon.21Jul14.v2.SHR.sh
qsub -q smp /home/data/saba/BNLx.SHR.Brain.polyARNA/programs/quant.Recon.21Jul14.v2.BNLx.sh
```




In the second iteration (AND FINAL), 17,274 out of 17,293 transcripts were retained (12,307 out of 12,308 genes).


9. Quantitate Final Combined Transcriptome (on PhenoGen)
---------------------------------
```
cufflinks -u --seed 7556 -p 5 --library-type fr-unstranded -b /data2/saba/index/BNLx_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/reconstruction/reconstruct.polyA.brain.FINAL.09Oct14.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/quantification/recon.Brain.polyA.FINAL.BNLx /hi-seq/BNLx.SHR.Brain-polyARNA/alignedReads/BNLx.brain.polyA.bam
cufflinks -u --seed 7555 -p 5 --library-type fr-unstranded -b /data2/saba/index/SHR_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/reconstruction/reconstruct.polyA.brain.FINAL.09Oct14.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/quantification/recon.Brain.polyA.FINAL.SHR /hi-seq/BNLx.SHR.Brain-polyARNA/alignedReads/SHR.brain.polyA.bam

```
