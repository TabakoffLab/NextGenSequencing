#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 645 -p 12 --library-type fr-unstranded -b /storage/saba/index/SHR.rn6.spikes.fa -o /storage/saba/BNLx.SHR.Brain.totalRNA/reconstruction/SHR.Brain.total.rn6.naive /storage/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR.rn6.bam
