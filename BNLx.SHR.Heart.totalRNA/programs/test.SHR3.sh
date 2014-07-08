#!/bin/bash
samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart
samtools index /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart.bam
samtools idxstats /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart.bam > /home/data/saba/BNLx.SHR.Heart.totalRNA/data/countByChr.SHR3.heart.txt
