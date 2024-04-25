#!/bin/bash

./purge_dups/src/split_fa Mrose.polished.fasta > Mrose.split.fasta

minimap2 -xasm5 -t 72 -DP Mrose.split.fasta Mrose.split.fasta | gzip -c - > Mrose.asm.self.paf.gz

minimap2 -x map-pb -t 72 Mrose.split.fasta Mrose.reads.ccs.fastq.gz | gzip -c - > Mrose.ccs.reads.paf.gz

./purge_dups/src/pbcstat -O coverage Mrose.ccs.reads.paf.gz

./purge_dups/src/calcuts PB.stat > cutoffs

./purge_dups/src/purge_dups -2 -c PB.base.cov -T cutoffs Mrose.asm.self.paf.gz > dups.bed

./purge_dups/src/get_seqs -e -p Mrose.purged -l 500 dups.bed Mrose.polished.fasta > Mrose.haplotype.fasta