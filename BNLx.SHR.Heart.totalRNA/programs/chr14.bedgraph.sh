#!/bin/bash
module add bio/bedtools2
samtools view -b /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart.bam chr14 | bedtools genomecov -bg -split -ibam - > /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.chr14.bedgraph


