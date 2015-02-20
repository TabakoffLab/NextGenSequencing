RI Panel - Batch 3 (Brain) Total RNA RNA-Seq
========================================================

* 1 sample per strain (SHR, BXH13, BXH5, BXH8)
* 2 samples per strain (BNLx, BXH10, BXH11, BXH3, BXH6, BXH9)
* tissues received from Dr. Michal Pravenec at Academy of Sciences of the Czech Republic, Prague, Czech Republic
* ribosomal RNA depleted total RNA
* 2X100 reads using the stranded protocol
* sequencing done by Beckman Coulter Genomics - received November 22, 2014
  * labeled UColorado Tabakoff Batch 5 by Beckman
* synthetic spike-in were added to each sample 
  * BXH3_1, BXH3_2, BXH5_1, BXH8_1, BXH10_1, BXH11_2, BXH13_1, and SHR_1 have mix 1
  * BXH6_1, BXH6_2, BXH9_1, BXH9_2, BXH10_2, BXH11_1, BNLx_1, and BNLx_2 have mix 2
  * 4 mL of 1:100 diluted spikes were added after RNA extraction but before rRNA-depletion
  * Information regarding the spike-ins can be found here: http://products.invitrogen.com/ivgn/product/4456739

1. Unzip Files - DONE
---------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/unzip.yucca.sh
```

2. Determine number of reads sent for each sample - DONE
-------------------------------------------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/countRawReads.brain.batch3.sh
```



Raw Reads/Read Fragments
---------------------------


| sample  | Number of Paired-End Reads | Number of Read Fragments |
|:-------:|:--------------------------:|:------------------------:|
| BNLX_1  |        149,664,346         |       299,328,692        |
| BNLX_2  |        147,573,455         |       295,146,910        |
| BXH10_1 |        136,119,802         |       272,239,604        |
| BXH10_2 |        143,559,349         |       287,118,698        |
| BXH11_1 |        143,165,227         |       286,330,454        |
| BXH11_2 |        142,142,287         |       284,284,574        |
| BXH13_1 |        136,469,855         |       272,939,710        |
| BXH3_1  |        148,297,982         |       296,595,964        |
| BXH3_2  |        138,276,728         |       276,553,456        |
| BXH5_1  |        141,525,963         |       283,051,926        |
| BXH6_1  |        140,776,240         |       281,552,480        |
| BXH6_2  |        146,263,134         |       292,526,268        |
| BXH8_1  |        130,847,183         |       261,694,366        |
| BXH9_1  |        132,797,003         |       265,594,006        |
| BXH9_2  |        133,839,175         |       267,678,350        |
|  SHR_1  |        146,707,331         |       293,414,662        |

Total Number of Paired End Reads: 2,258,025,060  
Total Number of Read Fragments:  4,516,050,120  
Average Number of Paired End Reads Per Sample: 141,126,566  

3. Trim reads for adaptors and for quality - DONE
---------------

```
qsub -q compute /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/trimReads.brain.batch3.sh
```

4. Characterize Trimmed Reads
---------------
```
qsub -q compute /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/countTrimmedReads.batch3.sh
qsub -q compute /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/countTrimmedReads.batch3.v2.sh

qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/compressRawReads.batch3.sh

```



Trimmed Reads/Read Fragments
---------------------------


| sample  | lane | Number of Paired-End Reads | Number of Read Fragments | Average Read Fragment Length After Trimming (first read fragment) | Average Read Fragment Length After Trimming (second read fragment) | Number of Read Fragments After Trimming | Percent of Read Fragments That Remained After Trimming |
|:-------:|:----:|:--------------------------:|:------------------------:|:-----------------------------------------------------------------:|:------------------------------------------------------------------:|:---------------------------------------:|:------------------------------------------------------:|
| BNLX_1  | L008 |        149,664,346         |       299,328,692        |                               99.0                                |                                98.8                                |               298,727,508               |                         99.8%                          |
| BNLX_2  | L006 |        147,573,455         |       295,146,910        |                               98.6                                |                                98.2                                |               293,935,996               |                         99.6%                          |
| BXH10_1 | L002 |        136,119,802         |       272,239,604        |                               98.4                                |                                98.1                                |               271,674,998               |                         99.8%                          |
| BXH10_2 | L005 |        143,559,349         |       287,118,698        |                               98.9                                |                                98.6                                |               286,239,662               |                         99.7%                          |
| BXH11_1 | L005 |        143,165,227         |       286,330,454        |                               98.7                                |                                98.5                                |               285,653,232               |                         99.8%                          |
| BXH11_2 | L002 |        142,142,287         |       284,284,574        |                               98.3                                |                                97.9                                |               283,596,826               |                         99.8%                          |
| BXH13_1 | L008 |        136,469,855         |       272,939,710        |                               98.2                                |                                97.8                                |               271,713,284               |                         99.6%                          |
| BXH3_1  | L001 |        148,297,982         |       296,595,964        |                               98.3                                |                                98.1                                |               295,623,226               |                         99.7%                          |
| BXH3_2  | L004 |        138,276,728         |       276,553,456        |                               97.4                                |                                97.1                                |               275,457,470               |                         99.6%                          |
| BXH5_1  | L003 |        141,525,963         |       283,051,926        |                               98.9                                |                                98.6                                |               282,020,926               |                         99.6%                          |
| BXH6_1  | L004 |        140,776,240         |       281,552,480        |                               99.0                                |                                98.8                                |               280,987,326               |                         99.8%                          |
| BXH6_2  | L003 |        146,263,134         |       292,526,268        |                               98.9                                |                                98.6                                |               291,702,468               |                         99.7%                          |
| BXH8_1  | L006 |        130,847,183         |       261,694,366        |                               98.7                                |                                98.5                                |               260,969,364               |                         99.7%                          |
| BXH9_1  | L007 |        132,797,003         |       265,594,006        |                               98.8                                |                                98.5                                |               265,022,346               |                         99.8%                          |
| BXH9_2  | L001 |        133,839,175         |       267,678,350        |                               99.0                                |                                98.7                                |               266,499,626               |                         99.6%                          |
|  SHR_1  | L007 |        146,707,331         |       293,414,662        |                               98.5                                |                                98.1                                |               292,141,722               |                         99.6%                          |

