#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 658 -p 12 --library-type fr-firststrand -b /storage/saba/index/SHR.rn6.spikes.fa -g /storage/saba/index/rn6.ENS.spikes.gtf -o /storage/saba/BNLx.SHR.Liver.totalRNA/reconstruction/SHR.Liver.total.rn6.ensemblGuided /storage/saba/BNLx.SHR.Liver.totalRNA/alignedReads/SHR.liver.rn6.bam
