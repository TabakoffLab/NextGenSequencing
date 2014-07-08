#!/bin/bash
module add bio/bowtie2
cat /home/saba/index/BNLx_rn5_wSpikes.fa /home/saba/index/chrM.rn5.fa > /home/saba/index/BNLx_rn5_wSpikesAndM.fa
cat /home/saba/index/SHR_rn5_Genome.wSpikes.fa /home/saba/index/chrM.rn5.fa > /home/saba/index/SHR_rn5_wSpikesAndM.fa
bowtie2-build /home/saba/index/SHR_rn5_wSpikesAndM.fa /home/saba/index/SHR_rn5_wSpikesAndM
bowtie2-build /home/saba/index/BNLx_rn5_wSpikesAndM.fa /home/saba/index/BNLx_rn5_wSpikesAndM

