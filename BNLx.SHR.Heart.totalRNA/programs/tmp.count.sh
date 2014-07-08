#!/bin/bash
samtools view /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.rRNA.OLD/unmapped.qsort.bam | wc -l > /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.rRNA.OLD/counts.txt
samtools view /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.rRNA.OLD/unmapped.bam | wc -l >> /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.rRNA.OLD/counts.txt
