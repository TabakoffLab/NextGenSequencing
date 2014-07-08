#!/bin/bash
module add bio/bedtools2
bedtools genomecov -bg -split -ibam $1.bam > $1.bedgraph
/home/saba/bin/bedGraphToBigWig $1.bedgraph $2 $1.bw
rm $1.bedgraph


