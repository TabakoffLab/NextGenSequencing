#!/bin/bash
export LC_ALL='C'
#samtools view -b -q 49 /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.heart.bam -o /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.heart.unique.bam
samtools view -b -q 49 /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx2.heart.bam -o /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx2.heart.unique.bam
samtools view -b -q 49 /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx3.heart.bam -o /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx3.heart.unique.bam
samtools view -b -q 49 /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx4.heart.bam -o /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx4.heart.unique.bam
samtools view -b -q 49 /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR1.heart.bam -o /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR1.heart.unique.bam
samtools view -b -q 49 /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR2.heart.bam -o /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR2.heart.unique.bam
samtools view -b -q 49 /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart.bam -o /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart.unique.bam
samtools view -b -q 49 /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR4.heart.bam -o /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR4.heart.unique.bam
