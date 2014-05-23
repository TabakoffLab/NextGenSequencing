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


5.  Align reads to mm10 reference genome
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

