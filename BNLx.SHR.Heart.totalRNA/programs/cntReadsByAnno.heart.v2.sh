#!/bin/bash
#rm /home/data/saba/BNLx.SHR.Heart.totalRNA/data/cntByAnno.heart.02Aug14.txt
for f in BNLx1 BNLx2 BNLx3 BNLx4 SHR1 SHR2 SHR3 SHR4
do
	samtools view -c -L /home/saba/source/ensemblAndHeartRecon.allExons.RGSC5.0.rn5.bed /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/$f.heart.unique.bam | awk -v sample="$f" '{print sample,"reconAndEnsembl",$0}' >> /home/data/saba/BNLx.SHR.Heart.totalRNA/data/cntByAnno.heart.02Aug14.txt
done