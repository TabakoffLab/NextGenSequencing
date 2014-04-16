#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 --library-type fr-firststrand -o /home/saba/BNLx.SHR.Liver.smallRNA.UCD/alignedReads/test.BNLx1 -p 4 /home/saba/index/BNLx_rn5_wSpikes /home/saba/BNLx.SHR.Liver.smallRNA.UCD/trimmedReads/BN_LX1_TAGCTT_L002_R1_001_val_1.fq /home/saba/BNLx.SHR.Liver.smallRNA.UCD/trimmedReads/BN_LX1_TAGCTT_L002_R2_001_val_2.fq
