BNLx and SHR Heart Transcriptome Reconstruction
========================================================

rRNA-Depleted Total RNA Reconstruction
--------------------






Complete SHR Transcriptome:  
75,159 genes  
86,920 transcripts  
13,763 Ensembl transcripts  
73,157 novel transcripts  

Complete BNLx Transcriptome:  
103,720 genes  
116,201 transcripts  
13,353 Ensembl transcripts  
102,848 novel transcripts  

1. Limit to transcripts with greater than 50 coverage and a transcript length greater than 200 nt (not including introns)
--------------




High Confidence SHR Transcripts:  
11,732 genes  
15,513 transcripts  
7,192 Ensembl transcripts  
5,102 novel transcripts of Ensembl genes  
3,219 novel transcripts/genes   


High Confidence BNLx Transcripts:  
11,046 genes  
13,624 transcripts  
5,890 Ensembl transcripts  
3,686 novel transcripts of Ensembl genes  
4,048 novel transcripts/genes   



2. Identify overlap between novel transcripts in strain-specific reconstructions
---------------------------------



BEDtools version = bedtools v2.19.1
```
export PATH=/usr/local/bedtools2/bin:$PATH
bedtools -version 

cd /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/reconstruction/tmp
intersectBed -a shr.bed -b bnlx.bed -wo > overlap.liver.total.byStrain.txt
```

3.  Compare novel transcripts across strain-specific transcriptomes BN-Lx and SHR 
------------------------------------------------------
Two transcripts were "merged" into one transcripts if:  
* they are both assigned to the same strand or one/both did not have a strand designation
* if 1) all exon starts and exon stops matched OR 2) all exon junctions matched, transcription start and stop sites could differ OR 3) two one-exon transcripts with transcription start sites within 100 bp of each other and transcription stop sites within 100 bp of each other




Combined Transcriptome:  
* 21,019 transcripts
* 2,351 novel transcripts identified in both strains
* 5,486 novel transcripts only identified in BNLx
* 5,954 novel transcripts only identified in SHR
* 7,087 Ensembl transcripts
* 141 novel transcripts very similar to Ensembl


4.  Identify overlap between transcripts in order to identify transcripts from the same gene
------------------------------------------------------

BEDtools Version = bedtools v2.19.1
```
export PATH=/usr/local/bedtools2/bin:$PATH
cd /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/reconstruction/tmp
intersectBed -a combined.liver.total.02Oct14.bed -b combined.liver.total.02Oct14.bed -wo > overlap.liver.total.forGeneID.txt
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
cufflinks -u --seed 4356 -p 25 --library-type fr-firststrand -b /data2/saba/index/BNLx_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/reconstruction/reconstruct.total.liver.02Oct14.v1.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/quantitation/recon.Liver.total.v1.BNLx /hi-seq/BNLx.SHR.Liver.totalRNA/alignedReads/BNLx.liver.bam
cufflinks -u --seed 4366 -p 25 --library-type fr-firststrand -b /data2/saba/index/SHR_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/reconstruction/reconstruct.total.liver.02Oct14.v1.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/quantitation/recon.Liver.total.v1.SHR /hi-seq/BNLx.SHR.Liver.totalRNA/alignedReads/SHR.liver.bam
```


```
## [1] 0.8976
```


In the first iteration, 18,866 out of 21,019 transcripts were retained (15,200 out of 16,022 genes).


7. Quantitate Combined Transcriptome (2nd Iteration)
---------------------------------
```
#on PhenoGen server
cufflinks -u --seed 9356 -p 25 --library-type fr-firststrand -b /data2/saba/index/BNLx_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/reconstruction/reconstruct.liver.03Oct14.v2.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/quantitation/recon.Liver.total.v2.BNLx /hi-seq/BNLx.SHR.Liver.totalRNA/alignedReads/BNLx.liver.bam
cufflinks -u --seed 9366 -p 25 --library-type fr-firststrand -b /data2/saba/index/SHR_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/reconstruction/reconstruct.liver.03Oct14.v2.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/quantitation/recon.Liver.total.v2.SHR /hi-seq/BNLx.SHR.Liver.totalRNA/alignedReads/SHR.liver.bam
```




In the first iteration, 18,866 out of 21,019 transcripts were retained (15,200 out of 16,022 genes).
