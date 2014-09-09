#!/bin/bash
module add bio/cufflinks
cufflinks -M /storage/saba/source/chrM.ensGene.rn5.gtf -u --seed 644855 -p 25 --library-type fr-firststrand -b /storage/saba/index/BNLx_rn5_wSpikesAndM.fa -g /storage/saba/source/ensGene.RGSC5.0.rn5.cleaned.gtf -o /storage/saba/BNLx.SHR.Heart.totalRNA/reconstruction/BNLx.Heart.wMask.ensemblGuided /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx.heart.bam
