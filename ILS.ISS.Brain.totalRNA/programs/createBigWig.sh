#!/bin/bash
module add bio/bedtool2

# this samtools step separates (using the -f option) the bam file into two bam files, one for the first fragment and one for the second fragment of a paired end read
samtools view -b -f 0X40 /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.first.bam
samtools view -b -f 0X80 /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.second.bam
samtools view -b -f 0X40 /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.first.bam
samtools view -b -f 0X80 /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.second.bam

# this bedtools step creates bedgraph files for each bam files separately by strand
bedtools genomecov -bg -split -strand + -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.first.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.first.plus.bedgraph
bedtools genomecov -bg -split -strand - -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.first.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.first.minus.bedgraph
bedtools genomecov -bg -split -strand + -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.second.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.second.plus.bedgraph
bedtools genomecov -bg -split -strand - -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.second.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.second.minus.bedgraph

bedtools genomecov -bg -split -strand + -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.first.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.first.plus.bedgraph
bedtools genomecov -bg -split -strand - -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.first.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.first.minus.bedgraph
bedtools genomecov -bg -split -strand + -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.second.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.second.plus.bedgraph
bedtools genomecov -bg -split -strand - -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.second.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.second.minus.bedgraph

