#!/bin/bash
module add bio/bowtie2
module add bio/tophat
#bowtie2-build /home/saba/index/rmsk.rRNA.RGSC5.0.rn5.fa /home/saba/index/rmsk.rRNA.RGSC5.0.rn5
#tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/BXH12_1.rRNA -p 20 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/BXH12_1_brain_total_RNA_cDNA_GTCCGC_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/BXH12_1_brain_total_RNA_cDNA_GTCCGC_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/BXH12_1_brain_total_RNA_cDNA_GTCCGC_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/BXH12_1_brain_total_RNA_cDNA_GTCCGC_L002_R2_val_2.fq
tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/alignedReads/BXH12_2.rRNA -p 16 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/BXH12_2_brain_total_RNA_cDNA_CAGATC_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/BXH12_2_brain_total_RNA_cDNA_CAGATC_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/BXH12_2_brain_total_RNA_cDNA_CAGATC_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/BXH12_2_brain_total_RNA_cDNA_CAGATC_L002_R2_val_2.fq
#tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/HXB13_1.rRNA -p 20 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB13_1_brain_total_RNA_cDNA_ATGTCA_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB13_1_brain_total_RNA_cDNA_ATGTCA_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB13_1_brain_total_RNA_cDNA_ATGTCA_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB13_1_brain_total_RNA_cDNA_ATGTCA_L002_R2_val_2.fq
#tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/HXB13_2.rRNA -p 20 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB13_2_brain_total_RNA_cDNA_GTGAAA_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB13_2_brain_total_RNA_cDNA_GTGAAA_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB13_2_brain_total_RNA_cDNA_GTGAAA_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB13_2_brain_total_RNA_cDNA_GTGAAA_L002_R2_val_2.fq
#tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/HXB17_1.rRNA -p 20 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB17_1_brain_total_RNA_cDNA_CCGTCC_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB17_1_brain_total_RNA_cDNA_CCGTCC_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB17_1_brain_total_RNA_cDNA_CCGTCC_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB17_1_brain_total_RNA_cDNA_CCGTCC_L002_R2_val_2.fq
#tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/HXB17_2.rRNA -p 20 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB17_2_brain_total_RNA_cDNA_ATGTCA_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB17_2_brain_total_RNA_cDNA_ATGTCA_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB17_2_brain_total_RNA_cDNA_ATGTCA_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB17_2_brain_total_RNA_cDNA_ATGTCA_L002_R2_val_2.fq
#tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/HXB2_1.rRNA -p 20 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB2_1_brain_total_RNA_cDNA_GTCCGC_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB2_1_brain_total_RNA_cDNA_GTCCGC_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB2_1_brain_total_RNA_cDNA_GTCCGC_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB2_1_brain_total_RNA_cDNA_GTCCGC_L002_R2_val_2.fq
#tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/HXB2_2.rRNA -p 20 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB2_2_brain_total_RNA_cDNA_CTTGTA_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB2_2_brain_total_RNA_cDNA_CTTGTA_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB2_2_brain_total_RNA_cDNA_CTTGTA_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB2_2_brain_total_RNA_cDNA_CTTGTA_L002_R2_val_2.fq
#tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/HXB25_1.rRNA -p 20 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB25_1_brain_total_RNA_cDNA_AGTTCC_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB25_1_brain_total_RNA_cDNA_AGTTCC_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB25_1_brain_total_RNA_cDNA_AGTTCC_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB25_1_brain_total_RNA_cDNA_AGTTCC_L002_R2_val_2.fq
#tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/HXB25_2.rRNA -p 20 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB25_2_brain_total_RNA_cDNA_AGTCAA_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB25_2_brain_total_RNA_cDNA_AGTCAA_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB25_2_brain_total_RNA_cDNA_AGTCAA_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB25_2_brain_total_RNA_cDNA_AGTCAA_L002_R2_val_2.fq
tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/alignedReads/HXB27_1.rRNA -p 16 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB27_1_brain_total_RNA_cDNA_CGATGT_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB27_1_brain_total_RNA_cDNA_CGATGT_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB27_1_brain_total_RNA_cDNA_CGATGT_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB27_1_brain_total_RNA_cDNA_CGATGT_L002_R2_val_2.fq
tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/alignedReads/HXB27_2.rRNA -p 16 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB27_2_brain_total_RNA_cDNA_AGTTCC_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB27_2_brain_total_RNA_cDNA_AGTTCC_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB27_2_brain_total_RNA_cDNA_AGTTCC_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB27_2_brain_total_RNA_cDNA_AGTTCC_L002_R2_val_2.fq
#tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/HXB7_1.rRNA -p 20 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_1_brain_total_RNA_cDNA_ACAGTG_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_1_brain_total_RNA_cDNA_ACAGTG_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_1_brain_total_RNA_cDNA_ACAGTG_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_1_brain_total_RNA_cDNA_ACAGTG_L002_R2_val_2.fq
#tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/HXB7_2.rRNA -p 20 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_2_brain_total_RNA_cDNA_AGTCAA_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_2_brain_total_RNA_cDNA_AGTCAA_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_2_brain_total_RNA_cDNA_AGTCAA_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_2_brain_total_RNA_cDNA_AGTCAA_L002_R2_val_2.fq
#tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/SHR_1.rRNA -p 20 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_1_brain_total_RNA_cDNA_GCCAAT_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_1_brain_total_RNA_cDNA_GCCAAT_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_1_brain_total_RNA_cDNA_GCCAAT_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_1_brain_total_RNA_cDNA_GCCAAT_L002_R2_val_2.fq
#tophat2 -g 2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/SHR_2.rRNA -p 20 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_2_brain_total_RNA_cDNA_TGACCA_L001_R1_val_1.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_2_brain_total_RNA_cDNA_TGACCA_L002_R1_val_1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_2_brain_total_RNA_cDNA_TGACCA_L001_R2_val_2.fq,/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_2_brain_total_RNA_cDNA_TGACCA_L002_R2_val_2.fq

