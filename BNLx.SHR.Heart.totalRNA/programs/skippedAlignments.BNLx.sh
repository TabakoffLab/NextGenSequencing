#!/bin/bash
module add bio/samtools
samtools view -bh -L /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/skipped/skipped.bed  /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx.heart.rn6.bam > /storage/saba/BNLx.SHR.Heart.totalRNA/alignedReads/skipped/skipped.BNLx.bam
