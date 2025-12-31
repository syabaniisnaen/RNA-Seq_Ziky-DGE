# Mengambil nama sampel dari header (baris pertama) counts_final.tsv
head -n 1 counts_final.tsv | tr '\t' '\n' | grep -v "Geneid" > samples.txt

echo "sample,condition,time" > sample_metadata.csv

while read s; do
    # Logika sederhana untuk menentukan kondisi dan waktu berdasarkan nama file
    if [[ $s == *"mock"* ]]; then cond="Mock"; else cond="Infected"; fi
    
    if [[ $s == *"12h"* ]]; then time="12h"; 
    elif [[ $s == *"18h"* ]]; then time="18h"; 
    else time="24h"; fi
    
    echo "$s,$cond,$time" >> sample_metadata.csv
done < samples.txt

rm samples.txt
echo "✅ File metadata berhasil dibuat: sample_metadata.csv"
column -t -s ',' sample_metadata.csv