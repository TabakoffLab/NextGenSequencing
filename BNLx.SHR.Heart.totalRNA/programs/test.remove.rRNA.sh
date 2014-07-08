#!/bin/bash
module add bio/bedtools2
bedtools intersect -v -abam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart.bam -b /home/saba/source/refGene.rRNAonly.RGSC5.0.rn5.v2.bed > /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart.wo.rRNA.v2.bam
