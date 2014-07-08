#!/bin/bash
cat /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/SHRH1/fastq/*_R1*.fastq > /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/SHR1.R1.fq
cat /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/SHRH1/fastq/*_R2*.fastq > /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/SHR1.R2.fq
cat /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/SHRH2/fastq/*_R1*.fastq > /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/SHR2.R1.fq
cat /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/SHRH2/fastq/*_R2*.fastq > /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/SHR2.R2.fq
cat /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/SHRH3/fastq/*_R1*.fastq > /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/SHR3.R1.fq
cat /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/SHRH3/fastq/*_R2*.fastq > /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/SHR3.R2.fq

cat /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/BNLX1/fastq/*_R1*.fastq > /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/BNLx1.R1.fq
cat /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/BNLX1/fastq/*_R2*.fastq > /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/BNLx1.R2.fq
cat /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/BNLX2/fastq/*_R1*.fastq > /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/BNLx2.R1.fq
cat /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/BNLX2/fastq/*_R2*.fastq > /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/BNLx2.R2.fq
cat /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/BNLX3/fastq/*_R1*.fastq > /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/BNLx3.R1.fq
cat /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/BNLX3/fastq/*_R2*.fastq > /home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/BNLx3.R2.fq

rm /home/data/saba/BNLx.SHR.Brain.polyARNA/data/rawReadCounts.27Jun14.txt
FILES1=/home/data/saba/BNLx.SHR.Brain.polyARNA/rawReads/*.fq
for f in $FILES1
do
	awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /home/data/saba/BNLx.SHR.Brain.polyARNA/data/rawReadCounts.27Jun14.txt
done
