#!/bin/bash
module add bio/bedtools2
samtools view -b -f 0x40 $1/unmapped.bam | bedtools bamtofastq -i - -fq $1/unmapped.end1.fq
samtools view -b -f 0x80 $1/unmapped.bam | bedtools bamtofastq -i - -fq $1/unmapped.end1.fq
FILES1=/home/data/saba/BNLx.SHR.Heart.totalRNA/rawReads/*.fastq
for f in $FILES1
do
	awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /home/data/saba/BNLx.SHR.Heart.totalRNA/data/rawReadCounts.02Jul14.txt
done
