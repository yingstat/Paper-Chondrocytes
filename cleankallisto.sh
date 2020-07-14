#!/bin/bash
for x in {"P1","P2","H3","H4"}
do
kallisto quant -i transcripts.idx -b 35 -t 12 -o ./CLEANkallisto/CLEANoutput"$x" "$x".clean_1.fastq "$x".clean_2.fastq
done
