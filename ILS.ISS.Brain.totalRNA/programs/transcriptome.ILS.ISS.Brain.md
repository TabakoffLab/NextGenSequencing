Compare Transcriptome-Guided Reconstructions Between ILS and ISS
========================================================

Add "chr" to gtf file to be able to visualize in the UCSC genome browser

```
cd /Volumes/LauraS/LXS/RNA-Seq/totalRNA.24Oct13/reconstruction
awk '{if($1!~"ERCC") print "chr"$0}' ./ILS.total.ensemblGuided/transcripts.gtf > ./ILS.total.ensemblGuided/transcripts.forUCSC.gtf
awk '{if($1!~"ERCC") print "chr"$0}' ./ISS.total.ensemblGuided/transcripts.gtf > ./ISS.total.ensemblGuided/transcripts.forUCSC.gtf
```

1.  Import GTF files and limit transcripts to those that have FPKM>1 in at least on strain and are larger than 300 bp (not including introns)
--------------------------


```r
rm(list = ls())
options(stringsAsFactors = FALSE)
setwd("/Volumes/LauraS/LXS/RNA-Seq/totalRNA.24Oct13")

ILS <- read.table(file = "reconstruction/ILS.total.ensemblGuided/transcripts.gtf", 
    sep = "\t", header = FALSE)
ILS$transcript_id = unlist(lapply(strsplit(ILS$V9, split = "; "), function(a) gsub("transcript_id ", 
    "", a[grep("transcript_id", a)])))
ILS$gene_id = unlist(lapply(strsplit(ILS$V9, split = "; "), function(a) gsub("gene_id ", 
    "", a[grep("gene_id", a)])))
ILS$fpkm = as.numeric(unlist(lapply(strsplit(ILS$V9, split = "; "), function(a) gsub("FPKM ", 
    "", a[grep("FPKM", a)]))))

# transcripts with duplicate transcript_id and unique gene_id
dups = ILS[!duplicated(ILS[, c("transcript_id", "V1")]), c("transcript_id", 
    "V1")]
dups = dups[dups$transcript_id %in% dups$transcript_id[duplicated(dups$transcript_id)], 
    ]
dups = dups[order(dups$transcript_id), ]
dups$rep = unlist(aggregate(dups$transcript_id, by = list(dups$transcript_id), 
    function(a) c(1:length(a)))$x)

ILS = merge(ILS, dups, by = c("transcript_id", "V1"), all = TRUE)
ILS$transcript_id[!is.na(ILS$rep)] = paste(ILS$transcript_id[!is.na(ILS$rep)], 
    ILS$rep[!is.na(ILS$rep)], sep = ".")

ILS.exons = ILS[ILS$V3 == "exon", ]
ILS.exons$length = ILS.exons$V5 - ILS.exons$V4 + 1

tmp = cbind(aggregate(ILS.exons$length, by = list(ILS.exons$transcript_id), 
    sum), aggregate(ILS.exons$transcript_id, by = list(ILS.exons$transcript_id), 
    length)$x)
colnames(tmp) = c("transcript_id", "length", "numExons")

ILS.transcripts = ILS[ILS$V3 == "transcript", ]
ILS.transcripts = merge(ILS.transcripts, tmp, by = "transcript_id")
ILS.transcripts = ILS.transcripts[ILS.transcripts$fpkm != 0 & ILS.transcripts$length > 
    300, ]

## ISS ##
ISS <- read.table(file = "reconstruction/ISS.total.ensemblGuided/transcripts.gtf", 
    sep = "\t", header = FALSE)
ISS$transcript_id = unlist(lapply(strsplit(ISS$V9, split = "; "), function(a) gsub("transcript_id ", 
    "", a[grep("transcript_id", a)])))
ISS$gene_id = unlist(lapply(strsplit(ISS$V9, split = "; "), function(a) gsub("gene_id ", 
    "", a[grep("gene_id", a)])))
ISS$fpkm = as.numeric(unlist(lapply(strsplit(ISS$V9, split = "; "), function(a) gsub("FPKM ", 
    "", a[grep("FPKM", a)]))))

ISS = merge(ISS, dups, by = c("transcript_id", "V1"), all = TRUE)
ISS$transcript_id[!is.na(ISS$rep)] = paste(ISS$transcript_id[!is.na(ISS$rep)], 
    ISS$rep[!is.na(ISS$rep)], sep = ".")

ISS.exons = ISS[ISS$V3 == "exon", ]
ISS.exons$length = ISS.exons$V5 - ISS.exons$V4 + 1

tmp = cbind(aggregate(ISS.exons$length, by = list(ISS.exons$transcript_id), 
    sum), aggregate(ISS.exons$transcript_id, by = list(ISS.exons$transcript_id), 
    length)$x)
colnames(tmp) = c("transcript_id", "length", "numExons")


ISS.transcripts = ISS[ISS$V3 == "transcript", ]
ISS.transcripts = merge(ISS.transcripts, tmp, by = "transcript_id")
ISS.transcripts = ISS.transcripts[ISS.transcripts$fpkm != 0 & ISS.transcripts$length > 
    300, ]
save(ILS.transcripts, ISS.transcripts, ILS, ISS, file = "Rdata/origRecon.Rdata")
```





