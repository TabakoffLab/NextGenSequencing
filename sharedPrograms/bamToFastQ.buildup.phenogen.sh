#!/bin/bash
export LC_ALL='C'
export PATH=/usr/local/samtools:/usr/local/bedtools2/bin:$PATH

PATH1=$1

cleaned=${PATH1//alignedReads*/cleanedReads}
sample=${PATH1//*alignedReads\//}
sample=${sample//.rRNA/}

echo $cleaned
echo $sample

samtools sort -n $1/unmapped.bam $1/unmapped_sort
echo "done sorting" $sample
samtools view -h $1/unmapped_sort.bam | /data2/saba/sharedPrograms/bam_re-pair.py | samtools view -bSo $1/unmapped_sort.filtered.bam - 
echo "done filtering" $sample
bedtools bamtofastq -i $1/unmapped_sort.filtered.bam -fq $cleaned/$sample.no_rRNA.end1.fq -fq2 $cleaned/$sample.no_rRNA.end2.fq 
echo "done converting" $sample

wc -l $cleaned/$sample.no_rRNA.*.fq > $1/numUnmappedFQ.txt
rm $1/unmapped_sort.bam $1/unmapped_sort.filtered.bam
