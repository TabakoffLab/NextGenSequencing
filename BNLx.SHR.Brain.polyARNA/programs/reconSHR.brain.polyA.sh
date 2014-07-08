#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 645922 -p 25 --library-type fr-unstranded -b /home/saba/index/SHR_rn5_wSpikesAndM.fa -g /home/saba/source/ensGene.RGSC5.0.rn5.cleaned.gtf -o /home/saba/reconstructions/SHR.Brain.PolyA.ensemblGuided /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/SHR.brain.polyA.bam