Comparison of Transcriptomes
----------------------------

* Number of Genes  
ILS = 157279  
ISS = 162581  

* Number of Transcripts  
ILS = 173292  
ISS = 178495  

* Average Number of Transcripts Per Gene  
ILS = 1.1018  
ISS = 1.0979  

* Max Number of Transcripts Per Gene  
ILS = 20  
ISS = 17  

* Number of RefSeq Genes Recovered    
ILS = 18146  
ISS = 18131  


2. Concatenate novel transcripts between strains, merge expressed RefSeq transcripts, and created BED File
--------------------------------------------------------------------------

```r

ILS.transcripts = ILS.transcripts[, c("transcript_id", "gene_id", "fpkm", "length", 
    "numExons", "V1", "V4", "V5")]
colnames(ILS.transcripts) = paste("ILS.", colnames(ILS.transcripts), sep = "")

ISS.transcripts = ISS.transcripts[, c("transcript_id", "gene_id", "fpkm", "length", 
    "numExons", "V1", "V4", "V5")]
colnames(ISS.transcripts) = paste("ISS.", colnames(ISS.transcripts), sep = "")

ILS.transcripts$transcript_id = gsub("CUFF", "ILS", ILS.transcripts$ILS.transcript_id)
ISS.transcripts$transcript_id = gsub("CUFF", "ISS", ISS.transcripts$ISS.transcript_id)

transcripts = merge(ISS.transcripts[ISS.transcripts$ISS.fpkm > 1, ], ILS.transcripts[ILS.transcripts$ILS.fpkm > 
    1, ], by = "transcript_id", all = TRUE)

## Convert to BED File ##
ILS.v2 = ILS
ILS.v2$transcript_id = gsub("CUFF", "ILS", ILS.v2$transcript_id)
ILS.v2$gene_id = gsub("CUFF", "ILS", ILS.v2$gene_id)

ISS.v2 = ISS
ISS.v2$transcript_id = gsub("CUFF", "ISS", ISS.v2$transcript_id)
ISS.v2$gene_id = gsub("CUFF", "ISS", ISS.v2$gene_id)

combinedGTF = rbind(ILS.v2, ISS.v2)
combinedGTF = combinedGTF[, !(colnames(combinedGTF) %in% c("V9", "fpkm", "gene_id"))]
combinedGTF = combinedGTF[!duplicated(combinedGTF), ]
combinedGTF = combinedGTF[combinedGTF$transcript_id %in% transcripts$transcript_id, 
    ]

gtf <- combinedGTF[combinedGTF$V3 == "exon", ]
gtf <- gtf[order(gtf$transcript_id, gtf$V4, gtf$V5), ]

print(paste("Number of Transcripts ", length(unique(gtf$transcript_id)), sep = ""))

## create one per transcript ##
start <- aggregate(gtf$V4, by = list(gtf$transcript_id), function(a) paste(a, 
    collapse = ","))
stop <- aggregate(gtf$V5, by = list(gtf$transcript_id), function(a) paste(a, 
    collapse = ","))
transcripts <- gtf[!duplicated(gtf[, c("transcript_id", "V1")]), c("transcript_id", 
    "V1", "V6", "V7")]
onePerTrans <- merge(start, stop, by = 1)
onePerTrans <- merge(transcripts, onePerTrans, by = 1)

onePerTrans$exonNum = unlist(lapply(strsplit(onePerTrans$x.x, split = ",", fixed = TRUE), 
    length))
onePerTrans$start <- as.integer(unlist(lapply(strsplit(onePerTrans$x.x, split = ",", 
    fixed = TRUE), function(a) min(as.numeric(a)))))
onePerTrans$stop <- as.integer(unlist(lapply(strsplit(onePerTrans$x.y, split = ",", 
    fixed = TRUE), function(a) max(as.numeric(a)))))

## export as BED style file for overlap ##
write.table(onePerTrans[, c("V1", "start", "stop", "transcript_id", "V6", "V7")], 
    file = "data/combined.04Jun14.v1.bed", sep = "\t", quote = FALSE, row.names = FALSE, 
    col.names = FALSE)
```



