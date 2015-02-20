#!/bin/bash

#PBS -l nodes=1:ppn=12
#PBS -l walltime=24:00:00

module add bio/bowtie2

st=`date +%s`
/share/apps/bio/trinityrnaseq_r20140717/trinity-plugins/rsem-1.2.15/rsem-calculate-expression -p 8 --time --seed-length 20 --seed $2 --bowtie2 --no-bam-output --forward-prob=0.0 --paired-end /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/$1.no_rRNA.end1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/$1.no_rRNA.end2.fq /storage/saba/index/RSEM/rn5.ensembl.wSpikes /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/rsem.Ensembl/$1.b1
end=`date +%s`
runtime=$((end-st))
echo "rsem runtime: $runtime sec."
