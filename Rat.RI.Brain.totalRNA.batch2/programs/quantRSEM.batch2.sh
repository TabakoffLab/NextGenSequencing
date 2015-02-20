#!/bin/bash
export PATH=/usr/local/rsem/bin:$PATH

st=`date +%s`
rsem-calculate-expression -p 10 --time --seed-length 20 --seed $2 --bowtie2 --no-bam-output --forward-prob=0.0 --paired-end /hi-seq/RI.Brain.totalRNA.24Sep14/cleanedReads/$1.no_rRNA.end1.fq /hi-seq/RI.Brain.totalRNA.24Sep14/cleanedReads/$1.no_rRNA.end2.fq /data2/saba/index/RSEM/rn5.ensembl.wSpikes /data2/saba/BxH.HxB.Rats/RNA-Seq/quantitation/rsem.Ensembl/$1.b2  
end=`date +%s`
runtime=$((end-st))
echo "rsem runtime: $runtime sec."

