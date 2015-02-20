#!/bin/bash
module add python/3.4.2
module add bio/trim_galore
FILES1=/storage/saba/Rat.RI.Brain.totalRNA.batch1/rawReads/HXB13_2*R1.fastq
for f in $FILES1
do
	f2=${f//R1/R2} 
	trim_galore --paired --stringency 3 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -q 20 -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/ $f $f2
done

