#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 -R /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BXH11_2.rRNA
tophat2 -R /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BXH13_1.rRNA
