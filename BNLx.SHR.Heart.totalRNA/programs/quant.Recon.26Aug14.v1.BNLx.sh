#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 4356 -p 25 --library-type fr-firststrand -b /storage/saba/index/BNLx_rn5_wSpikesAndM.fa -G /storage/saba/BNLx.SHR.Heart.totalRNA/reconstruction/reconstruct.total.heart.02Aug14.v1.gtf -o /home/saba/reconstructions/recon.Heart.total.v1.BNLx /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx.heart.bam
