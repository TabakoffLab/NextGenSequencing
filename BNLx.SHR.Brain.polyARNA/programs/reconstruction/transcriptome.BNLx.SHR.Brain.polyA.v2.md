BNLx and SHR Brain (polyA) Transcriptome Reconstruction
========================================================

polyA+-selected RNA Reconstruction
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

1. Limit to transcripts with greater than 50 coverage and a transcript length greater than 200 nt (not including introns)
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
bedtools -version 

cd /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/reconstruction/tmp
intersectBed -a shr.bed -b bnlx.bed -wo > overlap.brain.polyA.byStrain.txt
```

3.  Compare novel transcripts across strain-specific transcriptomes BN-Lx and SHR 
------------------------------------------------------
Two transcripts were "merged" into one transcripts if:  
* they are both assigned to the same strand or one/both did not have a strand designation
* if 1) all exon starts and exon stops matched OR 2) all exon junctions matched, transcription start and stop sites could differ OR 3) two one-exon transcripts with transcription start sites within 100 bp of each other and transcription stop sites within 100 bp of each other




Combined Transcriptome:  
* 19,793 transcripts
* 2,107 novel transcripts identified in both strains
* 4,022 novel transcripts only identified in BNLx
* 5,513 novel transcripts only identified in SHR
* 8,105 Ensembl transcripts
* 46 novel transcripts very similar to Ensembl


4.  Identify overlap between transcripts in order to identify transcripts from the same gene
------------------------------------------------------

BEDtools Version = bedtools v2.19.1
```
export PATH=/usr/local/bedtools2/bin:$PATH
cd /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/reconstruction/tmp
intersectBed -a combined.brain.polyA.10Oct14.bed -b combined.brain.polyA.10Oct14.bed -wo > overlap.brain.polyA.forGeneID.txt
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
#on PhenoGen server
cufflinks -u --seed 5645 -p 25 --library-type fr-unstranded -b /data2/saba/index/BNLx_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/reconstruction/reconstruct.brain.polyA.10Oct14.v1.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/quantitation/recon.Brain.polyA.v1.BNLx /hi-seq/BNLx.SHR.Brain-polyARNA/alignedReads/BNLx.brain.polyA.bam
cufflinks -u --seed 19885 -p 25 --library-type fr-unstranded -b /data2/saba/index/SHR_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/reconstruction/reconstruct.brain.polyA.10Oct14.v1.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/quantitation/recon.Brain.polyA.v1.SHR /hi-seq/BNLx.SHR.Brain-polyARNA/alignedReads/SHR.brain.polyA.bam
```




In the first iteration, 17,284 out of 19,793 transcripts were retained (12,306 out of 12,960 genes).


7. Quantitate Combined Transcriptome (2nd Iteration)
---------------------------------
```
cufflinks -u --seed 65498 -p 25 --library-type fr-unstranded -b /data2/saba/index/BNLx_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/reconstruction/reconstruct.brain.polyA.13Oct14.v2.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/quantitation/recon.Brain.polyA.v2.BNLx /hi-seq/BNLx.SHR.Brain-polyARNA/alignedReads/BNLx.brain.polyA.bam
cufflinks -u --seed 56946 -p 25 --library-type fr-unstranded -b /data2/saba/index/SHR_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/reconstruction/reconstruct.brain.polyA.13Oct14.v2.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/quantitation/recon.Brain.polyA.v2.SHR /hi-seq/BNLx.SHR.Brain-polyARNA/alignedReads/SHR.brain.polyA.bam
```




In the second (AND FINAL) iteration, 17,264 out of 17,284 transcripts were retained (12,305 out of 12,306 genes).

8. Quantitate Final Transcriptome For Annotation
---------------------------------
```
cufflinks -u --seed 5645 -p 25 --library-type fr-unstranded -b /data2/saba/index/BNLx_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/reconstruction/reconstruct.brain.polyA.14Oct14.FINAL.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/quantitation/recon.Brain.polyA.FINAL.BNLx /hi-seq/BNLx.SHR.Brain-polyARNA/alignedReads/BNLx.brain.polyA.bam
cufflinks -u --seed 98135 -p 25 --library-type fr-unstranded -b /data2/saba/index/SHR_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/reconstruction/reconstruct.brain.polyA.14Oct14.FINAL.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/quantitation/recon.Brain.polyA.FINAL.SHR /hi-seq/BNLx.SHR.Brain-polyARNA/alignedReads/SHR.brain.polyA.bam

```

