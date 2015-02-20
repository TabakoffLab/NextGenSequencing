#!/bin/bash
export LC_ALL='C'
module add bio/bedtools2
module add bio/samtools
module add python/3.4.2

samtools sort -n $1/unmapped.bam $1/unmapped_sort.bam
samtools view -h $1/unmapped_sort.bam | /storage/saba/sharedPrograms/bam_re-pair.py | samtools view -bSo $1/unmapped_sort.filtered.bam -