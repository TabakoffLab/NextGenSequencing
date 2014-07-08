ILS and ISS total Brain RNA-Seq
========================================================

* 3 samples per strain (ILS1, ILS2, ILS3, ISS1, ISS2, ISS3)
* ribosomal RNA depleted total RNA
* 2X100 reads using the stranded protocol
* sequencing done in Boulder by James Huntley
* synthetic spike-in were added to each sample (ISS samples got Mix 1 and ILS samples got Mix 2)
  * Information regarding the spike-ins can be found here: http://products.invitrogen.com/ivgn/product/4456739
  * Adam started with 1 ug of Total RNA and used 2 ul of a 1:100 dilution of either Mix 1 or Mix 2 in the samples. Also note, they are added prior to rRNA depletion so we can account for any variation through that step in library prep.

1. Unzip Files
---------------

```
gzip -d ./Sample_*/*.gz
```

2. Determine Number of Reads Generated
---------------------------------------

```
##  Determine Number of Reads Generated - number of rows divided by 4  ##
cd /data/Users/hi-seq/ILS.ISS.Brain.totalRNA.23Oct13/rawReads
wc -l ./*/*.fastq > /data/Tabastore3/LauraS/LXS/RNA-Seq/totalRNA.24Oct13/data/rawReadCount.15Apr14.txt
```




### Raw Reads/Read Fragments From UC Boulder Core

| sample  | strain | numPairedReads | numReadFragments |
|:-------:|:------:|:--------------:|:----------------:|
| ILS_1LB |  ILS   |   78,176,377   |   156,352,754    |
| ILS_2LB |  ILS   |   67,299,097   |   134,598,194    |
| ILS_3LB |  ILS   |   71,725,948   |   143,451,896    |
| ISS_1LB |  ISS   |   71,825,374   |   143,650,748    |
| ISS_2LB |  ISS   |   93,515,647   |   187,031,294    |
| ISS_3LB |  ISS   |   65,171,258   |   130,342,516    |



3. Trim Reads for Adapters and Quality  
--------------------------------------

```
export PATH=$HOME/bin:$PATH
export PYTHONPATH=$HOME/bin:$PYTHONPATH

cd /data/Users/hi-seq/ILS.ISS.Brain.totalRNA.23Oct13/

FILES1=./rawReads/Sample_ILS_1LB/*R1*.fastq
for f in $FILES1
do
  f2=${f//R1/R2} 
	trim_galore --paired --stringency 3 -a GATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -q 20 -o ./trimmedReads/ $f $f2
done

FILES=./rawReads/Sample_ILS_2LB/*R1*.fastq
for f in $FILES
do
	f2=${f//R1/R2} 
	trim_galore --paired --stringency 3 -a GATCGGAAGAGCACACGTCTGAACTCCAGTCACGTCCGCACATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -q 20 -o ./trimmedReads/ $f $f2
done

FILES=./rawReads/Sample_ILS_3LB/*R1*.fastq
for f in $FILES
do
	f2=${f//R1/R2} 
	trim_galore --paired --stringency 3 -a GATCGGAAGAGCACACGTCTGAACTCCAGTCACGTGAAACGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -q 20 -o ./trimmedReads/ $f $f2
done

FILES=./rawReads/Sample_ISS_1LB/*R1*.fastq
for f in $FILES
do
	f2=${f//R1/R2} 
	trim_galore --paired --stringency 3 -a GATCGGAAGAGCACACGTCTGAACTCCAGTCACAGTCAACAATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -q 20 -o ./trimmedReads/ $f $f2
done

FILES=./rawReads/Sample_ISS_2LB/*R1*.fastq
for f in $FILES
do
	f2=${f//R1/R2} 
	trim_galore --paired --stringency 3 -a GATCGGAAGAGCACACGTCTGAACTCCAGTCACAGTTCCGTATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -q 20 -o ./trimmedReads/ $f $f2
done

FILES=./rawReads/Sample_ISS_3LB/*R1*.fastq
for f in $FILES
do
	f2=${f//R1/R2} 
	trim_galore --paired --stringency 3 -a GATCGGAAGAGCACACGTCTGAACTCCAGTCACATGTCAGAATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -q 20 -o ./trimmedReads/ $f $f2
done

```

