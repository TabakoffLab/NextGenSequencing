#!/bin/bash
module add bio/trim_galore
FILES1=/home/data/saba/BNLx.SHR.Brain.totalRNA/rawReads/*R1.fq
for f in $FILES1
do
	f2=${f//.R1/.R2} 
	trim_galore --paired --stringency 3 -a GATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -q 20 -o /home/data/saba/BNLx.SHR.Brain.totalRNA/trimmedReads/ $f $f2
done

