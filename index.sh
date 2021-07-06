#!/bin/bash
wget ftp://ftp.ensembl.org/pub/release-89/fasta/mus_musculus/cdna/Mus_musculus.GRCm38.cdna.all.fa.gz
kallisto index -i transcripts.idx Mus_musculus.GRCm38.cdna.all.fa.gz
wget https://github.com/BUStools/getting_started/releases/download/getting_started/t2g.py
wget ftp://ftp.ensembl.org/pub/release-89/gtf/mus_musculus/Mus_musculus.GRCm38.89.gtf.gz
chmod +x t2g.py
gunzip Mus_musculus.GRCm38.89.gtf.gz
./t2g.py -v < Mus_musculus.GRCm38.89.gtf > t2g.txt
