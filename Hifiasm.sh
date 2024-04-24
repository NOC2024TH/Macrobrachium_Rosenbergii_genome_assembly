#!/bin/bash

version=`hifiasm --version`

hifiasm -o Mrose_asm -t 72 --primary Mrose_ccs.fq.gz

for x in `ls Mrose_asm_ctg.gfa | sed 's/\.gfa//g'`; do echo ${x}; any2fasta ${x}.gfa > ${x}.fasta; done

for x in `ls *fasta | sed 's/\.fasta//'`
do
check_stats.sh  ${x}.fasta >${x}.stats
done