echo "## 1) LIST FILE + SIZE"
ls -lh *.fastq
echo

echo "## 2) LINE COUNT"
wc -l *.fastq
echo

echo "## 3) MOD 4 CHECK (HARUS 0)"
for f in *.fastq; do
  echo -n "$f : "
  expr $(wc -l < "$f") % 4
done
echo

echo "## 4) HEADER PREVIEW (4 baris pertama)"
for f in *.fastq; do
  echo "=== $f ==="
  head -n 4 "$f"
  echo
done
