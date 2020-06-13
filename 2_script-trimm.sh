#!/bin/bash

#SBATCH -p cluster
#SBATCH --mem-per-cpu=100000
#SBATCH --cpus-per-task=7

fastq="../"
trim="../Programs/Trimmomatic-0.39"
paired="../Trimm/Paired"
unpaired="../Trimm/Unpaired"

#newvariablename=${oldvariablename//oldtext/newtext}
for R1 in $fastq/*R1*; do
   R2=${R1//R1_001.fastq.gz/R2_001.fastq.gz}
   R1paired=${R1//.fastq/_paired.fastq}
   R1unpaired=${R1//.fastq/_unpaired.fastq}
   R2paired=${R2//.fastq/_paired.fastq}
   R2unpaired=${R2//.fastq/_unpaired.fastq}
   java -jar $trim/trimmomatic-0.39.jar PE -phred33 $R1 $R2 $paired/$R1paired $unpaired/$R1unpaired $paired/$R2paired $unpaired/$R2unpaired MINLEN:100 SLIDINGWINDOW:4:20
done

##Este script es de Christian 
