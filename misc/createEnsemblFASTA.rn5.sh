#!/bin/bash
module add bio/cufflinks
samtools faidx /home/saba/index/BNLx_rn5_wSpikesAndM.fa
samtools faidx /home/saba/index/SHR_rn5_wSpikesAndM.fa
gffread -w /home/saba/index/ensGene.BNLx.18Jun14.fa -g /home/saba/index/BNLx_rn5_wSpikesAndM.fa /home/saba/source/ensGene.RGSC5.0.rn5.cleaned.gtf
gffread -w /home/saba/index/ensGene.SHR.18Jun14.fa -g /home/saba/index/SHR_rn5_wSpikesAndM.fa /home/saba/source/ensGene.RGSC5.0.rn5.cleaned.gtf
