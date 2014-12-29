#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 9756 --library-type fr-unstranded -b /storage/saba/index/SHR_rn5_wSpikesAndM.fa -G /storage/saba/BNLx.SHR.Brain.totalRNA/reconstruction/reconstruct.total.brain.FINAL.26Aug14.gtf -o /storage/saba/BNLx.SHR.Brain.totalRNA/quantitation/recon.Brain.total.FINAL.SHR /storage/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR.brain.bam
