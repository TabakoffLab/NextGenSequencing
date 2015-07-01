#!/bin/bash
FILES1=/hi-seq/RI.Liver.smallRNA.18Jun15/rawReads/*.fastq
for f in $FILES1
do
	awk '/@HISEQ/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /hi-seq/RI.Liver.smallRNA.18Jun15/data/rawReadCounts.01Jul15.txt
done
