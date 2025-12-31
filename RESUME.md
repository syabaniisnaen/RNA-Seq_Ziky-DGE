RESUME ANALISIS: Host Transcriptomic Response to Zika Virus Infection

Proyek ID: PRJNA485140 Analyst: Syabani Isnaen
1. Pendahuluan & Konteks Biologis

Analisis ini bertujuan untuk memahami bagaimana infeksi Virus Zika (ZIKV) mengubah ekspresi gen inang pada makrofag manusia (human monocyte-derived macrophages / hMDMs) seiring berjalannya waktu.

    Kondisi: Mock (Kontrol), Bystander, dan ZIKV-infected.

Titik Waktu: 12 jam, 18 jam, dan 24 jam pasca infeksi.

Pertanyaan Utama: Bagaimana profil ekspresi gen berubah secara temporal akibat infeksi ZIKV?

2. Metodologi (Workflow)

Analisis dilakukan dengan alur kerja bioinformatika yang sistematis:

    QC (Quality Control): Menggunakan FastQC dan MultiQC untuk memastikan kualitas reads sebelum proses alignment.

Alignment: Pemetaan reads ke genom referensi manusia (GRCh38) dan genom ZIKV menggunakan strategi dual alignment.

Quantification: Penghitungan jumlah reads per gen menggunakan featureCounts.

DGE Analysis: Analisis statistik menggunakan paket R DESeq2 untuk identifikasi gen yang terekspresi secara diferensial (DEGs).

3. Hasil Analisis Visual
A. Principal Component Analysis (PCA)

Visualisasi PCA (Rplot01.pdf) menunjukkan pengelompokan sampel berdasarkan profil ekspresi gennya.

    Varians: PC1 menjelaskan 51% varians data, yang secara jelas memisahkan kelompok berdasarkan status infeksi dan waktu.

Interpretasi: Sampel Mock cenderung mengelompok terpisah dari sampel Infected dan Bystander, menunjukkan adanya perubahan transkriptomik yang signifikan akibat paparan virus.

B. Analisis Diferensial (Volcano Plots)

Berdasarkan hasil Volcano Plots, ditemukan ribuan variabel gen yang mengalami perubahan ekspresi signifikan (Log2​ Fold Change > 1 atau < -1 dengan p-value yang signifikan):

    Bystander vs Mock: Menunjukkan respon sel yang terpapar lingkungan terinfeksi namun tidak terinfeksi secara langsung.

Infected vs Mock: Menunjukkan respon imun inang yang sangat kuat terhadap infeksi virus langsung, termasuk deteksi gen spesifik ZIKV.

Temporal (24h vs 12h): Menunjukkan progresi respon inang yang dinamis seiring bertambahnya durasi infeksi.

4. Struktur Repositori

Seluruh data dan script telah diorganisir agar dapat direproduksi sepenuhnya:

    00_data: Metadata dan script pengunduhan data.

01_fastqc: Laporan kualitas data mentah.

02_alignment: Script pemetaan genom dan referensi FASTA.

03_counts: Matriks hitungan gen (raw counts).

04_dge: Script R dan hasil akhir analisis statistik (CSV & PDF).

5. Kesimpulan Sementara

Analisis ini berhasil mengidentifikasi profil gen yang up-regulated dan down-regulated pada berbagai kondisi. Adanya pemisahan yang jelas pada plot PCA dan banyaknya gen signifikan pada Volcano Plot mengonfirmasi bahwa infeksi ZIKV memicu respon transkriptomik yang masif pada makrofag manusia.