3.  Look for overlap between transcripts within the combined BED file  
-----------------------------------------
BEDtools version = bedtools v2.16.2-zip-5db7ff9


```
export PATH=/usr/local/bedtools2/bin:$PATH
 
cd /data/Tabastore3/LauraS/LXS/RNA-Seq/totalRNA.24Oct13/data
intersectBed -a combined.04Jun14.v1.bed -b combined.04Jun14.v1.bed -wo > overlap.refSeqGuided.txt
```

4.  Identify novel transcripts that were identified in both BN-Lx and SHR 
------------------------------------------------------
Two transcripts were "merged" into one transcripts if:  
* they are both assigned to the same strand or one/both did not have a strand designation
* they were identified as novel in opposite strains (one from SHR and one from BNLx)
* if 1) all exon starts and exon stops matched OR 2) all exon junctions matched, transcription start and stop sites could differ OR 3) two one-exon transcripts with transcription start sites within 100 bp of each other and transcription stop sites within 100 bp of each other


```r
overlap <- read.table(file = "data/overlap.refSeqGuided.txt", sep = "\t", header = FALSE)
colnames(overlap) <- c(paste(c("chr", "start", "stop", "transcript_id", "V5", 
    "strand"), rep(c("A", "B"), each = 6), sep = "."), "overlap")

## add exon information to overlaps
setA = setB = onePerTrans[, c("transcript_id", "x.x", "x.y", "exonNum")]
colnames(setA) = c("transcript_id.A", "exonStarts.A", "exonStops.A", "exonNum.A")
colnames(setB) = c("transcript_id.B", "exonStarts.B", "exonStops.B", "exonNum.B")

overlap = merge(overlap, setA, by = "transcript_id.A")
overlap = merge(overlap, setB, by = "transcript_id.B")

overlap$ID = c(1:nrow(overlap))

## identify exon junction

findJunct <- function(starts, stops) {
    start <- strsplit(starts, split = ",", fixed = TRUE)[[1]]
    stop <- strsplit(stops, split = ",", fixed = TRUE)[[1]]
    junct <- NA
    if (length(start) > 1) 
        junct <- paste(paste(stop[-length(stop)], start[-1], sep = "//"), collapse = ",")
    return(junct)
}

overlap$exonJunct.A = apply(overlap[, c("exonStarts.A", "exonStops.A")], 1, 
    function(a) findJunct(a[1], a[2]))
overlap$exonJunct.B = apply(overlap[, c("exonStarts.B", "exonStops.B")], 1, 
    function(a) findJunct(a[1], a[2]))

## remove overlap that is on the opposite strand
overlap <- overlap[overlap$strand.A == "." | overlap$strand.B == "." | overlap$strand.A == 
    overlap$strand.B, ]

## remove overlap between same transcript
overlap <- overlap[overlap$transcript_id.A != overlap$transcript_id.B, ]


## remove overlap where coding regions don't overlap ##
intronCheck = c()
for (i in 1:nrow(overlap)) {
    input = overlap[i, ]
    out = sum(sum(unlist(lapply(strsplit(strsplit(input[1, "exonJunct.B"], split = ",")[[1]], 
        split = "//"), function(a) input[1, "start.A"] > a[1] & input[1, "stop.A"] < 
        a[2]))), sum(unlist(lapply(strsplit(strsplit(input[1, "exonJunct.A"], 
        split = ",")[[1]], split = "//"), function(a) input[1, "start.B"] > 
        a[1] & input[1, "stop.B"] < a[2]))), na.rm = TRUE)
    intronCheck = c(intronCheck, out)
}

overlap = overlap[intronCheck == 0, ]

## remove overlap with annotated genes/transcripts ##
overlap = overlap[!(grepl("N", overlap$transcript_id.B) | grepl("N", overlap$transcript_id.A)), 
    ]

## remove within strain overlap ##
overlap = overlap[!(grepl("ILS", overlap$transcript_id.B) & grepl("ILS", overlap$transcript_id.A)), 
    ]
overlap = overlap[!(grepl("ISS", overlap$transcript_id.B) & grepl("ISS", overlap$transcript_id.A)), 
    ]

## transcripts without any overlap - 39,167 transcripts
noOverlap = onePerTrans[!(onePerTrans$transcript_id %in% unique(c(overlap$transcript_id.A, 
    overlap$transcript_id.B))), ]

## perfect overlap - 190 transcripts
perfect = overlap[overlap$exonStarts.A == overlap$exonStarts.B & overlap$exonStops.A == 
    overlap$exonStops.B, ]

## identify exon junction matches - 2,122 transcripts
reduced = overlap[!(overlap$ID %in% perfect$ID), ]
exonJunctMatch <- reduced[!is.na(reduced$exonJunct.A) & !is.na(reduced$exonJunct.B) & 
    reduced$exonJunct.A == reduced$exonJunct.B, ]

## examine one-exon transcripts - 47012 transcripts
reduced = overlap[!(overlap$ID %in% c(perfect$ID, exonJunctMatch$ID)), ]
oneExons = reduced[reduced$exonNum.A == 1 & reduced$exonNum.B == 1, ]

closeMatch.oneExon = oneExons[abs(oneExons$start.A - oneExons$start.B) < 100 & 
    abs(oneExons$stop.A - oneExons$stop.B) < 100, ]
sum(duplicated(closeMatch.oneExon$transcript_id.B))

## Check for overlap between renamed ##
matched = as.data.frame(rbind(perfect, exonJunctMatch, closeMatch.oneExon))
sum(duplicated(matched$transcript_id.B))

## create new transcript for matched transcripts - 8,105 matches
matched = matched[grep("ILS", matched$transcript_id.A), ]

matched$transcript_id = paste("total", c(1:nrow(matched)), sep = ".")
matched$gene_id = NA
matched$V1 = matched$chr.A
matched$V6 = 1000
matched$V7 = matched$strand.A
matched$start = apply(matched[, c("start.B", "start.A")], 1, min)
matched$stop = apply(matched[, c("stop.B", "stop.A")], 1, max)
matched$exonNum = matched$exonNum.A

matched$x.x = NA
matched$x.x[matched$start == matched$start.A] = matched$exonStarts.A[matched$start == 
    matched$start.A]
matched$x.x[matched$start == matched$start.B] = matched$exonStarts.B[matched$start == 
    matched$start.B]

matched$x.y = NA
matched$x.y[matched$stop == matched$stop.A] = matched$exonStops.A[matched$stop == 
    matched$stop.A]
matched$x.y[matched$stop == matched$stop.B] = matched$exonStops.B[matched$stop == 
    matched$stop.B]

matched.toAdd = matched[, colnames(onePerTrans)]

new.transcripts = onePerTrans[!(onePerTrans$transcript_id %in% c(matched$transcript_id.A, 
    matched$transcript_id.B)), ]
new.transcripts = rbind(new.transcripts, matched.toAdd)

write.table(new.transcripts[, c("V1", "start", "stop", "transcript_id", "V6", 
    "V7")], file = "data/newTotal.04Jun14.bed", sep = "\t", quote = FALSE, row.names = FALSE, 
    col.names = FALSE)
```


