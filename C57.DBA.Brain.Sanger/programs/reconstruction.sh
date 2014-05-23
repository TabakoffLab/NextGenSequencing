#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 56456 -p 24 -b /home/saba/index/mm10.cleaned.fa -g /home/saba/source/ensembl.GRCm38.mm10.Dec11.cleaned.gtf -o /home/saba/C57.DBA.Brain.Sanger/reconstruction/C57.ensemblGuided /home/saba/C57.DBA.Brain.Sanger/alignedReads/C57.brain.bam
cufflinks -u --seed 19881 -p 24 -b /home/saba/index/mm10.cleaned.fa -g /home/saba/source/ensembl.GRCm38.mm10.Dec11.cleaned.gtf -o /home/saba/C57.DBA.Brain.Sanger/reconstruction/DBA.ensemblGuided /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA.brain.bam
