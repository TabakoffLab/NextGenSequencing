#!/bin/bash
module add bio/bedtools2

# this samtools step separates (using the -f option) the bam file into two bam files, one for the first fragment and one for the second fragment of a paired end read
#samtools view -b -f 0X40 /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.first.bam
#samtools view -b -f 0X80 /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.second.bam
#samtools view -b -f 0X40 /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.first.bam
#samtools view -b -f 0X80 /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.second.bam

# this bedtools step creates bedgraph files for each bam files separately by strand
#bedtools genomecov -bg -split -strand + -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.first.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.first.plus.bedgraph
#bedtools genomecov -bg -split -strand - -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.first.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.first.minus.bedgraph
#bedtools genomecov -bg -split -strand + -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.second.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.second.plus.bedgraph
#bedtools genomecov -bg -split -strand - -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.second.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.second.minus.bedgraph

#bedtools genomecov -bg -split -strand + -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.first.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.first.plus.bedgraph
#bedtools genomecov -bg -split -strand - -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.first.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.first.minus.bedgraph
#bedtools genomecov -bg -split -strand + -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.second.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.second.plus.bedgraph
#bedtools genomecov -bg -split -strand - -ibam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.second.bam > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.second.minus.bedgraph

bedtools unionbedg -i /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.first.plus.bedgraph  /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.second.minus.bedgraph /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.first.minus.bedgraph  /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.second.plus.bedgraph > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.bedgraph
bedtools unionbedg -i /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.first.plus.bedgraph  /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.second.minus.bedgraph /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.first.minus.bedgraph  /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.second.plus.bedgraph > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.bedgraph

awk '{if($1~"ERCC") print $1,$2,$3,$4+$5}' /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.bedgraph > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.controls.plus.bedgraph
awk '{if($1~"ERCC") print $1,$2,$3,$6+$7}' /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.bedgraph > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.controls.minus.bedgraph
awk '{if($1!~"ERCC") print "chr"$1,$2,$3,$4+$5}' /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.bedgraph > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.genome.plus.bedgraph
awk '{if($1!~"ERCC") print "chr"$1,$2,$3,$6+$7}' /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.bedgraph > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.genome.minus.bedgraph

awk '{if($1~"ERCC") print $1,$2,$3,$4+$5}' /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.bedgraph > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.controls.plus.bedgraph
awk '{if($1~"ERCC") print $1,$2,$3,$6+$7}' /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.bedgraph > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.controls.minus.bedgraph
awk '{if($1!~"ERCC") print "chr"$1,$2,$3,$4+$5}' /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.bedgraph > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.genome.plus.bedgraph
awk '{if($1!~"ERCC") print "chr"$1,$2,$3,$6+$7}' /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.bedgraph > /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.genome.minus.bedgraph

# convert bedgraph to bigwig
/home/saba/bin/bedGraphToBigWig  /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.genome.plus.bedgraph /home/saba/index/chrom.sizes.mm10.cleaned.v2 /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.genome.plus.bw
/home/saba/bin/bedGraphToBigWig  /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.genome.minus.bedgraph /home/saba/index/chrom.sizes.mm10.cleaned.v2 /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.genome.minus.bw
/home/saba/bin/bedGraphToBigWig  /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.genome.plus.bedgraph /home/saba/index/chrom.sizes.mm10.cleaned.v2 /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.genome.plus.bw
/home/saba/bin/bedGraphToBigWig  /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.genome.minus.bedgraph /home/saba/index/chrom.sizes.mm10.cleaned.v2 /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.genome.minus.bw


