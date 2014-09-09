#!/bin/bash
mkdir /home/saba/tmp
samtools view -f 0x40 $1/$2.bam | awk '{print $1}' | sort -b | uniq -c | awk '{if ($1 == 1) print $2}'  > /home/saba/tmp/firstSide.unique.txt
samtools view -f 0x40 $1/$2.bam | sort | join  -t $'\t' -1 1 -2 1 /home/saba/tmp/firstSide.unique.txt - > /home/saba/tmp/firstSide.unique.sam
samtools view -f 0x80 $1/$2.bam | awk '{print $1}' | sort -b | uniq -c | awk '{if ($1 == 1) print $2}'  > /home/saba/tmp/lastSide.unique.txt
samtools view -f 0x80 $1/$2.bam | sort | join  -t $'\t' -1 1 -2 1 /home/saba/tmp/lastSide.unique.txt - > /home/saba/tmp/lastSide.unique.sam
samtools view -H $1/$2.bam > /home/saba/tmp/header.txt
cat /home/saba/tmp/header.txt /home/saba/tmp/firstSide.unique.sam /home/saba/tmp/lastSide.unique.sam > /home/saba/tmp/unique.sam
samtools view -bS /home/saba/tmp/unique.sam | samtools sort - $1/$2.unique

samtools view -bS /home/saba/tmp/unique.sam | samtools sort - /home/saba/tmp/unique.sorted


samtools view -H /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/test.chrX.bam > /home/saba/tmp/header.txt
