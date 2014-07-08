#!/bin/bash
export LC_ALL='C'
samtools view -F 0x4 $1/alignedReads/$3.smallRNA.bam | awk '{print $1}' | sort -b | uniq -c | awk -v sample="$3" '{if($1==1) sum+=1} END {print sample,"aligned.first",sum,NR}' >> $1/data/$2
samtools view $1/alignedReads/$3.smallRNA.bam | awk '{print $3}' | sort -b | uniq -c > $1/quantification/ensemblCounts/$3.ensemblSmallRNA.txt
