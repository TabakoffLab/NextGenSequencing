#!/bin/bash
module add bio/cufflinks
cufflinks -M /home/saba/source/chrM.ensGene.rn5.gtf -u --seed 64548937 -p 25 --library-type fr-firststrand -b /home/saba/index/SHR_rn5_wSpikesAndM.fa -G /home/saba/source/ensemblAndHeartRecon.allExons.RGSC5.0.rn5.gtf -o /home/saba/quantitation/SHR1.Heart.ensemblWRecon /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR1.heart.unique.bam
cufflinks -M /home/saba/source/chrM.ensGene.rn5.gtf -u --seed 64548937 -p 25 --library-type fr-firststrand -b /home/saba/index/SHR_rn5_wSpikesAndM.fa -G /home/saba/source/ensemblAndHeartRecon.allExons.RGSC5.0.rn5.gtf -o /home/saba/quantitation/SHR2.Heart.ensemblWRecon /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR2.heart.unique.bam
cufflinks -M /home/saba/source/chrM.ensGene.rn5.gtf -u --seed 64548937 -p 25 --library-type fr-firststrand -b /home/saba/index/SHR_rn5_wSpikesAndM.fa -G /home/saba/source/ensemblAndHeartRecon.allExons.RGSC5.0.rn5.gtf -o /home/saba/quantitation/SHR3.Heart.ensemblWRecon /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart.unique.bam
cufflinks -M /home/saba/source/chrM.ensGene.rn5.gtf -u --seed 64548937 -p 25 --library-type fr-firststrand -b /home/saba/index/SHR_rn5_wSpikesAndM.fa -G /home/saba/source/ensemblAndHeartRecon.allExons.RGSC5.0.rn5.gtf -o /home/saba/quantitation/SHR4.Heart.ensemblWRecon /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR4.heart.unique.bam
cufflinks -M /home/saba/source/chrM.ensGene.rn5.gtf -u --seed 64548937 -p 25 --library-type fr-firststrand -b /home/saba/index/BNLx_rn5_wSpikesAndM.fa -G /home/saba/source/ensemblAndHeartRecon.allExons.RGSC5.0.rn5.gtf -o /home/saba/quantitation/BNLx1.Heart.ensemblWRecon /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.heart.unique.bam
cufflinks -M /home/saba/source/chrM.ensGene.rn5.gtf -u --seed 64548937 -p 25 --library-type fr-firststrand -b /home/saba/index/BNLx_rn5_wSpikesAndM.fa -G /home/saba/source/ensemblAndHeartRecon.allExons.RGSC5.0.rn5.gtf -o /home/saba/quantitation/BNLx2.Heart.ensemblWRecon /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx2.heart.unique.bam
cufflinks -M /home/saba/source/chrM.ensGene.rn5.gtf -u --seed 64548937 -p 25 --library-type fr-firststrand -b /home/saba/index/BNLx_rn5_wSpikesAndM.fa -G /home/saba/source/ensemblAndHeartRecon.allExons.RGSC5.0.rn5.gtf -o /home/saba/quantitation/BNLx3.Heart.ensemblWRecon /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx3.heart.unique.bam
cufflinks -M /home/saba/source/chrM.ensGene.rn5.gtf -u --seed 64548937 -p 25 --library-type fr-firststrand -b /home/saba/index/BNLx_rn5_wSpikesAndM.fa -G /home/saba/source/ensemblAndHeartRecon.allExons.RGSC5.0.rn5.gtf -o /home/saba/quantitation/BNLx4.Heart.ensemblWRecon /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx4.heart.unique.bam
