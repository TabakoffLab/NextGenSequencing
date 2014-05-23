Initial Quality Control of Liver RNA-Seq Reads From Beckman (received 3/25/14)
=========================
* 2 liver ribosomal RNA depleted total RNA samples, BN-Lx3 and SHR1
* synthetic spikes included Mix 1 in SHR1 and Mix 2 in BN-Lx3
* 2X100 paired end reads using the stranded protocol


1. Unzip FASTQ files - DONE
----------------------------
```
cd /data/Users/hi-seq/BNLx.SHR.Liver.totalRNA.Beckman.25Mar14/rawReads
gzip -d *.gz
```

2. Determine number of reads sent for each sample - DONE
----------------------------------------------------------
```
##  Determine Number of Reads Generated - number of rows divided by 4  ##
wc -l *.fastq > /data/Tabastore3/LauraS/BNLx.SHR/RNA-Seq.Liver/data/numberReads.BNLx.SHR.Liver.25Mar14.txt
```


```r
rm(list = ls())
options(stringsAsFactors = FALSE)
setwd("/Volumes/LauraS/BNLx.SHR/RNA-Seq.Liver/totalRNA.Beckman/data/")
rawCounts = read.table(file = "numberReads.BNLx.SHR.Liver.25Mar14.txt", sep = " ", 
    header = FALSE, fill = TRUE)
rawCounts = rawCounts[is.na(rawCounts$V2), ]
rawCounts$readFrag = as.numeric(rawCounts$V3)/4
```


BNLx3 = 150,598,054 read fragments (75,299,027 paired reads)  
SHR1 = 153,528,402 read fragments (76,764,201 paired reads)


3. Trim Reads for Adaptors and for Quality - DONE
--------------------------------------------
```
export PATH=$HOME/bin:$PATH
export PYTHONPATH=$HOME/bin:$PYTHONPATH

cd /data/Users/hi-seq/BNLx.SHR.Liver.totalRNA.Beckman.25Mar14/

trim_galore --paired --stringency 3 -a GATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -q 20 -o ./trimmedReads/ ./rawReads/BN_LX-3_CTTGTA_R1.fastq ./rawReads/BN_LX-3_CTTGTA_R2.fastq
trim_galore --paired --stringency 3 -a GATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -q 20 -o ./trimmedReads/ ./rawReads/SHR_H-1_CGATGT_R1.fastq ./rawReads/SHR_H-1_CGATGT_R2.fastq
```

4. Characterizing Trimmed Reads - DONE
----------------------------------
```
export PATH=$HOME/bin:$PATH
export PYTHONPATH=$HOME/bin:$PYTHONPATH

cd /data/Users/hi-seq/BNLx.SHR.Liver.totalRNA.Beckman.25Mar14/trimmedReads
awk  '/@HWI/ {getline; print length($0)}' BN*.fq | awk '{sum+=$1} END { print "BNLx3","\t",sum/NR,"\t",NR}' > /data/Tabastore3/LauraS/BNLx.SHR/RNA-Seq.Liver/data/trimmedInfo.BNLx.SHR.Liver.25Mar14.txt
awk  '/@HWI/ {getline; print length($0)}' SHR*.fq | awk '{sum+=$1} END { print "SHR1","\t",sum/NR,"\t",NR}' >> /data/Tabastore3/LauraS/BNLx.SHR/RNA-Seq.Liver/data/trimmedInfo.BNLx.SHR.Liver.25Mar14.txt
```


```r
rm(list = ls())
options(stringsAsFactors = FALSE)
setwd("/Volumes/LauraS/BNLx.SHR/RNA-Seq.Liver/totalRNA.Beckman/data/")
trimmed = read.table(file = "trimmedInfo.BNLx.SHR.Liver.25Mar14.txt", sep = "\t", 
    header = FALSE, row.names = 1)
```


BNLx3:
------
Average read fragment length = 97.87  
Number of read fragments that remain after trimming = 149,653,216

SHR1:
------
Average read fragment length = 96.8  
Number of read fragments that remain after trimming = 152,303,118


