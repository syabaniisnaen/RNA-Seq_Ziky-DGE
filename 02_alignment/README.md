# 02_alignment — Read Alignment

## Objective
This step performs read alignment of quality-controlled RNA-seq reads against reference genomes.
The objective is to generate accurate and reproducible BAM files for downstream read quantification and differential expression analysis.

In this project, reads are aligned against **two reference genomes**:
- **Host genome**: Human (GRCh38)
- **Viral genome**: Zika virus (ZIKV)

A **combined genome index (GRCh38 + ZIKV)** is used to enable simultaneous host–virus alignment and to distinguish host-mapped, virus-mapped, and unmapped reads.

---

## Input
From previous steps:
- Quality-controlled paired-end FASTQ files
  - `*_R1.fastq.gz`
  - `*_R2.fastq.gz`

Reference data:
- Combined genome FASTA (GRCh38 + ZIKV)
- Combined annotation GTF
- Pre-built aligner index derived from the combined reference

---

## Tools Used
- **Aligner**: HISAT2 or STAR (single aligner used consistently throughout the project)
- **SAM/BAM processing**: samtools
- **Alignment quality assessment**: samtools flagstat

---

