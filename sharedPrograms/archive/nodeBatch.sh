#!/bin/bash

#PBS -l nodes=1:ppn=12
#PBS -l walltime=24:00:00
#PBS -j oe
#PBS -m bea
#PBS -M spencer.mahaffey@ucdenver.edu


#params
#file hxb#_#_blah_L#_R1.fastq.part.xx
#file suffix (xx)
PATH1=$1
SAMPLE=$2
index=$3
AD1=$4
AD2=$5

PATH2=${PATH1//rawReads/trimmedReads}
PATH3=${PATH1//rawReads/alignedReads}
PATH4=$PATH3/$SAMPLE.rRNA

L1R1=$PATH1$SAMPLE"_L001_R1.fastq"
L1R2=$PATH1$SAMPLE"_L001_R2.fastq"
L2R1=$PATH1$SAMPLE"_L002_R1.fastq"
L2R2=$PATH1$SAMPLE"_L002_R2.fastq"

COUNTF=$PATH1$SAMPLE".count.txt"
rm $COUNTF

echo "count"
echo "$L1R1"
echo "$L1R2"
echo "$L2R1"
echo "$L2R2"

#count rawReads
wc -l $L1R1 >> $COUNTF &
wc -l $L1R2 >> $COUNTF &
wc -l $L2R1 >> $COUNTF &
wc -l $L2R2 >> $COUNTF &

echo "\n\ntrim output $PATH2"

mkdir $PATH2
mkdir $PATH3

module add python/3.4.2
module add bio/trim_galore
#trim Lane1 and Lane2 in parallel
st=`date +%s`

trim_galore --paired --stringency 3 -a $AD1 -a2 $AD2 -q 20 -o $PATH2 $L1R1 $L1R2 &
TPID1=$!

trim_galore --paired --stringency 3 -a $AD1 -a2 $AD2 -q 20 -o $PATH2 $L2R1 $L2R2 &
TPID2=$!

wait $TPID1
wait $TPID2

TL1R1=$PATH1$SAMPLE"_L001_R1_val_1.fq"
TL1R2=$PATH1$SAMPLE"_L001_R2_val_2.fq"
TL1R1F=${TL1R1//rawReads/trimmedReads}
TL1R2F=${TL1R2//rawReads/trimmedReads}

echo "count $TL1R1F"
echo "count $TL1R2F"

chmod ugo+rwx $TL1R1F
chmod ugo+rwx $TL1R2F

awk '/@HWI/ {getline; print length($0)}' $TL1R1F | awk -v sample="$TL1R1F" '{sum+=$1} END {print sample,sum/NR,NR}' > $TL1R1F.trim.txt &
awk '/@HWI/ {getline; print length($0)}' $TL1R2F | awk -v sample="$TL1R2F" '{sum+=$1} END {print sample,sum/NR,NR}' > $TL1R2F.trim.txt &

end=`date +%s`
runtime=$((end-st))
echo "trim runtime: $runtime sec."

TL2R1=$PATH1$SAMPLE"_L002_R1_val_1.fq"
TL2R2=$PATH1$SAMPLE"_L002_R2_val_2.fq"
TL2R1F=${TL2R1//rawReads/trimmedReads}
TL2R2F=${TL2R2//rawReads/trimmedReads}

echo "count $TL2R1F"
echo "count $TL2R2F"

chmod ugo+rwx $TL2R1F
chmod ugo+rwx $TL2R2F

awk '/@HWI/ {getline; print length($0)}' $TL2R1F | awk -v sample="$TL2R1F" '{sum+=$1} END {print sample,sum/NR,NR}' > $TL2R1F.trim.txt &
awk '/@HWI/ {getline; print length($0)}' $TL2R2F | awk -v sample="$TL2R2F" '{sum+=$1} END {print sample,sum/NR,NR}' > $TL2R2F.trim.txt &


module add bio/bowtie2
module add bio/tophat

echo "start node tophat $PATH4"
echo "R1 $TL1R1F,$TL2R1F"
echo "R2 $TL1R2F,$TL2R2F"



mkdir $PATH4
st=`date +%s`
tophat2 -g 2 --library-type fr-firststrand -o $PATH4 -p 20 $index $TL1R1F,$TL2R1F $TL1R2F,$TL2R2F
end=`date +%s`
runtime=$((end-st))
echo "end node tophat $f"
echo "tophat runtime: $runtime sec."


st=`date +%s`
/home/mahaffey/bamToFastQ.sh $PATH4
end=`date +%s`
runtime=$((end-st))
echo "end bamToFastQ"
echo "bamToFastQ runtime: $runtime sec."

echo "done"
