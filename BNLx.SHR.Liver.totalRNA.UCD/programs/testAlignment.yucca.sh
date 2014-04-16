#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 --library-type fr-firststrand -o /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/test -p 2 /home/saba/index/BNLx_rn5_wSpikes /home/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/test_R1_001_val_1.fq /home/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/test_R2_001_val_2.fq
