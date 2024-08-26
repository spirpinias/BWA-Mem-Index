#!/usr/bin/env bash

set -ex

source ./config.sh

if [ "$fasta_count" -eq 1 ]; then

  echo "Creating index from a single ${suffix_fasta} file"

  ref_file=$(find -L ../data -name "*$suffix_fasta")

  # Run the Function
  bwa index -p ../results/"$index_file_name" $index_algorithm "$ref_file"

elif [ "$fasta_count" -gt 1 ]; then  

  echo "Creating index from multiple ${suffix_fasta} files"

  ref_files=$(find -L ../data -name "*$suffix_fasta")

  cat $ref_files > "../scratch/${index_file_name}_concat"

  bwa index -p "../results/$index_file_name" $index_algorithm "../scratch/${index_file_name}_concat"

else
  echo "Please ensure your data has at least 1 reference sequence. Check the README for acceptable formats."
fi