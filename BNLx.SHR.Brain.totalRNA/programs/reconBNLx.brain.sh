#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 645920 -p 25 --library-type fr-firststrand -b /home/saba/index/BNLx_rn5_wSpikesAndM.fa -g /home/saba/source/ensGene.RGSC5.0.rn5.cleaned.gtf -o /home/saba/reconstructions/BNLx.Brain.ensemblGuided /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/BNLx.brain.bam
