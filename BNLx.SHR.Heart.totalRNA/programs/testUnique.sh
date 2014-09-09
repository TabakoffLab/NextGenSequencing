#!/bin/bash
export LC_ALL='C'
samtools view -f 0x40 /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR1.heart.bam | sort | join  -t $'\t' -1 1 -2 1 /home/saba/tmp/firstSide.unique.txt - > /home/saba/tmp/firstSide.unique.sam
