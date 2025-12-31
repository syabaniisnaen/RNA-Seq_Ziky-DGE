#!/bin/bash

echo "🧹 Merapikan matriks hasil featureCounts..."

# 1. Mengambil kolom 1 (Geneid) dan kolom 7 sampai akhir (Data Counts)
# Sekaligus menghapus baris pertama (baris command log dari featureCounts)
grep -v "^#" featureCounts_results.txt | cut -f1,7- > counts_final.tsv

# 2. Membersihkan nama kolom (Header)
# Menghapus path folder yang panjang
sed -i 's/\/media\/isna\/mypassport\/S2\/RNA-Seq\/ZIKV_DGE\/03_alignment\/bam2\///g' counts_final.tsv

# Menghapus ekstensi .bam
sed -i 's/\.bam//g' counts_final.tsv

echo "============================================================"
echo "✅ Matriks bersih telah dibuat: counts_final.tsv"
echo "📊 Intip 5 baris pertama hasil pembersihan:"
echo "============================================================"

# Menampilkan hasil dengan format tabel agar enak dibaca
head -n 5 counts_final.tsv | column -t