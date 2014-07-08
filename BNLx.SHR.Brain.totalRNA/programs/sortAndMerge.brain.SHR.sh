#!/bin/bash
samtools sort /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR1/accepted_hits.bam /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR1.brain
samtools sort /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR2/accepted_hits.bam /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR2.brain
samtools sort /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR3/accepted_hits.bam /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR3.brain
samtools merge - /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR1.brain.bam /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR2.brain.bam /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR3.brain.bam | samtools sort - /home/data/saba/BNLx.SHR.Brain.totalRNA/alignedReads/SHR.brain
