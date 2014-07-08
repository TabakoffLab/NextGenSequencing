#!/bin/bash
module add bio/trim_galore
FILES1=/home/saba/BNLx.SHR.Heart.totalRNA/rawReads/*R1.fastq
for f in $FILES1
do
	f2=${f//R1/R2} 
	trim_galore --paired --stringency 3 -a GATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -q 20 -o /home/saba/BNLx.SHR.Heart.totalRNA/trimmedReads/ $f $f2
done

