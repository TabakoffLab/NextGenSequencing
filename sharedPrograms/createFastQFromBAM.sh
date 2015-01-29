#!/bin/bash
#PBS -l nodes=1:ppn=12
export LC_ALL='C'
module add bio/bedtools2
module add bio/samtools
samtools view -f 0x40 $1/unmapped.bam > $1/right.test.sam &
SAMR=$!
samtools view -f 0x80 $1/unmapped.bam > $1/left.test.sam &
SAML=$!

wait $SAMR
wait $SAML

awk 'FNR==NR{a[$1]=$2; next}{if($1 in a) print $0}' $1/left.test.sam $1/right.test.sam | samtools view -bt /storage/saba/index/BNLx_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq $1/unmapped.end1.fq
awk 'FNR==NR{a[$1]=$2; next}{if($1 in a) print $0}' $1/right.test.sam $1/left.test.sam | samtools view -bt /storage/saba/index/SHR_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq $1/unmapped.end2.fq

echo $1" is DONE"
wc -l $1/*.fq > $1/numUnmappedFQ.txt
#rm  $1/right.test.sam  $1/left.test.sam