5.  Generate Strain-Specific Genomes Including Spike-In Sequences - DONE
-------------------------------------------
```
cd /data/Tabastore3/LauraS/index
cat /data/Tabastore3/LauraS/BNLx.SHR/RNA-Seq/index/BNLX_rn5_Genome.fa /data/Tabastore3/LauraS/BxH.HxB.Rats/RNA-Seq/spikeSource/ERCC92.fa > BNLx_rn5_wSpikes.fa
bowtie2-build BNLx_rn5_wSpikes.fa BNLx_rn5_wSpikes

cd /data/Tabastore3/LauraS/BxH.HxB.Rats/RNA-Seq/index/
cp SHR_rn5_Genome.wSpikes* /data/Tabastore3/LauraS/index
```

6. Alignment of Raw Reads to Strain-Specific Genomes
------------------------------------

```
qsub -q smp-q /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/programs/alignment.14Apr14.sh
```

### Code from alignment.14Apr14.sh
```
#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 --library-type fr-firststrand -o /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/alignedReads/BNLx3 -p 10 /home/saba/index/BNLx_rn5_wSpikes /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/trimmedReads/BN_LX-3_CTTGTA_R1_val_1.fq /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/trimmedReads/BN_LX-3_CTTGTA_R2_val_2.fq
tophat2 --library-type fr-firststrand -o /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/alignedReads/SHR1 -p 10 /home/saba/index/SHR_rn5_wSpikes /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/trimmedReads/SHR_H-1_CGATGT_R1_val_1.fq /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/trimmedReads/SHR_H-1_CGATGT_R2_val_2.fq
```


7.  Characterization of Aligned Reads
---------------------------


```r
sampleList = c("BNLx3", "SHR1")

alignStats = c()
for (i in sampleList) {
    x = read.table(file = paste("/Volumes/LauraS/BNLx.SHR/RNA-Seq.Liver/totalRNA.Beckman/alignedReads/", 
        i, "/align_summary.txt", sep = ""), sep = "\t", header = FALSE)
    sample = i
    numReads = as.numeric(gsub(":", "", gsub("Input", "", x[2, 1])))
    mappedLeft = as.numeric(gsub(":", "", gsub("Mapped", "", unlist(lapply(strsplit(x[3, 
        1], split = "(", fixed = TRUE), function(a) a[1])))))
    mappedRight = as.numeric(gsub(":", "", gsub("Mapped", "", unlist(lapply(strsplit(x[7, 
        1], split = "(", fixed = TRUE), function(a) a[1])))))
    multiLeft = as.numeric(gsub("of these: ", "", unlist(lapply(strsplit(x[4, 
        1], split = "(", fixed = TRUE), function(a) a[1]))))
    multiRight = as.numeric(gsub("of these: ", "", unlist(lapply(strsplit(x[8, 
        1], split = "(", fixed = TRUE), function(a) a[1]))))
    lotsLeft = as.numeric(gsub(" have >20)", "", unlist(lapply(strsplit(x[4, 
        1], split = "(", fixed = TRUE), function(a) a[3]))))
    lotsRight = as.numeric(gsub(" have >20)", "", unlist(lapply(strsplit(x[8, 
        1], split = "(", fixed = TRUE), function(a) a[3]))))
    mappedPairs = as.numeric(gsub("Aligned pairs: ", "", x[10, 1]))
    multiPairs = as.numeric(gsub("of these: ", "", unlist(lapply(strsplit(x[11, 
        1], split = "(", fixed = TRUE), function(a) a[1]))))
    discordPairs = as.numeric(gsub("and: ", "", unlist(lapply(strsplit(x[12, 
        1], split = "(", fixed = TRUE), function(a) a[1]))))
    
    alignStats = rbind(alignStats, data.frame(sample, numReads, mappedLeft, 
        mappedRight, multiLeft, multiRight, lotsLeft, lotsRight, mappedPairs, 
        multiPairs, discordPairs))
}

alignTable = data.frame(t(alignStats))
colnames(alignTable) = alignTable[1, ]
alignTable = alignTable[-1, ]
alignTable$BNLx3.pct = as.numeric(alignTable$BNLx3)/as.numeric(alignTable["numReads", 
    "BNLx3"])
alignTable$SHR1.pct = as.numeric(alignTable$SHR1)/as.numeric(alignTable["numReads", 
    "SHR1"])

## format numbers
alignTable$BNLx3 = prettyNum(alignTable$BNLx3, big.mark = ",", scientific = FALSE)
alignTable$SHR1 = prettyNum(alignTable$SHR1, big.mark = ",", scientific = FALSE)
alignTable$BNLx3.pct = paste(sprintf("%.2f", round(alignTable$BNLx3.pct * 100, 
    2)), "%", sep = "")
alignTable$SHR1.pct = paste(sprintf("%.2f", round(alignTable$SHR1.pct * 100, 
    2)), "%", sep = "")

## add labels
labels = read.table(file = "/Volumes/LauraS/NextGenSeq/misc/alignLabels.txt", 
    sep = "\t", header = TRUE)
alignTable = merge(labels, alignTable, by.x = "var", by.y = 0)
alignTable = alignTable[order(alignTable$orderNum), ]
alignTable = alignTable[, c("Label", "BNLx3", "BNLx3.pct", "SHR1", "SHR1.pct")]
```


