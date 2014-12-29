#!/bin/bash
module add bio/bowtie2
module add bio/tophat
#tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/alignedReads/BXH12_2.rRNA.v1 -p 16 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/BXH12_2_brain_total_RNA_cDNA_CAGATC_L001_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/BXH12_2_brain_total_RNA_cDNA_CAGATC_L001_R2_val_2.fq
tophat2 -R /storage/saba/Rat.RI.Brain.totalRNA.batch1/alignedReads/BXH12_2.rRNA.v1
tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/alignedReads/BXH12_2.rRNA.v2 -p 16 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/BXH12_2_brain_total_RNA_cDNA_CAGATC_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/BXH12_2_brain_total_RNA_cDNA_CAGATC_L002_R2_val_2.fq
