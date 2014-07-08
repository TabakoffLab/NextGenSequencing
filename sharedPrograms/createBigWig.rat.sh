#!/bin/bash
module add bio/bedtools2

mkdir /home/saba/tmp

# this samtools step separates (using the -f option) the bam file into two bam files, one for the first fragment and one for the second fragment of a paired end read
samtools view -b -f 0X40 $1.bam > /home/saba/tmp/first.bam
samtools view -b -f 0X80 $1.bam > /home/saba/tmp/second.bam

# this bedtools step creates bedgraph files for each bam files separately by strand
bedtools genomecov -bg -split -strand + -ibam /home/saba/tmp/first.bam > /home/saba/tmp/first.plus.bedgraph
bedtools genomecov -bg -split -strand - -ibam /home/saba/tmp/first.bam > /home/saba/tmp/first.minus.bedgraph

bedtools genomecov -bg -split -strand + -ibam /home/saba/tmp/second.bam > /home/saba/tmp/second.plus.bedgraph
bedtools genomecov -bg -split -strand - -ibam /home/saba/tmp/second.bam > /home/saba/tmp/second.minus.bedgraph

bedtools unionbedg -i /home/saba/tmp/first.plus.bedgraph /home/saba/tmp/second.minus.bedgraph /home/saba/tmp/first.minus.bedgraph /home/saba/tmp/second.plus.bedgraph > /home/saba/tmp/total.bedgraph

awk '{if($1!~"ERCC") print $1,$2,$3,$4+$5}' /home/saba/tmp/total.bedgraph > /home/saba/tmp/genome.minus.bedgraph
awk '{if($1!~"ERCC") print $1,$2,$3,$6+$7}' /home/saba/tmp/total.bedgraph > /home/saba/tmp/genome.plus.bedgraph

# convert bedgraph to bigwig
/home/saba/bin/bedGraphToBigWig  /home/saba/tmp/genome.plus.bedgraph $2 $1.genome.plus.bw
/home/saba/bin/bedGraphToBigWig  /home/saba/tmp/genome.minus.bedgraph $2 $1.genome.minus.bw

rm /home/saba/tmp/*
rmdir /home/saba/tmp

