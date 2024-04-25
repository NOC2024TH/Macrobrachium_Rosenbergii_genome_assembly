#!/bin/bash

module load Singularity

singularity exec -B $PWD:$PWD busco_v5.4.4_cv1.sif busco \
	-i Mrose.assembly.fasta \
	-o Mrose_geno \
	./eukaryota_odb10 --offline \
	-m geno \
	-c 48 