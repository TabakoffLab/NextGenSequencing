#!/bin/bash
module add bio/bowtie2
bowtie2-build /home/saba/index/ensGene.protein_coding.RGSC5.0.rn5.fa ensProteinCoding


samtools view -c -L test.chrX.unique.bam 