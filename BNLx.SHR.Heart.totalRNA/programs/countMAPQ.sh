#!/bin/bash
samtools view /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.heart.bam | awk '{print $5}' | sort | uniq -c > /home/data/saba/BNLx.SHR.Heart.totalRNA/data/countMAPQ.BNLx1.txt
