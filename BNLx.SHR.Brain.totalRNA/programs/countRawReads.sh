#!/bin/bash
#cat /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/SHR1/*_R1*.fastq > /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/SHR1.R1.fq
#cat /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/SHR1/*_R2*.fastq > /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/SHR1.R2.fq
#cat /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/SHR2/*_R1*.fastq > /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/SHR2.R1.fq
#cat /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/SHR2/*_R2*.fastq > /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/SHR2.R2.fq
#cat /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/SHR3/*_R1*.fastq > /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/SHR3.R1.fq
#cat /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/SHR3/*_R2*.fastq > /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/SHR3.R2.fq

#cat /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/BNLx1/*_R1*.fastq > /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/BNLx1.R1.fq
#cat /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/BNLx1/*_R2*.fastq > /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/BNLx1.R2.fq
#cat /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/BNLx2/*_R1*.fastq > /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/BNLx2.R1.fq
#cat /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/BNLx2/*_R2*.fastq > /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/BNLx2.R2.fq
#cat /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/BNLx3/*_R1*.fastq > /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/BNLx3.R1.fq
#cat /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/BNLx3/*_R2*.fastq > /home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/BNLx3.R2.fq

rm /home/data/saba/BNLx.SHR.Brain.totalRNA/data/rawReadCounts.26Jun14.txt
FILES1=/home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/*.fq
for f in $FILES1
do
	awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /home/data/saba/BNLx.SHR.Brain.totalRNA/data/rawReadCounts.26Jun14.txt
done
