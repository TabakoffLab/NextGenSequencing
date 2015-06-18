#!/bin/bash
export PATH=/usr/local/samtools:/usr/local/bedtools2/bin:$PATH
FILES1=/hi-seq/RI.Brain.totalRNA.09Jun15/trimmedReads/*R1_val_1.fq
for f in $FILES1
do
	f2=${f//R1_val_1.fq/R2_val_2.fq} 
	outf=${f//trimmedReads/alignedReads}
	outf=${outf//brain_*_/}
	outf=${outf//1.fq/.rRNA}
	tophat2 -g 2 --library-type fr-firststrand -o $outf -p 16 /data2/saba/index/rmsk.rRNA.RGSC5.0.rn5 $f $f2
done

