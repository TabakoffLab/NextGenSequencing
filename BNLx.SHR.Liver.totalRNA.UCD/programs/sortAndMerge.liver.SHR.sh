#!/bin/bash
samtools sort /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR1/accepted_hits.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR1.liver
samtools sort /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR5/accepted_hits.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR5.liver
samtools sort /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.dup/accepted_hits.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.dup.liver
samtools merge - /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR1.liver.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR5.liver.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.dup.liver.bam | samtools sort - /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR.liver
samtools sort /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25/accepted_hits.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.liver
