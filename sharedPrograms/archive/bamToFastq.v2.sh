#!/bin/bash
export LC_ALL='C'
module add bio/bedtools2
module add bio/samtools

#call both samtools and get PID for each process & at end forks a seperate process
samtools view -f 0x40 $1/unmapped.bam > $1/right.test.sam &
SAMR=$!
samtools view -f 0x80 $1/unmapped.bam > $1/left.test.sam &
SAML=$!

#wait for samtools processes to finish
wait $SAMR
wait $SAML

awk 'FNR==NR{a[$1]=$2; next}{if($1 in a) print $0}' $1/left.test.sam $1/right.test.sam | samtools view -bt /storage/saba/index/SHR_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq $1/unmapped.end1.fq &
AWKE1=$!
awk 'FNR==NR{a[$1]=$2; next}{if($1 in a) print $0}' $1/right.test.sam $1/left.test.sam | samtools view -bt /storage/saba/index/SHR_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq $1/unmapped.end2.fq &
AWKE2=$!

wait $AWKE1
wait $AWKE2

wc -l $1/*.fq > $1/numUnmappedFQ.txt
rm  $1/right.test.sam  $1/left.test.sam
