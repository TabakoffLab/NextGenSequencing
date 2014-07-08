#!/bin/bash
#samtools view /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.rRNA/unmapped.bam | wc -l > /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.rRNA/numUnmappedBAM.txt
#samtools view /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.rRNA/unmapped.sort.bam | wc -l >> /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.rRNA/numUnmappedBAM.txt
#wc -l /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.rRNA/*.fq > /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.rRNA/numUnmappedFQ.txt
wc -l /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.rRNA/*.sam > /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.rRNA/numUnmappedSAM.txt
