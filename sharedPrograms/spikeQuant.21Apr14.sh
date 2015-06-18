#!/bin/bash
module load bio/bedtools2
module load bio/cufflinks
samtools view /home/saba/$1/alignedReads/$2/accepted_hits.bam | awk '$3!~"chr"' - > /home/saba/$1/alignedReads/$2/spikeOnly.sam 
samtools view -H /home/saba/$1/alignedReads/$2/accepted_hits.bam | cat - /home/saba/$1/alignedReads/$2/spikeOnly.sam > /home/saba/$1/alignedReads/$2/spikeOnly.wH.sam
samtools view -bT /home/saba/index/$3 /home/saba/$1/alignedReads/$2/spikeOnly.wH.sam | genomeCoverageBed -d -split -strand - -ibam stdin > /home/saba/$1/alignedReads/$2/spikeInCoverage.txt
cufflinks -p 2 -o /home/saba/$1/alignedReads/$2/spikeCounts -b /home/saba/index/$3 -u -G /home/saba/source/ERCC92.none.gtf /home/saba/$1/alignedReads/$2/spikeOnly.wH.sam
samtools view -S -f 0X2 -F 0X100 /home/saba/$1/alignedReads/$2/spikeOnly.wH.sam |  awk '{print $3}' | sort - | uniq -c > /home/saba/$1/alignedReads/$2/readCounts.spikes.txt