4.  Characterizing Trimmed Reads  
-----------------------------------


```
qsub -q smp-q /home/saba/ILS.ISS.Brain.totalRNA/programs/countTrimmed.15Apr14.sh
```


```r
trimmed = read.table(file = "/Volumes/LauraS/LXS/RNA-Seq/totalRNA.24Oct13/data/trimmedInfo.ILS.ISS.Brain.15Apr14.txt", 
    sep = "\t", header = FALSE)
trimmed$avgTrimmedReadLength = prettyNum(trimmed$V2, digits = 4)
trimmed$numTrimmedReadFragments = prettyNum(trimmed$V3, big.mark = ",", scientific = FALSE)
trimmed$V1 = gsub(" ", "", trimmed$V1)
trimmed$V1 = gsub("1", "_1LB", trimmed$V1)
trimmed$V1 = gsub("2", "_2LB", trimmed$V1)
trimmed$V1 = gsub("3", "_3LB", trimmed$V1)

fullTable = merge(readFragments, trimmed, by.x = "sample", by.y = "V1")
fullTable = fullTable[, !(colnames(fullTable) %in% c("V2", "V3"))]
fullTable$pctRemovedByTrimming = paste(prettyNum(100 * (1 - (as.numeric(gsub(",", 
    "", fullTable$numTrimmedReadFragments))/as.numeric(gsub(",", "", fullTable$numReadFragments)))), 
    digits = 2), "%", sep = "")
```


### Effect of Trimming Adaptors and Poor Quality Base Calls

| sample  | strain | numPairedReads | numReadFragments | avgTrimmedReadLength | numTrimmedReadFragments | pctRemovedByTrimming |
|:-------:|:------:|:--------------:|:----------------:|:--------------------:|:-----------------------:|:--------------------:|
| ILS_1LB |  ILS   |   78,176,377   |   156,352,754    |        96.96         |       155,760,826       |        0.38%         |
| ILS_2LB |  ILS   |   67,299,097   |   134,598,194    |        97.24         |       134,219,316       |        0.28%         |
| ILS_3LB |  ILS   |   71,725,948   |   143,451,896    |         97.5         |       143,117,546       |        0.23%         |
| ISS_1LB |  ISS   |   71,825,374   |   143,650,748    |        97.18         |       142,883,024       |        0.53%         |
| ISS_2LB |  ISS   |   93,515,647   |   187,031,294    |        97.28         |       186,218,350       |        0.43%         |
| ISS_3LB |  ISS   |   65,171,258   |   130,342,516    |         97.3         |       129,805,906       |        0.41%         |


5.  Generate Strain-Specific Genomes Including Spike-In Sequences
-------------------------------------------

"clean" the reference genome

```
## eliminate any chromosome that starts with 'JH' or 'GL' or 'MT'
sed '/>JH/,/>/{//!d}' mm10.fa | sed '/>JH/d' | sed '/>GL/,/>/{//!d}' | sed '/>GL/d' | sed '/>MT/,/>/{//!d}' | sed '/>MT/d' > mm10.revised.fa

## separate chromosome Y because it had uneven lines
sed -n '/>Y/,/>/p' mm10.revised.fa > mm10.revised.chrY.fa
sed '/>Y/,/>/{//!d}' mm10.revised.fa | sed '/>Y/d' > mm10.revised.wo.chrY.fa
```

Convert fasta file for spike-ins from 50 bp returns to 60 bp returns

```
library(seqinr)
spikes = read.fasta(file="/Volumes/LauraS/BxH.HxB.Rats/RNA-Seq/spikeSource/ERCC92.fa",seqtype="DNA",forceDNAtolower=FALSE)
write.fasta(spikes,names(spikes),file.out="/Volumes/LauraS/BxH.HxB.Rats/RNA-Seq/spikeSource/ERCC92.v2.fa")

genome = read.fasta(file="/Volumes/LauraS/BXD/RNA-Seq/GeneNetwork/index/mm10.revised.chrY.fa",seqtype="DNA",forceDNAtolower=FALSE)
write.fasta(genome,names(genome),file.out="/Volumes/LauraS/BXD/RNA-Seq/GeneNetwork/index/mm10.revised.chrY.v2.fa")

```

