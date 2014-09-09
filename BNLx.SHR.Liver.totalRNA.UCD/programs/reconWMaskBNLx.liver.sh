#!/bin/bash
module add bio/cufflinks
cufflinks -M /storage/saba/source/chrM.ensGene.rn5.gtf -u --seed 645835 -p 25 --library-type fr-firststrand -b /storage/saba/index/BNLx_rn5_wSpikesAndM.fa -g /storage/saba/source/ensGene.RGSC5.0.rn5.cleaned.gtf -o /home/saba/reconstructions/BNLx.Liver.UCD.ensemblGuided.wMask /storage/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx.liver.bam
