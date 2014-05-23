#!/bin/bash
module load bio/sailfish
sailfish index -t /home/saba/BNLx.SHR.Liver.totalRNA.UCD/reconstruction/BNLx.Liver.05May14.fa -k 20 -p 5 -o /home/saba/BNLx.SHR.Liver.totalRNA.UCD/reconstruction/BNLx.liver.transcriptome.v1
sailfish quant -i /home/saba/BNLx.SHR.Liver.totalRNA.UCD/reconstruction/BNLx.liver.transcriptome.v1 -l "T=PE:O=><:S=AS" -1 /home/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/BNLX_1_GCCAAT_L005_R1_001_val_1.fq -2 /home/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/BNLX_1_GCCAAT_L005_R2_001_val_2.fq -p 4 -o /home/saba/BNLx.SHR.Liver.totalRNA.UCD/quantification/sailFish.v1/BNLx1
sailfish quant -i /home/saba/BNLx.SHR.Liver.totalRNA.UCD/reconstruction/BNLx.liver.transcriptome.v1 -l "T=PE:O=><:S=AS" -1 /home/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/BNLX_2_CAGATC_L006_R1_001_val_1.fq -2 /home/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/BNLX_2_CAGATC_L006_R2_001_val_2.fq -p 4 -o /home/saba/BNLx.SHR.Liver.totalRNA.UCD/quantification/sailFish.v1/BNLx2
sailfish quant -i /home/saba/BNLx.SHR.Liver.totalRNA.UCD/reconstruction/BNLx.liver.transcriptome.v1 -l "T=PE:O=><:S=AS" -1 /home/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/BNLX_3_CTTGTA_L007_R1_001_val_1.fq -2 /home/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/BNLX_3_CTTGTA_L007_R2_001_val_2.fq -p 4 -o /home/saba/BNLx.SHR.Liver.totalRNA.UCD/quantification/sailFish.v1/BNLx3

