#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 122 -p 25 --library-type fr-unstranded -b /home/saba/index/BNLx_rn5_wSpikesAndM.fa -G /home/data/saba/BNLx.SHR.Brain.polyARNA/reconstruction/reconstruct.polyA.brain.22Jul14.v2.gtf -o /home/saba/reconstructions/recon.Brain.PolyA.v2.BNLx /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/BNLx.brain.polyA.bam
