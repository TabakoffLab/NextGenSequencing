#!/bin/bash
rm /home/data/saba/BNLx.SHR.Heart.totalRNA/data/cntByAnno.heart.25Jul14.txt
for f in BNLx1 BNLx2 BNLx3 BNLx4 SHR1 SHR2 SHR3 SHR4
do
	samtools view -c -L /home/saba/source/ensembl.proteinCodingExons.RGSC5.0.rn5.bed /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/$f.heart.unique.bam | awk -v sample="$f" '{print sample,"proteinCodingExons",$0}' >> /home/data/saba/BNLx.SHR.Heart.totalRNA/data/cntByAnno.heart.25Jul14.txt
	samtools view -c -L /home/saba/source/ensembl.allExons.RGSC5.0.rn5.bed /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/$f.heart.unique.bam | awk -v sample="$f" '{print sample,"allExons",$0}' >> /home/data/saba/BNLx.SHR.Heart.totalRNA/data/cntByAnno.heart.25Jul14.txt
done