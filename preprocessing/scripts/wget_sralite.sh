#!/bin/bash
#SBATCH --account=bellab
#SBATCH --time=02:00:00
#SBATCH --partition=intel
#SBATCH --nodes=1
#SBATCH --mem=16G
#SBATCH --job-name=wget_sralite
#SBATCH --error=/project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/stderr/wget_sralite_%j.err
#SBATCH --output=/project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/stdout/wget_sralite_%j.out
#SBATCH --mail-user=wjkimab@connect.ust.hk
#SBATCH --mail-type=ALL

echo "Starting SRA download at $(date)..."
cd /project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/data/sralite

# Read accession IDs from file
while IFS= read -r accession; do
  # Construct the URL based on SRA naming convention
  # Format: https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos5/sra-pub-zq-14/SRR006/047/SRR6047143.sralite.1
  
  url="https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos5/sra-pub-zq-14/SRR006/047/${accession}.sralite.1"
  
  echo "Downloading $accession at $(date)..."
  wget "$url"
  
  if [ $? -eq 0 ]; then
    echo "Successfully downloaded $accession"
  else
    echo "Failed to download $accession"
  fi
done < /project/bellab/wjkimab/receptor_binding/he2018_primary_mg_bv2/data/SRR_Acc_List.txt

echo "SRA download completed at $(date)."