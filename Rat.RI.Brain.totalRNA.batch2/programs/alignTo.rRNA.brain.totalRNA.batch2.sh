#!/bin/bash
#PBS -l nodes=smp-3-2
module add bio/bowtie2
module add bio/tophat
FILES1=/storage/saba/Rat.RI.Brain.totalRNA.batch2/trimmedReads/*L001_R1_val_1.fq
for f in $FILES1
do
	f2a=${f//R1_val_1.fq/R2_val_2.fq} 
	fb=${f//L001/L002}
	f2b=${f2a//L001/L002}
	outf=${f//trimmedReads/alignedReads}
	outf=${outf//brain_*_/}
	outf=${outf//1.fq/.rRNA}
	tophat2 -g 2 --library-type fr-firststrand -o $outf -p 16 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 $f,$fb $f2a,$f2b
done

