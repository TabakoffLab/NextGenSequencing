#!/bin/bash
module load bio/bedtools2
bedtools genomecov -bg -split -strand + -ibam /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/alignedReads/BNLx3/accepted_hits.bam > /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/alignedReads/BNLx3.plus.bedgraph
bedtools genomecov -bg -split -strand - -ibam /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/alignedReads/BNLx3/accepted_hits.bam > /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/alignedReads/BNLx3.minus.bedgraph
/home/saba/bin/bedGraphToBigWig /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/alignedReads/BNLx3.plus.bedgraph /home/saba/index/chromSizes.rn5_wSpikes.txt /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/alignedReads/BNLx3.plus.bw
/home/saba/bin/bedGraphToBigWig /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/alignedReads/BNLx3.minus.bedgraph /home/saba/index/chromSizes.rn5_wSpikes.txt /home/saba/BNLx.SHR.Liver.totalRNA.Beckman/alignedReads/BNLx3.minus.bw
