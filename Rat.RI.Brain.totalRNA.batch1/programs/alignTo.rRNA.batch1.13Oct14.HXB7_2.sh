#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 -g 2 --library-type fr-firststrand -o /home/saba/HXB7_2.rRNA -p 16 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_2_brain_total_RNA_cDNA_AGTCAA_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_2_brain_total_RNA_cDNA_AGTCAA_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_2_brain_total_RNA_cDNA_AGTCAA_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_2_brain_total_RNA_cDNA_AGTCAA_L002_R2_val_2.fq
