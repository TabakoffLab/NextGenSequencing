#!/bin/bash
module add python/3.4.2
module add bio/trim_galore
FILES1=/storage/saba/Rat.RI.Brain.totalRNA.batch3/rawReads/*R1.fastq
for f in $FILES1
do
	f2=${f//R1/R2} 
	trim_galore --paired --stringency 3 -a GATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -q 20 -o /storage/saba/Rat.RI.Brain.totalRNA.batch3/trimmedReads/ $f $f2
done