5.  Identify overlap between transcripts in order to identify transcripts from the same gene
------------------------------------------------------

BEDtools Version = bedtools v2.16.2-zip-5db7ff9
```
export PATH=/usr/local/bedtools2/bin:$PATH
cd /data/Tabastore3/LauraS/LXS/RNA-Seq/totalRNA.24Oct13/data
intersectBed -a newTotal.04Jun14.bed -b newTotal.04Jun14.bed -wo > overlap.total.forGeneID.txt
```

6.  Match transcripts to genes and create new GTF file  
------------------------------------------------------

Two transcripts are from the same gene if:  
* Their transcription start sites matched exactly OR
* Their transcription stop sites matched exactly OR
* At least one exon-exon junction matched exactly


```r

findJunct <- function(starts, stops) {
    start <- strsplit(starts, split = ",", fixed = TRUE)[[1]]
    stop <- strsplit(stops, split = ",", fixed = TRUE)[[1]]
    junct <- NA
    if (length(start) > 1) 
        junct <- paste(paste(stop[-length(stop)], start[-1], sep = "//"), collapse = ",")
    return(junct)
}

new.transcripts$exonJunct = apply(new.transcripts[, c("x.x", "x.y")], 1, function(a) findJunct(a[1], 
    a[2]))

overlap = read.table(file = "data/overlap.total.forGeneID.txt", sep = "\t", 
    header = FALSE)
overlap = overlap[overlap$V4 != overlap$V10, ]
overlap = overlap[overlap$V6 == "." | overlap$V12 == "." | overlap$V6 == overlap$V12, 
    ]

overlap$pair = apply(overlap, 1, function(a) paste(sort(a[c("V4", "V10")]), 
    collapse = "//"))
overlap = overlap[!duplicated(overlap$pair), ]

pairs = c()
for (i in 1:nrow(overlap)) {
    x = new.transcripts[new.transcripts$transcript_id == overlap$V4[i], ]
    y = new.transcripts[new.transcripts$transcript_id == overlap$V10[i], ]
    sameGene = FALSE
    if (x$start == y$start | x$stop == y$stop) 
        sameGene = TRUE
    if (!is.na(y$exonJunct) & !is.na(x$exonJunct) & sum(duplicated(c(unlist(strsplit(x$exonJunct, 
        split = ",")), unlist(strsplit(y$exonJunct, split = ","))))) > 0) 
        sameGene = TRUE
    if (sameGene) 
        pairs = rbind(pairs, c(x$transcript_id, y$transcript_id))
}


## identify genes with multiple transcripts and create gene identifier ##
library(igraph)
library("ggm")

edges <- pairs
graph.polyA <- graph.data.frame(edges)
graph.polyA <- igraph.to.graphNEL(graph.polyA)

compList <- connectedComp(graph.polyA)
names(compList) <- paste("total", c(1:length(compList)), sep = ".")

multiTrans <- sapply(names(compList), function(a) cbind(gene_id.new = a, transcript_id.new = paste(a, 
    c(1:length(compList[[a]])), sep = "."), id = compList[[a]]))
multiTrans <- data.frame(do.call(rbind, multiTrans))

singleTrans <- data.frame(id = new.transcripts$transcript_id[!(new.transcripts$transcript_id %in% 
    multiTrans$id)])
singleTrans$gene_id.new = paste("total", c((length(compList) + 1):(length(compList) + 
    nrow(singleTrans))), sep = ".")
singleTrans$transcript_id.new = paste(singleTrans$gene_id.new, 1, sep = ".")

updated <- merge(new.transcripts, rbind(multiTrans, singleTrans), by.x = "transcript_id", 
    by.y = "id")

## Create New GTF File ##

byExon = data.frame(do.call(rbind, apply(updated, 1, function(tmp) data.frame(transcript_id.new = as.character(tmp[12]), 
    V4 = unlist(strsplit(as.character(tmp[5]), split = ",")), V5 = unlist(strsplit(as.character(tmp[6]), 
        split = ","))))))

gtf = merge(updated, byExon, by = "transcript_id.new")
gtf$V2 = "CuffLinks"
gtf$V3 = "exon"
gtf$V8 = "."
gtf$V9 = paste("gene_id \"", gtf$gene_id.new, "\"; transcript_id \"", gtf$transcript_id.new, 
    "\"; original \"", gtf$transcript_id, "\";", sep = "")

gtf = gtf[, paste("V", c(1:9), sep = "")]

write.table(gtf, file = "reconstruction/transcripts.05Jun14.v1.gtf", row.names = FALSE, 
    col.names = FALSE, quote = FALSE, sep = "\t")
```


