#!/bin/bash
#SBATCH --account=bellab
#SBATCH --time=00:59:00
#SBATCH --partition=intel
#SBATCH --nodes=1
#SBATCH --mem=4G
#SBATCH --job-name=salmon_index
#SBATCH --error=/project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/stderr/salmon_index_%j.err
#SBATCH --output=/project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/stdout/salmon_index_%j.out
#SBATCH --mail-user=wjkimab@connect.ust.hk
#SBATCH --mail-type=ALL

echo "Starting salmon index at $(date)..."
source ~/.bashrc
conda activate rnaseq
cd /project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/reference
salmon index -t mus_musculus_ref_cdna_GCA_000001635.9.fa.gz -i mus_musculus_index
echo "Salmon index completed at $(date)."