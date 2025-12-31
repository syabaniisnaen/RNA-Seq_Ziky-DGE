#!/bin/bash

# Konfigurasi
FASTA_IN="hg38_ZIKV.fa"
INDEX_BASE="hg38_ZIKV_index"
THREADS=4

echo "============================================================"
echo "🏗️  Memulai Pembuatan Indeks HISAT2"
echo "📂 Input : $FASTA_IN"
echo "📂 Output: ${INDEX_BASE}.*.ht2"
echo "📅 Waktu : $(date)"
echo "============================================================"

# Menjalankan hisat2-build dengan pelacakan tahapan
# -p menggunakan multi-threading agar lebih cepat
hisat2-build -p $THREADS "$FASTA_IN" "$INDEX_BASE" 2>&1 | while read line; do
    # Menampilkan log asli sambil menambahkan tanda waktu
    echo "[$(date +%H:%M:%S)] $line"
    
    # Memberikan info tambahan pada tahapan krusial
    if [[ "$line" == *"Building FM Index"* ]]; then
        echo "   💡 INFO: Sedang membangun FM-Index (ini tahap paling lama...)"
    fi
done

echo "============================================================"
echo "✅ Pembuatan Indeks Selesai!"
echo "📅 Selesai pada: $(date)"
echo "============================================================"