#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/alignedReads/SHR1.ss -p 16 /storage/saba/index/SHR_rn5_wSpikesAndM /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_1.no_rRNA.end1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_1.no_rRNA.end2.fq
tophat2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch1/alignedReads/SHR2.ss -p 16 /storage/saba/index/SHR_rn5_wSpikesAndM /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_2.no_rRNA.end1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch1/trimmedReads/SHR_2.no_rRNA.end2.fq
