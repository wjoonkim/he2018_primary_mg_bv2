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

# BV2_2
salmon quant --index reference/mus_musculus_index \
         --libType A \
         -1 data/fastq/BV2_2/SRR6047153_1.fastq \
         -2 data/fastq/BV2_2/SRR6047153_2.fastq \
         --threads 8 \
         --output quants/BV2_2_quant

# BV2_3
salmon quant --index reference/mus_musculus_index \
         --libType A \
         -1 data/fastq/BV2_3/SRR6047166_1.fastq \
         -2 data/fastq/BV2_3/SRR6047166_2.fastq \
         --threads 8 \
         --output quants/BV2_3_quant

# BV2_4
salmon quant --index reference/mus_musculus_index \
         --libType A \
         -1 data/fastq/BV2_4/SRR6047165_1.fastq \
         -2 data/fastq/BV2_4/SRR6047165_2.fastq \
         --threads 8 \
         --output quants/BV2_4_quant

# mg_shaking_1
salmon quant --index reference/mus_musculus_index \
         --libType A \
         -1 data/fastq/mg_shaking_1/SRR6047143_1.fastq \
         -2 data/fastq/mg_shaking_1/SRR6047143_2.fastq \
         --threads 8 \
         --output quants/mg_shaking_1_quant

# mg_shaking_2
salmon quant --index reference/mus_musculus_index \
         --libType A \
         -1 data/fastq/mg_shaking_2/SRR6047144_1.fastq \
         -2 data/fastq/mg_shaking_2/SRR6047144_2.fastq \
         --threads 8 \
         --output quants/mg_shaking_2_quant

# mg_shaking_3
salmon quant --index reference/mus_musculus_index \
         --libType A \
         -1 data/fastq/mg_shaking_3/SRR6047174_1.fastq \
         -2 data/fastq/mg_shaking_3/SRR6047174_2.fastq \
         --threads 8 \
         --output quants/mg_shaking_3_quant

# mg_shaking_4
salmon quant --index reference/mus_musculus_index \
         --libType A \
         -1 data/fastq/mg_shaking_4/SRR6047173_1.fastq \
         -2 data/fastq/mg_shaking_4/SRR6047173_2.fastq \
         --threads 8 \
         --output quants/mg_shaking_4_quant

echo "salmon quant completed at $(date)."