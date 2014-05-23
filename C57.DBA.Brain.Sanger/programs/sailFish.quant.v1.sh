#!/bin/bash
module load bio/sailfish
sailfish index -t /home/saba/C57.DBA.Brain.Sanger/reconstruction/transcript.total.05May14.fa -k 20 -p 5 -o /home/saba/C57.DBA.Brain.Sanger/reconstruction/C57.DBA.brain.transcriptome.v1
sailfish quant -i /home/saba/C57.DBA.Brain.Sanger/reconstruction/C57.DBA.brain.transcriptome.v1 -l "T=PE:O=><:S=U" -1 /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033006_1_val_1.fq -2 /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033006_2_val_2.fq -p 4 -o /home/saba/C57.DBA.Brain.Sanger/quantification/sailFish.v1/C571
sailfish quant -i /home/saba/C57.DBA.Brain.Sanger/reconstruction/C57.DBA.brain.transcriptome.v1 -l "T=PE:O=><:S=U" -1 /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033007_1_val_1.fq -2 /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033007_2_val_2.fq -p 4 -o /home/saba/C57.DBA.Brain.Sanger/quantification/sailFish.v1/C572
sailfish quant -i /home/saba/C57.DBA.Brain.Sanger/reconstruction/C57.DBA.brain.transcriptome.v1 -l "T=PE:O=><:S=U" -1 /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033015_1_val_1.fq -2 /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033015_2_val_2.fq -p 4 -o /home/saba/C57.DBA.Brain.Sanger/quantification/sailFish.v1/DBA1
sailfish quant -i /home/saba/C57.DBA.Brain.Sanger/reconstruction/C57.DBA.brain.transcriptome.v1 -l "T=PE:O=><:S=U" -1 /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033016_1_val_1.fq -2 /home/saba/C57.DBA.Brain.Sanger/trimmedReads/ERR033016_2_val_2.fq -p 4 -o /home/saba/C57.DBA.Brain.Sanger/quantification/sailFish.v1/DBA2

