#!/bin/bash
samtools sort /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR1/accepted_hits.bam /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR1.heart
#samtools sort /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR2/accepted_hits.bam /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR2.heart
#samtools sort /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3/accepted_hits.bam /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart
#samtools sort /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR4/accepted_hits.bam /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR4.heart
samtools merge - /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR1.heart.bam /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR2.heart.bam /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart.bam /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR4.heart.bam  | samtools sort - /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR.heart 
