#!/bin/bash
samtools sort /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR1.withMT/accepted_hits.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR1.liver
samtools sort /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR5.withMT/accepted_hits.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR5.liver
samtools sort /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.withMT/accepted_hits.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.liver
samtools merge - /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR1.liver.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR5.liver.bam /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR25.liver.bam | samtools sort - /home/data/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR.liver
