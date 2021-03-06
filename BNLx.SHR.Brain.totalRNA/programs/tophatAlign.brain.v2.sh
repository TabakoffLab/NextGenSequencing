#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 --library-type fr-unstranded -o /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR3.v2 -p 16 /home/saba/index/SHR_rn5_wSpikesAndM /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR3.rRNA/unmapped.end1.fq /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR3.rRNA/unmapped.end2.fq
tophat2 --library-type fr-unstranded -o /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR2.v2 -p 16 /home/saba/index/SHR_rn5_wSpikesAndM /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR2.rRNA/unmapped.end1.fq /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR2.rRNA/unmapped.end2.fq
tophat2 --library-type fr-unstranded -o /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR1.v2 -p 16 /home/saba/index/SHR_rn5_wSpikesAndM /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR1.rRNA/unmapped.end1.fq /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR1.rRNA/unmapped.end2.fq
