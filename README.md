# two-step-TL
Here we deposit the code and the models (weights) of the implementation of the framework "Two-step transfer learning improves deep learning-based drug response prediction in small datasets: A case study of glioblastoma". The goal of the study is to investigate how transfer learning (TL) alleviates the small sample size problem. A two-step TL framework was constructed for a difficult task: predicting the response of the drug temozolomide (TMZ) in glioblastoma (GBM) cell cultures.

# data
Three publicly available datasets were used in the study. 
GDSC dataset contains 558-710 cell cultures from 20-32 tissue sites (including GBM) treated by TMZ, Bortezomib, Cyclophosphamide and Oxaliplatin, respectively.
HGCC contains 83 GBM cell cultures treated by TMZ.
GSE232173 contains 22 GBM cell cultures treated by TMZ.

# Experiments
The entire study design consists of seven experiments. The python code, as well as the weights saved in transfer learning, is deposit here in Jupyter Notebook.
Experiment 1: Constructing four DL models on the GDSC dataset containing mRNA expression of cell cultures from various tissue sites for response prediction of four drugs: a) Temozolomide (TMZ), b) Cyclophosphamide (CPA), c) Bortezomib (BOR) and d) Oxaliplatin (OXA). 
Experiment 2: Constructing a DL model on the HGCC dataset containing mRNA expression data of 83 GBM cell cultures for TMZ response prediction. 
Experiment 3: One-step transfer learning (TL) from the DL models of the four drugs from the source GDSC dataset to the HGCC dataset and determine the best source drug dataset for the TMZ-treated GBM cell cultures response prediction. 
Experiment 4: Constructing a DL model solely on the GSE232173 dataset to predict TMZ response. 
Experiment 5: One-step TL from HGCC dataset to the target GSE232173 dataset. 
Experiment 6: One-step TL from the source GDSC dataset to the target GSE232173 dataset. 
Experiment 7: Two-step TL from the GDSC source dataset to the GSE232173 target dataset, with the refinement on the HGCC dataset.
