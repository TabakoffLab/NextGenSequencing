#!/bin/bash
samtools sort /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/BNLx1/accepted_hits.bam /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/BNLx1.brain.polyA
samtools sort /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/BNLx2/accepted_hits.bam /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/BNLx2.brain.polyA
samtools sort /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/BNLx3/accepted_hits.bam /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/BNLx3.brain.polyA
samtools sort /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/SHR1/accepted_hits.bam /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/SHR1.brain.polyA
samtools sort /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/SHR2/accepted_hits.bam /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/SHR2.brain.polyA
samtools sort /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/SHR3/accepted_hits.bam /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/SHR3.brain.polyA
samtools merge - /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/BNLx1.brain.polyA.bam /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/BNLx2.brain.polyA.bam /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/BNLx3.brain.polyA.bam | samtools sort - /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/BNLx.brain.polyA
samtools merge - /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/SHR1.brain.polyA.bam /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/SHR2.brain.polyA.bam /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/SHR3.brain.polyA.bam | samtools sort - /home/data/saba/BNLx.SHR.Brain.polyARNA/alignedReads/SHR.brain.polyA