7. Use SailFish To Check Quantification In New GTF
---------------------------------------

### Extract sequence of transcripts
```

# index genome
cd /Volumes/LauraS/index
samtools faidx mm10.cleaned.wSpikes.v2.fa

# generate fasta file of transcript sequences
cd /Volumes/LauraS/LXS/RNA-Seq/totalRNA.24Oct13/reconstruction
gffread -w transcripts.05Jun14.v1.fa -g /Volumes/LauraS/index/mm10.cleaned.wSpikes.v2.fa transcripts.05Jun14.v1.gtf
```

### Quantify Using SailFish
```
qsub -q smp /home/saba/ILS.ISS.Brain.totalRNA/programs/sailFish.quant.v1.sh
```


```r
rm(list = ls())
options(stringsAsFactors = FALSE)
setwd("/Volumes/LauraS/LXS/RNA-Seq/totalRNA.24Oct13/")
ILS1.count = read.table(file = "quantification/sailFish.v1/ILS1/quant.sf", sep = "\t", 
    header = FALSE)
ILS2.count = read.table(file = "quantification/sailFish.v1/ILS2/quant.sf", sep = "\t", 
    header = FALSE)
ILS3.count = read.table(file = "quantification/sailFish.v1/ILS3/quant.sf", sep = "\t", 
    header = FALSE)
ISS1.count = read.table(file = "quantification/sailFish.v1/ISS1/quant.sf", sep = "\t", 
    header = FALSE)
ISS2.count = read.table(file = "quantification/sailFish.v1/ISS2/quant.sf", sep = "\t", 
    header = FALSE)
ISS3.count = read.table(file = "quantification/sailFish.v1/ISS3/quant.sf", sep = "\t", 
    header = FALSE)

colnames(ILS1.count) = c("transcript_id", "length", paste("ILS1", c("TPM", "RPKM", 
    "KPKM", "EstNumKmers", "EstNumReads"), sep = "."))
colnames(ILS2.count) = c("transcript_id", "length", paste("ILS2", c("TPM", "RPKM", 
    "KPKM", "EstNumKmers", "EstNumReads"), sep = "."))
colnames(ILS3.count) = c("transcript_id", "length", paste("ILS3", c("TPM", "RPKM", 
    "KPKM", "EstNumKmers", "EstNumReads"), sep = "."))
colnames(ISS1.count) = c("transcript_id", "length", paste("ISS1", c("TPM", "RPKM", 
    "KPKM", "EstNumKmers", "EstNumReads"), sep = "."))
colnames(ISS2.count) = c("transcript_id", "length", paste("ISS2", c("TPM", "RPKM", 
    "KPKM", "EstNumKmers", "EstNumReads"), sep = "."))
colnames(ISS3.count) = c("transcript_id", "length", paste("ISS3", c("TPM", "RPKM", 
    "KPKM", "EstNumKmers", "EstNumReads"), sep = "."))

counts = merge(ILS1.count, ILS2.count, by = c("transcript_id", "length"))
counts = merge(counts, ILS3.count, by = c("transcript_id", "length"))
counts = merge(counts, ISS1.count, by = c("transcript_id", "length"))
counts = merge(counts, ISS2.count, by = c("transcript_id", "length"))
counts = merge(counts, ISS3.count, by = c("transcript_id", "length"))

counts$numSamplesGrt1 = rowSums(counts[, grep("TPM", colnames(counts))] > 1)
counts = counts[counts$numSamplesGrt1 != 0, ]

counts$gene_id = paste("total", unlist(lapply(strsplit(counts$transcript_id, 
    split = ".", fixed = TRUE), function(a) a[2])), sep = ".")

counts$sumTPM = rowSums(counts[, grep("TPM", colnames(counts))])
counts = counts[order(counts$gene_id, counts$sumTPM, decreasing = TRUE), ]

## rename transcripts based on TPM ##
newID = data.frame(do.call(rbind, aggregate(counts$transcript_id, by = list(gene_id = counts$gene_id), 
    function(a) cbind(a, paste("total", strsplit(a, split = ".", fixed = TRUE)[[1]][2], 
        1:length(a), sep = ".")))$x))
colnames(newID) = c("transcript_id", "transcript_id.new")

## reduce GTF file ##
orig.gtf = read.table(file = "reconstruction/transcripts.05Jun14.v1.gtf", header = FALSE, 
    sep = "\t")
orig.gtf$transcript_id = unlist(lapply(strsplit(orig.gtf$V9, split = "; "), 
    function(a) gsub("transcript_id ", "", a[grep("transcript", a)])))
orig.gtf$gene_id = unlist(lapply(strsplit(orig.gtf$V9, split = "; "), function(a) gsub("gene_id ", 
    "", a[grep("gene", a)])))

new.gtf = merge(orig.gtf, newID, by = "transcript_id")
new.gtf$V9 = paste("gene_id \"", new.gtf$gene_id, "\"; transcript_id \"", new.gtf$transcript_id.new, 
    "\";", sep = "")
write.table(new.gtf[, paste("V", c(1:9), sep = "")], file = "reconstruction/transcripts.05Jun14.v2.gtf", 
    row.names = FALSE, col.names = FALSE, quote = FALSE, sep = "\t")
```


