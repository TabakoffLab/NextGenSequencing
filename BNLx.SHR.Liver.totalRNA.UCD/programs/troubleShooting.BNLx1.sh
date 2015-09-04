
split -l 100000000 ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/unmapped.end1.fq ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/unmapped.end1.
split -l 100000000 ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/unmapped.end2.fq ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/unmapped.end2.

head -n 100000000 ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/unmapped.end1.fq > ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/tmp1.fq
head -n 100000000 ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/unmapped.end2.fq > ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/tmp2.fq


tophat2 --library-type fr-firststrand -o ~/Documents/BNLx.SHR/RNA-Seq.Liver/alignedReads/tmp.17Jul15.head250000 -p 4 ~/Documents/index/BNLx_rn5_wSpikesAndM ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/tmp1.fq ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/tmp2.fq
tophat2 --library-type fr-firststrand -o ~/Documents/BNLx.SHR/RNA-Seq.Liver/alignedReads/BNLx1.16Jul15 -p 4 ~/Documents/index/BNLx_rn5_wSpikesAndM ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/unmapped.end1.fq ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/unmapped.end2.fq

HISEQ:130:C48C5ACXX:5:2110:5052:66499	161	ERCC-00002	1	50	101M	chr6	66645769	0	TCCAGATTACTTCCATTTCCGCCCAAGCTGCTCACAGTATACGGGCGTCGGCATCCAGACCGTCGGCTGATCGTGGTTTTACTAGGCTAGACTAGCGTACG	BBBFFFFFFFFFFIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIFFFFFFFFFFFFFFFFFFFFFFFBFFBFFFFFFFFFFFFFFFFFFFFFFFB	AS:i:0	XN:i:0	XM:i:0	XO:i:0	XG:i:0	NM:i:0	MD:Z:101	YT:Z:UUNH:i:1	XS:A:+
GTTTTACTAGGCTAGACTAGCGTACGAGCACTATGGTCAGTAATTCCTGGAGGAATAGGTACCAAGAAAAAAACGAACCTTTGGGTTCCAGAGCTGTACGG	FFFFFFFFFFFBFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFFFFIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIFFFFFFFFFFBBB
samtools view BNLx1.liver.bam | awk '$1 ~ "HISEQ:130:C48C5ACXX:5:2110:5052:66499"'

GTTTTACTAGGCTAGACTAGCGTACG
GTTTTACTAGGCTAGACTAGCGTACGAGCACTATGGTCAGTAATTCCTGGAGGAATAGGTACCAAGAAAAAAACGAACCTTTGGGTTCCAGAGCTGTACGG


awk '$1 ~ "@HISEQ:130:C48C5ACXX:5:2110:5052:66499"' BNLX_1_GCCAAT_L005_R1_001.fastq

awk '/HISEQ:130:C48C5ACXX:5:1112:4239:70925/ {getline; print $0}' unmapped.end1.fq


awk '/HISEQ:130:C48C5ACXX:5:1112:4239:70925/ {getline; print $0}' BNLX_1_GCCAAT_L005_R1_001_val_1.fq
awk '/HISEQ:130:C48C5ACXX:5:1112:4239:70925/ {getline; print $0}' BNLX_1_GCCAAT_L005_R2_001_val_2.fq

tophat2 --library-type fr-firststrand -o ~/Documents/BNLx.SHR/RNA-Seq.Liver/alignedReads/tmp.17Jul15.ab -p 4 ~/Documents/index/BNLx_rn5_wSpikesAndM ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/unmapped.end1.ab ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/unmapped.end2.ab


awk '$1 ~ "HISEQ"' ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/unmapped.end1.fq | head -n 2500000 > ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/headers.end1.txt
awk '$1 ~ "HISEQ"' ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/unmapped.end2.fq | head -n 2500000 > ~/Documents/BNLx.SHR/RNA-Seq.Liver/trimmedReads/headers.end2.txt


