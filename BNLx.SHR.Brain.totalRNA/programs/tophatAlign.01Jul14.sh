#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 --library-type fr-unstranded -o /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/BNLx1 -p 16 /home/saba/index/BNLx_rn5_wSpikesAndM /home/data/saba/BNLx.SHR.Brain.totalRNA/trimmedReads/BNLx1.R1_val_1.fq /home/data/saba/BNLx.SHR.Brain.totalRNA/trimmedReads/BNLx1.R2_val_2.fq
tophat2 --library-type fr-unstranded -o /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/BNLx2 -p 16 /home/saba/index/BNLx_rn5_wSpikesAndM /home/data/saba/BNLx.SHR.Brain.totalRNA/trimmedReads/BNLx2.R1_val_1.fq /home/data/saba/BNLx.SHR.Brain.totalRNA/trimmedReads/BNLx2.R2_val_2.fq
tophat2 --library-type fr-unstranded -o /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/BNLx3 -p 16 /home/saba/index/BNLx_rn5_wSpikesAndM /home/data/saba/BNLx.SHR.Brain.totalRNA/trimmedReads/BNLx3.R1_val_1.fq /home/data/saba/BNLx.SHR.Brain.totalRNA/trimmedReads/BNLx3.R2_val_2.fq
tophat2 --library-type fr-unstranded -o /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR1 -p 16 /home/saba/index/SHR_rn5_wSpikesAndM /home/data/saba/BNLx.SHR.Brain.totalRNA/trimmedReads/SHR1.R1_val_1.fq /home/data/saba/BNLx.SHR.Brain.totalRNA/trimmedReads/SHR1.R2_val_2.fq
tophat2 --library-type fr-unstranded -o /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR2 -p 16 /home/saba/index/SHR_rn5_wSpikesAndM /home/data/saba/BNLx.SHR.Brain.totalRNA/trimmedReads/SHR2.R1_val_1.fq /home/data/saba/BNLx.SHR.Brain.totalRNA/trimmedReads/SHR2.R2_val_2.fq
tophat2 --library-type fr-unstranded -o /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR3 -p 16 /home/saba/index/SHR_rn5_wSpikesAndM /home/data/saba/BNLx.SHR.Brain.totalRNA/trimmedReads/SHR3.R1_val_1.fq /home/data/saba/BNLx.SHR.Brain.totalRNA/trimmedReads/SHR3.R2_val_2.fq
