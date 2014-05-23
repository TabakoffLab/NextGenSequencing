#!/bin/bash
module add bio/cufflinks
cufflinks -u --seed 564654 -p 16 --library-type fr-firststrand -b /home/saba/index/mm10.cleaned.wSpikes.v2.fa -g /home/saba/source/refSeq.mm10.Dec2011.cleaned.gtf -o /home/saba/ILS.ISS.Brain.totalRNA/reconstruction/ILS.total.ensemblGuided /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ILS.total.bam
cufflinks -u --seed 564879 -p 16 --library-type fr-firststrand -b /home/saba/index/mm10.cleaned.wSpikes.v2.fa -g /home/saba/source/refSeq.mm10.Dec2011.cleaned.gtf -o /home/saba/ILS.ISS.Brain.totalRNA/reconstruction/ISS.total.ensemblGuided /home/saba/ILS.ISS.Brain.totalRNA/alignedReads/ISS.total.bam
