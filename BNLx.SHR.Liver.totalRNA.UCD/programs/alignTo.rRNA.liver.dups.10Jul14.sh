#!/bin/bash
module add bio/bowtie2
module add bio/tophat
#tophat2 -g 2 --library-type fr-firststrand -o /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.dup.rRNA -p 25 /home/saba/index/rmsk.rRNA.RGSC5.0.rn5 /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/SHR_L25_ACAGTG_L001_R1_001_val_1.fq /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/SHR_L25_ACAGTG_L001_R2_001_val_2.fq
tophat2 -g 2 --library-type fr-firststrand -o /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.dup.rRNA -p 25 /home/saba/index/rmsk.rRNA.RGSC5.0.rn5 /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/BNLX_3_CTTGTA_L001_R1_001_val_1.fq /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/BNLX_3_CTTGTA_L001_R2_001_val_2.fq
