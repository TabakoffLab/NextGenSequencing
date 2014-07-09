#!/bin/bash
samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR1/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR1.heart
samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR2/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR2.heart
#samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.withMT/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart
samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR4/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR4.heart
samtools merge - /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR1.heart.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR2.heart.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR4.heart.bam  | samtools sort - /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR.heart 
