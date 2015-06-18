#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BNLx1.ss -p 16 /storage/saba/index/BNLx_rn5_wSpikesAndM /storage/saba/Rat.RI.Brain.totalRNA.batch3/cleanedReads/BNLX_1.no_rRNA.end1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch3/cleanedReads/BNLX_1.no_rRNA.end2.fq
tophat2 --library-type fr-firststrand -o /storage/saba/Rat.RI.Brain.totalRNA.batch3/alignedReads/BNLx2.ss -p 16 /storage/saba/index/BNLx_rn5_wSpikesAndM /storage/saba/Rat.RI.Brain.totalRNA.batch3/cleanedReads/BNLX_2.no_rRNA.end1.fq /storage/saba/Rat.RI.Brain.totalRNA.batch3/cleanedReads/BNLX_2.no_rRNA.end2.fq


