#!/bin/bash
FILES1=/storage/saba/Rat.RI.Brain.totalRNA.batch3/trimmedReads/*.fq
for f in $FILES1
do
	awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /storage/saba/Rat.RI.Brain.totalRNA.batch3/data/trimmedReadCounts.10Feb15.txt
done
