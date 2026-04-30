#!/bin/bash

mkdir -p trimmed  # checks that output directory exists, creates it if not

for R1 in $(find . -type f -name '*_R1_001.fastq.gz' | sort); do
    R2=${R1/_R1_/_R2_}                             # find matching R2 file
    base=$(basename "$R1" _R1_001.fastq.gz)        # extract sample base name

    echo "Processing sample: $base"
    
    cutadapt \
      -a TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG \
      -A GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG \
      -g ^GTGCCAGCMGCCGCGGTAA \
      -G ^CCCCGYCAATTCMTTTRAGT \
      -e 0.1 \
      -o "./trimmed/${base}_R1.trimmed.fastq.gz" \
      -p "./trimmed/${base}_R2.trimmed.fastq.gz" \
      "$R1" "$R2"
done