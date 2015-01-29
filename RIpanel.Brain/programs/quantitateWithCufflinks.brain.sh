#!/bin/bash
bowtie2-build /data2/saba/index/SailFish/rn5.ensembl.wSpikes.fa /data2/saba/index/SailFish/rn5.ensembl.wSpikes

export PATH=/usr/local/samtools:$PATH
cleanPATH=/hi-seq/RI.Brain.totalRNA.05Sep14/cleanedReads
alignPATH=/hi-seq/RI.Brain.totalRNA.05Sep14/alignedReads/bowtieEnsembl


bowtie2 -p 4 -x /data2/saba/index/SailFish/rn5.ensembl.wSpikes -1 $cleanPATH/BXH12_1.no_rRNA.end1.fq -2 $cleanPATH/BXH12_1.no_rRNA.end2.fq | samtools view -bS - > $alignPATH/BXH12_1.ensembl.bam &
bowtie2 -p 4 -x /data2/saba/index/SailFish/rn5.ensembl.wSpikes -1 $cleanPATH/BXH12_2.no_rRNA.end1.fq -2 $cleanPATH/BXH12_2.no_rRNA.end2.fq | samtools view -bS - > $alignPATH/BXH12_2.ensembl.bam &


