#!/bin/bash

for filename in ./*_1.fastq.gz
do
base=$(basename $filename _1.fastq.gz)
java -jar ~/yingying/software/Trimmomatic-0.36/trimmomatic-0.36.jar PE -threads 4 -phred33 -trimlog clean.log \
./${base}_1.fastq.gz ./${base}_2.fastq.gz ./${base}.clean_1.fastq.gz ./${base}.unpaired_1.fastq.gz ./${base}.clean_2.fastq.gz ./${base}.unpaired_2.fastq.gz \
ILLUMINACLIP:adapters.fasta:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
mkdir clean_fastqc_out
fastqc -o clean_fastqc_out ./${base}.clean_1.fastq.gz ./${base}.clean_2.fastq.gz
done
multiqc ./clean_fastqc_out
