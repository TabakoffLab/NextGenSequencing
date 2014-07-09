#!/bin/bash
#samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.heart
#samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx2/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx2.heart
samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx3/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx3.heart
samtools sort /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx4/accepted_hits.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx4.heart
samtools merge - /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.heart.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx2.heart.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx3.heart.bam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx4.heart.bam  | samtools sort - /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx.heart 
