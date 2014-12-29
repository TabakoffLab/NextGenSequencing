Annotate New Transcriptome - Brain PolyA+-selected RNA
========================================================

1.  Create BED Files to Identify Overlap With Annotation
----------------------------------------------------











2.  Identify overlap between transcripts in order to identify transcripts from the same gene
------------------------------------------------------

BEDtools Version = bedtools v2.19.1
```
export PATH=/usr/local/bedtools2/bin:$PATH
cd /data2/saba/BNLx.SHR/RNA-Seq.Brain.polyA/reconstruction/tmp
intersectBed -a gtf.bed -b /data2/saba/gtfFiles/ensGene.RGSC5.0.rn5.cleaned.bed -wo > overlap.brain.polyA.wEnsembl.txt
intersectBed -a gtf.bed -b /data2/saba/gtfFiles/refSeqGene.RGSC5.0.rn5.cleaned.bed -wo > overlap.brain.polyA.wRefSeq.txt
intersectBed -a gtf.bed -b /data2/saba/gtfFiles/xenoRefGene.mouseOnly.RGSC5.0.rn5.bed -wo > overlap.brain.polyA.wMouseRefSeq.txt
```




Number of Transcripts: 17,264
Number of Genes: 12,305

### Annotation for Entire Set of Transcripts  

|            Annotation             | Number of Transcripts | Percent of Transcripts |
|:---------------------------------:|:---------------------:|:----------------------:|
|        ensembl transcript         |         7,489         |         43.4%          |
| novel transcript of Ensembl Gene  |         7,267         |         42.1%          |
|  associated with Rat RefSeq Gene  |           140         |          0.8%          |
| associated with Mouse RefSeq Gene |           150         |          0.9%          |
|            unannotated            |         2,218         |         12.8%          |


### Annotation for 20% of Transcripts with Highest Expression   

|            Annotation             | Number of Transcripts | Percent of Transcripts |
|:---------------------------------:|:---------------------:|:----------------------:|
|        ensembl transcript         |         2,157         |         62.5%          |
| novel transcript of Ensembl Gene  |           970         |         28.1%          |
|  associated with Rat RefSeq Gene  |            19         |          0.6%          |
| associated with Mouse RefSeq Gene |            19         |          0.6%          |
|            unannotated            |           288         |          8.3%          |


### Top 10 Most Highly Expressed Transcripts   

|   transcript_id    | chromosome | start (bp) | stop (bp) |  annotation summary |  Gene Identifier   | Gene Symbol |           Gene Description            | Ensembl Gene Biotype | FPKM (BN-Lx) | FPKM (SHR) |
|:------------------:|:----------:|:----------:|:---------:|:-------------------:|:------------------:|:-----------:|:-------------------------------------:|:--------------------:|:------------:|:----------:|
| ENSRNOT00000022113 |   chr18    |  15307563  |  15314777 | ensembl transcript  | ENSRNOG00000016275 |     Ttr     |            transthyretin              |    protein_coding    |    2557.9    |   1504.2   |
| ENSRNOT00000041891 |    chr1    |  81878373  |  81881182 | ensembl transcript  | ENSRNOG00000018454 |    Apoe     |           apolipoprotein E            |    protein_coding    |    1677.8    |   1639.0   |
| ENSRNOT00000066885 |   chr10    |  48664388  |  48665064 | ensembl transcript  | ENSRNOG00000042271 |     UBB     |        Protein LOC100360645           |    protein_coding    |    1486.8    |   1195.2   |
| ENSRNOT00000074404 |   chr20    |  19258274  |  19274198 | ensembl transcript  | ENSRNOG00000048682 |    Zwint    | ZW10 interactor, kinetochore protein  |    protein_coding    |    1308.9    |   1225.8   |
| ENSRNOT00000071215 |    chr3    | 178489204  | 178490283 | ensembl transcript  | ENSRNOG00000047374 |    Gnas     |          GNAS complex locus           |    protein_coding    |    1176.0    |   1008.2   |
| ENSRNOT00000058295 |   chr18    |  78473296  |  78504226 | ensembl transcript  | ENSRNOG00000016516 |     MBP     |         myelin basic protein          |    protein_coding    |    1190.4    |    806.8   |
| ENSRNOT00000022280 |   chr18    |  78473296  |  78504226 | ensembl transcript  | ENSRNOG00000016516 |     MBP     |         myelin basic protein          |    protein_coding    |    1155.0    |    784.6   |
| ENSRNOT00000003283 |    chrX    | 107379831  | 107394874 | ensembl transcript  | ENSRNOG00000002419 |    Plp1     |        proteolipid protein 1          |    protein_coding    |    1050.9    |    789.0   |
| ENSRNOT00000007175 |    chr3    | 149628698  | 149632565 | ensembl transcript  | ENSRNOG00000005195 |    Cst3     |              cystatin C               |    protein_coding    |     881.8    |    830.3   |
| ENSRNOT00000071708 |    chrX    |  28985069  |  28987071 | ensembl transcript  | ENSRNOG00000047931 |   Tmsb4x    |    thymosin, beta 4, X chromosome     |    protein_coding    |     829.3    |    853.6   |




BigWig Tracks For UCSC Genome Browser
```
```

