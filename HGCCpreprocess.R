# read exp and AUC
swd.exp = read.csv("../hgccData/HGCC_RNA_expression.txt",sep = "\t")
swd.outcomes.tmz = read.csv("../HGCC_drugTMZ_response_AUC.txt",sep = "\t") 

# match id
swd.id = gsub(".1","",colnames(swd.exp),fixed = TRUE)
swd.outcome.id = substr(swd.outcomes.tmz$cell.line,1,5)

# duplicates in outcomes
# swd.outcome.id[duplicated(swd.outcome.id)]
# [1] "U3008" "U3013" "U3013" "U3024" "U3024" "U3054" "U3065" "U3065" "U3065" "U3065" "U3065" "U3065"
# [13] "U3065" "U3065" "U3078" "U3082" "U3082" "U3173" "U3180" "U3180" "U3214"

# find overlap samples in exp and AUC
swd.overlap = intersect(unique(swd.id),unique(swd.outcome.id))
swd.outcome.id[duplicated(swd.outcome.id)][swd.outcome.id[duplicated(swd.outcome.id)] %in% swd.overlap]

## summarize the biological duplicates with mean
swd.outcomes.tmz.m = swd.outcomes.tmz
# cell line identifiers
swd.outcomes.tmz.m$cell.line = substr(swd.outcomes.tmz.m$cell.line,1,5)
# select overlap
swd.outcomes.tmz.m = swd.outcomes.tmz.m[swd.outcomes.tmz.m$cell.line %in% swd.overlap,]
# swd.exp.1 = swd.exp[swd.overlap]
swd.outcomes.tmz.m1 = aggregate(swd.outcomes.tmz.m, by = list(swd.outcomes.tmz.m$cell.line), FUN = "mean")

# run PCA
# run_pca(swd.exp.1, grp = swd.outcomes.tmz.m1$AUC_Temozolomide,scale = TRUE,center = TRUE)