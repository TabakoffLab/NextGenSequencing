#!/bin/bash
#module add bio/cufflinks
cufflinks -u --seed 4356 -p 25 --library-type fr-firststrand -b /data2/saba/index/BNLx_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Heart/totalRNA/reconstruction/reconstruct.total.heart.01Oct14.v1.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Heart/totalRNA/quantitation/recon.Heart.total.v1.BNLx /hi-seq/BNLx.SHR.Heart.totalRNA.02Jun14/alignedReads/BNLx.heart.bam
cufflinks -u --seed 4366 -p 25 --library-type fr-firststrand -b /data2/saba/index/SHR_rn5_wSpikesAndM.fa -G /data2/saba/BNLx.SHR/RNA-Seq.Heart/totalRNA/reconstruction/reconstruct.total.heart.01Oct14.v1.gtf -o /data2/saba/BNLx.SHR/RNA-Seq.Heart/totalRNA/quantitation/recon.Heart.total.v1.SHR /hi-seq/BNLx.SHR.Heart.totalRNA.02Jun14/alignedReads/SHR.heart.bam
