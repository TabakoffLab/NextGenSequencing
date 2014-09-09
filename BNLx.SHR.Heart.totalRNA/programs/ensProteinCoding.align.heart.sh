module add bio/tophat
for f in test.chrX
do
	tophat2 --library-type fr-firststrand -G /home/saba/source/ensGene.protein_coding.RGSC5.0.rn5.gtf -T -o /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/uniquelyAligned/$f -p 16 /home/saba/index/BNLx_rn5_wSpikesAndM /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/uniquelyAligned/$f.end1.fq /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/uniquelyAligned/$f.end2.fq
done

