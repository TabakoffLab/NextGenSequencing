#!/bin/bash
FILES1=/hi-seq/RI.Brain.totalRNA.09Jun15/trimmedReads/*.fq
for f in $FILES1
do
	awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /hi-seq/RI.Brain.totalRNA.09Jun15/data/trimmedReadCounts.10Jun15.txt
done
