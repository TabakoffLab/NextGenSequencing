#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 --library-type fr-firststrand -o /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR1 -p 25 /home/saba/index/SHR_rn5_wSpikesAndM /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR1.rRNA/unmapped.end1.fq /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR1.rRNA/unmapped.end2.fq
tophat2 --library-type fr-firststrand -o /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25 -p 25 /home/saba/index/SHR_rn5_wSpikesAndM /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.rRNA/unmapped.end1.fq /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.rRNA/unmapped.end2.fq 
#tophat2 --library-type fr-firststrand -o /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR5 -p 16 /home/saba/index/SHR_rn5_wSpikesAndM /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR5.rRNA/unmapped.end1.fq /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR5.rRNA/unmapped.end2.fq 
