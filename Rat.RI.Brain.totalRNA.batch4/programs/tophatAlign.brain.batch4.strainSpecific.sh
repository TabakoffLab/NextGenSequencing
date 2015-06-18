#!/bin/bash
#module add bio/bowtie2
#module add bio/tophat
export PATH=/usr/local/samtools:/usr/local/bedtools2/bin:$PATH
tophat2 --library-type fr-firststrand -o /hi-seq/RI.Brain.totalRNA.09Jun15/alignedReads/BNLx3.ss -p 16 /data2/saba/index/BNLx_rn5_wSpikesAndM /hi-seq/RI.Brain.totalRNA.09Jun15/cleanedReads/BNLx_3.no_rRNA.end1.fq /hi-seq/RI.Brain.totalRNA.09Jun15/cleanedReads/BNLx_3.no_rRNA.end2.fq
tophat2 --library-type fr-firststrand -o /hi-seq/RI.Brain.totalRNA.09Jun15/alignedReads/SHR3.ss -p 16 /data2/saba/index/SHR_rn5_wSpikesAndM /hi-seq/RI.Brain.totalRNA.09Jun15/cleanedReads/SHR_3.no_rRNA.end1.fq /hi-seq/RI.Brain.totalRNA.09Jun15/cleanedReads/SHR_3.no_rRNA.end2.fq
tophat2 --library-type fr-firststrand -o /hi-seq/RI.Brain.totalRNA.09Jun15/alignedReads/SHR1.ss -p 16 /data2/saba/index/SHR_rn5_wSpikesAndM /hi-seq/RI.Brain.totalRNA.09Jun15/cleanedReads/SHR_1.no_rRNA.end1.fq /hi-seq/RI.Brain.totalRNA.09Jun15/cleanedReads/SHR_1.no_rRNA.end2.fq


