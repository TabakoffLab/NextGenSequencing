#!/bin/bash
samtools sort /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1/accepted_hits.bam /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.heart
samtools sort /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx2/accepted_hits.bam /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx2.heart
samtools sort /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx3/accepted_hits.bam /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx3.heart
samtools sort /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx4/accepted_hits.bam /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx4.heart
samtools merge - /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.heart.bam /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx2.heart.bam /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx3.heart.bam /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx4.heart.bam  | samtools sort - /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx.heart 
