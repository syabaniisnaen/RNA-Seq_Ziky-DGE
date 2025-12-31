#!/bin/bash

# Menulis Header Tabel
echo -e "sample\tZIKV_mapped\ttotal_mapped_host_virus\tunmapped_reads" > zikv_detailed_summary.tsv

for f in *.idxstats.txt
do
    sample=$(basename "$f" .idxstats.txt)
    
    # 1. Mapped reads ke ZIKV (Baris MH158236.1, Kolom 3)
    zikv=$(awk '$1=="MH158236.1" {print $3}' "$f")
    
    # 2. Total mapped reads (Host + Virus) 
    # Menjumlahkan semua angka di kolom 3 kecuali baris terakhir (*)
    total_mapped=$(awk '$1 != "*" {sum += $3} END {print sum}' "$f")
    
    # 3. Unmapped reads (Baris *, Kolom 4)
    unmapped=$(awk '$1=="*" {print $4}' "$f")
    
    # Gabungkan ke file (dengan pengaman jika ada nilai kosong diisi 0)
    echo -e "$sample\t${zikv:-0}\t${total_mapped:-0}\t${unmapped:-0}" >> zikv_detailed_summary.tsv
done

# Menampilkan hasil akhir
column -t -s $'\t' zikv_detailed_summary.tsv