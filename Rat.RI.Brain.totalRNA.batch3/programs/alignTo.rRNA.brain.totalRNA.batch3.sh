#!/bin/bash
#PBS -l nodes=smp-3-2
module add bio/bowtie2
module add bio/tophat
FILES1=/storage/saba/Rat.RI.Brain.totalRNA.batch3/trimmedReads/*R1_val_1.fq
for f in $FILES1
do
	f2=${f//R1_val_1.fq/R2_val_2.fq} 
	outf=${f//trimmedReads/alignedReads}
	outf=${outf//brain_*_/}
	outf=${outf//1.fq/.rRNA}
	tophat2 -g 2 --library-type fr-firststrand -o $outf -p 16 /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5 $f $f2
done

