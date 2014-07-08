#!/bin/bash
rm /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/data/trimmedReadCounts.02Jul14.txt
FILES1=/home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/trimmedReads/*.fq
for f in $FILES1
do
	awk '/@HISEQ/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/data/trimmedReadCounts.02Jul14.txt
done