Concatenate spikes with mm10 genome

```
cd /data/Tabastore3/LauraS/index
cat /data/Tabastore3/LauraS/BXD/RNA-Seq/GeneNetwork/index/mm10.revised.wo.chrY.fa /data/Tabastore3/LauraS/BXD/RNA-Seq/GeneNetwork/index/mm10.revised.chrY.v2.fa /data/Tabastore3/LauraS/BxH.HxB.Rats/RNA-Seq/spikeSource/ERCC92.v2.fa > mm10.cleaned.wSpikes.fa
awk '{if($1~">") print $1; else print $0}' mm10.cleaned.wSpikes.fa > mm10.cleaned.wSpikes.v2.fa
```

Create Bowtie2 Index

```
bowtie2-build BNLx_rn5_wSpikes.fa BNLx_rn5_wSpikes
```

6.  Align reads to mm10 reference genome
---------------------------------

```
qsub -q smp-q /home/saba/ILS.ISS.Brain.totalRNA/programs/tophatAlign.15Apr14.sh
```

### Code from tophatAlign.15Apr14.sh

```
#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 --library-type fr-firststrand -o /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS1 -p 16 /home/saba/index/mm10.revised.wSpikes /home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L004_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L004_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L004_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L004_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L004_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L004_R1_006_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L004_R1_007_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L005_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L005_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L005_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L005_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L005_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L005_R1_006_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L005_R1_007_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L006_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L006_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L006_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L006_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L006_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L006_R1_006_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L006_R1_007_val_1.fq /home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L004_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L004_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L004_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L004_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L004_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L004_R2_006_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L004_R2_007_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L005_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L005_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L005_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L005_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L005_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L005_R2_006_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L005_R2_007_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L006_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L006_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L006_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L006_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L006_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L006_R2_006_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_1LB_CCGTCC_L006_R2_007_val_2.fq
tophat2 --library-type fr-firststrand -o /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS1 -p 16 /home/saba/index/mm10.revised.wSpikes /home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L004_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L004_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L004_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L004_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L004_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L004_R1_006_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L004_R1_007_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L005_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L005_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L005_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L005_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L005_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L005_R1_006_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L006_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L006_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L006_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L006_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L006_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L006_R1_006_val_1.fq /home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L004_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L004_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L004_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L004_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L004_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L004_R2_006_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L004_R2_007_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L005_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L005_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L005_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L005_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L005_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L005_R2_006_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L006_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L006_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L006_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L006_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L006_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_1LB_AGTCAA_L006_R2_006_val_2.fq
tophat2 --library-type fr-firststrand -o /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS2 -p 16 /home/saba/index/mm10.revised.wSpikes /home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L004_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L004_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L004_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L004_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L004_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L004_R1_006_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L005_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L005_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L005_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L005_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L005_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L005_R1_006_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L006_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L006_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L006_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L006_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L006_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L006_R1_006_val_1.fq /home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L004_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L004_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L004_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L004_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L004_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L004_R2_006_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L005_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L005_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L005_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L005_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L005_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L005_R2_006_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L006_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L006_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L006_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L006_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L006_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_2LB_GTCCGC_L006_R2_006_val_2.fq
tophat2 --library-type fr-firststrand -o /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS3 -p 16 /home/saba/index/mm10.revised.wSpikes /home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L004_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L004_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L004_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L004_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L004_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L004_R1_006_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L004_R1_007_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L005_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L005_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L005_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L005_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L005_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L005_R1_006_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L006_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L006_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L006_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L006_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L006_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L006_R1_006_val_1.fq /home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L004_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L004_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L004_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L004_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L004_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L004_R2_006_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L004_R2_007_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L005_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L005_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L005_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L005_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L005_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L005_R2_006_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L006_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L006_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L006_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L006_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L006_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS_3LB_GTGAAA_L006_R2_006_val_2.fq 
tophat2 --library-type fr-firststrand -o /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS2 -p 16 /home/saba/index/mm10.revised.wSpikes /home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R1_006_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R1_007_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R1_008_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R1_006_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R1_007_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R1_008_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R1_006_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R1_007_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R1_008_val_1.fq /home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R2_006_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R2_007_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L004_R2_008_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R2_006_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R2_007_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L005_R2_008_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R2_006_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R2_007_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_2LB_AGTTCC_L006_R2_008_val_2.fq 
tophat2 --library-type fr-firststrand -o /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS3 -p 16 /home/saba/index/mm10.revised.wSpikes /home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L004_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L004_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L004_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L004_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L004_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L004_R1_006_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L005_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L005_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L005_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L005_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L005_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L005_R1_006_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L006_R1_001_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L006_R1_002_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L006_R1_003_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L006_R1_004_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L006_R1_005_val_1.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L006_R1_006_val_1.fq /home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L004_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L004_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L004_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L004_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L004_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L004_R2_006_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L005_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L005_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L005_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L005_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L005_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L005_R2_006_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L006_R2_001_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L006_R2_002_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L006_R2_003_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L006_R2_004_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L006_R2_005_val_2.fq,/home/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS_3LB_ATGTCA_L006_R2_006_val_2.fq
```