# generate fasta file of transcript sequences
```
cd /Volumes/LauraS/LXS/RNA-Seq/totalRNA.24Oct13/reconstruction
gffread -w transcripts.05Jun14.v2.fa -g /Volumes/LauraS/index/mm10.cleaned.wSpikes.v2.fa transcripts.05Jun14.v2.gtf
```

### Quantify Using SailFish
```
qsub -q smp /home/saba/ILS.ISS.Brain.totalRNA/programs/sailFish.quant.v2.sh
```

### Move files around
```
cd /data/Tabastore3/LauraS/LXS/RNA-Seq/totalRNA.24Oct13/quantification/
mkdir sailFish.v2
cd sailFish.v2
mkdir ISS1 ISS2 ISS3 ILS1 ILS2 ILS3
chmod a+rw *

cd /Volumes/LauraS/LXS/RNA-Seq/totalRNA.24Oct13/quantification/sailFish.v2

cd /home/saba/ILS.ISS.Brain.totalRNA/quantification/sailFish.v2
get ISS1/quant.sf ISS1/quant.sf
get ISS2/quant.sf ISS2/quant.sf
get ISS3/quant.sf ISS3/quant.sf
get ILS1/quant.sf ILS1/quant.sf
get ILS2/quant.sf ILS2/quant.sf
get ILS3/quant.sf ILS3/quant.sf
```


