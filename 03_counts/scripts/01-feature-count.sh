#!/bin/bash

# 1. Konfigurasi Lokasi
OUT_DIR="/media/isna/mypassport/S2/RNA-Seq/ZIKV_DGE/04_counts"
GTF="/media/isna/mypassport/S2/RNA-Seq/ZIKV_DGE/03_alignment/index/genome/hg38_ZIKV_combined.gtf"

# Menghitung jumlah file BAM untuk informasi
total_files=$(ls -1 *.bam | wc -l)

echo "============================================================"
echo "🚀 Memulai Read Counting (featureCounts)"
echo "📂 Total File BAM : $total_files"
echo "📂 File Anotasi   : $(basename $GTF)"
echo "📅 Waktu Mulai    : $(date +%H:%M:%S)"
echo "============================================================"

# 2. Jalankan featureCounts dengan stdbuf untuk memaksa log keluar seketika
# Kita menggunakan 'stdbuf -oL' agar output log tidak tertahan di buffer
stdbuf -oL featureCounts -T 4 -Q 10 \
  -a "$GTF" \
  -o "$OUT_DIR/featureCounts_results.txt" \
  -g gene_id \
  -t exon \
  *.bam 2>&1 | while read line; do
    
    # Menampilkan baris log asli
    echo "$line"
    
    # Memberikan penanda visual jika masuk ke tahap pemrosesan file
    if [[ "$line" == *"Process"* ]]; then
        echo "   🔄 Sedang memproses fragmen..."
    fi
done

echo "============================================================"
echo "✅ Selesai pada: $(date +%H:%M:%S)"
echo "📊 Matriks: $OUT_DIR/featureCounts_results.txt"
echo "📊 Ringkasan: $OUT_DIR/featureCounts_results.txt.summary"
echo "============================================================"