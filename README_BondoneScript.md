# BondoneScript.Rmd

## Overview

This R Markdown script performs a comprehensive analysis of soil bacterial community assembly processes along environmental gradients (elevation, pH, etc.) in the Bondone region. It uses high-throughput sequencing data (16S rRNA gene) and a variety of ecological and statistical methods to:

- Import and preprocess OTU, taxonomy, sample, and phylogenetic tree data
- Construct and subset phyloseq objects for downstream analysis
- Calculate and visualize niche breadths for bacterial taxa along elevation and pH gradients
- Perform null model analyses (e.g., bNTI, qpen) to infer ecological processes (selection, dispersal, etc.)
- Assess the influence of environmental variables (elevation, pH, TC, TN) on community assembly using multiple regression on distance matrices (MRM)
- Visualize the contribution of ecological processes across environmental gradients and soil horizons

## Main Steps

1. **Setup and Libraries**
   - Installs and loads required R packages: `tidyverse`, `phyloseq`, `iCAMP`, `vegan`, `ade4`, `ecodist`, `gtools`, `ggridges`, `viridis`, `ggpubr`, `MDMR`.

2. **Data Import**
   - Loads OTU table, taxonomy, sample metadata, and phylogenetic tree.
   - Cleans and formats data for use with `phyloseq`.

3. **Phyloseq Object Construction**
   - Creates a `phyloseq` object combining OTU, taxonomy, sample, and tree data.
   - Subsets OTUs based on occurrence and abundance thresholds.

4. **Niche Analysis**
   - Calculates niche means and variances for taxa along elevation and pH gradients.
   - Visualizes niche breadths by phylum using `ggplot2` and `ggridges`.

5. **Null Model and bNTI Analysis**
   - Runs null models (e.g., bNTI, qpen) to infer ecological processes structuring communities.
   - Calculates pairwise distances (elevation, pH, TC, TN) between samples.
   - Adds sample pairing and horizon information for detailed analysis.

6. **Statistical Modeling**
   - Performs Multiple Regression on distance Matrices (MRM) to assess the influence of environmental variables on community turnover.
   - Separates analyses by soil horizon (MIN, OR) to compare effects.

7. **Visualization**
   - Plots the contribution of ecological processes (selection, dispersal, etc.) across quantiles of environmental gradients.
   - Visualizes bNTI and Bray-Curtis dissimilarity in relation to environmental variables and horizons.

## Input Files
- `otu_table_bacteria.csv`: OTU abundance table
- `tax_table_bacteria.csv`: Taxonomy table
- `sample_table.csv`: Sample metadata (elevation, pH, etc.)
- `16s_bacteria_only.fasta`: Representative sequences (optional)
- `16s_bacterialtree.nwk`: Phylogenetic tree

## Output
- HTML report with all analyses and plots
- EMF files for key plots (if `save.emf` is used)

## Requirements
- R (with Bioconductor)
- Sufficient RAM for large OTU tables and null model randomizations

## Notes
- The script is modular and can be adapted for other datasets with similar structure.
- Some package installations may require administrative privileges or manual intervention.
- Null model steps can be computationally intensive.

---

*For questions or issues, contact the script author or maintainer.*
