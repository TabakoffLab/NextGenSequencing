#!/bin/bash
module add bio/bowtie2
module add bio/tophat
tophat2 -o /home/saba/C57.DBA.Brain.Sanger/alignedReads/C571 -p 16 /home/saba/index/mm10.cleaned /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033006_1_val_1.fq /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033006_2_val_2.fq
tophat2 -o /home/saba/C57.DBA.Brain.Sanger/alignedReads/C572 -p 16 /home/saba/index/mm10.cleaned /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033007_1_val_1.fq /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033007_2_val_2.fq
tophat2 -o /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA1 -p 16 /home/saba/index/mm10.cleaned /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033015_1_val_1.fq /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033015_2_val_2.fq
tophat2 -o /home/saba/C57.DBA.Brain.Sanger/alignedReads/DBA2 -p 16 /home/saba/index/mm10.cleaned /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033016_1_val_1.fq /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033016_2_val_2.fq
