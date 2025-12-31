counts <- read.delim("counts_final.tsv", row.names = 1, check.names = FALSE)
coldata <- read.csv("sample_metadata.csv", row.names = 1)

all(colnames(counts) == rownames(coldata))

#1 load paket
library(DESeq2)
library(tidyverse)
library(pheatmap)
library(EnhancedVolcano)


#A. Import data (tanpa drama)
library(DESeq2)

counts <- read.table(
  "counts_final.tsv",
  header = TRUE,
  row.names = 1,
  sep = "\t",
  check.names = FALSE
)

coldata <- read.csv(
  "sample_metadata.csv",
  row.names = 1
)

#Cek wajib (kalau beda → STOP)
all(colnames(counts) == rownames(coldata))


#Set faktor
coldata$condition <- factor(
  coldata$condition,
  levels = c("mock", "bystander", "infected")
)

coldata$time <- factor(
  coldata$time,
  levels = c("12h", "18h", "24h")
)

#------

table(coldata$condition, useNA = "ifany")

head(coldata)
colnames(coldata)
str(coldata)

#------
coldata$condition <- as.character(coldata$condition)

rownames(coldata)

coldata$condition <- ifelse(
  grepl("mock", rownames(coldata)), "mock",
  ifelse(
    grepl("bystander", rownames(coldata)), "bystander",
    "infected"
  )
)

table(coldata$condition)

#STEP 3 — BARU jadikan factor (INI URUTANNYA)
coldata$condition <- factor(coldata$condition,
                            levels = c("mock", "bystander", "infected"))

coldata$time <- factor(coldata$time,
                       levels = c("12h", "18h", "24h"))

stopifnot(!any(is.na(coldata$condition)))
stopifnot(!any(is.na(coldata$time)))


#Buat DESeq2 object (INI INTI-NYA)
dds <- DESeqDataSetFromMatrix(
  countData = counts,
  colData   = coldata,
  design    = ~ time + condition
)

#Filtering dasar (WAJIB)
keep <- rowSums(counts(dds) >= 10) >= 3
dds <- dds[keep, ]


#Jalankan DESeq2
dds <- DESeq(dds)

#QC GLOBAL (INI BUKAN OPSIONAL)
vsd <- vst(dds, blind = FALSE)
plotPCA(vsd, intgroup = c("condition", "time"))

#Sample distance heatmap
library(pheatmap)
sampleDists <- dist(t(assay(vsd)))
pheatmap(as.matrix(sampleDists),
         annotation_col = coldata)

#KONTRAS BIOLOGIS YANG SAH (INI PENTING)
res_infected_vs_mock <- results(dds,
                                contrast = c("condition", "infected", "mock"))


#2Efek bystander
res_bystander_vs_mock <- results(dds,
                                 contrast = c("condition", "bystander", "mock"))

#Efek waktu
res_24h_vs_12h <- results(dds,
                          contrast = c("time", "24h", "12h"))

#SIMPAN HASIL (WAJIB UNTUK PORTOFOLIO)
write.csv(as.data.frame(res_infected_vs_mock),
          file = "DEG_infected_vs_mock.csv")

write.csv(as.data.frame(res_bystander_vs_mock),
          file = "DEG_bystander_vs_mock.csv")

write.csv(as.data.frame(res_24h_vs_12h),
          file = "DEG_24h_vs_12h.csv")


#8️⃣ Volcano Plot (SATU CONTOH)
library(EnhancedVolcano)


EnhancedVolcano(
  res_infected_vs_mock,
  lab = rownames(res_infected_vs_mock),
  x = "log2FoldChange",
  y = "pvalue",
  pCutoff = 0.05,
  FCcutoff = 1,
  title = "Infected vs Mock",
  subtitle = "Global effect across all timepoints",
  caption = "DESeq2 ~ time + condition"
)


EnhancedVolcano(
  res_bystander_vs_mock,
  lab = rownames(res_bystander_vs_mock),
  x = "log2FoldChange",
  y = "pvalue",
  pCutoff = 0.05,
  FCcutoff = 1,
  title = "Bystander vs Mock",
  subtitle = "Paracrine / indirect response",
  caption = "DESeq2 ~ time + condition"
)


EnhancedVolcano(
  res_24h_vs_12h,
  lab = rownames(res_24h_vs_12h),
  x = "log2FoldChange",
  y = "pvalue",
  pCutoff = 0.05,
  FCcutoff = 1,
  title = "24h vs 12h",
  subtitle = "Time-dependent transcriptional changes",
  caption = "DESeq2 ~ time + condition"
)

#(OPSIONAL TAPI DEWASA) Simpan ke file
pdf("Volcano_Infected_vs_Mock.pdf")
EnhancedVolcano(res_infected_vs_mock,
                lab = rownames(res_infected_vs_mock),
                x = "log2FoldChange",
                y = "pvalue",
                pCutoff = 0.05,
                FCcutoff = 1)
dev.off()

pdf("Volcano_Bystander_vs_Mock.pdf")
EnhancedVolcano(res_bystander_vs_mock,
                lab = rownames(res_bystander_vs_mock),
                x = "log2FoldChange",
                y = "pvalue",
                pCutoff = 0.05,
                FCcutoff = 1)
dev.off()

pdf("Volcano_24h_vs_12h.pdf")
EnhancedVolcano(res_24h_vs_12h,
                lab = rownames(res_24h_vs_12h),
                x = "log2FoldChange",
                y = "pvalue",
                pCutoff = 0.05,
                FCcutoff = 1)
dev.off()

