#!/bin/bash

# --- Konfigurasi Jalur ---
# Folder tempat file fastq berada
FASTQ_DIR=/media/isna/mypassport/S2/RNA-Seq/ZIKV_DGE/00_data/fastq/sample-fastq

# Jalur Index yang diperbarui: Path folder + Basename file (.1.ht2 dst tidak perlu ditulis)
INDEX=/media/isna/mypassport/S2/RNA-Seq/ZIKV_DGE/03_alignment/index/genome/hg38_ziky-index/hg38_ZIKV_index

THREADS=4

# Menghitung total file untuk indikator progres
files=($FASTQ_DIR/*.fastq)
total_files=${#files[@]}
current_count=0

# Pastikan kita bekerja di direktori tempat script dijalankan untuk output
echo "🚀 Memulai proses alignment untuk $total_files sampel..."
echo "📂 Menggunakan Index: $INDEX"
echo

for fq in "${files[@]}"
do
  [ -e "$fq" ] || continue
  ((current_count++))
  sample=$(basename "$fq" .fastq)

  echo "============================================================"
  echo "📊 Sampel $current_count dari $total_files"
  echo "⏳ Sedang Memproses: $sample"
  echo "📅 Mulai pada: $(date +%H:%M:%S)"
  echo "============================================================"

  # Menjalankan HISAT2
  # Menggunakan -U untuk single-end reads
  hisat2 \
    -x "$INDEX" \
    -U "$fq" \
    -p "$THREADS" \
    --summary-file "${sample}_hisat2_summary.txt" \
    --new-summary | \
  samtools sort -@ "$THREADS" -o "${sample}.bam" && \
  samtools index "${sample}.bam"

  echo "------------------------------------------------------------"
  # Menampilkan ringkasan hasil alignment di layar (menyesuaikan format --new-summary)
  if [ -f "${sample}_hisat2_summary.txt" ]; then
    echo "📈 Ringkasan Alignment $sample:"
    grep -E "Overall alignment rate|Aligned" "${sample}_hisat2_summary.txt"
  fi
  echo "✅ Selesai: ${sample}.bam"
  echo "============================================================"
  echo
done

echo "🎉 Semua proses telah selesai pada $(date)"