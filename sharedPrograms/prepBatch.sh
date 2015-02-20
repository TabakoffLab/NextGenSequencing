#!/bin/bash


SCRIPTS="/home/mahaffey/"

PATH1=$1
#path to gz files ex /storage/mahaffey/batch/rawReads/

index=$2
#ex. /storage/saba/index/rmsk.rRNA.RGSC5.0.rn5

AD1=$3
AD2=$4
EMAIL=$5


echo "PATH: $PATH1"

#setup file names and paths for L001(R1,R2) and L002(R1,R2)
ZIPLIST=$PATH1"*.fastq.gz"

MAX=10

if [ "${#ZIPLIST[@]}" -gt "0" ]
then
	COUNT=0
	GTMAX=0
	for f in $ZIPLIST
	do
		LEN=${#f}-3
		UNZIP=${f:0:$LEN}
		echo "test unzip: $UNZIP"
		echo "file:$COUNT"
		if ! [ -s $UNZIP ]
		then
			if [ "$COUNT" -eq "$MAX" ]
			then
				GTMAX=1
				COUNT=0
				echo "Exceeded Max"
			fi
			if [ "$GTMAX" -eq "1" ]
			then
				echo "wait $COUNT : ${GZPID[COUNT]}"
				wait ${GZPID[COUNT]}
			fi
			echo "unzipping $f"
			gzip -d $f &
			GZPID[$COUNT]=$!
			COUNT=$[COUNT + 1]
		fi
	done
fi


for i in `seq 0 $COUNT`;
do
#for pid in $GZPID
#do
	echo "final wait $i : ${GZPID[i]}"
	wait ${GZPID[i]}
done

FQLIST=$PATH1"*_L001_R1.fastq"

len=${#PATH1}-9
BATCH=${PATH1:0:$len}"process.sh"
rm $BATCH

for f in $FQLIST
do
    	echo "processing..."$f
	echo "${f##*/}"
	SAMPLE=${f##*/}
	len=${#SAMPLE}-14
	SAMPLE=${SAMPLE:0:$len}
	echo "sample $SAMPLE"
	TEMP="qsub -q compute -N ${SAMPLE:0:9} -j oe -m bea -M $EMAIL -l nodes=1:ppn=12 -V -- $SCRIPTS""nodeBatch.sh $PATH1 $SAMPLE $index $AD1 $AD2"
	echo $TEMP >> $BATCH
done

chmod ug+x $BATCH
