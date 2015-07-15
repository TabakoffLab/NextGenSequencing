#!/bin/bash
#module add bio/bowtie2
#module add bio/tophat
export PATH=/usr/local/samtools:/usr/local/bedtools2/bin:$PATH
tophat2 --library-type fr-firststrand -o /hi-seq/RI.Brain.totalRNA.09Jun15/alignedReads/BNLx3.ss -p 16 /data2/saba/index/BNLx_rn5_wSpikesAndM /hi-seq/RI.Brain.totalRNA.09Jun15/cleanedReads/BNLx_3.no_rRNA.end1.fq /hi-seq/RI.Brain.totalRNA.09Jun15/cleanedReads/BNLx_3.no_rRNA.end2.fq
tophat2 --library-type fr-firststrand -o /hi-seq/RI.Brain.totalRNA.09Jun15/alignedReads/SHR3.ss -p 16 /data2/saba/index/SHR_rn5_wSpikesAndM /hi-seq/RI.Brain.totalRNA.09Jun15/cleanedReads/SHR_3.no_rRNA.end1.fq /hi-seq/RI.Brain.totalRNA.09Jun15/cleanedReads/SHR_3.no_rRNA.end2.fq
tophat2 --library-type fr-firststrand -o /hi-seq/RI.Brain.totalRNA.09Jun15/alignedReads/SHR1.ss -p 16 /data2/saba/index/SHR_rn5_wSpikesAndM /hi-seq/RI.Brain.totalRNA.09Jun15/cleanedReads/SHR_1.no_rRNA.end1.fq /hi-seq/RI.Brain.totalRNA.09Jun15/cleanedReads/SHR_1.no_rRNA.end2.fq

tophat2 --library-type fr-firststrand -o ~/Documents/BNLx.SHR/RNA-Seq.Liver/alignedReads/tmp2 -p 4 ~/Documents/index/BNLx_rn5_wSpikesAndM ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/BNLx1.tmp1.fq ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/BNLx1.tmp2.fq

HISEQ:130:C48C5ACXX:5:2110:5052:66499	161	ERCC-00002	1	50	101M	chr6	66645769	0	TCCAGATTACTTCCATTTCCGCCCAAGCTGCTCACAGTATACGGGCGTCGGCATCCAGACCGTCGGCTGATCGTGGTTTTACTAGGCTAGACTAGCGTACG	BBBFFFFFFFFFFIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIFFFFFFFFFFFFFFFFFFFFFFFBFFBFFFFFFFFFFFFFFFFFFFFFFFB	AS:i:0	XN:i:0	XM:i:0	XO:i:0	XG:i:0	NM:i:0	MD:Z:101	YT:Z:UUNH:i:1	XS:A:+
GTTTTACTAGGCTAGACTAGCGTACGAGCACTATGGTCAGTAATTCCTGGAGGAATAGGTACCAAGAAAAAAACGAACCTTTGGGTTCCAGAGCTGTACGG	FFFFFFFFFFFBFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFFFFIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIFFFFFFFFFFBBB
samtools view BNLx1.liver.bam | awk '$1 ~ "HISEQ:130:C48C5ACXX:5:2110:5052:66499"'

GTTTTACTAGGCTAGACTAGCGTACG
GTTTTACTAGGCTAGACTAGCGTACGAGCACTATGGTCAGTAATTCCTGGAGGAATAGGTACCAAGAAAAAAACGAACCTTTGGGTTCCAGAGCTGTACGG


awk '$1 ~ "@HISEQ:130:C48C5ACXX:5:2110:5052:66499"' BNLX_1_GCCAAT_L005_R1_001.fastq

awk '/HISEQ:130:C48C5ACXX:5:2110:5052:66499/ {getline; print $0}' tmp1.fq