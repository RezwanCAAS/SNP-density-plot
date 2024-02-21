# SNP-density-plot

# 1-convert the vcf file into hapmap file
    #!/bin/bash
    #
    #SBATCH --job-name=hapmap_file
    #SBATCH --output=hapmap_file.%j.out
    #SBATCH --partition=batch
    #SBATCH --cpus-per-task=20
    #SBATCH --time=40:00:00
    #SBATCH --mem=400G
    
    module load plink/1.90b6.24
    
    input_file="subset_filtered.vcf.gz"
    output_file="genotyped_hapmap"
    
    plink --vcf $input_file --recode  --const-fid --allow-extra-chr --out $output_file

# 2-convert the hapmap file into .map file

    #!/bin/bash
    #
    #SBATCH --job-name=hapmap_file
    #SBATCH --output=hapmap_file.%j.out
    #SBATCH --partition=batch
    #SBATCH --cpus-per-task=20
    #SBATCH --time=10:00:00
    #SBATCH --mem=200G
    
    module load plink/1.90b6.24
    
    plink --file genotyped_hapmap --allow-extra-chr --make-bed --out genotyped_hapmap_binary


# 3-use the map file in SNP-density R code
