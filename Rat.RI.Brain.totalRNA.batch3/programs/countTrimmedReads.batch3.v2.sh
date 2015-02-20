#!/bin/bash
f=/storage/saba/Rat.RI.Brain.totalRNA.batch3/trimmedReads/BXH9_1brain_AGTCAA_L007_R2_val_2.fq
awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /storage/saba/Rat.RI.Brain.totalRNA.batch3/data/trimmedReadCounts.10Feb15.txt
f=/storage/saba/Rat.RI.Brain.totalRNA.batch3/trimmedReads/BXH9_2brain_CAGATC_L001_R1_val_1.fq
awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /storage/saba/Rat.RI.Brain.totalRNA.batch3/data/trimmedReadCounts.10Feb15.txt
f=/storage/saba/Rat.RI.Brain.totalRNA.batch3/trimmedReads/BXH9_2brain_CAGATC_L001_R2_val_2.fq
awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /storage/saba/Rat.RI.Brain.totalRNA.batch3/data/trimmedReadCounts.10Feb15.txt
f=/storage/saba/Rat.RI.Brain.totalRNA.batch3/trimmedReads/SHR_1brain_ATGTCA_L007_R1_val_1.fq
awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /storage/saba/Rat.RI.Brain.totalRNA.batch3/data/trimmedReadCounts.10Feb15.txt
f=/storage/saba/Rat.RI.Brain.totalRNA.batch3/trimmedReads/SHR_1brain_ATGTCA_L007_R2_val_2.fq
awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /storage/saba/Rat.RI.Brain.totalRNA.batch3/data/trimmedReadCounts.10Feb15.txt
