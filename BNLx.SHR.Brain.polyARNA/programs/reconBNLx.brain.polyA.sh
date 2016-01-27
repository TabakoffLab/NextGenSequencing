#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 645988 -p 25 --library-type fr-unstranded -b /storage/saba/index/BNLx.rn6.spikes.fa -g /storage/saba/index/rn6.ENS.spikes.gtf -o /storage/saba/BNLx.SHR.Brain.polyARNA/reconstruction/BNLx.Brain.PolyA.ensemblGuided.rn6 /storage/saba/BNLx.SHR.Brain.polyARNA/alignedReads/BNLx.Brain.polyA.rn6.sorted.bam
