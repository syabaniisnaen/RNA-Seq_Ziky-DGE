OUTDIR=/media/isna/mypassport/S2/RNA-Seq/ZIKV_DGE/01_fastqc/04_ZIKV-bystander-24h-ZIKY-FSS13025
THREADS=4

files=(*.fastq)
total=${#files[@]}
i=1

for f in "${files[@]}"; do
  echo "[$(date '+%H:%M:%S')] ($i/$total) FastQC: $f"
  fastqc "$f" -o "$OUTDIR" --threads "$THREADS"
  i=$((i+1))
done

echo "[$(date '+%H:%M:%S')] FastQC selesai untuk $total file."