7.  Characterize Aligned Reads
-----------------------
```
cd /home/saba/ILS.ISS.Brain.totalRNA/alignedReads
qsub -q smp /home/saba/ILS.ISS.Brain.totalRNA/programs/countAlignedReads.03Jun14.sh
```


```r
setwd("/Volumes/LauraS/LXS/RNA-Seq/totalRNA.24Oct13")
aligned = read.table(file = "data/countAligned.03Jun14.txt", sep = "", header = FALSE)

aligned$sample = unlist(lapply(strsplit(aligned$V1, split = "/", fixed = TRUE), 
    function(a) a[6]))

aF = aligned[aligned$V2 == "aligned.first", c("sample", "V3", "V4")]
aS = aligned[aligned$V2 == "aligned.second", c("sample", "V3", "V4")]
cF = aligned[aligned$V2 == "controls.first", c("sample", "V3", "V4")]
cS = aligned[aligned$V2 == "controls.second", c("sample", "V3", "V4")]

colnames(aF) = c("sample", "aligned.first.unique", "aligned.first.all")
colnames(aS) = c("sample", "aligned.second.unique", "aligned.second.all")
colnames(cF) = c("sample", "controls.first.unique", "controls.first.all")
colnames(cS) = c("sample", "controls.second.unique", "controls.second.all")

alignTable = merge(aF, aS, by = "sample")
alignTable = merge(alignTable, cF, by = "sample")
alignTable = merge(alignTable, cS, by = "sample")

fullTable$sample = gsub("LB", "", gsub("_", "", fullTable$sample, fixed = TRUE))
newTable = merge(fullTable, alignTable, by = "sample")

newTable$numAlignedReadFrag = newTable$aligned.first.all + newTable$aligned.second.all
newTable$numAlignedUniqueReadFrag = newTable$aligned.first.unique + newTable$aligned.second.unique
newTable$numControlReadFrag = newTable$controls.first.all + newTable$controls.second.all

newTable$pctAligned = newTable$numAlignedReadFrag/as.numeric(gsub(",", "", newTable$numTrimmedReadFragments, 
    fixed = TRUE))
newTable$pctUnique = newTable$numAlignedUniqueReadFrag/newTable$numAlignedReadFrag
newTable$pctControl = newTable$numControlReadFrag/newTable$numAlignedReadFrag
newTable$pctControl.v2 = newTable$numControlReadFrag/as.numeric(gsub(",", "", 
    newTable$numTrimmedReadFragments, fixed = TRUE))

printTable = newTable[, c("sample", "numReadFragments", "numTrimmedReadFragments", 
    "pctRemovedByTrimming", "numAlignedReadFrag", "pctAligned", "numAlignedUniqueReadFrag", 
    "pctUnique", "numControlReadFrag", "pctControl")]
printTable$numAlignedReadFrag = prettyNum(printTable$numAlignedReadFrag, big.mark = ",")
printTable$numAlignedUniqueReadFrag = prettyNum(printTable$numAlignedUniqueReadFrag, 
    big.mark = ",")
printTable$numControlReadFrag = prettyNum(printTable$numControlReadFrag, big.mark = ",")

printTable$pctAligned = paste(sprintf("%.1f", round(100 * printTable$pctAligned, 
    1)), "%", sep = "")
printTable$pctUnique = paste(sprintf("%.1f", round(100 * printTable$pctUnique, 
    1)), "%", sep = "")
printTable$pctControl = paste(sprintf("%.2f", round(100 * printTable$pctControl, 
    2)), "%", sep = "")

colnames(printTable) = c("sample", "Number of Read Fragments Generated", "Number of Read Fragments After Trimming", 
    "Percent of Read Fragments Removed During Trimming", "Number of Read Fragments Aligned to Genome or Spike-Ins", 
    "Percent of Trimmed Read Fragments Aligned", "Number of Read Fragments Aligned To Only 1 Location", 
    "Percent of Aligned Read Fragments That Align To Only 1 Location", "Number of Read Fragments Aligned to Spike-In Controls", 
    "Percent of Aligned Read Fragments That Align to Spike-In Controls")
```


