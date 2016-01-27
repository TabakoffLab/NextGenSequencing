#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 568 -p 12 --library-type fr-firststrand -b /storage/saba/index/BNLx.rn6.spikes.fa -g /storage/saba/index/rn6.ENS.spikes.gtf -o /storage/saba/BNLx.SHR.Heart.totalRNA/reconstruction/BNLx.Heart.total.rn6.ensemblGuided /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx.heart.rn6.bam
