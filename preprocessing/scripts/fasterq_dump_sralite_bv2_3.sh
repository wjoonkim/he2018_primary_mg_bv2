#!/bin/bash
#SBATCH --account=bellab
#SBATCH --time=23:59:59
#SBATCH --partition=intel
#SBATCH --nodes=1
#SBATCH --mem=32G
#SBATCH --job-name=bv2_3_fasterq_dump
#SBATCH --error=/project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/stderr/bv2_3_fasterq_dump_%j.err
#SBATCH --output=/project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/stdout/bv2_3_fasterq_dump_%j.out
#SBATCH --mail-user=wjkimab@connect.ust.hk
#SBATCH --mail-type=ALL

echo "Starting SRA conversion at $(date)..."
source ~/.bashrc
conda activate rnaseq

OUTPUT_DIR="/project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/data/fastq"
mkdir -p $OUTPUT_DIR

SRA_PATH="/project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/data/sralite/SRR6047166.sralite.1"

fasterq-dump $SRA_PATH --split-3 --outdir $OUTPUT_DIR --progress --threads 16 --mem 24G --temp /scratch/wjkimab/

echo "SRA conversion completed at $(date)."
