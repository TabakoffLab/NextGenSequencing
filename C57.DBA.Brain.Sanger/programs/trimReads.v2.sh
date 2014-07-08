#!/bin/bash
module add bio/trim_galore
FILES1=/home/saba/C57.DBA.Brain.Sanger/rawReads/*_1*.fastq
for f in $FILES1
do
	f2=${f//_1/_2} 
	trim_galore --paired --stringency 3 -a AGATCGGAAGAGC -a2 AGATCGGAAGAGC -q 20 -o /home/saba/C57.DBA.Brain.Sanger/trimmedReads.v2/ $f $f2
done