Total Number of Paired End Reads After Trimming: 2,250,982,990  
Total Number of Read Fragments After Trimming:  4,501,965,980  
Average Number of Paired End Reads Per Sample After Trimming: 281,372,874  

5. Align to ribosomal RNA - DONE
---------------------------
```
qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/alignTo.rRNA.brain.totalRNA.batch3.sh
qsub -q compute /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/restart.rRNAalign.batch3.sh

qsub -q compute -N BXH3_1 -l nodes=1:ppn=12 -V -- /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/tophat.rRNA.batch3.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/rawReads/ BXH3_1brain_CGATGT_L001 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT
qsub -q compute -N BXH6_1 -l nodes=1:ppn=12 -V -- /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/tophat.rRNA.batch3.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/rawReads/ BXH6_1brain_TGACCA_L004 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT
qsub -q compute -N BXH6_2 -l nodes=1:ppn=12 -V -- /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/tophat.rRNA.batch3.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/rawReads/ BXH6_2brain_GTGAAA_L003 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT
qsub -q compute -N BXH8_1 -l nodes=1:ppn=12 -V -- /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/tophat.rRNA.batch3.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/rawReads/ BXH8_1brain_AGTTCC_L006 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT
qsub -q compute -N BXH9_2 -l nodes=1:ppn=12 -V -- /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/tophat.rRNA.batch3.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/rawReads/ BXH9_2brain_CAGATC_L001 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT
qsub -q compute -N SHR_1.b3 -l nodes=1:ppn=12 -V -- /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/tophat.rRNA.batch3.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/rawReads/ SHR_1brain_ATGTCA_L007 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT
qsub -q compute -N BXH9_1 -l nodes=1:ppn=12 -V -- /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/tophat.rRNA.batch3.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/rawReads/ BXH9_1brain_AGTCAA_L007 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT
qsub -q compute -N BXH11_2 -l nodes=1:ppn=12 -V -- /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/tophat.rRNA.batch3.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/rawReads/ BXH11_2brain_CTTGTA_L002 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT
qsub -q compute -N BXH3_2 -l nodes=1:ppn=12 -V -- /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/tophat.rRNA.batch3.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/rawReads/ BXH3_2brain_CCGTCC_L004 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT
qsub -q compute -N BXH5_1 -l nodes=1:ppn=12 -V -- /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/tophat.rRNA.batch3.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/rawReads/ BXH5_1brain_ACAGTG_L003 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT
```

**move files**


Proportion of Reads Aligned to rRNA
-----------------------------------
This batch was subjected to 2 washes with riboZero.  




| Sample  | Number of Paired-End Reads After Trimming | Number of Paired-End Reads with at Least One Fragment Aligned to rRNA | Percent of Paired-End Reads Aligned to rRNA | Number of Paired-End Reads NOT Aligned to rRNA |
|:-------:|:-----------------------------------------:|:---------------------------------------------------------------------:|:-------------------------------------------:|:----------------------------------------------:|
| BNLX_1  |                149,363,754                |                               6,608,664                               |                    4.4%                     |                  142,755,090                   |
| BXH10_1 |                135,837,499                |                               4,836,675                               |                    3.6%                     |                  131,000,824                   |
| BXH11_1 |                142,826,616                |                              13,559,766                               |                    9.5%                     |                  129,266,850                   |
| BXH13_1 |                135,856,642                |                              10,267,331                               |                    7.6%                     |                  125,589,311                   |
| BXH3_2  |                137,728,735                |                              45,072,766                               |                    32.7%                    |                   92,655,969                   |
| BXH6_1  |                140,493,663                |                              11,004,714                               |                    7.8%                     |                  129,488,949                   |
| BXH8_1  |                130,484,682                |                               5,721,968                               |                    4.4%                     |                  124,762,714                   |
| BXH9_2  |                133,249,813                |                              24,644,940                               |                    18.5%                    |                  108,604,873                   |
| BNLX_2  |                146,967,998                |                              16,456,059                               |                    11.2%                    |                  130,511,939                   |
| BXH10_2 |                143,119,831                |                               7,338,128                               |                    5.1%                     |                  135,781,703                   |
| BXH11_2 |                141,798,413                |                              22,051,108                               |                    15.6%                    |                  119,747,305                   |
| BXH3_1  |                147,811,613                |                              13,701,206                               |                    9.3%                     |                  134,110,407                   |
| BXH5_1  |                141,010,463                |                               6,091,831                               |                    4.3%                     |                  134,918,632                   |
| BXH6_2  |                145,851,234                |                               8,285,150                               |                    5.7%                     |                  137,566,084                   |
| BXH9_1  |                132,511,173                |                              50,227,904                               |                    37.9%                    |                   82,283,269                   |
|  SHR_1  |                146,070,861                |                              11,993,557                               |                    8.2%                     |                  134,077,304                   |


