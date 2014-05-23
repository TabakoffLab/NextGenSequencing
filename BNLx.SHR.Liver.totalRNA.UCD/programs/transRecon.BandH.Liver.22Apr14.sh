#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 645821 -p 16 --library-type fr-firststrand -b /home/saba/index/BNLx_rn5_wSpikes.fa -g /home/saba/source/refSeq.rn5.Mar2012.cleaned.gtf -o /home/saba/BNLx.SHR.Liver.totalRNA.UCD/reconstruction/ILS.total.ensemblGuided /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx.total.bam
cufflinks -u --seed 645835 -p 16 --library-type fr-firststrand -b /home/saba/index/SHR_rn5_Genome.wSpikes.fa -g /home/saba/source/refSeq.rn5.Mar2012.cleaned.gtf -o /home/saba/BNLx.SHR.Liver.totalRNA.UCD/reconstruction/ISS.total.ensemblGuided /home/saba/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/SHR.total.bam
