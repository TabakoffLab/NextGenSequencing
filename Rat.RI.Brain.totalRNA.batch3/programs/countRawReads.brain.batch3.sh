#!/bin/bash
#PBS -l nodes=smp-3-2
FILES1=/storage/saba/Rat.RI.Brain.totalRNA.batch3/rawReads/*R1.fastq
for f in $FILES1
do
	awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /storage/saba/Rat.RI.Brain.totalRNA.batch3/data/rawReadCounts.22Dec14.txt
done