6. Convert to fastq files
---------------------------
```
qsub -q compute -N BNLX_2 -l nodes=1:ppn=12 -V -- /storage/saba/sharedPrograms/bamToFastQ_py.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BNLX_2.rRNA
qsub -q compute -N BXH10_1 -l nodes=1:ppn=12 -V -- /storage/saba/sharedPrograms/bamToFastQ_py.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BXH10_1.rRNA
qsub -q compute -N BXH10_2 -l nodes=1:ppn=12 -V -- /storage/saba/sharedPrograms/bamToFastQ_py.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BXH10_2.rRNA
qsub -q compute -N BXH11_1 -l nodes=1:ppn=12 -V -- /storage/saba/sharedPrograms/bamToFastQ_py.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BXH11_1.rRNA
qsub -q compute -N BXH11_2 -l nodes=1:ppn=12 -V -- /storage/saba/sharedPrograms/bamToFastQ_py.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BXH11_2.rRNA
qsub -q compute -N BXH13_1 -l nodes=1:ppn=12 -V -- /storage/saba/sharedPrograms/bamToFastQ_py.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BXH13_1.rRNA
qsub -q compute -N BXH3_1 -l nodes=1:ppn=12 -V -- /storage/saba/sharedPrograms/bamToFastQ_py.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BXH3_1.rRNA
qsub -q compute -N BXH3_2 -l nodes=1:ppn=12 -V -- /storage/saba/sharedPrograms/bamToFastQ_py.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BXH3_2.rRNA
qsub -q compute -N BXH5_1 -l nodes=1:ppn=12 -V -- /storage/saba/sharedPrograms/bamToFastQ_py.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BXH5_1.rRNA
qsub -q compute -N BXH6_1 -l nodes=1:ppn=12 -V -- /storage/saba/sharedPrograms/bamToFastQ_py.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BXH6_1.rRNA
qsub -q compute -N BXH6_2 -l nodes=1:ppn=12 -V -- /storage/saba/sharedPrograms/bamToFastQ_py.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BXH6_2.rRNA
qsub -q compute -N BXH8_1 -l nodes=1:ppn=12 -V -- /storage/saba/sharedPrograms/bamToFastQ_py.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BXH8_1.rRNA
qsub -q compute -N BXH9_1 -l nodes=1:ppn=12 -V -- /storage/saba/sharedPrograms/bamToFastQ_py.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BXH9_1.rRNA
qsub -q compute -N BXH9_2 -l nodes=1:ppn=12 -V -- /storage/saba/sharedPrograms/bamToFastQ_py.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BXH9_2.rRNA
qsub -q compute -N SHR_1 -l nodes=1:ppn=12 -V -- /storage/saba/sharedPrograms/bamToFastQ_py.sh /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/SHR_1.rRNA
```








16 out of 16 of the fastq files were created correctly.


7.  Quantitate using RSEM and Ensembl Transcripts 
------------------------------------------------------
```
qsub -q compute -N quant1 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh BNLX_1 5648
qsub -q compute -N quant2 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh BNLX_2 5649
qsub -q compute -N quant3 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh BXH10_1 5650 
qsub -q compute -N quant4 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh BXH10_2 5651
qsub -q compute -N quant5 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh BXH11_1 5652
qsub -q compute -N quant6 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh BXH11_2 5653
qsub -q compute -N quant7 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh BXH13_1 5654
qsub -q compute -N quant8 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh BXH3_1 5655
qsub -q compute -N quant9 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh BXH3_2 5656



qsub -q compute -N quant10 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh BXH5_1 5657
qsub -q compute -N quant11 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh BXH6_1 5658
qsub -q compute -N quant12 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh BXH6_2 5659
qsub -q compute -N quant13 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh BXH8_1 5660
qsub -q compute -N quant14 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh BXH9_1 5661
qsub -q compute -N quant15 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh BXH9_2 5662
qsub -q compute -N quant16 -l nodes=1:ppn=12 -V --  /storage/saba/Rat.RI.Brain.totalRNA.batch3/programs/quantRSEM.batch3.sh SHR_1 5663
```



