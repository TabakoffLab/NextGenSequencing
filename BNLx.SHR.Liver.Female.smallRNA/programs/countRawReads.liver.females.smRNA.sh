#!/bin/bash
FILES1=/hi-seq/BNLx.SHR.Liver.Females.smallRNA/rawReads/*.fastq
for f in $FILES1
do
	awk '/@HISEQ/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /hi-seq/BNLx.SHR.Liver.Females.smallRNA/data/rawReadCounts.01Jul15.txt
done
