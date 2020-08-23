#!/bin/sh


#SBATCH -p cluster
#SBATCH -w keri

# Create directory alignment_refgen 
mkdir -p ../data/alignment_refgen_F

# extract samples names from pop name to use in for loop
for sample in $(cut -f1 ../../meta/allsamples_plate1.tsv) ;do

#Create variables
path_samples="../data/samples/"
gen_index="../../data/bwa/index_genome/Capsicum_index"
bam_file="../data/alignment_refgen_F/$sample.bam"
log_file="../data/alignment_refgen_F/$sample"

# run bwa & samtools 
bwa mem -M -t 20 $gen_index $path_samples/$sample.1.fq.gz | samtools view -b | samtools sort --threads 8 > $bam_file
done
