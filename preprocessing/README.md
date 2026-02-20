# preprocessing raw RNA-seq data into salmon quant files
this pipeline assumes the user has access to a slurm-based high-performance computing cluster (e.g., HKUST's HPC4)

0.  install salmon and sratoolkit in an empty conda env

``` sh
conda create -n rnaseq
conda activate rnaseq
conda install -c conda-forge -c bioconda salmon sra-tools boost-cpp
```

1.  get reference transcriptome

``` sh
wget https://ftp.ebi.ac.uk/pub/ensemblorganisms/Mus_musculus/GCA_000001635.9/ensembl/geneset/2023_04/cdna.fa.gz --output-document=mus_musculus_ref_cdna_GCA_000001635.9.fa.gz
```

2.  index reference 

```sh
sbatch `salmon_index.sh`
```

3.  download all `.sralite` files from SRA based on `SRR_Acc_List.txt` obtained from https://www.ncbi.nlm.nih.gov/Traces/study/?acc=SRP117795&o=acc_s%3Aa
    
```sh
sbatch wget_sralite.sh
```

data source:
He, Y., Yao, X., Taylor, N. et al. RNA sequencing analysis reveals quiescent microglia isolation methods from postnatal mouse brains and limitations of BV2 cells. J Neuroinflammation 15, 153 (2018). https://doi.org/10.1186/s12974-018-1195-4

*NOTE*: BV2-4 could not be downloaded via the same link format

``` out
Downloading SRR6047165 at Fri Nov 21 17:52:57 HKT 2025...
Failed to download SRR6047165
```

so it was downloaded separately into `data/sralite/` via:

``` sh
wget https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos5/sra-pub-zq-11/SRR006/047/SRR6047165/SRR6047165.sralite.1
```

(i.e., there is an extra `SRR6047165/` directory in the link)

*NOTE*: `.sralite` files were downloaded instead of `.sra` files because of an unknown connection issue

4.  identify desired sra files by grep-ing the metadata obtained from SRA (https://www.ncbi.nlm.nih.gov/Traces/study/?acc=SRP117795&o=acc_s%3Aa)

``` sh
head -1 SraRunTable.csv  > SraRunTable_Microglia_shaking_BV2.csv # add header
grep -E 'Microglia_shaking_|BV2' SraRunTable.csv >> SraRunTable_Microglia_shaking_BV2.csv # add desired rows
```

5.  convert `.sralite` files into `.fastq` files 

```sh
sbatch fasterq_dump_sralite_*.sh`
```

*NOTE*: `.sralite` do not contain detailed quality scores, 
    i.e., only tells whether a base is good (Q>30),
    so the resulting `.fastq` files' only contain good bases and quality scores are all `?`
    

6.  quantify expression with salmon

```sh
sbatch salmon_quant_*.sh
```
