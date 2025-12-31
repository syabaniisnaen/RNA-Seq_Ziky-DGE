# 04_dge — Differential Gene Expression Analysis

## Objective
This step identifies genes whose expression levels change significantly between experimental conditions.
The goal is to extract biologically meaningful signals from raw count data using statistically robust models.

Differential expression analysis is performed **only on host (human) genes**.
Viral gene counts are analyzed separately as descriptive or supportive data.

---

## Input
From previous step (03_counts):
- Gene-level raw count matrix
  - `counts_final.tsv`

Metadata:
- Sample information table
  - Condition (mock, bystander, infected)
  - Time point (12h, 18h, 24h)
  - Replicate identifiers

---

## Experimental Design
The primary experimental factors include:
- **Infection status**: mock vs bystander vs infected
- **Time point**: 12h, 18h, 24h

The design formula explicitly accounts for:
- Biological condition
- Time-dependent effects
- Replicate variability

Example design (conceptual):


---

## Statistical Framework
- Count-based model using negative binomial distribution
- Library size differences handled via internal normalization
- Multiple testing correction applied

---

## Tools Used
- **Primary DGE tool**: DESeq2 (R/Bioconductor)
- **Data handling & visualization**: tidyverse, pheatmap, ggplot2

---

## Folder Structure
