#!/bin/bash
module load bio/bedtools2
bedtools genomecov -bg -ibam /home/saba/C57.DBA.Brain.Sanger/alignedReads/C57.brain.bam > /home/saba/C57.DBA.Brain.Sanger/alignedReads/C57.brain.bedgraph
bedtools genomecov -bg -ibam /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA.brain.bam > /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA.brain.bedgraph
