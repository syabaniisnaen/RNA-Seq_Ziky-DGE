# 03_counts — Read Quantification

## Objective
This step quantifies aligned RNA-seq reads into gene-level count matrices.
The objective is to convert aligned BAM files into structured count data suitable for differential gene expression (DGE) analysis.

Because alignment was performed using a **combined host–virus reference**, read quantification explicitly distinguishes:
- Host (human) gene expression
- Viral (ZIKV) gene expression

---

## Input
From previous step (02_alignment):
- Sorted and indexed BAM files
  - `*.sorted.bam`

Reference data:
- Combined annotation file (GTF)
  - Human genes (GRCh38)
  - Viral genes (ZIKV)

---

## Quantification Strategy
- Gene-level read counting
- Paired-end aware
- Strand-specific settings explicitly defined (if applicable)
- Multi-mapped reads handled consistently (documented in script)

Counts are generated **per sample** and later merged into a single count matrix.

---

## Tools Used
- **Read counting**: featureCounts (Subread)
- **BAM handling**: samtools

---

## Folder Structure