### Alignment Stats

| sample | Number of Read Fragments Generated | Number of Read Fragments After Trimming | Percent of Read Fragments Removed During Trimming | Number of Read Fragments Aligned to Genome or Spike-Ins | Percent of Trimmed Read Fragments Aligned | Number of Read Fragments Aligned To Only 1 Location | Percent of Aligned Read Fragments That Align To Only 1 Location | Number of Read Fragments Aligned to Spike-In Controls | Percent of Aligned Read Fragments That Align to Spike-In Controls |
|:------:|:----------------------------------:|:---------------------------------------:|:-------------------------------------------------:|:-------------------------------------------------------:|:-----------------------------------------:|:---------------------------------------------------:|:---------------------------------------------------------------:|:-----------------------------------------------------:|:-----------------------------------------------------------------:|
|  ILS1  |            156,352,754             |               155,760,826               |                       0.38%                       |                       119,401,619                       |                   76.7%                   |                     111,979,196                     |                              93.8%                              |                         722,450                       |                               0.61%                               |
|  ILS2  |            134,598,194             |               134,219,316               |                       0.28%                       |                       102,639,677                       |                   76.5%                   |                      96,120,663                     |                              93.6%                              |                         468,506                       |                               0.46%                               |
|  ILS3  |            143,451,896             |               143,117,546               |                       0.23%                       |                       111,916,879                       |                   78.2%                   |                     105,243,379                     |                              94.0%                              |                         749,800                       |                               0.67%                               |
|  ISS1  |            143,650,748             |               142,883,024               |                       0.53%                       |                       112,827,399                       |                   79.0%                   |                     106,655,846                     |                              94.5%                              |                         829,283                       |                               0.74%                               |
|  ISS2  |            187,031,294             |               186,218,350               |                       0.43%                       |                       147,651,926                       |                   79.3%                   |                     138,993,513                     |                              94.1%                              |                         983,562                       |                               0.67%                               |
|  ISS3  |            130,342,516             |               129,805,906               |                       0.41%                       |                       100,710,665                       |                   77.6%                   |                      94,746,862                     |                              94.1%                              |                       1,041,531                       |                               1.03%                               |


8.  Sort and Merge Aligned Reads By Strain
-------------------------------------------

```
qsub -q smp-q /home/saba/ILS.ISS.Brain.totalRNA/programs/sortAndMerge.21Apr14.sh
```

9.  Transcriptome/Genome Guided Reconstruction
-------------------------------------------

```
qsub -q smp-q /home/saba/ILS.ISS.Brain.totalRNA/programs/transRecon.LXS.brain.22Apr14.sh
```

10. Manual Merge of Strain-Specific Transcriptomes
--------------------------------------------------


11. Create BigWig Files
------------------

```
qsub -q smp /home/saba/ILS.ISS.Brain.totalRNA/programs/createBigWig.sh
```