### Statistics on Alignment to Genome
|                           Label                           |   BNLx3    | BNLx3.pct |    SHR1    | SHR1.pct |
|:---------------------------------------------------------:|:----------:|:---------:|:----------:|:--------:|
|                number of paired-end reads                 | 74,826,608 |  100.00%  | 76,151,559 | 100.00%  |
|           number of left reads mapped to genome           | 63,339,834 |  84.65%   | 61,153,559 |  80.31%  |
|          number of right reads mapped to genome           | 63,697,146 |  85.13%   | 61,804,327 |  81.16%  |
|   number of mapped left reads with multiple alignments    | 10,723,581 |  14.33%   | 11,869,711 |  15.59%  |
|   number of mapped right reads with multiple alignments   | 10,849,654 |  14.50%   | 12,118,110 |  15.91%  |
| number of mapped left reads with more than 20 alignments  |    517,608 |   0.69%   |    289,346 |  0.38%   |
| number of mapped right reads with more than 20 alignments |    520,032 |   0.69%   |    289,713 |  0.38%   |
|                number of mapped read pairs                | 62,008,548 |  82.87%   | 59,377,570 |  77.97%  |
|   number of mapped read pairs with multiple alignments    | 10,281,516 |  13.74%   | 11,342,303 |  14.89%  |
|  number of mapped read pairs with discordant alignments   |  1,035,103 |   1.38%   |    850,214 |  1.12%   |




