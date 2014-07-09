#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 --library-type fr-unstranded -o /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR2 -p 25 /home/saba/index/SHR_rn5_wSpikesAndM /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR2.rRNA/unmapped.end1.fq /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR2.rRNA/unmapped.end2.fq
