#!/bin/bash
samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.withMT/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.heart
samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx2.withMT/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx2.heart
samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx3.withMT/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx3.heart
samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx4.withMT/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx4.heart
samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR1.withMT/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR1.heart
samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR2.withMT/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR2.heart
samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.withMT/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart
samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR4.withMT/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR4.heart
samtools merge - /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.heart.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx2.heart.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx3.heart.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx4.heart.bam  | samtools sort - /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx.heart 
samtools merge - /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR1.heart.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR2.heart.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR4.heart.bam  | samtools sort - /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR.heart 
