#!/usr/bin/env bash

set -ex

if [ $# -eq 0 ]; then
  echo "No arguments supplied"
else
  echo "args:"
  for i in $*; do 
    echo $i 
  done
  echo ""
fi

# Search the Environment for the type of Fasta.
some_fasta_file=$(get_fasta_file --dir ../data)
echo "some_fasta_file: $some_fasta_file"

# Extract suffixes.
suffix_fasta=$(basename "$some_fasta_file")
suffix_fasta=$(sed "s/.*\.f/\.f/" <<< "$suffix_fasta")
echo "Found suffix $suffix_fasta"

# Count the Fasta Files.
fasta_count=$(find -L ../data -name "*$suffix_fasta" | wc -l)

if [ -z "${1}" ]; then
  index_file_name=$(basename -s $suffix_fasta "${some_fasta_file}")
else
  index_file_name="${1}"
fi

if [ -z "${2}" ] || [ "${2}" == "auto" ]; then
  index_algorithm=""
else
  index_algorithm="-a ${2}"
fi
