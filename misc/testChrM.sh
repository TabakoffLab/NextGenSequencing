#!/bin/bash
module load bio/sailfish
sailfish index -t /home/saba/index/chrM.rn5.fa -k 20 -p 5 -o /home/data/saba/tissueTest/chrM.rn5
sailfish quant -i /home/data/saba/tissueTest/chrM.rn5 -l "T=PE:O=><:S=AS" -1 /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/BNLX_1_GCCAAT_L005_R1_001_val_1.fq -2 /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/BNLX_1_GCCAAT_L005_R2_001_val_2.fq -p 4 -o /home/data/saba/tissueTest/BNLx1.Liver
sailfish quant -i /home/data/saba/tissueTest/chrM.rn5 -l "T=PE:O=><:S=AS" -1 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/BN_LX_1_LV_total_RNA_cDNA_CTTGTA_L007_R1_val_1.fq -2 /home/data/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/BN_LX_1_LV_total_RNA_cDNA_CTTGTA_L007_R2_val_2.fq -p 4 -o /home/data/saba/tissueTest/BNLx1.Heart
