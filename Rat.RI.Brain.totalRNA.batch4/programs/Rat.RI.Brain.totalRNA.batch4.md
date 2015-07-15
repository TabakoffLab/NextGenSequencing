RI Panel - Batch 4 (Brain) Total RNA RNA-Seq
============================================

-   1 sample per strain (BNLx)
-   2 samples per strain (SHR)
-   tissues received from Dr. Michal Pravenec at Academy of Sciences of the Czech Republic, Prague, Czech Republic
-   ribosomal RNA depleted total RNA
-   2X100 reads using the stranded protocol
-   sequencing done by Beckman Coulter Genomics - received June 9, 2015
-   labeled 'HXB parental brain total RNA' by Beckman
-   synthetic spike-in were added to each sample
-   BNLx\_3 & SHR\_1 have mix 1 (need to double check)
-   SHR\_3 has mix 2 (need to double check)
-   4 mL of 1:100 diluted spikes were added after RNA extraction but before rRNA-depletion
-   Information regarding the spike-ins can be found here: <http://products.invitrogen.com/ivgn/product/4456739>

1. Unzip Files - DONE
---------------------

    gzip -d /hi-seq/RI.Brain.totalRNA.09Jun15/rawReads/*.gz
    #qsub -q smp /storage/saba/Rat.RI.Brain.totalRNA.batch4/programs/unzip.yucca.sh

2. Determine number of reads sent for each sample - DONE
--------------------------------------------------------

    /hi-seq/RI.Brain.totalRNA.09Jun15/programs/countRawReads.brain.batch4.sh &

Raw Reads/Read Fragments
------------------------

|  sample | Number of Paired-End Reads | Number of Read Fragments |
|:-------:|:--------------------------:|:------------------------:|
| BNLx\_3 |         111,066,309        |        222,132,618       |
|  SHR\_1 |         85,522,744         |        171,045,488       |
|  SHR\_3 |         99,413,434         |        198,826,868       |

Total Number of Paired End Reads: 296,002,487
Total Number of Read Fragments: 592,004,974
Average Number of Paired End Reads Per Sample: 98,667,496

3. Trim reads for adaptors and for quality - DONE
-------------------------------------------------

    /hi-seq/RI.Brain.totalRNA.09Jun15/programs/trimReads.brain.batch4.sh & 

4. Characterize Trimmed Reads - DONE
------------------------------------

    /hi-seq/RI.Brain.totalRNA.09Jun15/programs/countTrimmedReads.batch4.sh &

Trimmed Reads/Read Fragments
----------------------------

|  sample | lane | Number of Paired-End Reads | Number of Read Fragments | Average Read Fragment Length After Trimming (first read fragment) | Average Read Fragment Length After Trimming (second read fragment) | Number of Read Fragments After Trimming | Percent of Read Fragments That Remained After Trimming |
|:-------:|:----:|:--------------------------:|:------------------------:|:-----------------------------------------------------------------:|:------------------------------------------------------------------:|:---------------------------------------:|:------------------------------------------------------:|
| BNLx\_3 | L005 |         111,066,309        |        222,132,618       |                                96.9                               |                                96.6                                |               221,610,558               |                          99.8%                         |
|  SHR\_1 | L005 |         85,522,744         |        171,045,488       |                                96.4                               |                                95.9                                |               170,481,552               |                          99.7%                         |
|  SHR\_3 | L005 |         99,413,434         |        198,826,868       |                                97.3                               |                                96.4                                |               198,174,360               |                          99.7%                         |

Total Number of Paired End Reads After Trimming: 295,133,235
Total Number of Read Fragments After Trimming: 590,266,470
Average Number of Paired End Reads Per Sample After Trimming: 196,755,490

5. Align to ribosomal RNA - DONE
--------------------------------

    /hi-seq/RI.Brain.totalRNA.09Jun15/programs/alignTo.rRNA.brain.totalRNA.batch4.sh &

**move files**

Proportion of Reads Aligned to rRNA
-----------------------------------

This batch was subjected to 2 washes with riboZero.

|  Sample | Number of Paired-End Reads After Trimming | Number of Paired-End Reads with at Least One Fragment Aligned to rRNA | Percent of Paired-End Reads Aligned to rRNA | Number of Paired-End Reads NOT Aligned to rRNA |
|:-------:|:-----------------------------------------:|:---------------------------------------------------------------------:|:-------------------------------------------:|:----------------------------------------------:|
| BNLx\_3 |                110,805,279                |                               3,377,892                               |                     3.0%                    |                   107,427,387                  |
|  SHR\_1 |                 85,240,776                |                               2,264,214                               |                     2.7%                    |                   82,976,562                   |
|  SHR\_3 |                 99,087,180                |                               3,682,028                               |                     3.7%                    |                   95,405,152                   |

6. Convert to fastq files
-------------------------

    /hi-seq/sharedPrograms/bamToFastQ_py.phenogen.sh /hi-seq/RI.Brain.totalRNA.09Jun15/alignedReads/BNLx_3.rRNA &
    /hi-seq/sharedPrograms/bamToFastQ_py.phenogen.sh /hi-seq/RI.Brain.totalRNA.09Jun15/alignedReads/SHR_1.rRNA &
    /hi-seq/sharedPrograms/bamToFastQ_py.phenogen.sh /hi-seq/RI.Brain.totalRNA.09Jun15/alignedReads/SHR_3.rRNA &

3 out of 3 of the fastq files were created correctly.

7. Quantitate using RSEM and Ensembl Transcripts
------------------------------------------------

    /data2/saba/BxH.HxB.Rats/RNA-Seq/programs/quantRSEM.batch4.phenogen.sh BNLx_3 654129 & 
    /data2/saba/BxH.HxB.Rats/RNA-Seq/programs/quantRSEM.batch4.phenogen.sh SHR_3 65464 & 
    /data2/saba/BxH.HxB.Rats/RNA-Seq/programs/quantRSEM.batch4.phenogen.sh SHR_1 65466 & 

8. Align to strain-specific genomes - BNLx and SHR only
-------------------------------------------------------

    /hi-seq/RI.Brain.totalRNA.09Jun15/programs/tophatAlign.brain.batch4.strainSpecific.sh &
