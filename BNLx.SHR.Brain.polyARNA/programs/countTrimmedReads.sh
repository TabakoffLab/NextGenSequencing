#!/bin/bash
rm /home/data/saba/BNLx.SHR.Brain.polyARNA/data/trimmedReadCounts.27Jun14.txt
FILES1=/home/data/saba/BNLx.SHR.Brain.polyARNA/trimmedReads/*.fq
for f in $FILES1
do
	awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /home/data/saba/BNLx.SHR.Brain.polyARNA/data/trimmedReadCounts.27Jun14.txt
done
