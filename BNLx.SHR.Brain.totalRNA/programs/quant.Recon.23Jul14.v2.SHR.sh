#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 9756 -p 25 --library-type fr-unstranded -b /home/saba/index/SHR_rn5_wSpikesAndM.fa -G /home/data/saba/BNLx.SHR.Brain.totalRNA/reconstruction/reconstruct.total.brain.23Jul14.v2.gtf -o /home/saba/reconstructions/recon.Brain.total.v2.SHR /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR.brain.bam
