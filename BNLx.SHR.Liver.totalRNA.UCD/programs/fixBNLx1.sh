What finally worked for BNLx1 Liver (UCD) sample

## sorting bam file
export PATH=/usr/local/samtools:/usr/local/bedtools2/bin:$PATH
samtools sort -n unmapped.bam unmapped.sort & 
samtools view -f 0x40 /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/unmapped.sort.bam > /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/right.test.v2.sam &
samtools view -f 0x80 /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/unmapped.sort.bam > /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/left.test.v2.sam &
awk 'FNR==NR{a[$1]=$2; next}{if($1 in a) print $0}' left.test.v2.sam right.test.v2.sam | samtools view -bt /Volumes/saba/index/BNLx_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq unmapped.end1.v2.LS.fq & 
awk 'FNR==NR{a[$1]=$2; next}{if($1 in a) print $0}' right.test.v2.sam left.test.v2.sam | samtools view -bt /Volumes/saba/index/SHR_rn5_wSpikesAndM.fa.fai - | bedtools bamtofastq -i - -fq unmapped.end2.v2.LS.fq & 
tophat2 --library-type fr-firststrand -o /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.24Jul15 -p 2 /data2/saba/index/BNLx_rn5_wSpikesAndM /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/unmapped.end1.v2.LS.fq /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.rRNA/unmapped.end2.v2.LS.fq & 

export PATH=/usr/local/samtools:/usr/local/bedtools2/bin:$PATH
samtools sort /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.24Jul15/accepted_hits.bam /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.liver & 
samtools merge - /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx1.liver.bam /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx2.liver.bam /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx3.dup.liver.bam | samtools sort - /data2/saba/BNLx.SHR/RNA-Seq.Liver/totalRNA.UCD/alignedReads/BNLx.liver
