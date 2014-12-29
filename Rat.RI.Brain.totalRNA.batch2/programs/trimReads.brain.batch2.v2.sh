#!/bin/bash
module add bio/trim_galore
trim_galore --paired --stringency 3 -a GATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG -a2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT -q 20 ./SHR_1brain_CCGTCC_L002_R1.fastq ./SHR_1brain_CCGTCC_L002_R2.fastq