echo "==> Menghitung file FastQC..."
N=$(ls *_fastqc.zip | wc -l)
echo "==> Total FastQC file: $N"
echo

echo "==> Menjalankan MultiQC..."
multiqc . \
  -o . \
  --force \
  --verbose

echo
echo "==> MultiQC selesai"
echo "==> Output: multiqc_report.html"
