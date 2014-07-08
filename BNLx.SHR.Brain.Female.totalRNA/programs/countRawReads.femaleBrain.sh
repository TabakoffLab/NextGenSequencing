rm /home/data/saba/BNLx.SHR.Brain.Females.totalRNA/data/rawReadCounts.07Jul14.txt
FILES1=/home/data/saba/BNLx.SHR.Brain.Females.totalRNA/rawReads/*.fastq
for f in $FILES1
do
	awk '/@HWI/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /home/data/saba/BNLx.SHR.Brain.Females.totalRNA/data/rawReadCounts.07Jul14.txt
done
