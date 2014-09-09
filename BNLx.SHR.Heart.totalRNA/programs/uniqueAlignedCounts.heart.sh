#!/bin/bash
rm /home/data/saba/BNLx.SHR.Heart.totalRNA/data/uniquelyAlignedCounts.25Jul14.txt
FILES1=/home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/*unique.bam
for f in $FILES1
do
	samtools view $f | awk -v sample="$f" 'END {print sample,NR}' >> /home/data/saba/BNLx.SHR.Heart.totalRNA/data/uniquelyAlignedCounts.25Jul14.txt
done
