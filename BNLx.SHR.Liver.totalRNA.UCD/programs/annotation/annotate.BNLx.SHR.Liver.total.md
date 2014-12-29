Annotate New Transcriptome - Liver Ribosomal-RNA depleted Total RNA
========================================================

1.  Create BED Files to Identify Overlap With Annotation
----------------------------------------------------








2.  Identify overlap between transcripts from reconstruction and annotation databases
------------------------------------------------------

BEDtools Version = bedtools v2.19.1
```
export PATH=/usr/local/bedtools2/bin:$PATH
cd /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/reconstruction/tmp
intersectBed -a gtf.bed -b /data2/saba/gtfFiles/ensGene.RGSC5.0.rn5.cleaned.bed -wo > overlap.liver.total.wEnsembl.txt
intersectBed -a gtf.bed -b /data2/saba/gtfFiles/refSeqGene.RGSC5.0.rn5.cleaned.bed -wo > overlap.liver.total.wRefSeq.txt
intersectBed -a gtf.bed -b /data2/saba/gtfFiles/xenoRefGene.mouseOnly.RGSC5.0.rn5.bed -wo > overlap.liver.total.wMouseRefSeq.txt
```





Number of Transcripts: 18,833
Number of Genes: 15,176

### Annotation for Entire Set of Transcripts  

|            Annotation             | Number of Transcripts | Percent of Transcripts |
|:---------------------------------:|:---------------------:|:----------------------:|
|        ensembl transcript         |         6,605         |         35.1%          |
| novel transcript of Ensembl Gene  |         5,830         |         31.0%          |
|  associated with Rat RefSeq Gene  |           135         |          0.7%          |
| associated with Mouse RefSeq Gene |           111         |          0.6%          |
|            unannotated            |         6,152         |         32.7%          |


### Annotation for 20% of Transcripts with Highest Expression   

|            Annotation             | Number of Transcripts | Percent of Transcripts |
|:---------------------------------:|:---------------------:|:----------------------:|
|        ensembl transcript         |         2,162         |         57.4%          |
| novel transcript of Ensembl Gene  |         1,256         |         33.3%          |
|  associated with Rat RefSeq Gene  |            34         |          0.9%          |
| associated with Mouse RefSeq Gene |            26         |          0.7%          |
|            unannotated            |           289         |          7.7%          |


### Top 10 Most Highly Expressed Transcripts   

|   transcript_id    | chromosome | start (bp) | stop (bp) |         annotation summary        | Gene Identifier | Gene Symbol |                                            Gene Description                                            | Ensembl Gene Biotype | FPKM (BN-Lx) | FPKM (SHR) |
|:------------------:|:----------:|:----------:|:---------:|:---------------------------------:|:---------------:|:-----------:|:------------------------------------------------------------------------------------------------------:|:--------------------:|:------------:|:----------:|
|  matched.15626.1   |   chr15    |  31571402  |  31571703 |  associated with Rat RefSeq Gene  |    NR_002703    |    Rmrp     | Rattus norvegicus RNA component of mitochondrial RNA processing endoribonuclease (Rmrp), RNase MRP RNA |                      |    10614     |   17700    |
| ENSRNOT00000042860 |    chr8    |  41643250  |  41646813 |        ensembl transcript         |                 |    Rup2     |                                           urinary protein 2                                            |    protein_coding    |     4455     |    4802    |
|  matched.15822.1   |    chr5    |  63519281  |  63519565 | associated with Mouse RefSeq Gene |    NR_001460    |    Rmrp     |               Mus musculus RNA component of mitochondrial RNAase P (Rmrp), RNase MRP RNA               |                      |     3378     |    3884    |
| ENSRNOT00000021055 |    chr1    | 264287001  | 264294216 |        ensembl transcript         |                 |    Rbp4     |                                   retinol binding protein 4, plasma                                    |    protein_coding    |     2495     |    2800    |
| ENSRNOT00000022113 |   chr18    |  15307563  |  15314777 |        ensembl transcript         |                 |     Ttr     |                                             transthyretin                                              |    protein_coding    |     5220     |       0    |
| ENSRNOT00000008840 |    chr4    | 163840320  | 163844102 |        ensembl transcript         |                 |    Fabp1    |                                  fatty acid binding protein 1, liver                                   |    protein_coding    |     2320     |    2436    |
|    BNLx.4030.1     |   chr10    |  58888616  |  58890287 |            unannotated            |                 |             |                                                                                                        |                      |     1571     |    2564    |
| ENSRNOT00000020197 |   chr19    |  52921330  |  52925933 |        ensembl transcript         |                 |     Hp      |                                              haptoglobin                                               |    protein_coding    |     4078     |       0    |
| ENSRNOT00000004756 |   chr10    |  96364126  |  96378117 |        ensembl transcript         |                 |    Apoh     |                                           apolipoprotein H                                             |    protein_coding    |     1926     |    1476    |
| ENSRNOT00000004662 |   chr13    |  94223782  |  94225667 |        ensembl transcript         |                 |    Apoa2    |                                          apolipoprotein A-II                                           |    protein_coding    |     1867     |    1482    |




BigWig Tracks For UCSC Genome Browser
```
track type=bigWig name="BNLx.SHR.Liver.plus" description="BNLx and SHR Liver - Plus Strand" bigDataUrl=http://ucsc:JU7etr5t@phenogen.ucdenver.edu/ucsc/HXB.liver.plus.bw
track type=bigWig name="BNLx.SHR.Liver.minus" description="BNLx and SHR Liver - Minus Strand" bigDataUrl=http://ucsc:JU7etr5t@phenogen.ucdenver.edu/ucsc/HXB.liver.minus.bw
```
