#!/bin/bash
rm /storage/saba/Rat.RI.Brain.totalRNA.batch1/data/trimmedReadCounts.18Sep14.txt
FILES1=/storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/*.fq
for f in $FILES1
do
	awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /storage/saba/Rat.RI.Brain.totalRNA.batch1/data/trimmedReadCounts.18Sep14.txt
done
