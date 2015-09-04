#!/bin/bash
module add bio/bowtie2
module add bio/samtools
#bowtie2-build /storage/saba/index/rn6.cleaned.fa /storage/saba/index/rn6.cleaned
samtools faidx /storage/saba/index/rn6.cleaned.fa


