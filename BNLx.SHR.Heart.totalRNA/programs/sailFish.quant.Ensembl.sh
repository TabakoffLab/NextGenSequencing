#!/bin/bash
module load bio/sailfish
#sailfish index -t /home/saba/index/ensGene.BNLx.wSpikes.18Jun14.fa -k 20 -p 10 -o /home/saba/index/ensGene.BNLx.wSpikes.18Jun14
#sailfish index -t /home/saba/index/ensGene.SHR.wSpikes.18Jun14.fa -k 20 -p 10 -o /home/saba/index/ensGene.SHR.wSpikes.18Jun14
sailfish quant -i /home/saba/index/ensGene.BNLx.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/BN_LX_1_LV_total_RNA_cDNA_CTTGTA_L007_R1_val_1.fq -2 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/BN_LX_1_LV_total_RNA_cDNA_CTTGTA_L007_R2_val_2.fq -p 10 -o /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/sailfish.Ensembl/BNLx1
sailfish quant -i /home/saba/index/ensGene.BNLx.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/BN_LX_2_LV_total_RNA_cDNA_GTGAAA_L007_R1_val_1.fq -2 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/BN_LX_2_LV_total_RNA_cDNA_GTGAAA_L007_R2_val_2.fq -p 10 -o /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/sailfish.Ensembl/BNLx2
sailfish quant -i /home/saba/index/ensGene.BNLx.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/BN_LX_3_LV_total_RNA_cDNA_CAGATC_L008_R1_val_1.fq -2 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/BN_LX_3_LV_total_RNA_cDNA_CAGATC_L008_R2_val_2.fq -p 10 -o /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/sailfish.Ensembl/BNLx3
sailfish quant -i /home/saba/index/ensGene.BNLx.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/BN_LX_4_LV_total_RNA_cDNA_CCGTCC_L008_R1_val_1.fq -2 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/BN_LX_4_LV_total_RNA_cDNA_CCGTCC_L008_R2_val_2.fq -p 10 -o /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/sailfish.Ensembl/BNLx4
sailfish quant -i /home/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/SHR_H_1_LV_total_RNA_cDNA_GCCAAT_L005_R1_val_1.fq -2 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/SHR_H_1_LV_total_RNA_cDNA_GCCAAT_L005_R2_val_2.fq -p 10 -o /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/sailfish.Ensembl/SHR1
sailfish quant -i /home/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/SHR_H_2_LV_total_RNA_cDNA_ACAGTG_L005_R1_val_1.fq -2 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/SHR_H_2_LV_total_RNA_cDNA_ACAGTG_L005_R2_val_2.fq -p 10 -o /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/sailfish.Ensembl/SHR2
sailfish quant -i /home/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/SHR_H_3_LV_total_RNA_cDNA_CGATGT_L006_R1_val_1.fq -2 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/SHR_H_3_LV_total_RNA_cDNA_CGATGT_L006_R2_val_2.fq -p 10 -o /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/sailfish.Ensembl/SHR3
sailfish quant -i /home/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/SHR_H_4_LV_total_RNA_cDNA_TGACCA_L006_R1_val_1.fq -2 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/SHR_H_4_LV_total_RNA_cDNA_TGACCA_L006_R2_val_2.fq -p 10 -o /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/sailfish.Ensembl/SHR4
