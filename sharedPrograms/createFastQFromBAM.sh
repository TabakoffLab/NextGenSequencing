#!/bin/bash
export LC_ALL='C'
module add bio/bedtools2
samtools view -f 0x40 $1/unmapped.bam > $1/right.test.sam
samtools view -f 0x80 $1/unmapped.bam > $1/left.test.sam
#wc -l $1/*.sam > $1/numUnmappedSAM.txt
awk 'FNR==NR{a[$1]=$2; next}{if($1 in a) print $0}' $1/left.test.sam $1/right.test.sam | samtools view -bt /storage/saba/index/SHR_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq $1/unmapped.end1.fq
awk 'FNR==NR{a[$1]=$2; next}{if($1 in a) print $0}' $1/right.test.sam $1/left.test.sam | samtools view -bt /storage/saba/index/SHR_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq $1/unmapped.end2.fq
wc -l $1/*.fq > $1/numUnmappedFQ.txt
rm  $1/right.test.sam  $1/left.test.sam
