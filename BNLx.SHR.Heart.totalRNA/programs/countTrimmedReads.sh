#!/bin/bash
rm /home/saba/BNLx.SHR.Heart.totalRNA/data/trimmedReadCounts.01Jun14.txt
FILES1=/home/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/*.fq
for f in $FILES1
do
	awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /home/saba/BNLx.SHR.Heart.totalRNA/data/trimmedReadCounts.01Jun14.txt
done
