Added Benefit of RNA-Seq - Heart
========================================================
For Boris's departmental retreat presentation


Heart RNA-Seq
-------------

1. Number of raw reads
2. Number of uniquely aligned and filtered reads
3. Number of reads aligned to Ensembl protein-coding exons (out of uniquely aligned and filtered reads)
4. Number of Ensembl protein-coding exons expressed above background
5. Number of reads aligned to non-coding Ensembl genes (out of uniquely aligned and filtered reads)
6. Number of non-coding Ensembl genes expressed above background
7. Number of reads aligned to unannotated genes in the heart transcriptome reconstruction
8. Number of unannotated genes in the heart transcriptome reconstruction expressed above background


### 1.  Number of raw reads




**Number of raw read fragments:** 1,579,346,346

### 2. Number of uniquely aligned and filtered reads

Identify uniquely aligned reads based on mapping quality score in BAM file (MAPQ=50)
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/uniquelyAligned.heart.sh
```
Count number of uniquely aligned read fragments
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/uniqueAlignedCounts.heart.sh
```




**Number of uniquely aligned read fragments:** 1,263,485,502

### 3. Number of reads aligned to Ensembl exons (out of uniquely aligned and filtered reads)

Create BED files for overlap with unique BAM



Count uniquely aligned reads by annotation
```
qsub -q smp /home/data/saba/BNLx.SHR.Heart.totalRNA/programs/cntReadsByAnno.heart.sh
```




**Number of read fragments aligned to exons from protein-coding Ensembl transcripts (out of uniquely aligned and filtered reads:** 374,286,889

### 4. Number of Ensembl protein-coding exons expressed above background
???




Rat Exon 1.0 ST Array
-------------

1. Number of probe sets on the array
2. Number of probe sets retained after masking
3. Number of probe sets aligned to protein-coding Ensembl exons
4. Number of protein-coding Ensembl exons expressed above background
5. Number of probe sets aligned to non-coding Ensembl exons
6. Number of non-coding Ensembl exons expressed above background
7. Number of probe sets aligned to unannotated genes in the reconstructed heart transcriptome
8. Number of unannotated exons in the reconstructed heart transcriptome expressed above background


### 1. Number of probe sets on the array
```
wc -l /Volumes/LauraS/Affymetrix/SNP.Masks/Exon.Array/Rat/Source/RaEx-1_0-st-v1.probe.tab
awk '{print $2}' /Volumes/LauraS/Affymetrix/SNP.Masks/Exon.Array/Rat/Source/RaEx-1_0-st-v1.probe.tab | sort | uniq | wc -l
```
**Number of probes on the array:** 4,108,266  
**Number of probe sets on the array:** 1,065,841  


### 2. Number of probe sets retained after masking

```
wc -l /Volumes/LauraS/Affymetrix/SNP.Masks/Exon.Array/Rat/Results/RaEx-1_0-st-v1.r2.dt1.rn5.all.MASKED.ps
```
**Number of probe sets retained after masking:** 890,611  


### 3. Number of probe sets aligned to protein-coding Ensembl exons




BEDtools version = bedtools v2.19.1
```
export PATH=/usr/local/bedtools2/bin:$PATH
cd /data/Tabastore3/LauraS/Affymetrix/SNP.Masks/Exon.Array/Rat/Results
intersectBed -s -wo -f 1  -a probeSetLocations.wStrand.ratExonArray.25Jul2014.bed -b /data/Tabastore3/LauraS/gtfFiles/ensembl.proteinCodingExons.RGSC5.0.rn5.bed > probeSetOverlapWithEnsemblProteinCodingExons.txt
```




**Number of protein-coding Ensembl exons:** 209,999

**Number of probe sets that overlap a protein-coding Ensembl exon:** 179,858

### 4. Number of protein-coding Ensembl genes expressed above background







**Number of protein-coding Ensembl exon detected above background (dabg p-value<0.0001) in at least one sample (3 SHR samples and 3 BNLx samples):** 68,036

### 5. Number of probe sets aligned to non-coding Ensembl exons
BEDtools version = bedtools v2.19.1
```
export PATH=/usr/local/bedtools2/bin:$PATH
cd /data/Tabastore3/LauraS/Affymetrix/SNP.Masks/Exon.Array/Rat/Results
intersectBed -s -wo -f 1  -a probeSetLocations.wStrand.ratExonArray.25Jul2014.bed -b /data/Tabastore3/LauraS/gtfFiles/ensembl.allExons.RGSC5.0.rn5.bed > probeSetOverlapWithEnsemblExons.txt
```




**Number of non-coding Ensembl exons:** 6,478  
**Number of probe sets that overlap a non-coding Ensembl exon:** 2,041

### 6. Number of non-coding Ensembl exons expressed above background







**Number of non-coding Ensembl exon detected above background (dabg p-value<0.0001) in at least one sample (3 SHR samples and 3 BNLx samples):** 368
