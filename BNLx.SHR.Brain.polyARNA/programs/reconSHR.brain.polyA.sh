#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 645693 -p 25 --library-type fr-unstranded -b /storage/saba/index/SHR.rn6.spikes.fa -g /storage/saba/index/rn6.ENS.spikes.gtf -o /storage/saba/BNLx.SHR.Brain.polyARNA/reconstruction/SHR.Brain.PolyA.ensemblGuided.rn6 /storage/saba/BNLx.SHR.Brain.polyARNA/alignedReads/SHR.Brain.polyA.rn6.sorted.bam
