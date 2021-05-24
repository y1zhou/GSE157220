# Snakemake workflow: single cell RNA-seq

Processing scRNA-Seq data from [the following paper](https://doi.org/10.1038/s41588-020-00726-6):

> Kinker, G.S., Greenwald, A.C., Tal, R. et al. Pan-cancer single-cell RNA-seq identifies recurring programs of cellular heterogeneity. Nat Genet 52, 1208–1218 (2020).

The layout of this workflow follows [this template](https://github.com/snakemake-workflows/single-cell-rna-seq) by [Johannes Köster](https://koesterlab.github.io/). Given a SRA project ID, the pipeline downloads BAM files, converts them to FASTQ files using `bamtofastq`, and uses [Cell Ranger](https://support.10xgenomics.com/single-cell-gene-expression/software/downloads/latest) to align reads and generate expression matrices.

## Usage

#### Step 1: Obtain a copy of this workflow

```bash
git clone https://github.com/y1zhou/GSE157220
```

#### Step 2: Configure workflow

Configure the workflow according to your needs via editing the file `config.yaml`. Afterwards, install all required packages and generate the design matrix:

```bash
# Prepare environment
conda env create -f=environment.yaml
conda activate scrna-cellranger

# Generate sample matrix
snakemake --cores 1 generate_srr_id
```

#### Step 3: Execute workflow

Test your configuration by performing a dry-run via

```bash
snakemake -np --reason
```

Execute the workflow locally via

```bash
snakemake --cores <num-cores> --reason
```

See the [Snakemake documentation](https://snakemake.readthedocs.io/en/stable/executable.html) for further details.
