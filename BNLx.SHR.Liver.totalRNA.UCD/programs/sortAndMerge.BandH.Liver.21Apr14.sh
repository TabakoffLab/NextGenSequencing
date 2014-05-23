#!/bin/bash
samtools sort /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx1/accepted_hits.bam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx1.total
samtools sort /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx2/accepted_hits.bam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx2.total
samtools sort /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3/accepted_hits.bam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total
samtools sort /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR1/accepted_hits.bam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR1.total
samtools sort /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR5/accepted_hits.bam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR5.total
samtools sort /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25/accepted_hits.bam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.total
samtools merge - /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx1.total.bam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx2.total.bam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx3.total.bam | samtools sort - /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx.total.bam
samtools merge - /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR1.total.bam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR5.total.bam /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.total.bam | samtools sort - /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR.total.bam
