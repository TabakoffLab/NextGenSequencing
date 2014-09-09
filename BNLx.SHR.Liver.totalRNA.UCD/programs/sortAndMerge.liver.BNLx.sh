#!/bin/bash
#samtools sort /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx1/accepted_hits.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx1.liver
#samtools sort /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx2/accepted_hits.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx2.liver
#samtools sort /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3/accepted_hits.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.liver
#samtools sort /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.dup/accepted_hits.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.dup.liver
samtools merge - /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx1.liver.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx2.liver.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.dup.liver.bam | samtools sort - /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx.liver