/hi-seq/sharedPrograms/bamToFastQ_py.phenogen.LS.sh /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA &

cp /data2/harrall/BNLx.SHR.Liver.totalRNA.UCD/alignedReads/BNLx1.rRNA/* /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/


export PATH=/usr/local/samtools:/usr/local/bedtools2/bin:$PATH
samtools view -f 0x40 /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/unmapped.bam > /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/right.test.sam &
samtools view -f 0x80 /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/unmapped.bam > /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/left.test.sam &

sort left.test.sam > left.test.ordered.sam & 
sort right.test.sam > right.test.ordered.sam & 

head -n 100 unmapped.bam | samtools sort -n -o tmp

samtools sort -n unmapped.bam unmapped.sort & 


awk 'FNR==NR{a[$1]=$2; next}{if($1 in a) print $0}' left.test.sam right.test.sam | samtools view -bt /data2/saba/index/BNLx_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq unmapped.end1.LS.fq
awk 'FNR==NR{a[$1]=$2; next}{if($1 in a) print $0}' right.test.sam left.test.sam | samtools view -bt /data2/saba/index/SHR_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq unmapped.end2.LS.fq & 

## sorting sam files
samtools view -f 0x40 /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/unmapped.bam > /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/right.test.sam &
samtools view -f 0x80 /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/unmapped.bam > /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/left.test.sam &

export LC_ALL='C'
sort left.test.sam > left.test.ordered.sam & 
sort right.test.sam > right.test.ordered.sam & 

awk 'FNR==NR{a[$1]=$2; next}{if($1 in a) print $0}' left.test.ordered.sam right.test.ordered.sam | samtools view -bt /data2/saba/index/BNLx_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq unmapped.end1.ordered.LS.fq & 
awk 'FNR==NR{a[$1]=$2; next}{if($1 in a) print $0}' right.test.ordered.sam left.test.ordered.sam | samtools view -bt /data2/saba/index/SHR_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq unmapped.end2.ordered.LS.fq & 


tophat2 --library-type fr-firststrand -o /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.20Jul15 -p 16 /data2/saba/index/BNLx_rn5_wSpikesAndM /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/unmapped.end1.ordered.LS.fq /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/unmapped.end2.ordered.LS.fq & 



## sorting bam file
export PATH=/usr/local/samtools:/usr/local/bedtools2/bin:$PATH
samtools sort -n unmapped.bam unmapped.sort & 
samtools view -f 0x40 /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/unmapped.sort.bam > /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/right.test.v2.sam &
samtools view -f 0x80 /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/unmapped.sort.bam > /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/left.test.v2.sam &
awk 'FNR==NR{a[$1]=$2; next}{if($1 in a) print $0}' left.test.v2.sam right.test.v2.sam | samtools view -bt /Volumes/saba/index/BNLx_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq unmapped.end1.v2.LS.fq & 
awk 'FNR==NR{a[$1]=$2; next}{if($1 in a) print $0}' right.test.v2.sam left.test.v2.sam | samtools view -bt /Volumes/saba/index/SHR_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq unmapped.end2.v2.LS.fq & 
tophat2 --library-type fr-firststrand -o /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.24Jul15 -p 2 /data2/saba/index/BNLx_rn5_wSpikesAndM /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/unmapped.end1.v2.LS.fq /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/unmapped.end2.v2.LS.fq & 



## directly from sorted bam file

samtools view unmapped.sort.bam | awk 'BEGIN{curr="";prev="";flag=0} {prev=curr;prevfull=currfull;curr=$1;currfull=$0; if(prev!=curr){flag=1}; if(flag!=0 && prev==curr)flag=2 ; if(flag==2) {print prevfull;print currfull}}' > unmapped.sort.paired.sam
samtools view -Sb  unmapped.sort.paired.sam >  unmapped.sort.paired.bam

bedtools bamtofastq -i unmapped.sort.paired.bam -fq outUnmapped1.fq -fq2 outUnmapped2.fq &