8.  Examine Spike-In Expression 
-----------------------
```
##  NOT YET UPDATED

cd /data/Tabastore3/LauraS/BxH.HxB.Rats/RNA-Seq/
samtools view ./alignedReads/HXB25_1/accepted_hits.bam | awk '$3!~"chr"' - > ./alignedReads/HXB25_1/spikeOnly.sam 
samtools view ./alignedReads/HXB25_2/accepted_hits.bam | awk '$3!~"chr"' - > ./alignedReads/HXB25_2/spikeOnly.sam 
samtools view ./alignedReads/HXB25_3/accepted_hits.bam | awk '$3!~"chr"' - > ./alignedReads/HXB25_3/spikeOnly.sam 

samtools view ./alignedReads/HXB2_1/accepted_hits.bam | awk '$3!~"chr"' - > ./alignedReads/HXB2_1/spikeOnly.sam 
samtools view ./alignedReads/HXB2_2/accepted_hits.bam | awk '$3!~"chr"' - > ./alignedReads/HXB2_2/spikeOnly.sam 
samtools view ./alignedReads/HXB2_3/accepted_hits.bam | awk '$3!~"chr"' - > ./alignedReads/HXB2_3/spikeOnly.sam 


cd /data/Tabastore3/LauraS/BxH.HxB.Rats/RNA-Seq/
cufflinks -p 2 -o ./spikeCounts/HXB25_1 -b ./index/SHR_rn5_Genome.wSpikes.fa -u -G ./spikeSource/ERCC92.none.gtf ./alignedReads/HXB25_1/spikeOnly.sam
cufflinks -p 2 -o ./spikeCounts/HXB25_2 -b ./index/SHR_rn5_Genome.wSpikes.fa -u -G ./spikeSource/ERCC92.none.gtf ./alignedReads/HXB25_2/spikeOnly.sam
cufflinks -p 2 -o ./spikeCounts/HXB25_3 -b ./index/SHR_rn5_Genome.wSpikes.fa -u -G ./spikeSource/ERCC92.none.gtf ./alignedReads/HXB25_3/spikeOnly.sam

cufflinks -p 2 -o ./spikeCounts/HXB2_1 -b ./index/SHR_rn5_Genome.wSpikes.fa -u -G ./spikeSource/ERCC92.none.gtf ./alignedReads/HXB2_1/spikeOnly.sam
cufflinks -p 2 -o ./spikeCounts/HXB2_2 -b ./index/SHR_rn5_Genome.wSpikes.fa -u -G ./spikeSource/ERCC92.none.gtf ./alignedReads/HXB2_2/spikeOnly.sam
cufflinks -p 2 -o ./spikeCounts/HXB2_3 -b ./index/SHR_rn5_Genome.wSpikes.fa -u -G ./spikeSource/ERCC92.none.gtf ./alignedReads/HXB2_3/spikeOnly.sam


samtools view -bT ./index/rn5.wSpikes.fa ./alignedReads/HXB25_1/spikeOnly.sam | genomeCoverageBed -d -split -strand - -ibam stdin | sort - > ./spikeCounts/spikeInCoverage.HXB25_1.txt
samtools view -bT ./index/rn5.wSpikes.fa ./alignedReads/HXB25_2/spikeOnly.sam | genomeCoverageBed -d -split -strand - -ibam stdin | sort - > ./spikeCounts/spikeInCoverage.HXB25_2.txt
samtools view -bT ./index/rn5.wSpikes.fa ./alignedReads/HXB25_3/spikeOnly.sam | genomeCoverageBed -d -split -strand - -ibam stdin | sort - > ./spikeCounts/spikeInCoverage.HXB25_3.txt


awk '{if($2==16) print $3}' ./alignedReads/HXB25_1/spikeOnly.sam | sort - | uniq -c > ./spikeCounts/readCounts.spikes.HXB25_1.txt
awk '{if($2==16) print $3}' ./alignedReads/HXB25_2/spikeOnly.sam | sort - | uniq -c > ./spikeCounts/readCounts.spikes.HXB25_2.txt
awk '{if($2==16) print $3}' ./alignedReads/HXB25_3/spikeOnly.sam | sort - | uniq -c > ./spikeCounts/readCounts.spikes.HXB25_3.txt

awk '{if($2==16) print $3}' ./alignedReads/HXB2_1/spikeOnly.sam | sort - | uniq -c > ./spikeCounts/readCounts.spikes.HXB2_1.txt
awk '{if($2==16) print $3}' ./alignedReads/HXB2_2/spikeOnly.sam | sort - | uniq -c > ./spikeCounts/readCounts.spikes.HXB2_2.txt
awk '{if($2==16) print $3}' ./alignedReads/HXB2_3/spikeOnly.sam | sort - | uniq -c > ./spikeCounts/readCounts.spikes.HXB2_3.txt



##  number of aligned reads  ##
samtools view -F 0X100 ./alignedReads/HXB25_1/accepted_hits.bam | wc -l 
samtools view -F 0X100 ./alignedReads/HXB25_2/accepted_hits.bam | wc -l 
samtools view -F 0X100 ./alignedReads/HXB25_3/accepted_hits.bam | wc -l 

``` 

