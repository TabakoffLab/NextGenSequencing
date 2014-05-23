#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 645835 -p 25 --library-type fr-firststrand -b /home/saba/index/SHR_rn5_Genome.wSpikes.fa -g /home/saba/source/refSeq.rn5.Mar2012.cleaned.gtf -o /home/saba/BNLx.SHR.Liver.totalRNA.UCD/reconstruction/SHR.total.refSeqGuided /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR.total.bam
