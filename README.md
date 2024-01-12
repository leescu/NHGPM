Developing a machine learning model for accurate nucleoside hydrogels prediction based on descriptors
==============================

This code is the details of the manuscript "eveloping a machine learning model for accurate nucleoside hydrogels prediction based on descriptors".


## Table of Contents

- [Overview](#overview)
- [System Requirements](#system-requirements)
- [Installation Guide](#installation-guide)
- [Deatails](#details)
- [Contributing](#contributing)
- [License](#license)
 
## Overview

Supramolecular hydrogels derived from nucleosides have been gaining significant attention in the biomedical field due to their unique properties and excellent biocompatibility. However, a major challenge in this field is that there is no model for predicting whether nucleoside derivatives will form a hydrogel. Here, we successfully developed a machine learning (ML) model to predict the hydrogel-forming ability of nucleoside derivatives. An optimal ML model with a 71% (95% Confidence Interval, 0.69-0.73) accuracy in predicting hydrogel formation capacity was established based on a dataset of 71 reported nucleoside derivatives was constructed. Three potential gelators were selected based on the optimal model external application and the gel-forming ability were experimentally verified. Among these, two cation-independent nucleoside hydrogels were found surprisingly for the first time. After investigated their self-assembly mechanisms, the cation-independent hydrogel was found to have potential applications in rapid visual detection of Ag+ and cysteine. This optimal ML model may provide a tool to predict nucleoside derivatives with hydrogel-forming ability in the future.

 <img src="https://github.com/leescu/NHGPM/blob/main/Figures/GA.png" width = "900"  alt="Graph abstract" align=center />

## System Requirements
### Hardware requirements
Requires only a standard computer with enough RAM to support the in-memory operations.

### Software requirements
### OS Requirements
Supported for *windows* and *Linux*. The package has been tested on the following systems:
+ Windows: Win 10
+ Linux: Ubuntu 20.04
### Python Dependencies
Mainly depends on the Python 3.9.12 and  JupterLab Notebook 3.5.0-1 . The versions of packages are, specifically:

```
rdkit ≥ 2022.3.3
numpy ≥ 1.22.3
scipy ≥ 1.8.1
pandas ≥ 1.4.2
sklearn ≥ 1.1.1
joblib ≥ 1.1.0
seaborn ≥ 0.11.2
matplotlib ≥ 3.5.2
plotnine ≥ 0.10.1
optuna ≥ 3.0.5
xgboost ≥ 1.7.2
```
#### Notes
The calculation of molecular descriptors relies on the payware alvaDesc(https://www.alvascience.com/alvadesc/), and we provide the results of the descriptors in the corresponding file.


## Installation Guide

Installation via cloned repository:

```
$ git clone https://github.com/leescu/NHGPM.git
$ cd NHGPM
```
Make sure that the unpacked folders are inside “python/” folder in NHGPM. Now you should be able to run the ipyn notebook or play with the python scripts!

## Details

### 1.Calculation and three-step feature selection of molecular descriptors for 71 nucleoside hydrogels

[./Codes/Step 1. Feature selection.ipynb](https://github.com/leescu/NHGPM/blob/main/Codes/Step%201.%20Feature%20selection.ipynb)
 
### 2.Construction of machine learning models

including models based on 4175, 144 and post-REF descriptors

#### 2.1 Decision tree

[./Codes/Step 2. Model construction.ipynb](https://github.com/leescu/NHGPM/blob/main/Codes/Step%202.%20Model%20construction.ipynb)

#### 2.2 Random forest

[./Codes/Step 2. Model construction.ipynb](https://github.com/leescu/NHGPM/blob/main/Codes/Step%202.%20Model%20construction.ipynb)

#### 2.3 Logistic regression

[./Codes/Step 2. Model construction.ipynb](https://github.com/leescu/NHGPM/blob/main/Codes/Step%202.%20Model%20construction.ipynb)

#### 2.4 Rextreme gradient boosting

[./Codes/Step 2. Model construction.ipynb](https://github.com/leescu/NHGPM/blob/main/Codes/Step%202.%20Mode%20construction.ipynb)

### 3.MLREM and LASSO feature selection

#### 3.1 MLREM
[./data/others/MLREM.R](https://github.com/leescu/NHGPM/blob/main/data/others/MLREM.R)

#### 3.2 LASSO and evaluation of MLREM and LASSO feature selection 
[./Codes/Step 3. Comparison of feature selection.ipynb](https://github.com/leescu/NHGPM/blob/main/Codes/Step%203.%20Comparison%20of%20feature%20selection.ipynb)

### 4 Sensitivity analysis

[./Codes/Step 4. Sensitivity analysis.ipynb](https://github.com/leescu/NHGPM/blob/main/Codes/Step%204.%20Sensitivity%20analysis.ipynb)

### 5. Molecular prediction of pubchem

[./Codes/Step 5. Optimal model external validation.ipynb](https://github.com/leescu/NHGPM/blob/main/Codes/Step%205.%20Optimal%20model%20external%20validation.ipynb)

### 6. Code for figures

[./Codes/Step 6. Figures.ipynb](https://github.com/leescu/NHGPM/blob/main/Codes/Step%206.%20Figures.ipynb)


## Contributing

See [the contributing file](CONTRIBUTING.md)!

### Contributions for manuscript
X.H. and H.Z. conceived and directed the project; W.L. and Y.W. wrote the paper; Y.W., K.W. and Z.D. performed most experiments under the supervision of X.H., H.Z. and L. X.; X.H. and W.L. construction the models; W.L. and Y.W. performed external validation of the model; L. X. and Y.W. explored the mechanism and application of the cation-independent hydrogel. All authors discussed the results and commented on the manuscript. 
L.W., and Y.W. contributed equally to this work.

### Any optional sections

## License

[The Apache license 2.0](LICENCE.md)

