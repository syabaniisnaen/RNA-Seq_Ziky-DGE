# RNA-Seq_Ziky-DGE PRJNA485140
**Host Transcriptomic Response to Zika Virus Infection (RNA-Seq Differential Gene Expression Analysis)**

---

## Overview
This repository contains a complete, reproducible RNA-seq analysis workflow to study
**host (human) transcriptional responses** to **Zika virus (ZIKV) infection**.

The project focuses on:
- Quality control of RNA-seq reads
- Alignment to host and viral reference genomes
- Gene-level quantification
- Differential gene expression (DGE) analysis

The workflow follows best practices for bulk RNA-seq analysis and is organized in a
clear, stepwise folder structure suitable for academic and professional portfolios.

---

## Biological Context
- **Host**: Human monocyte-derived macrophages (hMDMs)
- **Conditions**:
  - Mock (control)
  - Bystander
  - ZIKV-infected
- **Time points**: 12h, 18h, 24h post infection
- **Sequencing type**: Paired-end RNA-seq

The primary biological question:
> How does ZIKV infection alter host gene expression over time?

---

## Repository Structure

```text
.
├── 00_data
│   ├── metadata
│   │   ├── experimental_design.md
│   │   ├── metadata-PRJNA485140.xlsx
│   │   └── SRR_Acc_List.txt
│   ├── README.md
│   └── scripts
│       ├── 01-Download-SRR-PRJNA485140.sh
│       └── 02-convert-sra-fastq.sh
├── 01_fastqc
│   ├── README.md
│   ├── results
│   │   ├── 01-mock-infected-24h_SRX4521348_fastqc.html
│   │   ├── 01-mock-infected-24h_SRX4521353_fastqc.html
│   │   ├── 01-mock-infected-24h_SRX4521358_fastqc.html
│   │   ├── 01-mock-infected-24h_SRX4521365_fastqc.html
│   │   ├── 01-mock-infected-24h_SRX4521372_fastqc.html
│   │   ├── 02-ZIKV-bystander-12h-ZIKY-FSS13025_SRX4521359_fastqc.html
│   │   ├── 02-ZIKV-bystander-12h-ZIKY-FSS13025_SRX4521366_fastqc.html
│   │   ├── 02-ZIKV-bystander-12h-ZIKY-FSS13025_SRX4521373_fastqc.html
│   │   ├── 03-ZIKV-bystander-18h-ZIKY-FSS13025_SRX4521360_fastqc.html
│   │   ├── 03-ZIKV-bystander-18h-ZIKY-FSS13025_SRX4521367_fastqc.html
│   │   ├── 03-ZIKV-bystander-18h-ZIKY-FSS13025_SRX4521374_fastqc.html
│   │   ├── 04-ZIKV-bystander-24h-ZIKY-FSS13025_SRX4521349_fastqc.html
│   │   ├── 04-ZIKV-bystander-24h-ZIKY-FSS13025_SRX4521354_fastqc.html
│   │   ├── 04-ZIKV-bystander-24h-ZIKY-FSS13025_SRX4521361_fastqc.html
│   │   ├── 04-ZIKV-bystander-24h-ZIKY-FSS13025_SRX4521368_fastqc.html
│   │   ├── 04-ZIKV-bystander-24h-ZIKY-FSS13025_SRX4521375_fastqc.html
│   │   ├── 05-ZIKV-infected-12h-ZIKY-FSS13025_SRX4521362_fastqc.html
│   │   ├── 05-ZIKV-infected-12h-ZIKY-FSS13025_SRX4521369_fastqc.html
│   │   ├── 05-ZIKV-infected-12h-ZIKY-FSS13025_SRX4521376_fastqc.html
│   │   ├── 06-ZIKV-infected-18h-ZIKY-FSS13025_SRX4521363_fastqc.html
│   │   ├── 06-ZIKV-infected-18h-ZIKY-FSS13025_SRX4521370_fastqc.html
│   │   ├── 06-ZIKV-infected-18h-ZIKY-FSS13025_SRX4521377_fastqc.html
│   │   ├── 07-ZIKV-infected-24h-ZIKY-FSS13025_SRX4521350_fastqc.html
│   │   ├── 07-ZIKV-infected-24h-ZIKY-FSS13025_SRX4521355_fastqc.html
│   │   ├── 07-ZIKV-infected-24h-ZIKY-FSS13025_SRX4521364_fastqc.html
│   │   ├── 07-ZIKV-infected-24h-ZIKY-FSS13025_SRX4521371_fastqc.html
│   │   ├── 07-ZIKV-infected-24h-ZIKY-FSS13025_SRX4521378_fastqc.html
│   │   └── multiqc_report.html
│   └── scripts
│       ├── 01-mock-infected-24h
│       ├── 02-multiqc.sh
│       ├── 02-ZIKV-bystander-12h-ZIKY-FSS13025
│       ├── 03-ZIKV-bystander-18h-ZIKY-FSS13025
│       ├── 04-ZIKV-bystander-24h-ZIKY-FSS13025
│       ├── 05-ZIKV-infected-12h-ZIKY-FSS13025
│       ├── 06-ZIKV-infected-18h-ZIKY-FSS13025
│       └── 07-ZIKV-infected-24h-ZIKY-FSS13025
├── 02_alignment
│   ├── README.md
│   ├── results
│   │   ├── total_alignment_report.txt
│   │   ├── zikv_detailed_summary.tsv
│   │   └── ZIKV_FSS13025.fasta
│   └── scripts
│       ├── 01-download-hg38.sh
│       ├── 02-extract-hg38.sh
│       ├── 03-make-gtf-ziky.sh
│       ├── 04-merge-hg38-ziky.sh
│       ├── 05-build-index-hg38_ziky.sh
│       ├── 06-HISAT2-HG38-ZIKY.sh
│       ├── 07-samtools.sh
│       ├── 08-qc-alignment.sh
│       ├── 09-qc-alignment-save-to-txt.sh
│       └── 11-resume.sh
├── 03_counts
│   ├── README.md
│   ├── results
│   │   ├── counts_final.tsv
│   │   ├── featureCounts_results.txt
│   │   ├── featureCounts_results.txt.summary
│   │   └── sample_metadata.csv
│   └── scripts
│       ├── 01-feature-count.sh
│       ├── 02-cek-ziky.sh
│       ├── 03-Membersihkan-Matriks-untuk-R-(DESeq2).sh
│       └── 04-Membuat-File-Metadata.sh
├── 04_dge
│   ├── README.md
│   ├── results
│   │   ├── DEG_24h_vs_12h.csv
│   │   ├── DEG_bystander_vs_mock.csv
│   │   ├── DEG_infected_vs_mock.csv
│   │   ├── input-file
│   │   ├── Rplot01.pdf
│   │   ├── Rplot02.pdf
│   │   ├── Volcano_24h_vs_12h.pdf
│   │   ├── Volcano_Bystander_vs_Mock.pdf
│   │   └── Volcano_Infected_vs_Mock.pdf
│   └── scripts
│       └── dge.R
└── README.md

Each numbered directory represents **one logical analysis stage**.
Scripts are stored **within each step** to ensure local reproducibility and clarity.

---

## Workflow Summary

### 00_data — Data Preparation
- Sample metadata
- Reference genome information
- Data organization scripts

### 01_fastqc — Quality Control
- FastQC and MultiQC reports
- Assessment of:
  - Per-base quality
  - GC content
  - Sequence duplication
  - Read length distribution
- **No trimming applied**, based on QC results

### 02_alignment — Read Alignment
- Alignment against:
  - Human genome (GRCh38)
  - ZIKV genome (dual alignment strategy)
- Generation of sorted and indexed BAM files
- Alignment quality evaluation

### 03_counts — Gene Quantification
- Gene-level read counting
- Host genes prioritized for downstream analysis
- Generation of raw count matrices

### 04_dge — Differential Gene Expression
- Statistical analysis using DESeq2
- Normalization and variance stabilization
- Identification of differentially expressed genes (DEGs)
- Visualization (PCA, MA plots, volcano plots)

---

## Tools & Technologies
- **QC**: FastQC, MultiQC
- **Alignment**: HISAT2 / STAR, samtools
- **Quantification**: featureCounts
- **Statistics**: DESeq2 (R/Bioconductor)
- **Environment management**: Conda

All dependencies are defined in `environment.yml`.

---

## Reproducibility
To recreate the analysis environment:
```bash
conda env create -f environment.yml
conda activate bioinfo


