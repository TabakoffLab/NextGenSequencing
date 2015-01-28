#!/bin/bash
PATH1=$1
SAMPLE=$2
index=$3
AD1=$4
AD2=$5
PATH2=${PATH1//rawReads/trimmedReads}
PATH3=${PATH1//rawReads/alignedReads}
PATH4=$PATH3/$SAMPLE.rRNA
L1R1=$PATH1$SAMPLE"_L001_R1.fastq"
L1R2=$PATH1$SAMPLE"_L001_R2.fastq"
L2R1=$PATH1$SAMPLE"_L002_R1.fastq"
L2R2=$PATH1$SAMPLE"_L002_R2.fastq"
TL1R1=$PATH1$SAMPLE"_L001_R1_val_1.fq"
TL1R2=$PATH1$SAMPLE"_L001_R2_val_2.fq"
TL1R1F=${TL1R1//rawReads/trimmedReads}
TL1R2F=${TL1R2//rawReads/trimmedReads}
TL2R1=$PATH1$SAMPLE"_L002_R1_val_1.fq"
TL2R2=$PATH1$SAMPLE"_L002_R2_val_2.fq"
TL2R1F=${TL2R1//rawReads/trimmedReads}
TL2R2F=${TL2R2//rawReads/trimmedReads}
module add bio/bowtie2
module add bio/tophat
echo "start node tophat $PATH4"
echo "R1 $TL1R1F,$TL2R1F"
echo "R2 $TL1R2F,$TL2R2F"
