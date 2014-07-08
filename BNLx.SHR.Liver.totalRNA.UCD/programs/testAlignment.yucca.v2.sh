#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 --library-type fr-firststrand -o /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx2 -p 16 /home/saba/index/BNLx_rn5_wSpikes /home/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/BNLX_2_CAGATC_L006_R1_001_val_1.fq /home/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/BNLX_2_CAGATC_L006_R2_001_val_2.fq
