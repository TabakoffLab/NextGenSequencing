#!/bin/bash
module add bio/bedtools2
samtools view -b -f 0X40 /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.bam > /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.first.bam
samtools view -b -f 0X80 /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.bam > /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.second.bam
bedtools genomecov -bg -split -strand + -ibam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.first.bam > /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.first.plus.bedgraph
bedtools genomecov -bg -split -strand - -ibam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.first.bam > /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.first.minus.bedgraph
bedtools genomecov -bg -split -strand + -ibam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.second.bam > /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.second.plus.bedgraph
bedtools genomecov -bg -split -strand - -ibam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.second.bam > /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.second.minus.bedgraph
/home/saba/bin/bedGraphToBigWig /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.first.plus.bedgraph /home/saba/index/chromSizes.rn5_wSpikes.txt /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.UCD.first.plus.bw
/home/saba/bin/bedGraphToBigWig /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.first.minus.bedgraph /home/saba/index/chromSizes.rn5_wSpikes.txt /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.UCD.first.minus.bw
/home/saba/bin/bedGraphToBigWig /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.second.plus.bedgraph /home/saba/index/chromSizes.rn5_wSpikes.txt /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.UCD.second.plus.bw
/home/saba/bin/bedGraphToBigWig /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.second.minus.bedgraph /home/saba/index/chromSizes.rn5_wSpikes.txt /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.UCD.second.minus.bw
