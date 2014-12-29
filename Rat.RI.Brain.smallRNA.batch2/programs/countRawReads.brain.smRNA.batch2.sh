rm /storage/saba/Rat.RI.Brain.smallRNA.batch2/data/rawReadCounts.30Sep14.txt
FILES1=/storage/saba/Rat.RI.Brain.smallRNA.batch2/rawReads/*.fastq
for f in $FILES1
do
	awk '/@HISEQ/ {getline; print length($0)}' $f | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /storage/saba/Rat.RI.Brain.smallRNA.batch2/data/rawReadCounts.30Sep14.txt
done
