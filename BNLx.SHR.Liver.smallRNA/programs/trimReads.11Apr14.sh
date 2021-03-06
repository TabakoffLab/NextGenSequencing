#!/bin/bash
module add bio/trim_galore
FILES1=/home/saba/BNLx.SHR.Liver.smallRNA.UCD/rawReads/*R1*.fastq
for f in $FILES1
do
	f2=${f//R1/R2} 
	trim_galore --paired --stringency 3 -a TGGAATTCTCGGGTGCCAAGG -a2 GATCGTCGGACTGTAGAACTCTGAAC -q 20 -o /home/saba/BNLx.SHR.Liver.smallRNA.UCD/trimmedReads/ $f $f2
done

