#!/bin/bash

#PBS -l nodes=1:ppn=12
#PBS -l walltime=24:00:00

module add bio/bowtie2

/share/apps/bio/trinityrnaseq_r20140717/trinity-plugins/rsem-1.2.15/rsem-prepare-reference --bowtie2 --gtf /storage/saba/source/ensemblGenes.RGSC5.0.rn5.CLEANED.gtf /storage/saba/index/rn5_wSpikes.fa /storage/saba/index/RSEM/rn5.ensembl.wSpikes
