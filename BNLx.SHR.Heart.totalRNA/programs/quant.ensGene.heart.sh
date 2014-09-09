#!/bin/bash
module add bio/bedtools2
coverageBed -s -split -abam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR1.heart.bam -b /home/saba/source/ensembl.proteinCodingGenes.RGSC5.0.rn5.bed > /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/ensGene.cnts.SHR1.txt
coverageBed -s -split -abam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR2.heart.bam -b /home/saba/source/ensembl.proteinCodingGenes.RGSC5.0.rn5.bed > /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/ensGene.cnts.SHR2.txt
coverageBed -s -split -abam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR3.heart.bam -b /home/saba/source/ensembl.proteinCodingGenes.RGSC5.0.rn5.bed > /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/ensGene.cnts.SHR3.txt
coverageBed -s -split -abam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/SHR4.heart.bam -b /home/saba/source/ensembl.proteinCodingGenes.RGSC5.0.rn5.bed > /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/ensGene.cnts.SHR4.txt
coverageBed -s -split -abam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx1.heart.bam -b /home/saba/source/ensembl.proteinCodingGenes.RGSC5.0.rn5.bed > /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/ensGene.cnts.BNLx1.txt
coverageBed -s -split -abam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx2.heart.bam -b /home/saba/source/ensembl.proteinCodingGenes.RGSC5.0.rn5.bed > /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/ensGene.cnts.BNLx2.txt
coverageBed -s -split -abam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx3.heart.bam -b /home/saba/source/ensembl.proteinCodingGenes.RGSC5.0.rn5.bed > /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/ensGene.cnts.BNLx3.txt
coverageBed -s -split -abam /home/data/saba/BNLx.SHR.Heart.totalRNA/alignedReads/BNLx4.heart.bam -b /home/saba/source/ensembl.proteinCodingGenes.RGSC5.0.rn5.bed > /home/data/saba/BNLx.SHR.Heart.totalRNA/quantitation/ensGene.cnts.BNLx4.txt
