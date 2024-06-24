library(survival)
library(xlsx)



##### response data #####

outcomes.c = read.xlsx("TMZ responses_ GLIOTRAIN n=22 samples_IN.xlsx", 1)
outcomes.c = outcomes.c[order(outcomes.c$X..cell.viability_100uM.TMZ),]
sampleNames.c = outcomes.c$GS.number
sampleNames.c = gsub("GS", "GS.", sampleNames.c, fixed = TRUE)


#### read exp ####
cell.count = read.table("count_data_24_cells.txt",sep = "\t", header = TRUE, row.names = 1)
cell.count22 = cell.count[sampleNames.c]

# metat data with batch information
meta.c = read.table("metadata_EMC_24_cells.txt",sep = "\t", header = TRUE, row.names = 1)
meta.c22 = meta.c[sampleNames.c,]
names(meta.c22) = sampleNames.c

run_pca(cell.count22)

#### remove batch effect ####
library(sva)
cell.batch.c = ComBat_seq(as.matrix(cell.count22), batch = meta.c22, group=NULL, full_mod=FALSE)
cell.batch.c = as.data.frame(cell.batch.c)
# pca
run_pca(cell.batch.c)

#### normalization ####
library(edgeR)

# filter
cell.obj = DGEList(counts=as.matrix(cell.batch.c), genes=rownames(cell.batch.c))
keep.expr.c = filterByExpr(cell.obj, min.count = 0, min.prop = 0.1) #, min.total.count = 1,min.count = 0
cell.filter = cell.obj[keep.expr.c,]

# norm
norm.factor.c = calcNormFactors(cell.filter, method = "TMM")
cell.cpm = cpm(norm.factor.c, log=TRUE)
cell.cpm = as.data.frame(cell.cpm)

write.csv(cell.cpm,"cell22cpm.csv")