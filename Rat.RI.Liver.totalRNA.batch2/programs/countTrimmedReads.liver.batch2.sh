#!/bin/bash
FILES1=/storage/saba/Rat.RI.Liver.totalRNA.batch2/trimmedReads/*.fq
for f in $FILES1
do
	awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /storage/saba/Rat.RI.Liver.totalRNA.batch2/data/trimmedReadCounts.22Jul15.txt
done
