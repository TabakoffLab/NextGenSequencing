#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 564692 --library-type fr-unstranded -b /storage/saba/index/BNLx_rn5_wSpikesAndM.fa -G /storage/saba/BNLx.SHR.Brain.totalRNA/reconstruction/reconstruct.total.brain.FINAL.26Aug14.gtf -o /storage/saba/BNLx.SHR.Brain.totalRNA/quantitation/recon.Brain.total.FINAL.BNLx /storage/saba/BNLx.SHR.Brain.totalRNA/alignedReads/BNLx.brain.bam
