#!/bin/bash
samtools sort /home/saba/C57.DBA.Brain.Sanger/alignedReads/C571/accepted_hits.bam /home/saba/C57.DBA.Brain.Sanger/alignedReads/C571.brain
samtools sort /home/saba/C57.DBA.Brain.Sanger/alignedReads/C572/accepted_hits.bam /home/saba/C57.DBA.Brain.Sanger/alignedReads/C572.brain
samtools sort /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA1/accepted_hits.bam /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA1.brain
samtools sort /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA2/accepted_hits.bam /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA2.brain
samtools merge - /home/saba/C57.DBA.Brain.Sanger/alignedReads/C571.brain.bam /home/saba/C57.DBA.Brain.Sanger/alignedReads/C572.brain.bam | samtools sort - /home/saba/C57.DBA.Brain.Sanger/alignedReads/C57.brain.bam
samtools merge - /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA1.brain.bam /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA2.brain.bam | samtools sort - /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA.brain.bam
