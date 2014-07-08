#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 645838 -p 25 --library-type fr-firststrand -b /home/saba/index/SHR_rn5_wSpikesAndM.fa -g /home/saba/source/ensGene.RGSC5.0.rn5.cleaned.gtf -o /home/saba/reconstructions/SHR.Liver.UCD.ensemblGuided /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR.liver.bam
