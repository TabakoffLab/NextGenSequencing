#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 568 -p 12 --library-type fr-unstranded -b /storage/saba/index/BNLx.rn6.spikes.fa -o /storage/saba/BNLx.SHR.Brain.totalRNA/reconstruction/BNLx.Brain.total.rn6.naive /storage/saba/BNLx.SHR.Brain.totalRNA/alignedReads/BNLx.rn6.bam
