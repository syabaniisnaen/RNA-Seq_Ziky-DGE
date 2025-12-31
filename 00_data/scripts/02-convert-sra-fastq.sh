mkdir -p FASTQ

for sra in SRR*/SRR*.sra; do
    echo "Processing $sra ..."
    fasterq-dump "$sra" --split-files -O FASTQ -e 4
done