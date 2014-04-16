#!/bin/bash
samtools view ./alignedReads/$1/accepted_hits.bam | awk '{print $1}' | sort -b | uniq -c | awk '{if ($1 == 1) print $2}'  > ./alignedReads/$1/unique.hits.txt
samtools view ./alignedReads/$1/accepted_hits.bam | sort | join  -t $'\t' -1 1 -2 1 ./alignedReads/$1/unique.hits.txt - | samtools view -b -S -t /data/Tabastore3/LauraS/LXS/RNA-Seq/index/mm10.wSpikes.fa.fai - -o ./alignedReads/$1.unique.bam
samtools sort ./alignedReads/$1.unique.bam ./alignedReads/$1.unique.sorted
rm ./alignedReads/$1/unique.hits.txt
rm ./alignedReads/$1.unique.bam