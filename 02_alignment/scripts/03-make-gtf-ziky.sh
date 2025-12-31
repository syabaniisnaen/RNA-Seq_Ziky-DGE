grep ">" ZIKV_FSS13025.fasta
# >MH158236.1 Zika virus isolate FSS13025, complete genome
grep -v ">" ZIKV_FSS13025.fasta | tr -d '\n' | wc -c
# 10807

#Buat File GTF Zika
echo -e "MH158236.1\tManual\tgene\t1\t10807\t.\t+\t.\tgene_id \"ZIKV_Gene\"; gene_name \"ZIKV_FSS13025\";" > ZIKV_FSS13025.gtf
echo -e "MH158236.1\tManual\texon\t1\t10807\t.\t+\t.\tgene_id \"ZIKV_Gene\"; transcript_id \"ZIKV_Trans\";" >> ZIKV_FSS13025.gtf

#Gabungkan dengan Anotasi Manusia (Gencode)
cat gencode.v45.annotation.gtf ZIKV_FSS13025.gtf > hg38_ZIKV_combined.gtf

#Verifikasi Penggabungan
tail -n 5 hg38_ZIKV_combined.gtf