```r
rm(list = ls())
options(stringsAsFactors = FALSE)
setwd("/Volumes/LauraS/LXS/RNA-Seq/totalRNA.24Oct13/")
ILS1.count = read.table(file = "quantification/sailFish.v2/ILS1/quant.sf", sep = "\t", 
    header = FALSE)
ILS2.count = read.table(file = "quantification/sailFish.v2/ILS2/quant.sf", sep = "\t", 
    header = FALSE)
ILS3.count = read.table(file = "quantification/sailFish.v2/ILS3/quant.sf", sep = "\t", 
    header = FALSE)
ISS1.count = read.table(file = "quantification/sailFish.v2/ISS1/quant.sf", sep = "\t", 
    header = FALSE)
ISS2.count = read.table(file = "quantification/sailFish.v2/ISS2/quant.sf", sep = "\t", 
    header = FALSE)
ISS3.count = read.table(file = "quantification/sailFish.v2/ISS3/quant.sf", sep = "\t", 
    header = FALSE)

colnames(ILS1.count) = c("transcript_id", "length", paste("ILS1", c("TPM", "RPKM", 
    "KPKM", "EstNumKmers", "EstNumReads"), sep = "."))
colnames(ILS2.count) = c("transcript_id", "length", paste("ILS2", c("TPM", "RPKM", 
    "KPKM", "EstNumKmers", "EstNumReads"), sep = "."))
colnames(ILS3.count) = c("transcript_id", "length", paste("ILS3", c("TPM", "RPKM", 
    "KPKM", "EstNumKmers", "EstNumReads"), sep = "."))
colnames(ISS1.count) = c("transcript_id", "length", paste("ISS1", c("TPM", "RPKM", 
    "KPKM", "EstNumKmers", "EstNumReads"), sep = "."))
colnames(ISS2.count) = c("transcript_id", "length", paste("ISS2", c("TPM", "RPKM", 
    "KPKM", "EstNumKmers", "EstNumReads"), sep = "."))
colnames(ISS3.count) = c("transcript_id", "length", paste("ISS3", c("TPM", "RPKM", 
    "KPKM", "EstNumKmers", "EstNumReads"), sep = "."))

counts = merge(ILS1.count, ILS2.count, by = c("transcript_id", "length"))
counts = merge(counts, ILS3.count, by = c("transcript_id", "length"))
counts = merge(counts, ISS1.count, by = c("transcript_id", "length"))
counts = merge(counts, ISS2.count, by = c("transcript_id", "length"))
counts = merge(counts, ISS3.count, by = c("transcript_id", "length"))

counts$numSamplesGrt1 = rowSums(counts[, grep("TPM", colnames(counts))] > 1)
counts = counts[counts$numSamplesGrt1 != 0, ]

counts$gene_id = paste("total", unlist(lapply(strsplit(counts$transcript_id, 
    split = ".", fixed = TRUE), function(a) a[2])), sep = ".")

counts$sumTPM = rowSums(counts[, grep("TPM", colnames(counts))])
counts = counts[order(counts$gene_id, counts$sumTPM, decreasing = TRUE), ]

## rename transcripts based on TPM ##
newID = data.frame(do.call(rbind, aggregate(counts$transcript_id, by = list(gene_id = counts$gene_id), 
    function(a) cbind(a, paste("total", strsplit(a, split = ".", fixed = TRUE)[[1]][2], 
        1:length(a), sep = ".")))$x))
colnames(newID) = c("transcript_id", "transcript_id.new")

## reduce GTF file ##
orig.gtf = read.table(file = "reconstruction/transcripts.05Jun14.v2.gtf", header = FALSE, 
    sep = "\t")
orig.gtf$transcript_id = unlist(lapply(strsplit(orig.gtf$V9, split = "; "), 
    function(a) gsub("transcript_id ", "", a[grep("transcript", a)])))
orig.gtf$transcript_id = gsub(";", "", orig.gtf$transcript_id)
orig.gtf$gene_id = unlist(lapply(strsplit(orig.gtf$V9, split = "; "), function(a) gsub("gene_id ", 
    "", a[grep("gene", a)])))

new.gtf = merge(orig.gtf, newID, by = "transcript_id")
new.gtf$V9 = paste("gene_id \"", new.gtf$gene_id, "\"; transcript_id \"", new.gtf$transcript_id.new, 
    "\";", sep = "")
new.gtf = new.gtf[, paste("V", c(1:9), sep = "")]

write.table(new.gtf, file = "reconstruction/transcripts.11Jun14.FINAL.gtf", 
    row.names = FALSE, col.names = FALSE, quote = FALSE, sep = "\t")

new.gtf$V1 = paste("chr", new.gtf$V1, sep = "")
forUCSC = new.gtf[-grep("ERCC", new.gtf$V1), ]
write.table(forUCSC, file = "reconstruction/transcripts.11Jun14.FINAL.forUCSC.gtf", 
    row.names = FALSE, col.names = FALSE, quote = FALSE, sep = "\t")
```



