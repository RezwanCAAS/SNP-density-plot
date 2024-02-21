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

    #output .map file formate
    1	chr01:9536	0	9536
    01	chr01:9540	0	9540
    01	chr01:9543	0	9543
    01	chr01:9563	0	9563
    01	chr01:9567	0	9567
    01	chr01:9596	0	9596
    01	chr01:9700	0	9700
    01	chr01:9737	0	9737
    01	chr01:9741	0	9741
    01	chr01:9744	0	9744
    01	chr01:9776	0	9776
    01	chr01:9814	0	9814


# 3-use the map file in SNP-density R code
