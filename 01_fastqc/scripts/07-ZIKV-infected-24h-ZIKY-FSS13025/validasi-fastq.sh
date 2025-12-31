echo "## 1) LIST FILE + SIZE"
ls -lh *.fastq
echo

echo "## 2) LINE COUNT (WITH PROGRESS)"
for f in *.fastq; do
  echo "Counting lines: $f"
  pv "$f" | wc -l
done
echo

echo "## 3) MOD 4 CHECK (HARUS 0, WITH PROGRESS)"
for f in *.fastq; do
  echo -n "$f : "
  pv "$f" | wc -l | awk '{print $1 % 4}'
done
echo

echo "## 4) HEADER PREVIEW (4 BARIS PERTAMA)"
for f in *.fastq; do
  echo "=== $f ==="
  head -n 4 "$f"
  echo
done
