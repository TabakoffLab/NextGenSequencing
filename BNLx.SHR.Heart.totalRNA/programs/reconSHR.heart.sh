#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 658 -p 12 --library-type fr-firststrand -b /storage/saba/index/SHR.rn6.spikes.fa -g /storage/saba/index/rn6.ENS.spikes.gtf -o /storage/saba/BNLx.SHR.Heart.totalRNA/reconstruction/SHR.Heart.total.rn6.ensemblGuided /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR.heart.rn6.bam
