## Input
Paired-end RNA-seq FASTQ files generated from hMDMs samples.

## Tools
- FastQC v0.11.x
- MultiQC v1.x

# 01_fastqc — Quality Control Assessment

This step evaluates the quality of raw RNA-seq reads prior to downstream analysis.
The goal is to assess sequencing quality, detect potential technical issues,
and make an informed decision on whether read trimming is required.

---

## Input
Raw RNA-seq FASTQ files generated from human monocyte-derived macrophages (hMDMs)
under mock, ZIKV-bystander, and ZIKV-infected conditions at multiple time points.

---

## Tools
- **FastQC**
- **MultiQC**

---

## QC Findings

### 1. Sample Naming Consistency
Sample names were standardized using the `--fn_as_s_name` flag, resulting in clear
grouping by experimental condition:
- **01-mock**: Mock control  
- **02–04**: ZIKV Bystander (12h, 18h, 24h)  
- **05–07**: ZIKV Infected (12h, 18h, 24h)

This consistent naming scheme facilitates downstream grouping and interpretation
across all analysis steps.

---

### 2. Sequence Duplication Levels
- **Observed range**: 39.8% – 63.5% duplicated reads  
- **Highest duplication**: 07-ZIKV-infected-24h_SRX4521378 (>60%)

**Interpretation:**  
Duplication levels above 50% are relatively high but are consistently observed
across samples. In RNA-seq experiments, elevated duplication often reflects
biologically meaningful overexpression of specific transcripts (e.g.
interferon-stimulated genes during viral infection), rather than purely technical
PCR artifacts.  
Given the uniform pattern across conditions, duplication is not considered a
critical technical concern for downstream differential gene expression analysis.

---

### 3. GC Content
- **Observed range**: 45% – 50%  
- **Pattern**: Highly consistent across all samples

**Interpretation:**  
This GC content range is characteristic of the human transcriptome and shows no
evidence of major contamination (e.g. bacterial RNA). Consistency across samples
indicates stable library preparation.

---

### 4. Read Length Distribution
Two median read-length groups were observed:
- **50 bp**: Majority of samples  
- **76 bp**: Subset of samples across mock, bystander, and infected groups

**Interpretation:**  
Although read lengths vary, both lengths are well supported by modern splice-aware
aligners such as STAR and HISAT2. This variability must be considered during
alignment parameterization but does not invalidate the dataset.

---

### 5. Sequencing Depth (Total Reads)
- **Range**: 11.0M – 69.8M reads per sample  
- **Lowest depth**: 07-ZIKV-infected-24h_SRX4521371 (~11.0M reads)  
- **Highest depth**: 06-ZIKV-infected-18h_SRX4521377 (~69.8M reads)

**Interpretation:**  
All samples meet or exceed the commonly accepted minimum depth for human RNA-seq
differential expression analysis (~10–15M reads). However, the wide range in
sequencing depth necessitates robust normalization during downstream statistical
analysis.

---

### 6. Base Quality Distribution
Based on sequence quality histograms:
- Base quality scores remain **> Q30** across the effective read length
- A sharp quality drop is observed **after ~230 bp**

**Interpretation:**  
Since the median read lengths are 50–76 bp, quality degradation beyond 200 bp does
not affect the usable portion of the reads. Overall base quality is considered
excellent.

---

## Sequence Counts and Duplication Overview

The Sequence Counts plot divides reads into:
- **Unique reads** (light blue)
- **Duplicate reads** (gray)

**Key observations:**
- Substantial variation in total read counts across samples
- Infected 24h samples show the highest proportion of duplicate reads
- This trend is consistent with strong transcriptional activation following ZIKV
  infection

**Important note:**  
Duplicate reads were **not removed**. In RNA-seq experiments, duplicate reads often
represent genuine biological signal from highly expressed genes. Removing them
(deduplication) may bias expression estimates and is therefore not recommended.

---

## QC Conclusion and Decision

- Overall sequencing quality is high across all samples  
- No major technical artifacts or contamination were detected  
- Read length variability and sequencing depth differences are manageable with
  appropriate alignment settings and normalization strategies  

**Decision:**  
❌ **No trimming was performed**

The observed data quality does not justify adapter or quality trimming, and
preserving the original reads avoids unnecessary information loss.

The dataset is suitable for direct progression to the alignment stage.

---

## Next Step
Proceed to **02_alignment**, ensuring that the chosen aligner and parameters can
robustly handle:
- Variable read lengths (50–76 bp)
- Large differences in sequencing depth across samples

