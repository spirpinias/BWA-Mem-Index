# BWA Index

Before alignment BWA first needs to construct an FM-index for the reference genome (the index command). 

## Input data

**Genome Fasta File(s)**

Nucleotide sequences to generate the index from. Any \*.fa\*, \*.fna\* file(s) in **data** directory will be used. 

If there are multiple reference sequences with identical suffixes (i.e., .fa), sequences will be concatenated into a single file before indexing. Please ensure that you are using an identical suffix for all your sequences.

## App Panel Parameters

Data : Hg38 Reference
- The hg38 reference is attached as default.
    - If you should decide to change it, please substitute this dataset with your own reference sequence. 

Index File Name
- Output name for index file. If not specified, will be based on input fasta name.

Algorithm
- Algorithm to use for indexing

> **is**: linear-time algorithm for constructing suffix array. It requires 5.37N memory where N is the size of the database. IS is moderately fast, but does not work with databases larger than 2GB.  IS is the default algorithm due to its simplicity. 

> **bwtsw**: Algorithm implemented in BWT-SW. This method works with the whole human genome.

> **auto**: Pick algorithm based on genome size (default)

## Output

In your **results** folder you will find the index. Name will be based on input fasta or Index File Name.

## Source

https://github.com/lh3/bwa

## Cite

Li H. and Durbin R. (2009) Fast and accurate short read alignment with Burrows-Wheeler Transform. Bioinformatics, 25:1754-60. [PMID: 19451168]
