#!/bin/bash
export PATH=/usr/local/sailfish/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/sailfish/lib:$LD_LIBRARY_PATH
sailfish quant -i /data2/saba/index/SailFish/rn5.Ensembl.wSpikes -l "T=PE:O=><:S=AS" -1 /hi-seq/RI.Brain.totalRNA.05Sep14/cleanedReads/BXH12_1.no_rRNA.end1.fq -2 /hi-seq/RI.Brain.totalRNA.05Sep14/cleanedReads/BXH12_1.no_rRNA.end2.fq -p 10 -o /data2/saba/BxH.HxB.Rats/RNA-Seq/quantitation/sailFish.Ensembl/BXH12_1



sailfish quant -i /storage/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/BXH12_2.no_rRNA.end1.fq -2 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/BXH12_2.no_rRNA.end2.fq -p 10 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/sailFish.Ensembl/BXH12_2
sailfish quant -i /storage/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB13_1.no_rRNA.end1.fq -2 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB13_1.no_rRNA.end2.fq -p 10 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/sailFish.Ensembl/HXB13_1
sailfish quant -i /storage/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB13_2.no_rRNA.end1.fq -2 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB13_2.no_rRNA.end2.fq -p 10 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/sailFish.Ensembl/HXB13_2
sailfish quant -i /storage/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB17_1.no_rRNA.end1.fq -2 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB17_1.no_rRNA.end2.fq -p 10 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/sailFish.Ensembl/HXB17_1
sailfish quant -i /storage/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB17_2.no_rRNA.end1.fq -2 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB17_2.no_rRNA.end2.fq -p 10 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/sailFish.Ensembl/HXB17_2
sailfish quant -i /storage/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB2_1.no_rRNA.end1.fq -2 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB2_1.no_rRNA.end2.fq -p 10 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/sailFish.Ensembl/HXB2_1
sailfish quant -i /storage/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB2_2.no_rRNA.end1.fq -2 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB2_2.no_rRNA.end2.fq -p 10 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/sailFish.Ensembl/HXB2_2
sailfish quant -i /storage/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB25_1.no_rRNA.end1.fq -2 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB25_1.no_rRNA.end2.fq -p 10 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/sailFish.Ensembl/HXB25_1
sailfish quant -i /storage/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB25_2.no_rRNA.end1.fq -2 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB25_2.no_rRNA.end2.fq -p 10 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/sailFish.Ensembl/HXB25_2
sailfish quant -i /storage/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB27_1.no_rRNA.end1.fq -2 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB27_1.no_rRNA.end2.fq -p 10 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/sailFish.Ensembl/HXB27_1
sailfish quant -i /storage/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB27_2.no_rRNA.end1.fq -2 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB27_2.no_rRNA.end2.fq -p 10 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/sailFish.Ensembl/HXB27_2
sailfish quant -i /storage/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_1.no_rRNA.end1.fq -2 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_1.no_rRNA.end2.fq -p 10 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/sailFish.Ensembl/HXB7_1
sailfish quant -i /storage/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_2.no_rRNA.end1.fq -2 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/HXB7_2.no_rRNA.end2.fq -p 10 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/sailFish.Ensembl/HXB7_2
sailfish quant -i /storage/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_1.no_rRNA.end1.fq -2 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_1.no_rRNA.end2.fq -p 10 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/sailFish.Ensembl/SHR_1
sailfish quant -i /storage/saba/index/ensGene.SHR.wSpikes.18Jun14 -l "T=PE:O=><:S=AS" -1 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_2.no_rRNA.end1.fq -2 /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_2.no_rRNA.end2.fq -p 10 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/quantitation/sailFish.Ensembl/SHR_2








