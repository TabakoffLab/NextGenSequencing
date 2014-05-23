#!/bin/bash
module load bio/bedtools2
bedtools genomecov -bg -split -strand + -ibam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.bam > /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.UCD.plus.bedgraph
bedtools genomecov -bg -split -strand - -ibam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.bam > /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.UCD.minus.bedgraph
/home/saba/bin/bedGraphToBigWig /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.UCD.plus.bedgraph /home/saba/index/chromSizes.rn5_wSpikes.txt /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.UCD.plus.bw
/home/saba/bin/bedGraphToBigWig /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.UCD.minus.bedgraph /home/saba/index/chromSizes.rn5_wSpikes.txt /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.UCD.minus.bw
