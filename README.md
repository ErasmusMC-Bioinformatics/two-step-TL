# Two-step-TL
Here we deposit the code and the models (weights) of the implementation of the framework "Two-step transfer learning improves deep learning-based drug response prediction in small datasets: A case study of glioblastoma". The goal of the study is to investigate how transfer learning (TL) alleviates the small sample size problem. A two-step TL framework was constructed for a difficult task: predicting the response of the drug temozolomide (TMZ) in glioblastoma (GBM) cell cultures.

# Data
Three publicly available datasets were used in the study. 

GDSC dataset contains RNA expressions of 558-710 cell cultures from 20-32 tissue sites (including GBM) treated by TMZ, Bortezomib, Cyclophosphamide and Oxaliplatin, respectively.

HGCC contains RNA expressions of 83 GBM cell cultures treated by TMZ (preprocessed as shown in the R script).

GSE232173 contains RNA expressions of 22 GBM cell cultures treated by TMZ (preprocessed as shown in the R script).

# Experiments
The two-step TL consists of three parts. The python code and the weights extracted from each step of the DL models are deposit here. (Some output were muted due to the size limitation)

First, the DL models were pre-trained on the cell cultures treated by each of the four drugs from GDSC, respectively. Refered as Experiment 1 in the manuscript.

Second, the DL models were refined on HGCC, where the best source drug was identified. Referred as Experiment 3 in the manuscript.

Finally, the DL model was validated on GSE232173. Referred as Experiment 7 in the manuscript.
