#!/bin/bash
#SBATCH --account=bellab
#SBATCH --time=23:59:59
#SBATCH --partition=intel
#SBATCH --nodes=1
#SBATCH --mem=32G
#SBATCH --job-name=salmon_quant_bv2_1
#SBATCH --error=/project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/stderr/salmon_quant_bv2_1_%j.err
#SBATCH --output=/project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/stdout/salmon_quant_bv2_1_%j.out
#SBATCH --mail-user=wjkimab@connect.ust.hk
#SBATCH --mail-type=ALL

echo "Starting salmon quant at $(date)..."
source ~/.bashrc
conda activate rnaseq
cd /project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/

salmon quant --index reference/mus_musculus_index \
         --libType A \
         -1 data/fastq/BV2_1/SRR6047154_1.fastq \
         -2 data/fastq/BV2_1/SRR6047154_2.fastq \
         --threads 8 \
         --output quants/BV2_1_quant

echo "salmon quant completed at $(date)."