#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch2/alignedReads/SHR1.ss -p 16 /storage/saba/index/SHR_rn5_wSpikesAndM /storage/saba/Rat.RI.Brain.totalRNA.batch2/alignedReads/SHR_1.rRNA/unmapped.end1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch2/alignedReads/SHR_1.rRNA/unmapped.end2.fq
