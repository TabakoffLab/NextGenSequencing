#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 4366 -p 25 --library-type fr-firststrand -b /storage/saba/index/SHR_rn5_wSpikesAndM.fa -G /storage/saba/BNLx.SHR.Heart.totalRNA/reconstruction/reconstruct.total.heart.01Oct14.v1.gtf -o /storage/saba/BNLx.SHR.Heart.totalRNA/reconstruction/recon.Heart.total.v1.SHR /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR.heart.bam
