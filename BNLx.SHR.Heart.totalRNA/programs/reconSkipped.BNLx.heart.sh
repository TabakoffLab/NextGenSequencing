#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 658 -p 12 --max-bundle-frags 350000000 --library-type fr-firststrand -b /storage/saba/index/BNLx.rn6.spikes.fa -g /storage/saba/index/rn6.ENS.spikes.gtf -o /storage/saba/BNLx.SHR.Heart.totalRNA/reconstruction/BNLx.Heart.total.rn6.ensemblGuided.skipped /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/skipped/skipped.BNLx.bam

