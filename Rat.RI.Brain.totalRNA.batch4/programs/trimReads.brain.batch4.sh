#!/bin/bash
FILES1=/hi-seq/RI.Brain.totalRNA.09Jun15/rawReads/*R1.fastq
for f in $FILES1
do
	f2=${f//R1/R2} 
	trim_galore --paired --stringency 3 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -q 20 -o /hi-seq/RI.Brain.totalRNA.09Jun15/trimmedReads/ $f $f2
done

