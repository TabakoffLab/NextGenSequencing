#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 --library-type fr-firststrand -o /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/alignedReads/BNLx3 -p 10 /home/saba/index/BNLx_rn5_wSpikes /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/trimmedReads/BN_LX-3_CTTGTA_R1_val_1.fq /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/trimmedReads/BN_LX-3_CTTGTA_R2_val_2.fq
tophat2 --library-type fr-firststrand -o /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/alignedReads/SHR1 -p 10 /home/saba/index/SHR_rn5_wSpikes /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/trimmedReads/SHR_H-1_CGATGT_R1_val_1.fq /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/trimmedReads/SHR_H-1_CGATGT_R2_val_2.fq
