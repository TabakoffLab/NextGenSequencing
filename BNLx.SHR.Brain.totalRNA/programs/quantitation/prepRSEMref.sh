#!/bin/bash

module add bio/bowtie2
module add bio/rsem-1.2.21

rsem-prepare-reference --gtf /storage/saba/index/rsemBrainRecon26Feb15/reconstruct.brain.COMBINED.26Feb15.allStranded.gtf /storage/saba/index/BNLx_rn5_wSpikesAndM.fa /storage/saba/index/rsemBrainRecon26Feb15/rsem.brainRecon.BNLx & 
rsem-prepare-reference --gtf /storage/saba/index/rsemBrainRecon26Feb15/reconstruct.brain.COMBINED.26Feb15.allStranded.gtf /storage/saba/index/SHR_rn5_wSpikesAndM.fa /data2/saba/index/rsemBrainRecon26Feb15/rsem.brainRecon.SHR & 
