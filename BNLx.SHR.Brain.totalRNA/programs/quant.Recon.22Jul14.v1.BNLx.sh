#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 4356 -p 25 --library-type fr-firststrand -b /home/saba/index/BNLx_rn5_wSpikesAndM.fa -G /home/data/saba/BNLx.SHR.Brain.totalRNA/reconstruction/reconstruct.total.brain.22Jul14.v1.gtf -o /home/saba/reconstructions/recon.Brain.total.v1.BNLx /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/BNLx.brain.bam
