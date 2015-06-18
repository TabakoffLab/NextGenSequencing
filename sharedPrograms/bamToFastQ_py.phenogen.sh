#!/bin/bash
export LC_ALL='C'
export PATH=/usr/local/samtools:/usr/local/bedtools2/bin:$PATH

SCRIPTS="/hi-seq/sharedPrograms/"

ls -alh $1

echo "run samtools right, left"

#call both samtools and get PID for each process & at end forks a seperate process
samtools view -f 0x40 $1/unmapped.bam > $1/right.test.sam &
SAMR=$!

samtools view -f 0x80 $1/unmapped.bam > $1/left.test.sam &
SAML=$!

#wait for samtools processes to finish
wait $SAMR
wait $SAML

ls -alh $1
echo "run python:"

PYSCRPT=$SCRIPTS"filterUnpaired.py"

python3 $PYSCRPT $1/left.test.sam $1/right.test.sam | samtools view -bu -t /data2/saba/index/SHR_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq $1/unmapped.end1.fq &

AWKE1=$!

python3 $PYSCRPT $1/right.test.sam $1/left.test.sam | samtools view -bu -t /data2/saba/index/SHR_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq $1/unmapped.end2.fq &

AWKE2=$!

wait $AWKE1
wait $AWKE2

ls -alh $1

echo "run wc, rm"

wc -l $1/*.fq > $1/numUnmappedFQ.txt
echo "wc done"
echo "rm"
rm  $1/right.test.sam  $1/left.test.sam
echo "rm done"
echo "done"
