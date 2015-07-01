#!/bin/bash
#rm /hi-seq/RI.Brain.smallRNA.14May15/data/rawReadCounts.30Jun15.txt
FILES1=/hi-seq/RI.Brain.smallRNA.14May15/rawReads/*.fastq
for f in $FILES1
do
	awk '/@HISEQ/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /hi-seq/RI.Brain.smallRNA.14May15/data/rawReadCounts.30Jun15.txt
done
