#!/bin/bash
#SBATCH --account=bellab
#SBATCH --time=23:59:59
#SBATCH --partition=intel
#SBATCH --nodes=1
#SBATCH --mem=16G
#SBATCH --job-name=fasterq_dump_sralite
#SBATCH --error=/project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/stderr/fasterq_dump_sralite_%j.err
#SBATCH --output=/project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/stdout/fasterq_dump_sralite_%j.out
#SBATCH --mail-user=wjkimab@connect.ust.hk
#SBATCH --mail-type=ALL

echo "Starting SRA conversion at $(date)..."
source ~/.bashrc
conda activate rnaseq

OUTPUT_DIR="/project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/data/fastq"
mkdir -p $OUTPUT_DIR

SRA_PATH="/project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/data/sralite/SRR6047154.sralite.1"

fasterq-dump $SRA_PATH --split-3 --outdir $OUTPUT_DIR --progress

echo "SRA conversion completed at $(date)."
