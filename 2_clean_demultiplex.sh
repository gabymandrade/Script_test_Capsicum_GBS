#!/bin/sh


#SBATCH -p cluster
#SBATCH -w nodo4


# Script to run process_radtags for demultiplex


#Create directory
mkdir -p ../data/samples


#For paired-end samples

stacks process_radtags -1 ../data/clean/Pinero-Sept19_S59_L002_R1_001_clean.fastq.gz -2 ../data/clean/Pinero-Sept19_S59_L002_R2_001_clean.fastq.gz --inline_null -o ../data/samples -b ../meta/barcode_samples_plate1.txt -e apeKI -r -c -q

#check output with FastQC

fastqc ../data/samples*.fastqc.gz
