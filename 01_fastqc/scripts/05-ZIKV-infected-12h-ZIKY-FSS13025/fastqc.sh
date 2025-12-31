#!/bin/bash

# 1. Tentukan Direktori
OUTDIR=/media/isna/mypassport/S2/RNA-Seq/ZIKV_DGE/01_fastqc/05_ZIKV-infected-12h-ZIKY-FSS13025
THREADS=4

# 2. Pastikan OUTDIR sudah ada (Penting!)
mkdir -p "$OUTDIR"

# 3. Ambil semua file fastq
files=(*.fastq)
total=${#files[@]}

echo "[$(date '+%H:%M:%S')] Memulai FastQC untuk $total file menggunakan $THREADS threads..."

# 4. Jalankan FastQC secara paralel (langsung semua file)
# Ini jauh lebih cepat karena 4 file akan diproses sekaligus secara bersamaan
fastqc "${files[@]}" -o "$OUTDIR" --threads "$THREADS"

echo "[$(date '+%H:%M:%S')] FastQC selesai."