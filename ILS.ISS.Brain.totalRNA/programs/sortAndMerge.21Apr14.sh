#!/bin/bash
samtools sort /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS1/accepted_hits.bam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS1.total
samtools sort /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS2/accepted_hits.bam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS2.total
samtools sort /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS3/accepted_hits.bam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS3.total
samtools sort /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS1/accepted_hits.bam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS1.total
samtools sort /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS2/accepted_hits.bam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS2.total
samtools sort /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS3/accepted_hits.bam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS3.total
samtools merge - /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS1.total.bam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS2.total.bam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS3.total.bam | samtools sort - /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total 
samtools merge - /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS1.total.bam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS2.total.bam /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS3.total.bam | samtools sort - /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total 
