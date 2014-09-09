#!/bin/bash
module add bio/bedtools2
for f in test.chrX
do
	samtools view -b -f 0x40 /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/$f.unique.bam | bedtools bamtofastq -i - -fq /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/uniquelyAligned/$f.end1.fq
	samtools view -b -f 0x80 /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/$f.unique.bam | bedtools bamtofastq -i - -fq /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/uniquelyAligned/$f.end2.fq
done

