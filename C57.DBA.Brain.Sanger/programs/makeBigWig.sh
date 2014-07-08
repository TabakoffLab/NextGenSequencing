#!/bin/bash
module load bio/bedtools2
bedtools genomecov -bg -split -ibam /home/saba/C57.DBA.Brain.Sanger/alignedReads/C57.brain.bam > /home/saba/C57.DBA.Brain.Sanger/alignedReads/C57.brain.bedgraph
bedtools genomecov -bg -split -ibam /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA.brain.bam > /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA.brain.bedgraph
awk '{print "chr"$0}' /home/saba/C57.DBA.Brain.Sanger/alignedReads/C57.brain.bedgraph > /home/saba/C57.DBA.Brain.Sanger/alignedReads/C57.brain.v2.bedgraph
awk '{print "chr"$0}' /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA.brain.bedgraph > /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA.brain.v2.bedgraph
/home/saba/bin/bedGraphToBigWig /home/saba/C57.DBA.Brain.Sanger/alignedReads/C57.brain.v2.bedgraph /home/saba/index/chrom.sizes.mm10.cleaned.v2 /home/saba/C57.DBA.Brain.Sanger/alignedReads/C57.brain.bw
/home/saba/bin/bedGraphToBigWig /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA.brain.v2.bedgraph /home/saba/index/chrom.sizes.mm10.cleaned.v2 /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA.brain.bw
