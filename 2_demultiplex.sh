#!/bin/sh


#SBATCH -p cluster
#SBATCH -w nodo4


# Script to run process_radtags for demultiplex


#Create directory
mkdir -p ../data/samples


#For single-end samples (Generic FASTQ Data)

stacks process_radtags -f ../data/clean/Pinero-Sept19_S59_L002_R1_001_clean.fastq.gz --inline_null -o ../data/samples -b ../../meta/barcode_samples_plate1.txt -e apeKI -r -c -q

#check output with FastQC

fastqc ../data/samples*.fastqc.gz
