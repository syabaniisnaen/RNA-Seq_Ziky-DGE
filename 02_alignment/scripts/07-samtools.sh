#!/bin/bash

mkdir -p idxstats

# Hitung total file BAM untuk indikator progres
total_files=$(ls -1 *.bam 2>/dev/null | wc -l)
current_count=0

if [ "$total_files" -eq 0 ]; then
    echo "❌ Tidak ditemukan file .bam di direktori ini!"
    exit 1
fi

echo "============================================================"
echo "📊 Memulai Perhitungan Statistik (idxstats)"
echo "📂 Total File: $total_files"
echo "============================================================"

for bam in *.bam
do
    ((current_count++))
    sample=$(basename "$bam" .bam)

    # Menampilkan progres sederhana di terminal
    echo -n "⏳ [$current_count/$total_files] Memproses: $sample... "

    # Menjalankan samtools idxstats
    samtools idxstats "$bam" > idxstats/"$sample".idxstats.txt

    echo "✅ Selesai"
done

echo "============================================================"
echo "🎉 Semua statistik telah disimpan di folder: idxstats/"
echo "============================================================"