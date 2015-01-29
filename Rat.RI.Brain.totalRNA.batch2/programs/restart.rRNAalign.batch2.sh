#!/bin/bash
#PBS -l nodes=smp-3-2
module add bio/bowtie2
module add bio/tophat
tophat2 -R /storage/saba/Rat.RI.Brain.totalRNA.batch2/alignedReads/HXB15_1.rRNA
tophat2 -R /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/HXB18_1.rRNA
tophat2 -R /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/HXB20_1.rRNA
