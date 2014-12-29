Annotate New Transcriptome - Brain Ribosomal-RNA depleted Total RNA
========================================================

1.  Create BED Files to Identify Overlap With Annotation
----------------------------------------------------








2.  Identify overlap between transcripts from reconstruction and annotation databases
------------------------------------------------------

BEDtools Version = bedtools v2.19.1
```
export PATH=/usr/local/bedtools2/bin:$PATH
cd /data2/saba/BNLx.SHR/RNA-Seq.Heart/totalRNA/reconstruction/tmp
intersectBed -a gtf.bed -b /data2/saba/gtfFiles/ensGene.RGSC5.0.rn5.cleaned.bed -wo > overlap.heart.total.wEnsembl.txt
intersectBed -a gtf.bed -b /data2/saba/gtfFiles/refSeqGene.RGSC5.0.rn5.cleaned.bed -wo > overlap.heart.total.wRefSeq.txt
intersectBed -a gtf.bed -b /data2/saba/gtfFiles/xenoRefGene.mouseOnly.RGSC5.0.rn5.bed -wo > overlap.heart.total.wMouseRefSeq.txt
```





Number of Transcripts: 39,368
Number of Genes: 34,773

### Annotation for Entire Set of Transcripts  

|            Annotation             | Number of Transcripts | Percent of Transcripts |
|:---------------------------------:|:---------------------:|:----------------------:|
|        ensembl transcript         |         7,299         |         18.5%          |
| novel transcript of Ensembl Gene  |         6,735         |         17.1%          |
|  associated with Rat RefSeq Gene  |           130         |          0.3%          |
| associated with Mouse RefSeq Gene |           157         |          0.4%          |
|            unannotated            |        25,047         |         63.6%          |


### Annotation for 20% of Transcripts with Highest Expression   

|            Annotation             | Number of Transcripts | Percent of Transcripts |
|:---------------------------------:|:---------------------:|:----------------------:|
|        ensembl transcript         |         3,797         |         48.2%          |
| novel transcript of Ensembl Gene  |         2,494         |         31.7%          |
|  associated with Rat RefSeq Gene  |            57         |          0.7%          |
| associated with Mouse RefSeq Gene |            42         |          0.5%          |
|            unannotated            |         1,484         |         18.8%          |


### Top 10 Most Highly Expressed Transcripts   

|   transcript_id    | chromosome | start (bp) | stop (bp) |         annotation summary        | Gene Identifier | Gene Symbol |                                            Gene Description                                            | Ensembl Gene Biotype | FPKM (BN-Lx) | FPKM (SHR) |
|:------------------:|:----------:|:----------:|:---------:|:---------------------------------:|:---------------:|:-----------:|:------------------------------------------------------------------------------------------------------:|:--------------------:|:------------:|:----------:|
| ENSRNOT00000050368 |   chr12    |  41777254  |  41835824 |        ensembl transcript         |                 |    Myl2     |                           myosin, light chain 2, regulatory, cardiac, slow                             |    protein_coding    |     8531     |    9205    |
| ENSRNOT00000041241 |    chrM    |      9451  |      9798 |        ensembl transcript         |                 |     ND3     |                                     NADH dehydrogenase subunit 3                                       |    protein_coding    |     4190     |    5968    |
|  matched.41405.1   |   chr15    |  31571329  |  31571699 |  associated with Rat RefSeq Gene  |    NR_002703    |    Rmrp     | Rattus norvegicus RNA component of mitochondrial RNA processing endoribonuclease (Rmrp), RNase MRP RNA |                      |     3792     |    3127    |
| ENSRNOT00000047550 |    chrM    |      2740  |      3694 |        ensembl transcript         |                 |     ND1     |                                     NADH dehydrogenase subunit 1                                       |    protein_coding    |     1726     |    3030    |
|  matched.38795.1   |   chr16    |  48981559  |  48985393 | novel transcript of Ensembl Gene  |                 |   Slc25a4   |                                       solute carrier family 25                                         |    protein_coding    |     1398     |    1330    |
| ENSRNOT00000048044 |    chr8    |  77153110  |  77174392 |        ensembl transcript         |                 |    TPM1     |                                         tropomyosin 1, alpha                                           |    protein_coding    |     1372     |    1305    |
|    BNLx.14980.1    |   chr18    |  28068414  |  28068622 | associated with Mouse RefSeq Gene |    NR_002905    |  Snora74a   |            Mus musculus small nucleolar RNA, H/ACA box 74A (Snora74a), small nucleolar RNA             |                      |     1365     |    1247    |
|  matched.39304.1   |    chr5    |  63519277  |  63519609 | associated with Mouse RefSeq Gene |    NR_001460    |    Rmrp     |               Mus musculus RNA component of mitochondrial RNAase P (Rmrp), RNase MRP RNA               |                      |     1403     |    1129    |
| ENSRNOT00000003965 |    chr7    |   2484095  |   2490338 |        ensembl transcript         |                 |    Atp5b    |               ATP synthase, H+ transporting, mitochondrial F1 complex, beta polypeptide                |    protein_coding    |     1339     |    1183    |
| ENSRNOT00000017325 |    chr5    | 152246244  | 152253006 |        ensembl transcript         |                 |    Fabp3    |                            fatty acid binding protein 3, muscle and heart                              |    protein_coding    |     1175     |    1339    |




BigWig Tracks For UCSC Genome Browser
```
track type=bigWig name="BNLx.SHR.Heart.plus" description="BNLx and SHR Heart - Plus Strand" bigDataUrl=http://ucsc:JU7etr5t@phenogen.ucdenver.edu/ucsc/HXB.heart.plus.bw
track type=bigWig name="BNLx.SHR.Heart.minus" description="BNLx and SHR Heart - Minus Strand" bigDataUrl=http://ucsc:JU7etr5t@phenogen.ucdenver.edu/ucsc/HXB.heart.minus.bw
```
