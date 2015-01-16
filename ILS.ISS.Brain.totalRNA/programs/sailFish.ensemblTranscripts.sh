#!/bin/bash
module add bio/sailfish
sailfish quant -i /storage/saba/index/ensemblGenes.GRCm38.mm10.wSpikes -l "T=PE:O=><:S=AS" -1 /storage/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS1.R1.fq -2 /storage/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS1.R2.fq -p 5 -o /storage/saba/ILS.ISS.Brain.totalRNA/quantification/ILS1.ensembl
sailfish quant -i /storage/saba/index/ensemblGenes.GRCm38.mm10.wSpikes -l "T=PE:O=><:S=AS" -1 /storage/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS2.R1.fq -2 /storage/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS2.R2.fq -p 5 -o /storage/saba/ILS.ISS.Brain.totalRNA/quantification/ILS2.ensembl
sailfish quant -i /storage/saba/index/ensemblGenes.GRCm38.mm10.wSpikes -l "T=PE:O=><:S=AS" -1 /storage/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS3.R1.fq -2 /storage/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ILS3.R2.fq -p 5 -o /storage/saba/ILS.ISS.Brain.totalRNA/quantification/ILS3.ensembl
sailfish quant -i /storage/saba/index/ensemblGenes.GRCm38.mm10.wSpikes -l "T=PE:O=><:S=AS" -1 /storage/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS1.R1.fq -2 /storage/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS1.R2.fq -p 5 -o /storage/saba/ILS.ISS.Brain.totalRNA/quantification/ISS1.ensembl
sailfish quant -i /storage/saba/index/ensemblGenes.GRCm38.mm10.wSpikes -l "T=PE:O=><:S=AS" -1 /storage/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS2.R1.fq -2 /storage/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS2.R2.fq -p 5 -o /storage/saba/ILS.ISS.Brain.totalRNA/quantification/ISS2.ensembl
sailfish quant -i /storage/saba/index/ensemblGenes.GRCm38.mm10.wSpikes -l "T=PE:O=><:S=AS" -1 /storage/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS3.R1.fq -2 /storage/saba/ILS.ISS.Brain.totalRNA/trimmedReads/ISS3.R2.fq -p 5 -o /storage/saba/ILS.ISS.Brain.totalRNA/quantification/ISS3.ensembl
