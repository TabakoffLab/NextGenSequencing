BNLx and SHR Heart Transcriptome Reconstruction
========================================================

rRNA-Depleted Total RNA Reconstruction
--------------------






Complete SHR Transcriptome:  
149,500 genes  
163,848 transcripts  
14,235 Ensembl transcripts  
149,613 novel transcripts  

Complete BNLx Transcriptome:  
147,150 genes  
161,890 transcripts  
14,272 Ensembl transcripts  
147,618 novel transcripts  

1. Limit to transcripts with greater than 50 coverage and a transcript length greater than 200 nt (not including introns)
--------------




High Confidence SHR Transcripts:  
28,189 genes  
32,672 transcripts  
7,687 Ensembl transcripts  
5,682 novel transcripts of Ensembl genes  
19,303 novel transcripts/genes   


High Confidence BNLx Transcripts:  
26,397 genes  
30,786 transcripts  
7,631 Ensembl transcripts  
5,534 novel transcripts of Ensembl genes  
17,621 novel transcripts/genes   



2. Identify overlap between novel transcripts in strain-specific reconstructions
---------------------------------



BEDtools version = bedtools v2.19.1
```
export PATH=/usr/local/bedtools2/bin:$PATH
bedtools -version 

cd /data2/saba/BNLx.SHR/RNA-Seq.Heart/totalRNA/reconstruction/tmp
intersectBed -a shr.bed -b bnlx.bed -wo > overlap.brain.total.byStrain.txt
```

3.  Compare novel transcripts across strain-specific transcriptomes BN-Lx and SHR 
------------------------------------------------------
Two transcripts were "merged" into one transcripts if:  
* they are both assigned to the same strand or one/both did not have a strand designation
* if 1) all exon starts and exon stops matched OR 2) all exon junctions matched, transcription start and stop sites could differ OR 3) two one-exon transcripts with transcription start sites within 100 bp of each other and transcription stop sites within 100 bp of each other




Combined Transcriptome:  
* 50,203 transcripts
* 6,059 novel transcripts identified in both strains
* 17,099 novel transcripts only identified in BNLx
* 18,915 novel transcripts only identified in SHR
* 7,951 Ensembl transcripts
* 179 novel transcripts very similar to Ensembl


4.  Identify overlap between transcripts in order to identify transcripts from the same gene
------------------------------------------------------

BEDtools Version = bedtools v2.19.1
```
export PATH=/usr/local/bedtools2/bin:$PATH
cd /data2/saba/BNLx.SHR/RNA-Seq.Heart/totalRNA/reconstruction/tmp
intersectBed -a combined.heart.total.01Oct14.bed -b combined.heart.total.01Oct14.bed -wo > overlap.heart.total.forGeneID.txt
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
cufflinks -u --seed 4356 -p 25 --library-type fr-firststrand -b /data2/saba/index/BNLx_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Heart/totalRNA/reconstruction/reconstruct.total.heart.01Oct14.v1.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Heart/totalRNA/quantitation/recon.Heart.total.v1.BNLx /hi-seq/BNLx.SHR.Heart.totalRNA.02Jun14/alignedReads/BNLx.heart.bam
cufflinks -u --seed 4366 -p 25 --library-type fr-firststrand -b /data2/saba/index/SHR_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Heart/totalRNA/reconstruction/reconstruct.total.heart.01Oct14.v1.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Heart/totalRNA/quantitation/recon.Heart.total.v1.SHR /hi-seq/BNLx.SHR.Heart.totalRNA.02Jun14/alignedReads/SHR.heart.bam
```




In the first iteration, 40,091 out of 50,203 transcripts were retained (35,445 out of 43,046 genes).


7. Quantitate Combined Transcriptome (2nd Iteration)
---------------------------------
```
cufflinks -u --seed 6356 -p 25 --library-type fr-firststrand -b /data2/saba/index/BNLx_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Heart/totalRNA/reconstruction/reconstruct.total.heart.03Oct14.v2.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Heart/totalRNA/quantitation/recon.Heart.total.v2.BNLx /hi-seq/BNLx.SHR.Heart.totalRNA.02Jun14/alignedReads/BNLx.heart.bam
cufflinks -u --seed 6366 -p 25 --library-type fr-firststrand -b /data2/saba/index/SHR_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Heart/totalRNA/reconstruction/reconstruct.total.heart.03Oct14.v2.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Heart/totalRNA/quantitation/recon.Heart.total.v2.SHR /hi-seq/BNLx.SHR.Heart.totalRNA.02Jun14/alignedReads/SHR.heart.bam

```




In the first iteration, 40,091 out of 50,203 transcripts were retained (35,445 out of 43,046 genes).
