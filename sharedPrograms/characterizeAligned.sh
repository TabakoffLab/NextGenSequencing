#!/bin/bash
samtools index $1/alignedReads/$2.bam
samtools idxstats $1/alignedReads/$2.bam > $1/data/countByChr.$2.txt
