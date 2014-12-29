#!/bin/bash
module add bio/bowtie2
module add bio/tophat
module add bio/cufflinks
cuffdiff --library-type fr-firststrand -p 24 -L BNLx,SHR -o /storage/saba/BNLx.SHR.Liver.totalRNA.UCD/quantification/cuffDiff.24Nov14 /storage/saba/BNLx.SHR.Liver.totalRNA.UCD/reconstruction/reconstruct.liver.07Oct14.FINAL.gtf /storage/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx1.liver.bam,/storage/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx2.liver.bam,/storage/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.liver.bam /storage/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR1.liver.bam,/storage/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.liver.bam,/storage/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR5.liver.bam