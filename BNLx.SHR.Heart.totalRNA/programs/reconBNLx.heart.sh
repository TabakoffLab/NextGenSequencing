#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 645955 -p 25 --library-type fr-firststrand -b /home/saba/index/BNLx_rn5_wSpikesAndM.fa -g /home/saba/source/ensGene.RGSC5.0.rn5.cleaned.gtf -o /home/saba/reconstructions/BNLx.Heart.ensemblGuided /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx.heart.bam
