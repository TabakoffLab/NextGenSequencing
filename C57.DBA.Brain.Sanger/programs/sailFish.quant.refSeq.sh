export DYLD_LIBRARY_PATH=/usr/local/bin/Sailfish-0.6.3-Mac_x86-64/lib:$DYLD_LIBRARY_PATH
export PATH=/usr/local/bin/Sailfish-0.6.3-Mac_x86-64/bin:$PATH

export LD_LIBRARY_PATH=/usr/local/sailfish/lib:$LD_LIBRARY_PATH
export PATH=/usr/local/sailfish/bin:$PATH

awk '{if($1~">") print $1$2; else print $0}' refSeq.GRCm38.mm10.fa > refSeq.GRCm38.mm10.v2.fa
head -n 13940 refSeq.GRCm38.mm10.fa | awk '{if($1~">") print $1; else print $0}' | tail -n 12 

head -n 20000 refSeq.GRCm38.mm10.fa | awk '{if($1~">") print $1; else print $0}' | sed '/>mm10_refGene_NM_001012623/,/>/{//!d}' | sed '/mm10_refGene_NM_001012623/d' > refSeq.GRCm38.mm10.v2.fa

awk '{if($1~">") print $1; else print $0}' refSeq.GRCm38.mm10.fa | sed '/>mm10_refGene_NM_001012623/,/>/{//!d}' | sed '/mm10_refGene_NM_001012623/d' > refSeq.GRCm38.mm10.v2.fa


sailfish index --force -t /data/Tabastore3/LauraS/index/refSeq.GRCm38.mm10.v2.fa -k 20 -p 5 -o /data/Tabastore3/LauraS/index/refSeq.GRCm38.mm10.v2
sailfish quant -i /data/Tabastore3/LauraS/index/refSeq.GRCm38.mm10.v2 -l "T=PE:O=><:S=U" -1 /data/Tabastore3/LauraS/BXD/RNA-Seq/Sanger/trimmedReads/ERR033006_1_val_1.fq -2 /data/Tabastore3/LauraS/BXD/RNA-Seq/Sanger/trimmedReads/ERR033006_2_val_2.fq -p 5 -o /data/Tabastore3/LauraS/BXD/RNA-Seq/Sanger/quantification/sailFish.refSeq/C571
sailfish quant -i /data/Tabastore3/LauraS/index/refSeq.GRCm38.mm10.v2 -l "T=PE:O=><:S=U" -1 /data/Tabastore3/LauraS/BXD/RNA-Seq/Sanger/trimmedReads/ERR033007_1_val_1.fq -2 /data/Tabastore3/LauraS/BXD/RNA-Seq/Sanger/trimmedReads/ERR033007_2_val_2.fq -p 5 -o /data/Tabastore3/LauraS/BXD/RNA-Seq/Sanger/quantification/sailFish.refSeq/C572
sailfish quant -i /data/Tabastore3/LauraS/index/refSeq.GRCm38.mm10.v2 -l "T=PE:O=><:S=U" -1 /data/Tabastore3/LauraS/BXD/RNA-Seq/Sanger/trimmedReads/ERR033015_1_val_1.fq -2 /data/Tabastore3/LauraS/BXD/RNA-Seq/Sanger/trimmedReads/ERR033015_2_val_2.fq -p 5 -o /data/Tabastore3/LauraS/BXD/RNA-Seq/Sanger/quantification/sailFish.refSeq/DBA1
sailfish quant -i /data/Tabastore3/LauraS/index/refSeq.GRCm38.mm10.v2 -l "T=PE:O=><:S=U" -1 /data/Tabastore3/LauraS/BXD/RNA-Seq/Sanger/trimmedReads/ERR033016_1_val_1.fq -2 /data/Tabastore3/LauraS/BXD/RNA-Seq/Sanger/trimmedReads/ERR033016_2_val_2.fq -p 5 -o /data/Tabastore3/LauraS/BXD/RNA-Seq/Sanger/quantification/sailFish.refSeq/DBA2



awk '{if($1~">") print $0}' refSeq.GRCm38.mm10.v2.fa

awk '{if($1~">mm10_refGene_NM_001012623") print $0}' refSeq.GRCm38.mm10.fa