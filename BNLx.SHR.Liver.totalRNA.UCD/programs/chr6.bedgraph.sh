#!/bin/bash
module add bio/bedtools2
#samtools view -b /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.dup.liver.bam chr6 | bedtools genomecov -bg -split -ibam - > /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.dup.chr6.bedgraph
#samtools view -b /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.dup.liver.bam chr6 | bedtools genomecov -bg -split -ibam - > /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.dup.chr6.bedgraph
samtools view -b /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.dup.liver.bam chr4 | bedtools genomecov -bg -split -ibam - > /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.dup.chr4.bedgraph
samtools view -b /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.dup.liver.bam chr4 | bedtools genomecov -bg -split -ibam - > /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.dup.chr4.bedgraph
samtools view -b /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.dup.liver.bam chr14 | bedtools genomecov -bg -split -ibam - > /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.dup.chr14.bedgraph
samtools view -b /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.dup.liver.bam chr14 | bedtools genomecov -bg -split -ibam - > /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.dup.chr14.bedgraph
samtools view -b /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.dup.liver.bam chr12 | bedtools genomecov -bg -split -ibam - > /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.dup.chr12.bedgraph
samtools view -b /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.dup.liver.bam chr12 | bedtools genomecov -bg -split -ibam - > /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.dup.chr12.bedgraph

